-- Question: https://leetcode.com/problems/primary-department-for-each-employee/?envType=study-plan-v2&envId=top-sql-50

--Sol[1]
    SELECT employee_id ,department_id
    FROM Employee
    GROUP BY employee_id
    HAVING (COUNT(employee_id)=1)
UNION
    SELECT employee_id ,department_id
    FROM Employee
    WHERE primary_flag='Y';

--Sol[2]
SELECT employee_id,department_id
FROM Employee
WHERE employee_id IN (
    SELECT employee_id FROM Employee 
    GROUP BY employee_id HAVING(COUNT(*)=1)) OR primary_flag='Y';
