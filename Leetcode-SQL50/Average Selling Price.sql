--Question: https://leetcode.com/problems/average-selling-price/?envType=study-plan-v2&envId=top-sql-50


--Sol[1]
SELECT p.product_id, ROUND(IFNULL(SUM(u.units*p.price)/SUM(u.units),0),2) AS average_price 
FROM Prices p
LEFT JOIN UnitsSold u
ON p.product_id=u.product_id
AND u.purchase_date >=p.start_date AND u.purchase_date <=p.end_date
GROUP BY p.product_id
ORDER BY average_price;

--Sol[2]
SELECT 
    p.product_id,
    ROUND(SUM(u.units * p.price) / SUM(u.units), 2) AS average_price
FROM 
    UnitsSold u
JOIN 
    Prices p
ON 
    u.product_id = p.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY 
    p.product_id
UNION
SELECT 
    p.product_id,
    0 AS average_price
FROM 
    Prices p
WHERE 
    p.product_id NOT IN (SELECT DISTINCT product_id FROM UnitsSold);
