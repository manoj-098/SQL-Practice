-- Question: https://leetcode.com/problems/percentage-of-users-attended-a-contest/?envType=study-plan-v2&envId=top-sql-50

SELECT r.contest_id,ROUND((COUNT(r.user_id)/(SELECT COUNT(*) FROM Users))*100,2) AS percentage
FROM  Users u
JOIN register r
ON u.user_id=r.user_id
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id ASC;
