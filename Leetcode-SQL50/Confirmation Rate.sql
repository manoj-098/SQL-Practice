-- Question : https://leetcode.com/problems/confirmation-rate/?envType=study-plan-v2&envId=top-sql-50

-- Sol[1]
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


-- Sol[2]

select s.user_id, round(ifnull(avg(action = 'confirmed'), 0),2) as confirmation_rate from
Signups s left join Confirmations c
on s.user_id= c.user_id
group by s.user_id

