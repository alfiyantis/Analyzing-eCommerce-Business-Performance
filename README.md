Analyzing-eCommerce-Business-Performance
===

## Table of Contents
* **[Background and Objective](#backg)**
* **[Research Question](#quest)**
* **[Data and Assumptions](#datas)**
* **[Data Analysis](#analys)**
* **[Summary](#summary)**
* **[Suggestion](#suggest)**

<a name="backg"></a>
## Background and Objective
Business performance reflects the commercial effectiveness of the company. So it is necessary to conduct an analysis related to business performance every year.

Three important aspects in knowing business performance, including:
1. Customer growth
2. Product quality
3. Type of payment

It is important to conduct business performance analysis to better understand customers and products, so that a better and more efficient business plan can be formed, and can achieve company goals.

<a name="quest"></a>
## Research Question
How was customer growth, product quality, and frequently used payment types over the past year?

<a name="datas"></a>
## Data and Assumptions
The data used is up to 112650.
The sample data used include:
1. Customers
2. Location
3. Orders
4. Sellers
5. Payment method

The data was taken from 2016 to 2018, but the data used is only 2017 and 2018 data. This is because there are data imbalance between 2016 and 2017 and 2018, the data collected in 2016 is from September. So the data for 2016 is dropped.

<a name="analys"></a>
## Data Analysis
After doing data preparation, then data analysis related to e-commerce business performance is carried out (using google data studio)

![customers and orders](https://user-images.githubusercontent.com/105115689/171444536-0d39f99f-298e-4f3f-bea6-8630a04bed08.png)

The average monthly active users (MAU) increase every year, and the increase in MAU every year is also in line with the increase in new customers. But there is a significant difference between 2016 to 2017 and 2018. This is because the data collection available in 2016 does not start in January, so the data taken is not full for 1 year.
However, the number of repeat orders decreased from 2017 to 2018. This is supported by an average order per customer of no more than 1.

![revenue](https://user-images.githubusercontent.com/105115689/171444661-35b252ae-d6b5-4ed9-b11c-f867590d6684.png)

The chart above shows that the number of canceled orders has increased which may be due to the large number of orders that occurred, so the revenue obtained is also a lot. However the number of canceled orders that occur also increases.

| year | top product category | top canceled product category |
| --- | --- | --- |
| 2016 | furniture_decor | toys |
| 2017 | bed_bath_table | sports_leisure |
| 2018 | health_beauty | health_beauty |

Health_beauty is the category product that received the highest revenue in 2018, and is also the product category that has the most cancel orders in 2018.
This may be due to high orders for health_beauty products in 2018. But to ensure this truth, further analysis is needed regarding the number of orders by each product category each year.

![payment method](https://user-images.githubusercontent.com/105115689/171444702-065b0d05-6215-49f4-996a-71e6e4b5519d.png)

The payment method most often used in transactions is a credit card. In addition, the difference in payment methods in 2017 and 2018 is higher than transactions using other payment methods.

According to the existing article, there are several reasons why people prefer to use a credit card as the payment method used:
1. They build credit history
2. They may offer sign-on bonuses
3. They give cash back
4. They offer rewards programs
5. They track your spending for you
6. They protect against fraud
7. They let you transfer your balance
8. They come with purchase protection
9. [etc](https://www.moneyunder30.com/advantages-to-using-a-credit-card).

The use of the payment method using vouchers decreased in 2018, this could be due to the reduced number of vouchers distributed by ecommers to users. However, to ensure this, further analysis is needed regarding the number of vouchers distributed each year.


<a name="summary"></a>
## Summary
- Customer growth that occurred between 2017 and 2018 was quite good, where there was an increase in the average monthly active users of 44.5% and the number of new customers by 19.2%
- The percentage of revenue increased by 22.1% from 2017 to 2018, this shows that many purchases of goods occurred through e-commerce at that time. On the other hand, the quality of the product needs to be questioned because of the increasing number of orders canceled by customers, there was an increase in the percentage of 26% in the number of canceled orders.
- The most frequently used type of payment is credit cards, besides that credit cards also have a fairly high increase between 2017 and 2018, which is 21.4%

<a name="suggest"></a>
## Suggestion
Need further analysis regarding the number of orders and repeated orders, it is hoped that after doing further analysis the company can make a better business plan to increase the number of orders and reduce the number of canceled orders.
In addition, further analysis is needed regarding the product category health_beauty which is the product category that has the highest revenue and has the highest number of canceled orders in the same year (in 2018).
