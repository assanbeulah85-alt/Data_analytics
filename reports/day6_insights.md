Day 6 SQL Analysis — Findings and Interpretations



Findings



1\. Top Customer: Ibrahim Tetteh (C024) generated the highest recorded customer revenue at 102,539.50.



2\. Revenue by Region: Greater Accra recorded the highest total revenue at 783,853.00, while Ashanti recorded the lowest at 435,102.25.



3\. Revenue by Category: Computers generated the highest total revenue at 2,164,050.00, while Accessories generated the lowest at 151,598.00.



4\. Top Product: Performance Laptop generated the highest total product revenue at 1,052,880.00.



5\. Customers with No Orders: The LEFT JOIN analysis found 0 customers without a matching order. Every customer in the customer table had at least one recorded order.



&#x20;Interpretations



1\. The customer revenue results show that Ibrahim Tetteh contributed the highest recorded revenue among the customers in the dataset.



2\. Revenue was not evenly distributed across regions, with Greater Accra recording more revenue than the other regions in this dataset.



3\. The Computers category accounted for the largest share of recorded category revenue, while Accessories accounted for the smallest.



4\. The Performance Laptop was the highest-revenue product in the dataset, indicating that it contributed more recorded sales revenue than the other products.



5\. Since every customer had at least one matching order, the customer and order tables are fully connected based on CustomerID for the customers in this dataset.



