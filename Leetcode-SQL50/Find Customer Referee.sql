-- Question: https://leetcode.com/problems/find-customer-referee/submissions/1477096498/?envType=study-plan-v2&envId=top-sql-50

SELECT name from customer
where referee_id IS NULL OR referee_id!=2;
