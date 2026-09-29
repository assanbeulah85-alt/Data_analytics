Sales Management Dashboard



&#x20;Business Problem



The business needs a clear and interactive way to monitor sales performance and identify important patterns in revenue, customers, products, regions, categories and salespeople.



The objective of this project was to transform the available relational sales data into a Power BI management dashboard that allows decision-makers to quickly understand sales performance and explore the data using interactive filters.



The dashboard focuses on answering questions such as:



\* What is the total revenue generated?

\* How many orders and customers are represented in the data?

\* What is the average order value?

\* How does revenue change over time?

\* Which regions generate the most revenue?

\* Which product categories perform best?

\* Which products generate the most revenue?

\* How does sales performance differ between salespeople?



&#x20;Dataset



The dashboard uses three related CSV datasets:



1\. Customers



Contains customer information, including:



\* CustomerID

\* CustomerName

\* Region

\* Segment



2\. Products



Contains product information, including:



\* ProductID

\* ProductName

\* Category

\* UnitPrice



3\. Orders



Contains transaction-level sales information, including:



\* OrderID

\* OrderDate

\* CustomerID

\* ProductID

\* Quantity

\* UnitPrice

\* Salesperson

\* PaymentMethod



The three tables were imported into Power BI and connected using their related customer and product identifiers.



\## Data Cleaning and Preparation



Data preparation was carried out during the earlier Excel and SQL stages of the project.



The cleaning process included:



\* Investigating unusual and inconsistent values.

\* Checking for duplicate records.

\* Reviewing quantity values and identifying negative quantities.

\* Correcting identified data-quality issues where appropriate.

\* Checking date formatting and ensuring dates could be used for time-based analysis.

\* Creating revenue calculations from quantity and unit price.

\* Reviewing region and other categorical values for consistency.

\* Preparing the relational Customers, Products and Orders tables for analysis.



The cleaned relational data was then imported into Power BI.



\## SQL Analysis



SQL was used before the Power BI stage to perform business-focused analysis on the sales data.



The analysis included:



\* Transaction counts.

\* Total revenue.

\* Average order value.

\* Monthly revenue.

\* Salesperson performance.

\* Top products by revenue.

\* Revenue by region.

\* Revenue by product category.

\* Top customers.

\* Best-performing products by region.

\* Customers with no matching orders.



JOINs were used to combine the Customers, Products and Orders tables. A LEFT JOIN was also used to identify customers without matching orders, and a Common Table Expression (CTE) was used for customer-level revenue analysis.



This SQL analysis provided the foundation for the Power BI dashboard.



&#x20;Power BI Data Model



The dashboard uses a relational data model consisting of:

customers.csv, products.csv, orders.csv



Orders contains the transaction records and connects customers through CustomerID and products through ProductID.



Power BI relationships allow information from the three tables to be analysed together.



&#x20;KPIs



The dashboard contains four main KPI cards:



1\. Total Revenue



Measures the total revenue generated from the sales transactions.



2\. Total Orders



Measures the number of orders/transactions represented in the dataset.



3\. Average Order Value



Shows the average revenue generated per order.



4\. Total Customers



Shows the number of customers represented in the customer data.



These KPIs provide a quick overview of overall sales performance.



&#x20;Dashboard Visualizations



The dashboard includes:



\* Monthly revenue trend

\* Revenue by region

\* Category performance

\* Top 5 products by revenue

\* Salesperson performance

\* KPI cards

\* Interactive date, region and category slicers



The dashboard was designed to provide a simple management-level view while allowing users to filter and explore the sales data.



&#x20;Insights



The following insights were identified from the Power BI dashboard:



1\. Greater Accra is the highest-performing region, generating GH₵780,437.5 in revenue — around 23% of total revenue across all six regions.\*\*



2\. Eastern is the lowest-performing region, generating GH₵423,577.25, roughly 46% less than Greater Accra. The gap is notable but not extreme; the middle four regions form a fairly even gradient between the two.



3.. Computers is the highest-performing product category, generating approximately GH₵1.77M — roughly half of total revenue on its own. This aligns with the Top Products chart, where the two best-selling items (Performance Laptop, Office Laptop) both fall under Computers, suggesting the category's strength is concentrated in a couple of high-value products rather than spread evenly across it.



4\. The Performance Laptop is the top-performing product, generating GH₵984,000 — about 29% of total revenue on its own.\*\* Together with the Office Laptop (GH₵769,860), the top two products account for roughly 52% of all revenue.



5\. Salesperson performance is comparatively even. Francis Amoah is the top performer (GH₵627,506.5) and Esther Nyarko the lowest (GH₵529,724.25) — a gap of about 18%, much narrower than the spread seen across products or regions.



6\. Monthly revenue shows no steady upward or downward trend; it fluctuates. Revenue peaks in May (GH₵602,685.75) and dips in June (GH₵349,313) and August (GH₵316,055). The August figure should be treated with caution, as the dataset's date range ends mid-month and may not represent a full month.



7\. Revenue is concentrated in a small number of products. The eight lowest-selling products combined contribute less than 4% of total revenue, indicating a long tail of low-impact items.



8\. Unit prices for individual products vary across orders rather than staying fixed. Each product consistently appears at three price points — approximately 95%, 100%, and 105% of a base price — across different transactions. This pattern is consistent enough to be intentional (e.g. a discount or price-adjustment policy) rather than a data error, but the dataset does not explain its cause.



These insights describe patterns observed in the available sales data. They do not assume the reasons behind those patterns unless supported by additional evidence.



\## Evidence-Based Recommendations



Based on the patterns identified in the Power BI dashboard:



1\. \*\*Focus attention on high-performing regions and categories.\*\*

&#x20;  Management can examine the products and sales activity contributing to stronger revenue performance and consider how successful practices can be maintained or replicated.



2\. \*\*Review underperforming regions, products and categories.\*\*

&#x20;  Areas generating comparatively lower revenue should be investigated further to determine whether product demand, sales activity, pricing or other business factors may be contributing to the difference.



3\. \*\*Use the dashboard regularly to monitor sales performance.\*\*

&#x20;  Management can use the KPI cards, monthly trend and interactive slicers to monitor changes over time and identify emerging patterns that require further investigation.



\## Conclusion



This project demonstrates an end-to-end data analytics workflow, from data cleaning and SQL analysis to interactive business intelligence reporting.



The Power BI dashboard brings together customer, product and order information into a single interactive view, allowing management to monitor key sales metrics and investigate performance across time, regions, categories, products and salespeople.



The project demonstrates the use of data preparation, relational data modelling, SQL, DAX measures and Power BI visualization to communicate business information to non-technical stakeholders.

