/*
Objective:
Practice SQL window functions to perform ranking,
comparisons, and advanced analytical queries that
cannot be solved using GROUP BY alone.

This file also compares window functions with GROUP BY
to highlight when each approach should be used.
*/
use demo;
-- Business Question: Identify the top 2 highest sales orders within each category
SELECT * FROM 
(SELECT order_id, category, sub_category, sales, ROW_NUMBER() OVER (PARTITION BY category ORDER BY sales DESC) AS row_num
FROM superstore_orders) ranked_orders WHERE row_num <= 2;
-- ROW_NUMBER assigns a unique sequence to each row per category,
-- making it suitable for selecting a fixed number of top records.

-- Business Question: Rank orders by sales within each category
SELECT order_id, category, sales, RANK() OVER (PARTITION BY category ORDER BY sales DESC) AS sales_rank FROM superstore_orders;
-- RANK assigns the same rank to tied sales values
-- but skips subsequent ranks when ties occur.

-- Business Question: Rank orders by sales without gaps in ranking
SELECT order_id, category, sales, DENSE_RANK() OVER (PARTITION BY category ORDER BY sales DESC) AS dense_sales_rank FROM superstore_orders;
-- DENSE_RANK assigns consecutive ranks even when ties exist,
-- making it suitable for leaderboard-style analysis.

/*
Difference between RANK and DENSE_RANK:
- RANK creates gaps in ranking when sales values are tied.
- DENSE_RANK does not create gaps.
- The choice depends on whether skipped ranking positions matter
  for the business analysis.
*/


-- Business Question: Rank customers based on total sales within each category
SELECT customer_id, customer_name, category, SUM(sales) AS total_sales, 
RANK() OVER (PARTITION BY category ORDER BY SUM(sales) DESC) AS customer_rank
FROM superstore_orders GROUP BY customer_id, customer_name, category;

-- Business Question: Identify the top-selling sub-category within each category
SELECT * FROM (SELECT category, sub_category, SUM(sales) AS total_sales, 
DENSE_RANK() OVER (PARTITION BY category ORDER BY SUM(sales) DESC ) AS rank_within_category
FROM superstore_orders GROUP BY category, sub_category) ranked_subcategories WHERE rank_within_category <= 2;


/*
Window Functions Summary:
- Window functions perform calculations across a set of related rows
  without collapsing the result set.
- They are commonly used for ranking, comparisons,
  and analytical reporting.
- Window functions are frequently tested in interviews
  to evaluate advanced SQL thinking.
*/