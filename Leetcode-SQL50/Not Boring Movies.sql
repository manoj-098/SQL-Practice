-- Write your MySQL query statement below
-- [EASY] 
SELECT * 
FROM Cinema
WHERE id%2!=0 AND description != 'boring'
ORDER BY rating DESC;
