use demo;
select * from supermart_grocery_sales;
# Basic Aggregations
-- Total Revenue
select sum(sales * (1 - discount)) as total_revenue from supermart_grocery_sales;

-- Total Profit
select sum(profit) as total_profit from supermart_grocery_sales;

-- Average discount
select avg(discount) as average_discount from supermart_grocery_sales;

-- Revenue & Profit by Category
select category, sum(sales * (1 - discount)) as revenue, sum(profit) as profit from supermart_grocery_sales group by category;

-- Revenue by Region
select region, sum(sales * (1 - discount)) as revenue from supermart_grocery_sales group by region;

-- Top 5 Cities by revenue
select city, sum(sales * (1 - discount)) as total_revenue from supermart_grocery_sales
group by city order by total_revenue desc limit 5;

-- Top 10 Customers by Revenue
select customer_name, sum(sales * (1 - discount)) as revenue from supermart_grocery_sales group by customer_name order by revenue desc limit 10;

-- Top 10 Most Profitable Customers
select customer_name, sum(profit) as profit from supermart_grocery_sales group by customer_name order by profit desc limit 10;

-- Top 10 Customers with High Sales but Low Profit
select customer_name, sum(sales) as sales, sum(profit) as profit from supermart_grocery_sales 
group by customer_name order by sales desc, profit asc;

-- Profit by Category
select category, round(sum(profit), 2) as total_profit, round(sum(sales * (1 - discount)), 2) as total_revenue,
    round((sum(profit) / sum(sales * (1 - discount))) * 100, 2) as profit_margin_pct from supermart_grocery_sales group by category;

-- Monthly revenue in each year
select  year(order_date) as year, month(order_date) as month, round(sum(sales * (1 - discount)), 2) as monthly_revenue
from supermart_grocery_sales group by year(order_date), month(order_date) order by year, month;

-- Yearly Growth %
select year, yearly_revenue, round(((yearly_revenue - lag(yearly_revenue) 
		over (order by year)) / lag(yearly_revenue) over (order by year)) * 100, 2) as yearly_growth_pct
		from (select year(order_date) as year, sum(sales * (1 - discount)) as yearly_revenue
        from supermart_grocery_sales group by YEAR(order_date)) t order by year;

-- Top 10 high revenue months in all years
select year(order_date) as year, month(order_date) as month, round(sum(sales * (1 - discount)), 2) AS monthly_revenue
	from supermart_grocery_sales group by year(order_date), month(order_date)
	order by monthly_revenue desc limit 10;

-- monthly revenue and running total of each year
select year(order_date) as year, month(order_date) as month, sum(sales * (1 - discount)) as monthly_revenue,
    sum(sum(sales * (1 - discount))) over (partition by year(order_date) order by month(order_date)) as running_total
from supermart_grocery_sales group by year(order_date), month(order_date) order by year, month;

-- Correlation between Discount and Profit
select (avg(discount * profit) - avg(discount) * avg(profit)) / (stddev_pop(discount) * stddev_pop(profit)) as discount_profit_correlation
	from supermart_grocery_sales where discount is not null and profit is not null;

-- High Discount Categories vs Profitability
select category, round(avg(discount), 2) as avg_discount, round(sum(profit), 2) as total_profit,
    round((sum(profit) / sum(sales * (1 - discount))) * 100, 2) as profit_margin_pct
	from supermart_grocery_sales group by category order by avg_discount desc;

-- Revenue generated under High Discount (>25%)
select round(sum(sales * (1 - discount)), 2) as high_discount_revenue from supermart_grocery_sales where discount > 0.25;