-- Get the Top 3 products in each division that have a high 
-- total_sold_quantity in the fiscal_year 2021

WITH cte1 AS
(
    SELECT 
        p.division AS _division,
        s.product_code AS _product_code,
        p.product AS _product,
        SUM(s.sold_quantity) AS total_sold_qty
    FROM 
        fact_sales_monthly s 
    JOIN 
        dim_product p ON s.product_code = p.product_code
    WHERE 
        s.fiscal_year = 2021
    GROUP BY 
        p.division, p.product, p.product_code
),
cte2 AS 
(
    SELECT 
        _division,
        _product_code,
        _product,
        total_sold_qty,
        DENSE_RANK() OVER(PARTITION BY _division ORDER BY total_sold_qty DESC) AS _rank
    FROM 
        cte1
)

SELECT * FROM cte2
WHERE _rank <= 3;