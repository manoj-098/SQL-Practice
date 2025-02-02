-- Question: https://leetcode.com/problems/delete-duplicate-emails/?envType=study-plan-v2&envId=top-sql-50

-- Sol[1] Using Window Function
WITH Temp AS(
    SELECT id, RANK() OVER(PARTITION BY email ORDER BY id) AS rnk
    FROM Person
)
DELETE FROM Person
WHERE Person.id IN (SELECT id FROM Temp WHERE rnk>1);

-- Sol[2] Using sub-query
DELETE FROM Person
WHERE Person.id NOT IN (SELECT * FROM (SELECT MIN(id) FROM Person GROUP BY email) AS minId);
