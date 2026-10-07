 Sales Management Dashboard

 Business Problem

The business needs a clear and interactive way to monitor sales performance and identify important patterns in revenue, customers, products, regions, categories and salespeople.

The objective of this project was to transform relational sales data into a Power BI management dashboard that allows decision-makers to understand sales performance and explore important patterns, validated against SQL analysis and supported by evidence-based business insights.

The analysis focuses on questions such as:

* What is the total revenue generated?
* How many orders and customers are represented in the data?
* What is the average order value?
* How does revenue change over time, including month-over-month growth?
* Which regions generate the most revenue?
* Which product categories and products generate the most revenue?
* How do salespeople compare?
* Which payment methods are most frequently used?
* Which customers and products show unusual patterns?

 Tools Used

* Excel — initial data cleaning and exploratory analysis
* MySQL (via XAMPP / phpMyAdmin) — relational database and SQL analysis
* Power BI Desktop — data modeling, DAX measures, and the interactive dashboard
* Git / GitHub — version control and project handover

 Dataset

The project uses three related CSV datasets:

 1. Customers

* CustomerID
* CustomerName
* Region
* Segment

 2. Products

* ProductID
* ProductName
* Category
* UnitPrice

 3. Orders

* OrderID
* OrderDate
* CustomerID
* ProductID
* Quantity
* UnitPrice
* SalesPerson
* PaymentMethod

Note: the source data contains no Revenue column. Revenue is calculated throughout this project as `Quantity × UnitPrice`.

The three tables are related through their customer and product identifiers.

 Data Cleaning and Preparation

Data preparation was carried out during the Excel and SQL stages of the project. The process included:

* Investigating unusual and inconsistent values.
* Checking for duplicate OrderID records.
* Reviewing quantity values and identifying invalid or negative quantities.
* Checking for null/missing keys (CustomerID, ProductID).
* Checking date formatting and converting OrderDate for time-based analysis.
* Checking for unmatched CustomerID/ProductID values between tables.
* Creating and validating revenue calculations (Quantity × UnitPrice).
* Reviewing regional and categorical values for consistency.
* Investigating unit price variation — every product consistently sells at three price points (approximately 95%, 100%, and 105% of a base price), a pattern that is consistent but not explained by any available field.

The validated relational data was then used for business analysis and Power BI reporting.

 Data Model

The Power BI data model consists of four tables:

* customers — one row per customer
* products — one row per product
* orders — one row per transaction (the fact table)
* DateTable — a dedicated calendar table, created with `CALENDAR(MIN(orders[OrderDate]), MAX(orders[OrderDate]))`, covering every calendar day in the dataset's range with no gaps

Relationships:

| From | To | Cardinality | Direction |
|---|---|---|---|
| orders (CustomerID) | customers (CustomerID) | Many-to-one | Single |
| orders (ProductID) | products (ProductID) | Many-to-one | Single |
| orders (OrderDate) | DateTable (Date) | Many-to-one | Single |

Why a separate Date table was used: Power BI's `DATEADD()` function, used for the month-over-month revenue comparison, requires a contiguous date column with no gaps. `orders[OrderDate]` only contains dates where a sale actually occurred, so it has gaps. The dedicated DateTable, marked as an official date table, provides the unbroken daily calendar that time-intelligence functions need. All date-based slicers and chart axes in the report use `DateTable[Date]` rather than `orders[OrderDate]`, so filtering correctly flows through to the time-intelligence measures.

 KPI Definitions

| Measure | DAX | Definition |
|---|---|---|
| Total Revenue | `SUMX(orders, orders[Quantity] * orders[UnitPrice])` | Sum of Quantity × UnitPrice across all orders. |
| Total Orders | `COUNTROWS(orders)` | Count of transaction rows. |
| Average Order Value | `DIVIDE([Total Revenue], [Total Orders])` | Total Revenue divided by Total Orders. |
| Total Customers | `DISTINCTCOUNT(orders[CustomerID])` | Count of unique customers who placed at least one order. |
| Previous Month Revenue | `CALCULATE([Total Revenue], DATEADD(DateTable[Date], -1, MONTH))` | Total Revenue shifted back one month, using the DateTable's contiguous calendar. |
| Monthly Revenue Growth % | `DIVIDE([Total Revenue] - [Previous Month Revenue], [Previous Month Revenue])` | Percentage change vs. the previous month. Most meaningful when filtered to a single month; at the full-range level it approaches 0%, since the current and shifted ranges mostly overlap. |

Current overall values (full dataset, no filters applied):

* Total Revenue: GH₵3,458,371.25
* Total Orders: 1,000
* Average Order Value: GH₵3,458.37
* Total Customers: 120
* Previous Month Revenue (example, single-month context): GH₵3.14M
* Monthly Revenue Growth (example, single-month context): 10.06%

These KPIs provide management with a quick overview of overall sales performance and recent revenue movement.

 Dashboard Visualizations

The dashboard includes:

* KPI cards (Total Revenue, Total Orders, Average Order Value, Total Customers, Previous Month Revenue, Monthly Revenue Growth %)
* Monthly revenue trend
* Revenue by region
* Revenue by product category
* Top products by revenue
* Salesperson performance
* Interactive date, region and category slicers
* A drill-through page ("Product Details") — accessible from the Top Products chart, showing order-level detail filtered to the selected product
* A Data Notes page documenting known data limitations and assumptions

The dashboard was designed to provide a management-level view while allowing users to investigate different parts of the sales data.

 Key Findings

Full detail, evidence, and recommendations are documented in `executive_summary.md` and `day9_management_answers.md`. Summary highlights:

* Revenue fluctuates considerably rather than trending steadily — May was strongest (GH₵602,685.75, +65.03% vs. April), June and August both declined sharply (-42.04% and -39.22% respectively).
* Greater Accra and Western lead regionally (22.67% and 19.77% of revenue respectively), but revenue is not concentrated in one region — every region contributes at least 12.58%.
* Computers is the top category (GH₵2,164,050.00) despite modest unit volume (388 units), while Accessories sold the most units (758) but generated far less revenue (GH₵151,598.00) — volume does not predict revenue.
* Performance Laptop and Office Laptop are the top two products (GH₵1,052,880.00 and GH₵769,860.00 respectively).
* Customer value does not track order frequency — e.g. Kojo Sarpong generated GH₵62,199.00 from 12 orders (AOV GH₵5,183.25), while Priscilla Issah generated GH₵22,943.00 from 15 orders (AOV GH₵1,529.53).
* Salesperson revenue does not track order count — Francis Amoah led in revenue (GH₵699,100.50) and AOV (GH₵4,315.44), while Benjamin Osei had the most orders (176) but lower revenue (GH₵558,175.50).
* Payment methods are balanced, with Cash the most common (27.70%) but no method dominant.
* Unit prices vary by ±5% per product across orders, a consistent but unexplained pattern.

## Evidence-Based Recommendations

1. Investigate major monthly revenue changes — particularly the 42.04% decline in June and 39.22% decline in August — before using monthly figures for forecasting.
2. Prioritize high-value products and customers over high-volume ones — continue supporting Computers-category products like the Performance Laptop, while reviewing weaker performers like the Wireless Mouse (GH₵9,945.00 from 117 units) for pricing or positioning issues.
3. Use the dashboard regularly to monitor performance — the KPI cards, monthly trend, growth measures, slicers, and drill-through together support ongoing monitoring and early identification of emerging patterns.

## Assumptions and Limitations

* The available analysis period covers January to August 2026; August may be a partial month, as the dataset's date range ends August 25.
* Revenue is a derived field, calculated as Quantity × UnitPrice — any inaccuracy in the underlying quantity or price data would directly affect every revenue-based result.
* Unit price variation is unexplained — every product sells at three consistent price points (~95%, 100%, 105% of a base price), assumed intentional but not documented in the source data.
* The analysis identifies relationships and patterns but does not establish causes unless supporting evidence is available.
* Conclusions may change if additional transactions, customers, products, or business context become available.

 SQL Analysis

SQL was used throughout the project to perform business-focused analysis on the relational sales data, including:

* Transaction counts, total revenue, average order value
* Monthly revenue trend and month-over-month change (via CTE)
* Revenue by region and by product category
* Top products and top customers, including product ranking via window functions (`ROW_NUMBER()` / `RANK()`)
* Customers whose spend is above the overall customer average
* Salesperson performance and payment method analysis
* Customer/product validation (duplicates, nulls, unmatched keys)
* A reusable view, `vw_sales_analysis`, joining the main tables for analysis-ready querying

JOINs (including LEFT JOIN, for customers with no matching orders) were used to combine the Customers, Products and Orders tables. Key KPIs were reconciled between SQL and Power BI to confirm consistency — see `day8_validation.md`.

 Setup / Run Instructions

1. Import `customers.csv`, `products.csv`, and `orders.csv` into MySQL using the structure in `sql/database_setup.sql`.
2. Run the queries in `sql/day5_queries.sql`, `sql/day6_advanced_analysis.sql`, and `sql/day8_validation_and_advanced.sql` in order to reproduce the SQL-side analysis.
3. Open `powerbi/sales_dashboard_final.pbix` in Power BI Desktop to view and interact with the dashboard. No sign-in is required to open or view the file locally.
4. Refer to `day8_validation.md` for QA checks and `executive_summary.md` / `day9_management_answers.md` for business findings.

 Conclusion

This project demonstrates an end-to-end data analytics workflow, from data cleaning and validation through SQL analysis and interactive business intelligence reporting.

The Power BI dashboard brings together customer, product and order information into a single management view, validated against SQL results, allowing users to monitor key sales metrics and investigate performance across time, regions, categories, products, customers, salespeople and payment methods.

The project demonstrates practical use of data preparation, relational data modelling, SQL, DAX measures, time-intelligence calculations, and Power BI visualization to communicate evidence-based business information to non-technical stakeholders.