--Question: https://leetcode.com/problems/find-followers-count/submissions/1490526392/?envType=study-plan-v2&envId=top-sql-50

SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY 1
ORDER BY 1;

