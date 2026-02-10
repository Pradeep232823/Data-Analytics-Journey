use swiggy_db;

-- Distribution of orders by order_status
SELECT order_status, COUNT(*) AS total_orders FROM orders_cleaned GROUP BY order_status;

-- Overall cancellation rate
SELECT ROUND(SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS cancellation_rate_percentage FROM orders_cleaned;

-- Top restaurants by total revenue
SELECT r.restaurant_name, r.city, ROUND(SUM(o.price * o.quantity), 2) AS total_revenue
	FROM orders_cleaned o JOIN restaurants_cleaned r ON o.restaurant_id = r.restaurant_id
	WHERE o.order_status = 'Successful' GROUP BY r.restaurant_name, r.city ORDER BY total_revenue DESC;

-- Average delivery delay by restaurant city
SELECT r.city, ROUND(AVG(o.delivery_delay_mins), 2) AS avg_delivery_delay_mins FROM orders_cleaned o
	JOIN restaurants_cleaned r ON o.restaurant_id = r.restaurant_id 
	WHERE o.delivery_delay_mins IS NOT NULL GROUP BY r.city ORDER BY avg_delivery_delay_mins DESC;

-- Rank delivery partners by average delivery delay
SELECT d.partner_name, d.city, ROUND(AVG(o.delivery_delay_mins), 2) AS avg_delivery_delay_mins,
    RANK() OVER (ORDER BY AVG(o.delivery_delay_mins)) AS delivery_performance_rank
	FROM orders_cleaned o JOIN delivery_partners_cleaned d 
    ON o.delivery_partner_id = d.partner_id GROUP BY d.partner_name, d.city;

-- High-value delayed orders
SELECT order_id, customer_id, ROUND(price * quantity, 2) AS order_value, delivery_delay_mins
	FROM orders_cleaned WHERE delivery_delay_mins > 0 
	AND (price * quantity) > (SELECT AVG(price * quantity) FROM orders_cleaned) ORDER BY delivery_delay_mins DESC;

-- Average delivery delay by restaurant rating category
SELECT r.rating_category, ROUND(AVG(o.delivery_delay_mins), 2) AS avg_delivery_delay_mins
FROM orders_cleaned o JOIN restaurants_cleaned r ON o.restaurant_id = r.restaurant_id
GROUP BY r.rating_category ORDER BY avg_delivery_delay_mins;

/*
SQL Analysis Summary:
- Evaluated order success and cancellation behavior
- Identified high-revenue restaurants
- Analyzed delivery delays across cities
- Ranked delivery partners using window functions
- Highlighted high-value orders impacted by delays
- Compared restaurant ratings with delivery performance
*/
