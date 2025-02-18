SELECT
  FORMAT_DATE('%Y-%m', PARSE_DATE('%Y%m%d', date)) AS Month,
  SUM(totals.transactions) AS Total_Transactions,
  SUM(totals.transactionRevenue) / 1000000 AS Total_Revenue
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20170101' AND '20170331'
GROUP BY
  Month
ORDER BY
  Month;
