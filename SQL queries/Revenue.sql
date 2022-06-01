create table total_revenue_per_year as
select extract(year from o.order_purchase_timestamp) as year,sum(rev_order) as revenue
from (select order_id,sum(price+freight_value) as rev_order
	  from order_items
	  group by order_id) rev
join orders o on rev.order_id=o.order_id
where o.order_status='delivered'
group by year;

create table total_cancel_per_year as
select extract(year from o.order_purchase_timestamp) as year,count(1) as num_canceled_orders
from orders o
where order_status='canceled'
group by year;

create table top_product_category_per_year as
select year,product_category_name,revenue
from (select extract(year from o.order_purchase_timestamp) as year,
	  	p.product_category_name,sum(oi.price + oi.freight_value) as revenue,
	  	rank() over(partition by extract(year from o.order_purchase_timestamp)
					order by sum(oi.price + oi.freight_value) desc) as rank_cat
	  from order_items oi
	  join orders o on o.order_id=oi.order_id
	  join products p on p.product_id=oi.product_id
	  where o.order_status='delivered'
	  group by year,p.product_category_name) top_cat
where rank_cat = 1;

create table top_canceled_product_category_per_year as
select year,product_category_name,num_canceled
from (select extract(year from o.order_purchase_timestamp) as year,p.product_category_name,count(1) as num_canceled,
	  	rank() over(partition by extract(year from o.order_purchase_timestamp)
					order by count(1) desc) as rank_cat
	  from order_items oi
	  join orders o on o.order_id=oi.order_id
	  join products p on p.product_id=oi.product_id
	  where o.order_status='canceled'
	  group by year,product_category_name) top_can
where rank_cat = 1;

select r.year,r.revenue,c.num_canceled_orders,tpc.product_category_name as top_product_category,tcc.product_category_name as top_canceled_category
from total_revenue_per_year r
join total_cancel_per_year c on r.year=c.year
join top_product_category_per_year tpc on r.year=tpc.year
join top_canceled_product_category_per_year tcc on r.year=tcc.year