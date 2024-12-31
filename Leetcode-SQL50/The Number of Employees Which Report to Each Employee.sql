--Question: https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/?envType=study-plan-v2&envId=top-sql-50

SELECT e1.employee_id, e1.name, COUNT(e1.employee_id) AS reports_count , ROUND(AVG(e2.age),0) AS average_age 
FROM Employees AS e1
JOIN Employees AS e2
ON e1.employee_id=e2.reports_to
GROUP BY e1.employee_id
ORDER BY e1.employee_id;
