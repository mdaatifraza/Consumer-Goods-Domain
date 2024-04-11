-- Provide the list of markets in which customer  "Atliq  Exclusive" 
-- operates its business in the  APAC  region.

SELECT 
	distinct market,
    region,
    customer
FROM 
	dim_customer c
WHERE
	customer = 'Atliq Exclusive' AND
    region = 'APAC'