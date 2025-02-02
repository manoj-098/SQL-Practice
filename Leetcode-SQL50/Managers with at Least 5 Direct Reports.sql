-- Question: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/submissions/?envType=study-plan-v2&envId=top-sql-50

SELECT temp.name
FROM (SELECT E2.name,E1.managerId
FROM Employee E1
JOIN Employee E2
ON E1.managerId=E2.id) AS temp
GROUP BY temp.name, temp.managerId
HAVING COUNT(*)>=5;
