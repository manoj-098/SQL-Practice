-- Question: https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/?envType=study-plan-v2&envId=top-sql-50

-- -- select v.customer_id, count(*) as count_no_trans
-- -- from (select * from visits,transactions
-- -- where visits.visit_id==transactions.visit_id) as v
-- -- group by v.customer_id;
-- create view temp as
-- select v.customer_id,t.visit_id,t.transaction_id from visits as v
-- left join transactions as t
-- on v.visit_id=t.visit_id;

-- select customer_id, count(*) as count_no_trans
-- from (select v.customer_id,t.visit_id,t.transaction_id from visits as v
-- left join transactions as t
-- on v.visit_id=t.visit_id) as temp
-- where transaction_id is null
-- group by customer_id
-- order by count_no_trans desc;

select v.customer_id, count(*) as count_no_trans
from visits as v
left join transactions as t
on v.visit_id=t.visit_id
where t.transaction_id is null
group by v.customer_id
order by count_no_trans desc;
