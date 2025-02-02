-- Question: https://leetcode.com/problems/restaurant-growth/?envType=study-plan-v2&envId=top-sql-50

SELECT DISTINCT visited_on, SUM(amount) OVER(ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) AS amount, ROUND((SUM(amount) OVER(ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW)/7),2) AS average_amount
FROM Customer
LIMIT 9999999999
OFFSET 6;

-- We can't use OFFSET without LIMIT and hence providing some random higer value as limit

-- ROUND((SUM(amount) OVER(ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW)/7),2) AS average_amount
-- Here we are using SUM()/7 to manually find the avergae instead of using AVG(), because we can get multiple occurences of same date and hence we need to consider all those dates as a single date. But if we use AVG(), then it will consider all those dates as individual entry
