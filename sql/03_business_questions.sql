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