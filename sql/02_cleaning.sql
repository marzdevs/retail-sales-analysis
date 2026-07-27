-- Create a cleaned version of the data, leaving raw_sales untouched
CREATE TABLE clean_sales AS
SELECT
  "Row ID" AS row_id,
  "Order ID" AS order_id,
  TO_DATE("Order Date", 'DD/MM/YYYY') AS order_date,
  TO_DATE("Ship Date", 'DD/MM/YYYY') AS ship_date,
  "Ship Mode" AS ship_mode,
  "Customer ID" AS customer_id,
  "Customer Name" AS customer_name,
  "Segment" AS segment,
  "City" AS city,
  "State" AS state,
  "Postal Code" AS postal_code,
  "Region" AS region,
  "Product ID" AS product_id,
  "Category" AS category,
  "Sub-Category" AS sub_category,
  "Product Name" AS product_name,
  "Sales" AS sales
FROM raw_sales;

-- Confirm row count matches
SELECT COUNT(*) FROM clean_sales;

-- Confirm dates converted correctly (June 12 should now show 2017-06-12, not misread)
SELECT order_date, ship_date FROM clean_sales LIMIT 5;

-- Confirm data type is now a real date
SELECT pg_typeof(order_date) FROM clean_sales LIMIT 1;