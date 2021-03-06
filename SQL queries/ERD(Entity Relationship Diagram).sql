-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.customers
(
    customer_id character varying(32) COLLATE pg_catalog."default" NOT NULL,
    customer_unique_id character varying(32) COLLATE pg_catalog."default",
    customer_zip_code integer,
    customer_city character varying(100) COLLATE pg_catalog."default",
    customer_state character varying(5) COLLATE pg_catalog."default",
    CONSTRAINT customers_pkey PRIMARY KEY (customer_id)
);

CREATE TABLE IF NOT EXISTS public.geoloc
(
    geoloc_zip_code integer,
    geoloc_lat character varying(50) COLLATE pg_catalog."default",
    geoloc_lng character varying(50) COLLATE pg_catalog."default",
    geoloc_city character varying(100) COLLATE pg_catalog."default",
    geoloc_state character varying(5) COLLATE pg_catalog."default"
);

CREATE TABLE IF NOT EXISTS public.order_items
(
    order_id character varying(32) COLLATE pg_catalog."default",
    order_item_id integer,
    product_id character varying(32) COLLATE pg_catalog."default",
    seller_id character varying(32) COLLATE pg_catalog."default",
    shipping_limit_date timestamp without time zone,
    price double precision,
    freight_value double precision
);

CREATE TABLE IF NOT EXISTS public.orders
(
    order_id character varying(32) COLLATE pg_catalog."default" NOT NULL,
    customer_id character varying(32) COLLATE pg_catalog."default",
    order_status character varying(20) COLLATE pg_catalog."default",
    order_purchase_timestamp timestamp without time zone,
    order_approved_at timestamp without time zone,
    order_delivered_carrier_date timestamp without time zone,
    order_delivered_customer_date timestamp without time zone,
    order_estimated_delivered_date timestamp without time zone,
    CONSTRAINT orders_pkey PRIMARY KEY (order_id)
);

CREATE TABLE IF NOT EXISTS public.payments
(
    order_id character varying(32) COLLATE pg_catalog."default",
    payment_sequential integer,
    payment_type character varying(20) COLLATE pg_catalog."default",
    payment_installments integer,
    payment_value double precision
);

CREATE TABLE IF NOT EXISTS public.products
(
    product_id character varying(32) COLLATE pg_catalog."default" NOT NULL,
    product_category_name character varying(50) COLLATE pg_catalog."default",
    product_name_length integer,
    product_description_length integer,
    product_photos_qty integer,
    product_weight_g integer,
    product_length_cm integer,
    product_height_cm integer,
    product_width_cm integer,
    CONSTRAINT products_pkey PRIMARY KEY (product_id)
);

CREATE TABLE IF NOT EXISTS public.reviews
(
    review_id character varying(32) COLLATE pg_catalog."default",
    order_id character varying(32) COLLATE pg_catalog."default",
    review_score integer,
    review_comment_title character varying(100) COLLATE pg_catalog."default",
    review_comment_message text COLLATE pg_catalog."default",
    review_creation_date timestamp without time zone,
    review_answer_timestamp timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.sellers
(
    seller_id character varying(32) COLLATE pg_catalog."default" NOT NULL,
    seller_zip_code integer,
    seller_city character varying(100) COLLATE pg_catalog."default",
    seller_state character varying(5) COLLATE pg_catalog."default",
    CONSTRAINT sellers_pkey PRIMARY KEY (seller_id)
);

ALTER TABLE IF EXISTS public.customers
    ADD CONSTRAINT customers FOREIGN KEY (customer_zip_code)
    REFERENCES public.geoloc (geoloc_zip_code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.order_items
    ADD CONSTRAINT order_items FOREIGN KEY (order_id)
    REFERENCES public.orders (order_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.order_items
    ADD CONSTRAINT order_items FOREIGN KEY (product_id)
    REFERENCES public.products (product_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.order_items
    ADD CONSTRAINT order_items FOREIGN KEY (seller_id)
    REFERENCES public.sellers (seller_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.orders
    ADD FOREIGN KEY (customer_id)
    REFERENCES public.customers (customer_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.payments
    ADD CONSTRAINT payments FOREIGN KEY (order_id)
    REFERENCES public.orders (order_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.reviews
    ADD CONSTRAINT reviews FOREIGN KEY (order_id)
    REFERENCES public.orders (order_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.sellers
    ADD CONSTRAINT sellers FOREIGN KEY (seller_zip_code)
    REFERENCES public.geoloc (geoloc_zip_code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;