-- Question: https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/?envType=study-plan-v2&envId=top-sql-50

WITH AllIds AS(
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
)
SELECT id,COUNT(*) AS num
FROM AllIds
GROUP BY id
ORDER BY COUNT(*) DESC
LIMIT 1;
