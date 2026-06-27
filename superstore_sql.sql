# Display the table

SELECT *
FROM superstore
LIMIT 10;

# ============================================================

# BUSINESS QUESTION 1

# What is the total revenue, total profit and total quantity sold?

# Purpose:

# This gives an executive overview of the company's overall business

# performance and forms the primary KPI section of the dashboard.

# ============================================================

SELECT
SUM(sales) AS total_revenue,
SUM(profit) AS total_profit,
SUM(quantity) AS total_units_sold
FROM superstore;

# ============================================================

# BUSINESS QUESTION 2

# Display all orders from the West region.

# Purpose:

# Regional managers often analyze only their own territory

# instead of the company's complete dataset.

# ============================================================

SELECT *
FROM superstore
WHERE region = 'West';

# ============================================================

# BUSINESS QUESTION 3

# Display all Technology category products.

#

# Purpose:

# Product managers often analyze a single product category

# to understand its sales performance.

# ============================================================

SELECT
order_id,
product_name,
category,
sales
FROM superstore
WHERE category = 'Technology';


# ============================================================

# BUSINESS QUESTION 4

# Identify all orders that resulted in a financial loss.

#

# Purpose:

# Managers monitor loss-making transactions to understand

# pricing, discounts and profitability issues.

# ============================================================

SELECT
order_id,
customer_name,
product_name,
sales,
profit
FROM superstore
WHERE profit < 0;

# ============================================================

# BUSINESS QUESTION 5

# Display all Technology products sold in the West region.

#

# Purpose:

# Managers often analyze a specific product category

# within a specific region to evaluate regional performance.

# ============================================================

SELECT
order_id,
customer_name,
region,
category,
sales
FROM superstore
WHERE region = 'West'
AND category = 'Technology';

# ============================================================

# BUSINESS QUESTION 6

# Display all orders where sales are between

# 500 and 1000.

#

# Purpose:

# Analysts often classify transactions into value ranges

# for pricing and sales analysis.

# ============================================================

SELECT
order_id,
customer_name,
sales
FROM superstore
WHERE sales BETWEEN 500 AND 1000;

# ============================================================

# BUSINESS QUESTION 7

# Display the Top 10 highest sales transactions.

#

# Purpose:

# Managers monitor high-value orders to identify major

# customers, premium products and significant business

# transactions.

# ============================================================

SELECT
order_id,
customer_name,
product_name,
sales
FROM superstore
ORDER BY sales DESC
LIMIT 10;

# ============================================================

# BUSINESS QUESTION 8

# Display the 10 lowest profit transactions.

#

# Purpose:

# Identifies the worst-performing transactions so that

# management can investigate pricing, discounting or

# operational issues.

# ============================================================

SELECT
order_id,
customer_name,
product_name,
profit
FROM superstore
ORDER BY profit ASC
LIMIT 10;

# ============================================================

# BUSINESS QUESTION 9

# How many orders are present in the dataset?

#

# Purpose:

# Understanding total order volume helps measure business

# activity and demand.

# ============================================================

SELECT
COUNT(order_id) AS total_orders
FROM superstore;

# ============================================================

# BUSINESS QUESTION 10

# What is the average sales value per transaction?

#

# Purpose:

# Average Order Value (AOV) is an important KPI that helps

# businesses understand customer purchasing behaviour.

# ============================================================

SELECT
AVG(sales) AS average_order_value
FROM superstore;

# highest sale 
SELECT
MAX(sales) AS highest_sale
FROM superstore;

# ============================================================

# BUSINESS QUESTION 11

# What is the biggest financial loss recorded?

#

# Purpose:

# Identifying the largest loss helps management investigate

# pricing issues, excessive discounts or operational mistakes.

# ============================================================

SELECT
MIN(profit) AS largest_loss
FROM superstore;


BUSINESS QUESTION 12
What is the total revenue generated by each region?

SELECT region,
SUM(sales) AS total_revenue
From superstore
GROUP by region;

#Thats why every non-grouped column must be wrapped inside an aggregate function.


#BUSINESS QUESTION 13
#Which region generated the highest revenue?


SELECT region,
SUM(sales) AS total_revenue
From superstore
GROUP by region
order by total_revenue desc;



BUSINESS QUESTION 14
How many orders were placed in each region?

select region,
count(order_id) as total_order
from superstore
group by region 
order by total_order desc;



#Which product category (category) generated the highest total profit?

select category,
sum(profit) as total_profit
from superstore 
group by category
order by total_profit desc;

##
##Keyword	Filters
##WHERE	       Individual rows    ( used to filter raws individual)
##HAVING	 =         Groups    ( used to filter group)

##

BUSINESS QUESTION 15
Which product categories generated more than
$100,000 in total profit?

select category,
sum(profit) as total_profit
from superstore
group by category 
having sum(profit)>=100000
order by total_profit desc;

BUSINESS QUESTION 16
Which customers have placed more than
10 orders?

select customer_name,
count(order_id) as total_order
from superstore
group by customer_name
having count(order_id)>10
order by total_order desc;

select * from superstore

BUSINESS QUESTION 17
Which regions generated an average profit
greater than $30 per transaction?

select * from superstore

select region,
avg(profit) as avg_profit
from superstore
group by region
having avg(profit)>30
order by avg_profit desc;

# ============================================================

# BUSINESS QUESTION 18

# Classify each transaction as Profit or Loss.

#

# Purpose:

# Business analysts often create custom categories that

# do not exist in the original dataset. This makes

# reporting and dashboarding much easier.

# ============================================================

SELECT
order_id,
customer_name,
sales,
profit,
CASE
WHEN profit >= 0 THEN 'Profit'
ELSE 'Loss'
END AS transaction_status
FROM superstore
LIMIT 20;


# ============================================================

# BUSINESS QUESTION 19

# Categorize orders based on discount percentage.

#

# Purpose:

# Helps management understand how different discount

# levels are distributed across transactions.

# ============================================================

SELECT
order_id,
product_name,
discount,
CASE
WHEN discount = 0 THEN 'No Discount'
WHEN discount <= 0.20 THEN 'Low Discount'
WHEN discount <= 0.50 THEN 'Medium Discount'
ELSE 'High Discount'
END AS discount_category
FROM superstore
LIMIT 20;

# ============================================================

# BUSINESS QUESTION 20

# How many transactions fall into Profit and Loss categories?

#

# Purpose:

# Provides an overview of profitable versus loss-making

# transactions.

# ============================================================

SELECT
CASE
WHEN profit >= 0 THEN 'Profit'
ELSE 'Loss'
END AS transaction_status,
COUNT(*) AS total_transactions
FROM superstore
GROUP BY transaction_status;

# BUSINESS QUESTION 21
# ============================================================
#write a query that creates a new column called customer_type:

Rules:

If sales >= 1000 → 'High Value'
Otherwise → 'Regular'

Display:

customer_name
sales
customer_type

## If you can do that on your own, youve genuinely understood CASE WHEN.
# ============================================================ 


select customer_name,
sum(sales) as total_sale,
case 
WHEN sum(sales)>=5000 then 'high_value'
else 'Regular'
end as customer_type
from superstore 
group by customer_name


Business Question: 22

Categorize each region as:

Excellent → Total Sales ≥ 500000
Good → Total Sales ≥ 300000
Needs Improvement → Otherwise

select * from superstore 

select region,
sum(sales) as total_sale,
case 
when SUM(sales)>=500000 then 'Excellent'
when sum(sales)>=300000 then 'good'
else 'Needs_Improvement'
END as Performance_Category
from superstore
GROUP by region 
order by total_sale desc; 


# ============================================================

# BUSINESS QUESTION 23

# Rank all customers based on their total sales.

#

# Purpose:

# Customer ranking helps identify the highest-value

# customers and supports customer relationship

# management strategies.

# ============================================================

SELECT
customer_name,
SUM(sales) AS total_sales,
ROW_NUMBER() 
OVER(ORDER BY SUM(sales) DESC)
AS customer_rank
FROM superstore
GROUP BY customer_name;


BUSINESS QUESTION 24
Rank product categories based on total revenue.

select * from superstore

select category,
sum(sales) as total_sales,
ROW_NUMBER()
OVER(ORDER BY sum(sales) desc)
as category_rank
FROM superstore
group by category;


# ============================================================

# BUSINESS QUESTION 25

# Rank customers based on total sales while assigning

# the same rank to customers with equal sales.

#

# Purpose:

# Fairly ranks customers when multiple customers have

# identical sales performance.

# ============================================================

SELECT
customer_name,
SUM(sales) AS total_sales,
RANK() OVER(
ORDER BY SUM(sales) DESC
) AS sales_rank
FROM superstore
GROUP BY customer_name;



# ============================================================

# BUSINESS QUESTION 26
# Create a temporary customer sales summary.

#

# Purpose:

# Common Table Expressions (CTEs) improve readability by

# breaking complex SQL into smaller logical steps.

# ============================================================

WITH customer_sales AS (

SELECT
    customer_name,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY customer_name

)

SELECT *
FROM customer_sales
ORDER BY total_sales DESC;

============================================================
BUSINESS QUESTION 27
Identify customers whose total sales are greater
than $10,000.


select customer_name,
sum(sales) as total_sale
from superstore 
GROUP BY customer_name
having sum(sales)>10000
order by total_sale desc;


#m2  with cluase //

WITH customer_sales AS (

SELECT
    customer_name,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY customer_name

)

SELECT
customer_name,
total_sales
FROM customer_sales
WHERE total_sales > 10000
ORDER BY total_sales DESC;


# ============================================================

# BUSINESS QUESTION 28

# Identify customers whose total sales are greater than

# the average customer sales.

#

# Purpose:

# Helps identify customers who spend more than the

# average customer, making them ideal targets for

# loyalty programs and premium offerings.

# ============================================================

SELECT
customer_name,
SUM(sales) AS total_sales
FROM superstore
GROUP BY customer_name
HAVING SUM(sales) >
(
SELECT AVG(total_sales)
FROM
(
SELECT
customer_name,
SUM(sales) AS total_sales
FROM superstore
GROUP BY customer_name
) AS customer_summary
)
ORDER BY total_sales DESC;


Demonstrates how CTEs improve readability when solving
multi-step analytical problems.
============================================================

WITH customer_sales AS (

SELECT
    customer_name,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY customer_name

)

SELECT
customer_name,
total_sales
FROM customer_sales
WHERE total_sales >
(
SELECT AVG(total_sales)
FROM customer_sales
)
ORDER BY total_sales DESC;


# ============================================================

# BUSINESS QUESTION 29

# What are the yearly sales trends?

#

# Purpose:

# Helps management understand how sales have changed

# over the years and identify long-term business growth.

# ============================================================

SELECT
EXTRACT(YEAR FROM order_date) AS order_year,
SUM(sales) AS total_sales
FROM superstore
GROUP BY order_year
ORDER BY order_year;



# ============================================================

# BUSINESS QUESTION 30

# Which month generates the highest revenue?

#

# Purpose:

# Identifies seasonal sales patterns to support

# marketing campaigns and inventory planning.

# ============================================================

SELECT
EXTRACT(MONTH FROM order_date) AS order_month,
SUM(sales) AS total_sales
FROM superstore
GROUP BY order_month
ORDER BY total_sales DESC;

# ============================================================

# BUSINESS QUESTION 31

# Create a reusable customer sales summary.

#

# Purpose:

# SQL Views allow analysts to save frequently used

# business queries as virtual tables.

# ============================================================

CREATE VIEW customer_sales_summary AS

SELECT
customer_name,
SUM(sales) AS total_sales,
SUM(profit) AS total_profit
FROM superstore
GROUP BY customer_name;


select * from customer_sales_summary


# ============================================================

# BUSINESS QUESTION 32

# Display the Top 10 highest-value customers using

# the customer sales summary view.

#

# Purpose:

# Demonstrates how SQL Views simplify repetitive

# analytical queries.

# ============================================================

SELECT
customer_name,
total_sales,
total_profit
FROM customer_sales_summary
ORDER BY total_sales DESC
LIMIT 10;



SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'superstore';


View 2

Region Summary 


CREATE VIEW region_summary AS

SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(order_id) AS total_orders,
    AVG(discount) AS avg_discount
FROM superstore
GROUP BY region;



View 3

Category Summary

CREATE VIEW category_summary AS

SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(order_id) AS total_orders
FROM superstore
GROUP BY category;

view 4

Monthly Summary

CREATE VIEW monthly_sales_summary AS

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date);


