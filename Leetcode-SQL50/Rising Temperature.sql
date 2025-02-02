-- Question: https://leetcode.com/problems/rising-temperature/description/?envType=study-plan-v2&envId=top-sql-50

-- select a.id 
-- from weather as a, weather as b
-- where DATEDIFF(a.recordDate,b.recordDate)=1 
-- and a.temperature>b.temperature;

select a.id
from weather as a
join weather as b
on a.temperature>b.temperature and DATEDIFF(a.recordDate,b.recordDate)=1;
