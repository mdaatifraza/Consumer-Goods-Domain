-- Get the complete report of the Gross sales amount for the customer  “Atliq 
-- Exclusive”  for each month  .  This analysis helps to  get an idea of low and 
-- high-performing months and take strategic decisions. 

SELECT 
	MONTHNAME(f.date) AS month_name,
    YEAR(f.date) as _year,
    ROUND(SUM(g.gross_price * f.sold_quantity)/1000000,2) AS gross_sales_amount_mln
    
FROM fact_sales_monthly f
JOIN fact_gross_price g ON f.product_code = g.product_code
JOIN dim_customer c ON f.customer_code = c.customer_code
WHERE 
	c.customer = 'Atliq Exclusive'
GROUP BY month_name,_year