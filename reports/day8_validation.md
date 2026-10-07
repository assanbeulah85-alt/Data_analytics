&#x20;Day 8 — Data Validation Report



&#x20;1. Data Quality Validation



The following checks were performed to verify the quality and consistency of the sales dataset.



| Validation Check             |                    Expected |                         Actual | Status | Action                                          |

| ---------------------------- | --------------------------: | -----------------------------: | ------ | ----------------------------------------------- |

| Total order records          |                       1,000 |                          1,000 | PASS   | No action required                              |

| Unique OrderIDs              |                       1,000 |                          1,000 | PASS   | No action required                              |

| Duplicate OrderIDs           |                           0 |                              0 | PASS   | No action required                              |

| Null OrderIDs                |                           0 |                              0 | PASS   | No action required                              |

| Null CustomerIDs             |                           0 |                              0 | PASS   | No action required                              |

| Null ProductIDs              |                           0 |                              0 | PASS   | No action required                              |

| Invalid quantities           |                           0 |                              0 | PASS   | No action required                              |

| Unmatched CustomerIDs        |                           0 |                              0 | PASS   | No action required                              |

| Unmatched ProductIDs         |                           0 |                              0 | PASS   | No action required                              |

| Unexpected price differences | No inconsistent differences | 375 systematic ±5% differences | PASS   | Retained as valid transaction-level adjustments |







&#x20;2. Price Difference Validation



A comparison was performed between the UnitPrice in the orders table and the UnitPrice in the products table.



A total of 375 orders had price differences.



| Price Difference | Number of Orders |

| ---------------: | ---------------: |

|              -5% |              185 |

|              +5% |              190 |

|            Total |              375 |



The differences were systematic rather than random. All observed differences were either -5% or +5%, indicating transaction-level price adjustments rather than data corruption.



Conclusion: The differences were considered valid and no price corrections were made.



\---



&#x20;3. SQL vs Power BI Reconciliation



The overall SQL results were compared with the Power BI dashboard after clearing the dashboard slicer selections.



| Metric              |    SQL Value | Power BI Value | Status |

| ------------------- | -----------: | -------------: | ------ |

| Total Orders        |        1,000 |             1K | PASS   |

| Total Revenue       | 3,458,371.25 |          3.46M | PASS   |

| Average Order Value |     3,458.37 |          3.46K | PASS   |



The SQL and Power BI results reconcile successfully.



The small difference in how the numbers appear is due to Power BI's display rounding:



\* 1,000 → 1K

\* 3,458,371.25 → 3.46M

\* 3,458.37 → 3.46K



The underlying values are consistent.







4\. Validation Summary



The validation checks confirm that the dataset is structurally consistent.



&#x20;Key findings



\* The dataset contains 1,000 orders.

\* All OrderIDs are unique.

\* There are no null OrderIDs, CustomerIDs, or ProductIDs.

\* There are no invalid quantities.

\* All CustomerIDs match the customer reference table.

\* All ProductIDs match the product reference table.

\* The 375 price differences are systematic ±5% transaction-level adjustments.

\* SQL and Power BI totals reconcile successfully.



&#x20;Overall Result



Dataset validation: PASS



The dataset is suitable for the next stage of advanced SQL analysis and Power BI development.



