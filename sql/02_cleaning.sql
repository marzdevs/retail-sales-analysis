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