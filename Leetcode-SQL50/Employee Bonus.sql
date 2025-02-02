-- Question: https://leetcode.com/problems/employee-bonus/description/?envType=study-plan-v2&envId=top-sql-50

select e.name, b.bonus
from employee as e
left join bonus as b
on e.empId=b.empId
where b.bonus<1000 or b.bonus is null;
