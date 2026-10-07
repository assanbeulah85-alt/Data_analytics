&#x20;Data Dictionary



&#x20;Project Overview



This project analyzes sales transactions using a relational data model consisting of orders, customers, and products. The original raw sales data is stored in `data/raw\_sales.csv`, while the cleaned relational datasets are stored in `data/orders.csv`, `data/customers.csv`, and `data/products.csv`.



&#x20;1. Raw Sales Dataset



File: `data/raw\_sales.csv`



This is the original denormalized sales dataset. It combines order, customer, and product information in a single table.



| Column        | Description                                                          |

| ------------- | -------------------------------------------------------------------- |

| OrderID       | Unique identifier for a sales order.                                 |

| OrderDate     | Date on which the order was placed, stored in day/month/year format. |

| CustomerID    | Identifier for the customer associated with the order.               |

| CustomerName  | Customer name recorded in the raw dataset.                           |

| Region        | Customer's region recorded in the raw dataset.                       |

| Segment       | Customer segment, such as Retail, SME, or Corporate.                 |

| ProductID     | Identifier for the product sold.                                     |

| Product       | Product name recorded in the raw dataset.                            |

| Category      | Product category.                                                    |

| Quantity      | Number of units sold in the order.                                   |

| UnitPrice     | Price per unit for the transaction.                                  |

| SalesPerson   | Salesperson responsible for the order.                               |

| PaymentMethod | Payment method used for the transaction.                             |



&#x20;2. Orders Table



File: `data/orders.csv`



The orders table contains transaction-level sales information.



| Column        | Data Type | Description                                                    |

| ------------- | --------- | -------------------------------------------------------------- |

| OrderID       | Text      | Unique identifier for the order.                               |

| OrderDate     | Text/Date | Date of the order, stored in day/month/year format in the CSV. |

| CustomerID    | Text      | Customer identifier used to link orders to customers.          |

| ProductID     | Text      | Product identifier used to link orders to products.            |

| Quantity      | Integer   | Number of units sold.                                          |

| UnitPrice     | Decimal   | Unit selling price recorded for the transaction.               |

| SalesPerson   | Text      | Salesperson responsible for the order.                         |

| PaymentMethod | Text      | Payment method used by the customer.                           |



Derived metric:



`Revenue = Quantity × UnitPrice`



&#x20;3. Customers Table



File: `data/customers.csv`



The customers table contains customer master data.



| Column       | Description                                     |

| ------------ | ----------------------------------------------- |

| CustomerID   | Unique identifier for a customer.               |

| CustomerName | Customer name.                                  |

| Region       | Geographic region associated with the customer. |

| Segment      | Customer segment.                               |



`CustomerID` is used to connect the customers table to the orders table.



&#x20;4. Products Table



File: `data/products.csv`



The products table contains product master data.



| Column      | Description                           |

| ----------- | ------------------------------------- |

| ProductID   | Unique identifier for a product.      |

| ProductName | Name of the product.                  |

| Category    | Product category.                     |

| UnitPrice   | Reference unit price for the product. |



`ProductID` is used to connect the products table to the orders table.



&#x20;5. Relationships



The project uses the following relational structure:



```text

Customers

&#x20;   CustomerID

&#x20;       │

&#x20;       │ 1-to-many

&#x20;       ▼

Orders

&#x20;   CustomerID

&#x20;   ProductID

&#x20;       ▲

&#x20;       │ 1-to-many

&#x20;       │

Products

&#x20;   ProductID

```



Each customer can have multiple orders, and each product can appear in multiple orders.



&#x20;6. Key Business Metrics



| Metric              | Definition                                                      |

| ------------------- | --------------------------------------------------------------- |

| Total Revenue       | Sum of transaction revenue, calculated as Quantity × UnitPrice. |

| Total Orders        | Count of orders/OrderID records.                                |

| Average Order Value | Total Revenue divided by Total Orders.                          |

| Total Customers     | Count of customers represented in the analysis.                 |

| Units Sold          | Sum of Quantity across orders.                                  |



&#x20;7. Important Data Notes



\* `OrderDate` is stored as text in the source CSV and SQL table and uses the `DD/MM/YYYY` format.

\* `Revenue` is a derived value rather than a stored source column.

\* The raw dataset combines customer and product attributes with transaction data, while the cleaned datasets separate these into related tables.

\* The `UnitPrice` in the orders table represents the transaction price used to calculate revenue. The product table's `UnitPrice` is treated as product reference information.



