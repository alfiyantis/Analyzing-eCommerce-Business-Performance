with avg_mau as (
select year, round(avg(mau), 2) as average_mau
from (select extract(year from order_purchase_timestamp) as year,
	  extract(month from order_purchase_timestamp) as month,
	  count(distinct c.customer_unique_id) as mau
	  from orders o
	  join customers c on o.customer_id = c.customer_id
	  group by year,month) mau
group by year
),
newcust as (
select extract(year from first_time_purchase) as year, count(1) as new_customers
from (select c.customer_unique_id,min(o.order_purchase_timestamp) as first_time_purchase
	  from orders o
	  join customers c on c.customer_id=o.customer_id
	  group by c.customer_unique_id) newcust
group by year
),
rep_order as (
select year,count(distinct customer_unique_id) as repeat_customers
from (select extract(year from order_purchase_timestamp) as year,c.customer_unique_id,count(1) as purchase_freq
	  from orders o
	  join customers c on c.customer_id=o.customer_id
	  group by year, c.customer_unique_id
	  having count(1) > 1) reporder
group by year
),
avg_freq_order as (
select year,round(avg(purchase_freq),3) as avg_orders_per_customers
from (select extract(year from order_purchase_timestamp) as year,c.customer_unique_id,count(1) as purchase_freq
	  from orders o
	  join customers c on c.customer_id = o.customer_id
	  group by year, c.customer_unique_id) avg_freqorder
group by year
)

select a.year, a.average_mau, n.new_customers, r.repeat_customers, f.avg_orders_per_customers
from avg_mau a
join newcust n on a.year=n.year
join rep_order r on r.year=a.year
join avg_freq_order f on f.year=a.year