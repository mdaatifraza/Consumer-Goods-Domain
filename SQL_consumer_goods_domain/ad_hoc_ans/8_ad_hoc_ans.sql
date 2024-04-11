-- In which quarter of 2020, got the maximum total_sold_quantity?

SELECT 
    f.fiscal_year,
    CASE 
        WHEN MONTH(f.date) IN (9, 10, 11) THEN 'Q1'
        WHEN MONTH(f.date) IN (12, 1, 2) THEN 'Q2'
        WHEN MONTH(f.date) IN (3, 4, 5) THEN 'Q3'
        WHEN MONTH(f.date) IN (6, 7, 8) THEN 'Q4'
    END AS quarter_name,
    ROUND(SUM(f.sold_quantity)/1000000,3) as total_sold_qty_mln
FROM 
    fact_sales_monthly f
WHERE fiscal_year = 2020
GROUP BY quarter_name
ORDER BY total_sold_qty_mln desc
