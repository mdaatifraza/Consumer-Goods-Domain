-- Generate a report which contains the top 5 customers who received an 
-- average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the 
-- Indian  market.

SELECT 
  c.customer_code, 
  c.customer, 
  ROUND(
    AVG(f.pre_invoice_discount_pct), 3) AS average_discount_percentage
FROM 
  dim_customer c 
  JOIN fact_pre_invoice_deductions f ON c.customer_code = f.customer_code 
WHERE 
  fiscal_year = 2021 
  AND market = 'India' 
GROUP BY 
  c.customer,
  c.customer_code
   
ORDER BY 
  average_discount_percentage DESC 
LIMIT 5
  
