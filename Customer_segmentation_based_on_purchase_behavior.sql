SELECT
  fullVisitorId AS Customer_ID,
  COUNT(DISTINCT visitId) AS Number_of_Sessions,
  SUM(totals.transactions) AS Total_Transactions,
  SUM(totals.transactionRevenue) / 1000000 AS Total_Revenue
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20170101' AND '20170331'
GROUP BY
  Customer_ID
HAVING
  Total_Transactions > 0
ORDER BY
  Total_Revenue DESC
LIMIT 10;
