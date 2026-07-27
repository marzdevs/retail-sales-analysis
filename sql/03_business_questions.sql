--- 1. Which regions and categories drive the most revenue?
SELECT region, category, SUM(sales) AS total_sales
FROM clean_sales
GROUP BY region, category
ORDER BY total_sales DESC;

--- 2. Is there a seasonal pattern — which months/quarters consistently outperform?
SELECT 
  EXTRACT(YEAR FROM order_date) AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month,
  SUM(sales) AS total_sales
FROM clean_sales
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

--- 3. Which customer segment generates the most revenue, and is it growing over time?
SELECT 
  EXTRACT(YEAR FROM order_date) AS order_year,
  segment,
  SUM(sales) AS total_sales
FROM clean_sales
GROUP BY order_year, segment
ORDER BY order_year, segment;

--- 4. Which sub-categories are the top revenue drivers within each category?
SELECT category, sub_category, SUM(sales) AS total_sales
FROM clean_sales
GROUP BY category, sub_category
ORDER BY category, total_sales DESC;

--- 5. What would I recommend the business focus on next quarter? adding to README.
