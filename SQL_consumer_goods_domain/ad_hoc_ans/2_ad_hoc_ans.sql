-- What is the percentage of unique product increase in 2021 vs. 2020? 

WITH 
  unique_prod_2020 AS (
    SELECT 
      COUNT(DISTINCT product_code) AS unique_products_2020
    FROM 
      fact_sales_monthly 
    WHERE 
      fiscal_year = 2020
  ),
  unique_prod_2021 AS (
    SELECT 
      COUNT(DISTINCT product_code) AS unique_products_2021
    FROM 
      fact_sales_monthly 
    WHERE 
      fiscal_year = 2021
  )

SELECT 
  up_20.unique_products_2020,
  up_21.unique_products_2021,
  ROUND(((up_21.unique_products_2021 - up_20.unique_products_2020) / NULLIF(up_20.unique_products_2020, 0)) * 100, 2) AS percentage_chg
FROM 
  unique_prod_2020 up_20
  CROSS JOIN unique_prod_2021 up_21;
