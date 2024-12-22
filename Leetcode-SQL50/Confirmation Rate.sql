-- Question : https://leetcode.com/problems/confirmation-rate/?envType=study-plan-v2&envId=top-sql-50

SELECT s.user_id , ROUND(
    CASE
       WHEN c.action IS NULL THEN 0
       ELSE SUM(c.action='confirmed')/COUNT(c.action)
    END,2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id=c.user_id
GROUP BY s.user_id
ORDER BY confirmation_rate;
