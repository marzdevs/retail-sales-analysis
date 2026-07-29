# Data Dictionary

Source: [Sales Forecasting dataset](https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting) (Kaggle)
9,800 rows, 18 columns

| Column | Type | Notes |
|---|---|---|
| Row ID | Integer | Original row identifier from the CSV |
| Order ID | Text | Repeats across rows since one order can have multiple product line items |
| Order Date | Date | Source format was DD/MM/YYYY, fixed during cleaning |
| Ship Date | Date | Same date format fix applied |
| Ship Mode | Text | Standard Class, Second Class, First Class, Same Day |
| Customer ID | Text | Unique per customer |
| Customer Name | Text | |
| Segment | Text | Consumer, Corporate, Home Office |
| Country | Text | Always "United States" |
| City | Text | |
| State | Text | |
| Postal Code | Text/Numeric | 11 rows missing, all from Burlington, VT, left blank rather than guessing a value |
| Region | Text | Central, East, South, West |
| Product ID | Text | |
| Category | Text | Furniture, Office Supplies, Technology |
| Sub-Category | Text | 17 values, no typos or inconsistent naming found |
| Product Name | Text | |
| Sales | Decimal | No negatives, no missing values |

## Notes
- No Profit column in this dataset so I kept the analysis scoped to Sales/revenue rather than guessing at margins.
- Order ID repeating isn't a data error. It's expected since each row is one product line item, not one full order (4,922 unique Order IDs across 9,800 rows).
- Checked for exact duplicate rows and found zero.