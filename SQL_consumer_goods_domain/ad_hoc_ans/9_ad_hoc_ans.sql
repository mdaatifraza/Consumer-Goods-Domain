-- Which channel helped to bring more gross sales in the fiscal year 2021 
-- and the percentage of contribution

WITH gross_sales as 
(
SELECT 
	c.channel AS _channel,
    ROUND(SUM(g.gross_price * s.sold_quantity)/1000000,2) AS gross_sales_mln
FROM fact_sales_monthly s
JOIN fact_gross_price g 
ON s.product_code = g.product_code
AND s.fiscal_year = g.fiscal_year
JOIN dim_customer c 
ON s.customer_code = c.customer_code
WHERE s.fiscal_year = 2021
GROUP BY c.channel
)
SELECT 
	_channel,
    gross_sales_mln,
    ROUND(gross_sales_mln/SUM(gross_sales_mln) OVER() *100,2)  AS pct_contribution
FROM gross_sales
ORDER BY pct_contribution DESC
