-- Question: https://leetcode.com/problems/second-highest-salary/?envType=study-plan-v2&envId=top-sql-50

-- Sol[1] Using Window Function
WITH RankedTable AS(
    SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk FROM Employee
)
SELECT COALESCE((SELECT salary
FROM RankedTable
WHERE rnk = 2 LIMIT 1), NULL) AS SecondHighestSalary;

-- Sol[2]
SELECT (
    SELECT DISTINCT salary FROM Employee ORDER BY salary DESC LIMIT 1 OFFSET 1
) AS SecondHighestSalary
