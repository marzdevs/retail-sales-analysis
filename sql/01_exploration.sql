-- 1. Total row count (confirm all 9,800 rows loaded)
SELECT COUNT(*) FROM raw_sales

-- 2. shows the actual row of data up to 20 
SELECT * FROM raw_sales LIMIT 20;

-- 3. Checks date range of the dataset
SELECT 
  MIN("Order Date") AS earliest_order,
  MAX("Order Date") AS latest_order
FROM raw_sales;

-- 4. Checks for duplicate Order IDs (this dataset has multiple rows per order — one per product line item — so duplicates here are expected, not a bug, but worth confirming)
SELECT "Order ID", COUNT(*) AS line_items
FROM raw_sales
GROUP BY "Order ID"
ORDER BY line_items DESC
LIMIT 10;

-- 5. Checks for nulls in key columns
SELECT
  COUNT(*) FILTER (WHERE "Order Date" IS NULL) AS null_order_date,
  COUNT(*) FILTER (WHERE "Ship Date" IS NULL) AS null_ship_date,
  COUNT(*) FILTER (WHERE "Sales" IS NULL) AS null_sales,
  COUNT(*) FILTER (WHERE "Customer ID" IS NULL) AS null_customer,
  COUNT(*) FILTER (WHERE "Region" IS NULL) AS null_region
FROM raw_sales;

-- 6. Checks distinct values in categorical columns (spot inconsistent naming, typos)
SELECT DISTINCT "Region" FROM raw_sales ORDER BY 1;
SELECT DISTINCT "Category" FROM raw_sales ORDER BY 1;
SELECT DISTINCT "Sub-Category" FROM raw_sales ORDER BY 1;
SELECT DISTINCT "Segment" FROM raw_sales ORDER BY 1;
SELECT DISTINCT "Ship Mode" FROM raw_sales ORDER BY 1;

-- 7. Basic stats on Sales
SELECT
  MIN("Sales") AS min_sale,
  MAX("Sales") AS max_sale,
  AVG("Sales") AS avg_sale,
  SUM("Sales") AS total_sales
FROM raw_sales;

-- 8. Checks for exact duplicate rows (not just duplicate Order IDs)
SELECT "Order ID", "Product ID", "Sales", COUNT(*)
FROM raw_sales
GROUP BY "Order ID", "Product ID", "Sales"
HAVING COUNT(*) > 1;