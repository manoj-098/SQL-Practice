--Question: https://leetcode.com/problems/user-activity-for-the-past-30-days-i/?envType=study-plan-v2&envId=top-sql-50

--Sol[1] Slower due to use of HAVING
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
GROUP BY activity_date
HAVING activity_date>'2019-06-27' AND activity_date<='2019-07-27';

--Sol[2] Faster due to WHERE
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date>'2019-06-27' AND activity_date<='2019-07-27'
GROUP BY activity_date;
