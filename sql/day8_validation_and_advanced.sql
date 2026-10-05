-- DAY 8: VALIDATION AND ADVANCED SQL ANALYSIS
-- Purpose: Data validation, advanced analysis, and business insights


-- QUERY 1: MONTHLY REVENUE AND MONTH-OVER-MONTH GROWTH
-- Business Question:
-- How much revenue did the business generate each month,
-- and how did revenue change compared with the previous month?

WITH MonthlyRevenue AS (
    SELECT
        DATE_FORMAT(
            STR_TO_DATE(OrderDate, '%d/%m/%Y'),
            '%Y-%m'
        ) AS month,
        SUM(Revenue) AS monthly_revenue
    FROM orders
    GROUP BY month
)

SELECT
    month,
    monthly_revenue,
    LAG(monthly_revenue) OVER (
        ORDER BY month
    ) AS previous_month_revenue,
    ROUND(
        (
            (monthly_revenue -
             LAG(monthly_revenue) OVER (ORDER BY month))
            /
            LAG(monthly_revenue) OVER (ORDER BY month)
        ) * 100,
        2
    ) AS mom_growth_percent
FROM MonthlyRevenue
ORDER BY month;


-- QUERY 2: RANK PRODUCTS BY REVENUE
-- Business Question:
-- Which products generate the most revenue, and what is the
-- revenue ranking of each product?

SELECT
    p.ProductID,
    p.ProductName,
    SUM(o.Revenue) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(o.Revenue) DESC
    ) AS revenue_rank
FROM orders o
JOIN products p
    ON o.ProductID = p.ProductID
GROUP BY
    p.ProductID,
    p.ProductName
ORDER BY revenue_rank;


-- QUERY 3: CUSTOMERS ABOVE AVERAGE SPEND
-- Business Question:
-- Which customers spend more than the average customer,
-- and which high-value customers may deserve special attention?

WITH CustomerSpend AS (
    SELECT
        c.CustomerID,
        c.CustomerName,
        SUM(o.Revenue) AS total_spend
    FROM orders o
    JOIN customers c
        ON o.CustomerID = c.CustomerID
    GROUP BY
        c.CustomerID,
        c.CustomerName
)

SELECT
    CustomerID,
    CustomerName,
    total_spend
FROM CustomerSpend
WHERE total_spend > (
    SELECT AVG(total_spend)
    FROM CustomerSpend
)
ORDER BY total_spend DESC;


-- QUERY 4: CREATE SALES ANALYSIS VIEW
-- Business Question:
-- Can we create a reusable view that combines order,
-- customer, and product information for future analysis?

CREATE OR REPLACE VIEW vw_sales_analysis AS
SELECT
    o.OrderID,
    o.OrderDate,
    o.CustomerID,
    c.CustomerName,
    c.Region,
    c.Segment,
    o.ProductID,
    p.ProductName,
    p.Category,
    o.Quantity,
    o.UnitPrice,
    o.Revenue,
    o.Salesperson,
    o.PaymentMethod
FROM orders o
LEFT JOIN customers c
    ON o.CustomerID = c.CustomerID
LEFT JOIN products p
    ON o.ProductID = p.ProductID;


-- Verify the sales analysis view
SELECT *
FROM vw_sales_analysis
LIMIT 10;


-- QUERY 5: REVENUE BY REGION
-- Business Question:
-- Which regions generate the most revenue, how many orders
-- do they receive, and what is their average order value?

SELECT
    c.Region,
    COUNT(DISTINCT o.OrderID) AS total_orders,
    SUM(o.Revenue) AS total_revenue,
    ROUND(AVG(o.Revenue), 2) AS average_order_value
FROM orders o
JOIN customers c
    ON o.CustomerID = c.CustomerID
GROUP BY c.Region
ORDER BY total_revenue DESC;


-- QUERY 6: REVENUE BY PRODUCT CATEGORY
-- Business Question:
-- Which product categories generate the most revenue,
-- how many orders do they receive, and what is their
-- average order value?

SELECT
    p.Category,
    COUNT(DISTINCT o.OrderID) AS total_orders,
    SUM(o.Revenue) AS total_revenue,
    ROUND(AVG(o.Revenue), 2) AS average_order_value
FROM orders o
JOIN products p
    ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY total_revenue DESC;


-- QUERY 7: TOP 5 CUSTOMERS BY REVENUE
-- Business Question:
-- Who are the five highest-value customers based on
-- the total revenue they generated?

SELECT
    c.CustomerID,
    c.CustomerName,
    c.Region,
    SUM(o.Revenue) AS total_revenue
FROM orders o
JOIN customers c
    ON o.CustomerID = c.CustomerID
GROUP BY
    c.CustomerID,
    c.CustomerName,
    c.Region
ORDER BY total_revenue DESC
LIMIT 5;
