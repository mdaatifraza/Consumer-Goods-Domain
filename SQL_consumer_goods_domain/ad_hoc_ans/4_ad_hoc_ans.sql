-- Which segment had the most increase in unique products in 
-- 2021 vs 2020?

WITH segment_product_counts AS (
  SELECT 
    d.segment, 
    COUNT(
      DISTINCT CASE WHEN f.fiscal_year = 2020 THEN f.product_code END
    ) AS product_count_2020, 
    
    COUNT(
      DISTINCT CASE WHEN f.fiscal_year = 2021 THEN f.product_code END
    ) AS product_count_2021 
  FROM 
    fact_sales_monthly f 
    JOIN dim_product d ON f.product_code = d.product_code 
  WHERE 
    f.fiscal_year IN (2020, 2021) 
  GROUP BY 
    d.segment
) 
SELECT 
  segment, 
  product_count_2020, 
  product_count_2021, 
  product_count_2021 - product_count_2020 AS difference 
FROM 
  segment_product_counts 
ORDER BY 
  difference DESC 