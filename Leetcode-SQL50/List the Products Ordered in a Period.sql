-- Question: https://leetcode.com/problems/list-the-products-ordered-in-a-period/submissions/1528563181/?envType=study-plan-v2&envId=top-sql-50

-- Sol[1]
SELECT P.product_name , SUM(O.unit) AS unit
FROM Products P
JOIN Orders O
ON P.product_id = O.product_id
AND O.order_date LIKE "2020-02-%"
GROUP BY O.product_id
HAVING SUM(O.unit)>=100

--Sol[2]
SELECT P.product_name, O.unit
FROM Products P
JOIN (
    SELECT product_id , SUM(unit) AS unit
    FROM Orders
    WHERE order_date LIKE "2020-02-%"
    GROUP BY product_id
) AS O
ON P.product_id = O.product_id
WHERE O.unit >=100;
