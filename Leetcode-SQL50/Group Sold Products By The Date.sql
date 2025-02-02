-- Question: https://leetcode.com/problems/group-sold-products-by-the-date/?envType=study-plan-v2&envId=top-sql-50

SELECT sell_date, COUNT( DISTINCT product) AS num_sold,GROUP_CONCAT(DISTINCT product ORDER BY product separator ',') AS products
FROM Activities
GROUP BY sell_date;
