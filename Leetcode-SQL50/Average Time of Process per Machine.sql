-- Question: https://leetcode.com/problems/average-time-of-process-per-machine/?envType=study-plan-v2&envId=top-sql-50


-- select a.machine_id as m1,a.process_id as p1,a.activity_type as a1,a.timestamp as t1,
-- b.machine_id as m2,b.process_id as p2,b.activity_type as a2,b.timestamp as t2
select a.machine_id ,ROUND(AVG(b.timestamp-a.timestamp),3) as processing_time
from activity as a
join activity as b
on a.machine_id=b.machine_id 
where a.process_id=b.process_id
and a.activity_type = 'start' and b.activity_type='end'
group by a.machine_id
-- order by a.machine_id;
