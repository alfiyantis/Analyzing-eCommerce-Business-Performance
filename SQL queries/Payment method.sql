with payment_methods as (select extract(year from o.order_purchase_timestamp) as year, op.payment_type, count(op.payment_type) as num_payment
						 from orders o
						 join payments op on o.order_id=op.order_id
						 group by year, op.payment_type
						 order by year, num_payment desc)
						 
select *
from (select payment_type,
	  	sum(case when year = '2016' then num_payment else 0 end) as year_2016,
	  	sum(case when year = '2017' then num_payment else 0 end) as year_2017,
	  	sum(case when year = '2018' then num_payment else 0 end) as year_2018
	  from payment_methods
	  group by payment_type) per_year