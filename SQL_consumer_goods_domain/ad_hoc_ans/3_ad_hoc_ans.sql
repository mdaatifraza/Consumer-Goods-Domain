-- Provide a report with all the unique product counts for each  segment  
-- and sort them in descending order of product counts.

SELECT 
	segment,
    COUNT(DISTINCT(product_code)) as product_count
FROM dim_product
GROUP BY segment
ORDER BY product_count