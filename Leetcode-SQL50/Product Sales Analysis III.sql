--Question : https://leetcode.com/problems/product-sales-analysis-iii/?envType=study-plan-v2&envId=top-sql-50

--Sol[1]
SELECT s.product_id, s.year As first_year, s.quantity, s.price
FROM Sales s
JOIN (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) AS first_sales
ON s.product_id=first_sales.product_id AND
s.year=first_sales.first_year;

--Sol[2]
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) in (
    SELECT product_id, MIN(year) 
    FROM Sales
    GROUP BY product_id
)

--Sol[3] - Using RANK()
SELECT product_id, first_year, quantity, price
FROM (
    SELECT 
        product_id,
        year AS first_year,
        quantity,
        price,
        RANK() OVER (PARTITION BY product_id ORDER BY year) AS row_num
    FROM Sales
) subquery
WHERE row_num = 1
