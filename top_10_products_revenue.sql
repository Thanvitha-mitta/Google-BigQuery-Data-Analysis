SELECT
  product.productSKU AS SKU,
  product.v2ProductName AS Product_Name,
  SUM(product.productRevenue) / 1000000 AS Total_Revenue
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS hits,
  UNNEST(hits.product) AS product
WHERE
  _TABLE_SUFFIX BETWEEN '20170101' AND '20170331'
  AND hits.eCommerceAction.action_type = '6'
GROUP BY
  SKU, Product_Name
ORDER BY
  Total_Revenue DESC
LIMIT 10;
