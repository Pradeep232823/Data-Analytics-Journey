/*
Objective:
Use basic SQL queries and aggregations to answer
business questions using the superstore_orders table.
*/

use demo;

# SELECT + WHERE (Basic Filtering)
# Query 1
select * from superstore_orders where sales>1000;

# Query 2
select order_id, customer_name, segment, state, sub_category, sales from superstore_orders where segment = "Consumer";

# LIKE / IN / BETWEEN

# Query 3 using LIKE
select customer_id, customer_name, sales from superstore_orders where customer_name like "A%";

# Query 4 using IN
select order_id, customer_name, state, sub_category, sales from superstore_orders where state in("California","Texas","Utah","New York");

# Query 5 using Between
select order_id, customer_name, sales from superstore_orders where sales between 100 and 500;

# Aggregation Functions (COUNT, SUM, AVG)

# Query 6 using count
select sub_category,count(sub_category) from superstore_orders group by sub_category;
# Query 7 using count
select count(distinct product_name) as Products_count from superstore_orders;

# Query 8 using sum
select sum(sales) as Total_sales from superstore_orders;

# Query 9 using avg
select avg(sales) as Average_sales from superstore_orders;

# GROUP BY + HAVING (VERY IMPORTANT)

# Query 10 using Group By
select category, sub_category, sum(sales) as sub_category_sales from superstore_orders group by category, sub_category;

# Query 11 using Having
SELECT customer_name, SUM(sales) AS total_sales FROM superstore_orders GROUP BY customer_name HAVING SUM(sales) > 1000;

/*
Key Takeaways:
- WHERE filters rows before aggregation.
- GROUP BY summarizes data at a chosen level.
- HAVING filters aggregated results.
- Aggregations help translate raw transactional data
  into meaningful business insights.
*/
