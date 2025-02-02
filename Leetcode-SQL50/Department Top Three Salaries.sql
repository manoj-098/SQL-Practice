-- Question: https://leetcode.com/problems/department-top-three-salaries/?envType=study-plan-v2&envId=top-sql-50

WITH RankedTable AS(
    SELECT Tab.Department,Employee,salary,
    DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS rnk
    FROM 
    (
        SELECT E.name AS Employee,E.salary,E.departmentId,D.name AS Department 
        FROM Employee   AS E
        JOIN Department AS D
        ON E.departmentId = D.id
    ) AS Tab
)
SELECT Department, Employee, Salary FROM RankedTable
WHERE rnk <= 3;
