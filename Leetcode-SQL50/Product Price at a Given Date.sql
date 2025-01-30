-- Question: https://leetcode.com/problems/product-price-at-a-given-date/?envType=study-plan-v2&envId=top-sql-50


-- My Solution
SELECT Table3.product_id, IFNULL(Table2.new_price,10) AS price FROM
    (SELECT DISTINCT product_id FROM Products) AS Table3
LEFT JOIN
    (SELECT product_id, new_price FROM 
        (
            SELECT product_id,new_price,change_date,
            ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS row_num
            FROM Products
            WHERE change_date <= '2019-08-16'
        ) AS Table1
    WHERE Table1.row_num=1
    ) AS Table2
ON Table3.product_id = Table2.product_id;


-- Sol[1]
SELECT product_id, 10 as price 
FROM Products
WHERE product_id NOT IN (SELECT product_id FROM Products WHERE change_date <= '2019-08-16')
UNION
SELECT product_id, new_price as price
FROM Products
WHERE (product_id, change_date) IN (SELECT product_id, max(change_date) FROM Products WHERE change_date <= '2019-08-16' GROUP BY product_id);
