-- Question: https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/description/?envType=study-plan-v2&envId=top-sql-50

select e2.unique_id,e1.name
from employees as e1
left join employeeUNI as e2
on e1.id=e2.id;
