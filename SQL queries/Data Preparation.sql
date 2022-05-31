create database ecommers
    with
    owner = postgres
    encoding = 'UTF8'
    connection limit = -1;

create table customers (
	customer_id varchar(32),
	customer_unique_id varchar(32),
	customer_zip_code int,
	customer_city varchar(100),
	customer_state varchar(5),
	primary key(customer_id));
	
create table geoloc (
	geoloc_zip_code int,
	geoloc_lat varchar(50),
	geoloc_lng varchar(50),
	geoloc_city varchar(100),
	geoloc_state varchar(5));
	
create table order_items (
	order_id varchar(32),
	order_item_id int,
	product_id varchar(32),
	seller_id varchar(32),
	shipping_limit_date timestamp,
	price float,
	freight_value float);
	
create table payments (
	order_id varchar(32),
	payment_sequential int,
	payment_type varchar(20),
	payment_installments int,
	payment_value float);
	
create table reviews (
	review_id varchar(32),
	order_id varchar(32),
	review_score int,
	review_comment_title varchar(100),
	review_comment_message text,
	review_creation_date timestamp,
	review_answer_timestamp timestamp);
	
create table orders (
	order_id varchar(32),
	customer_id varchar(32),
	order_status varchar(20),
	order_purchase_timestamp timestamp,
	order_approved_at timestamp,
	order_delivered_carrier_date timestamp,
	order_delivered_customer_date timestamp,
	order_estimated_delivered_date timestamp,
	primary key(order_id));
	
create table products (
	product_id varchar(32),
	product_category_name varchar(50),
	product_name_length int,
	product_description_length int,
	product_photos_qty int,
	product_weight_g int,
	product_length_cm int,
	product_height_cm int,
	product_width_cm int,
	primary key(product_id));
	
create table sellers (
	seller_id varchar(32),
	seller_zip_code int,
	seller_city varchar(100),
	seller_state varchar(5),
	primary key(seller_id));

copy customers(
	customer_id,
	customer_unique_id,
	customer_zip_code,
	customer_city,
	customer_state)
from 'D:\Data Science - Rakamin\Portofolio\Mini Project 1\Dataset\customers_dataset.csv'
delimiter ','
csv header;

copy geoloc (
	geoloc_zip_code,
	geoloc_lat,
	geoloc_lng,
	geoloc_city,
	geoloc_state)
from 'D:\Data Science - Rakamin\Portofolio\Mini Project 1\Dataset\geolocation_dataset.csv'
delimiter ','
csv header;

copy order_items (
	order_id,
	order_item_id,
	product_id,
	seller_id,
	shipping_limit_date,
	price,
	freight_value)
from 'D:\Data Science - Rakamin\Portofolio\Mini Project 1\DataSet\order_items_dataset.csv'
delimiter ','
csv header;

copy payments (
	order_id,
	payment_sequential,
	payment_type,
	payment_installments,
	payment_value)
from 'D:\Data Science - Rakamin\Portofolio\Mini Project 1\DataSet\order_payments_dataset.csv'
delimiter ','
csv header;

copy reviews (
	review_id,
	order_id,
	review_score,
	review_comment_title,
	review_comment_message,
	review_creation_date,
	review_answer_timestamp)
from 'D:\Data Science - Rakamin\Portofolio\Mini Project 1\DataSet\order_reviews_dataset.csv'
delimiter ','
csv header;

copy orders (
	order_id,
	customer_id,
	order_status,
	order_purchase_timestamp,
	order_approved_at,
	order_delivered_carrier_date,
	order_delivered_customer_date,
	order_estimated_delivered_date)
from 'D:\Data Science - Rakamin\Portofolio\Mini Project 1\DataSet\orders_dataset.csv'
delimiter ','
csv header;

copy products (
	product_id,
	product_category_name,
	product_name_length,
	product_description_length,
	product_photos_qty,
	product_weight_g,
	product_length_cm,
	product_height_cm,
	product_width_cm)
from 'D:\Data Science - Rakamin\Portofolio\Mini Project 1\DataSet\product_dataset.csv'
delimiter ','
csv header;

copy sellers (
	seller_id,
	seller_zip_code,
	seller_city,
	seller_state)
from 'D:\Data Science - Rakamin\Portofolio\Mini Project 1\DataSet\sellers_dataset.csv'
delimiter ','
csv header;
