-- database_setup.sql
-- Note: the orders table was exported into mysql by phpMyAdmin
-- when importing orders.csv (Import tab > CSV > first line contains
-- column names). The structure below is what phpMyAdmin generated,
-- taken from SHOW CREATE TABLE orders;

CREATE DATABASE IF NOT EXISTS data_analytics;
USE data_analytics;

DROP TABLE IF EXISTS orders;

CREATE TABLE `orders` (
  `OrderID` varchar(6) DEFAULT NULL,
  `OrderDate` varchar(10) DEFAULT NULL,
  `CustomerID` varchar(4) DEFAULT NULL,
  `ProductID` varchar(4) DEFAULT NULL,
  `Quantity` int(2) DEFAULT NULL,
  `UnitPrice` decimal(6,2) DEFAULT NULL,
  `SalesPerson` varchar(14) DEFAULT NULL,
  `PaymentMethod` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Data loaded via phpMyAdmin import of orders.csv