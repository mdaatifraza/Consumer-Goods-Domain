-- Get the products that have the highest and lowest manufacturing costs. 

SELECT 
    p.product_code,
    p.product,
    f.manufacturing_cost
FROM 
    dim_product p
JOIN 
    fact_manufacturing_cost f ON p.product_code = f.product_code
WHERE 
    f.manufacturing_cost = (
        SELECT MAX(manufacturing_cost) 
        FROM fact_manufacturing_cost
    )
    OR f.manufacturing_cost = (
        SELECT MIN(manufacturing_cost) 
        FROM fact_manufacturing_cost
    );
