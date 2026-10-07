&#x20;Assumptions and Limitations



&#x20;1. Data and Validation Assumptions



&#x20;Order Identification



`OrderID` is treated as the unique identifier for an order. Validation confirmed 1,000 order records and 1,000 unique OrderIDs, with no duplicate OrderIDs.



&#x20;Customer and Product Relationships



`CustomerID` and `ProductID` are treated as valid foreign keys linking the orders table to the customers and products tables. Validation confirmed that there were no unmatched CustomerIDs or ProductIDs.



&#x20;Missing Values



The analysis assumes that the key fields required for the analysis are complete. Validation found no null OrderIDs, CustomerIDs, or ProductIDs.



&#x20;Quantity



Quantity values are assumed to represent valid units sold. Validation found no invalid quantities.



&#x20;Revenue Calculation



Revenue is calculated at transaction level as:



`Revenue = Quantity × UnitPrice`



The UnitPrice stored in the orders table is used for the revenue calculation because it represents the price associated with the individual transaction.



&#x20;Transaction-Level Price Differences



The UnitPrice in the orders table was compared with the reference UnitPrice in the products table.



A total of 375 orders had price differences:



&#x20;185 orders had a -5% difference.

&#x20;190 orders had a +5% difference.



The differences were systematic and occurred at exactly ±5%. They were therefore treated as valid transaction-level price adjustments rather than data errors. No price corrections were made.



\---



&#x20;2. SQL and Power BI Reconciliation



The main dashboard metrics were reconciled between SQL and Power BI after clearing dashboard slicer selections.



| Metric              |    SQL Value | Power BI Display | Result |

| ------------------- | -----------: | ---------------: | ------ |

| Total Orders        |        1,000 |               1K | PASS   |

| Total Revenue       | 3,458,371.25 |            3.46M | PASS   |

| Average Order Value |     3,458.37 |            3.46K | PASS   |



The underlying SQL and Power BI values agree. The differences visible in the dashboard are due to Power BI display rounding.



\---



&#x20;3. Analysis Assumptions



The analysis focuses primarily on sales revenue, order volume, customer activity, product performance, regional performance, and salesperson performance.



The available data is assumed to be sufficiently representative for the purpose of this project. However, the analysis describes patterns in the available dataset and does not establish causal relationships.



Revenue is used as a performance measure. Revenue should not be interpreted as profit because the dataset does not contain product costs, operating expenses, or profit-margin information.



\---



&#x20;4. Limitations



&#x20;Limited Time Period



The dataset represents a limited period of sales activity. This restricts the ability to make strong conclusions about long-term trends, annual performance, or seasonality.



&#x20;Historical Rather Than Real-Time Data



The analysis is based on the supplied historical data. The dashboard should therefore not be interpreted as a real-time monitoring system.



&#x20;No Cost or Profit Data



The dataset contains sales prices and quantities but does not provide product costs, operating expenses, or profit margins. Therefore, the analysis can evaluate revenue performance but cannot determine profitability.



&#x20;Limited Customer Information



The customer data contains CustomerID, CustomerName, Region, and Segment. It does not include detailed demographic information, customer acquisition cost, lifetime value, or broader customer behavior.



&#x20;Limited Product Information



The product data contains ProductID, ProductName, Category, and UnitPrice. It does not contain inventory levels, supplier costs, stock availability, or product margins.



&#x20;Price Reference Limitation



The products table contains reference UnitPrice values, while the orders table contains the UnitPrice used for individual transactions. Because the validation identified systematic ±5% transaction-level differences, the orders table price was retained for revenue calculations.



&#x20;Data Quality Scope



The validation checks covered the available fields and relationships, including duplicates, null keys, quantities, customer/product matching, and price differences. Errors that cannot be detected using the available fields may still exist.







&#x20;5. Recommended Next Steps



Future versions of the analysis could be improved by adding:



1\. Product cost and margin data to support profitability analysis.

2\. Inventory data to evaluate stock availability and potential lost sales.

3\. A longer historical period to support trend and seasonality analysis.

4\. More detailed customer information to support customer segmentation and lifetime-value analysis.

5\. Marketing and acquisition data to evaluate marketing effectiveness.

6\. Automated validation checks as part of the data-refresh process.



&#x20;6. Responsible Interpretation



The dashboard and analysis should be used to identify patterns, compare performance, and support business investigation.



Recommendations in this project are based on the available sales data and should be considered together with operational knowledge and additional business information. Observed relationships in the dataset should not automatically be interpreted as causal relationships.



