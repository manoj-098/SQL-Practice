-- Question : https://leetcode.com/problems/count-salary-categories/?envType=study-plan-v2&envId=top-sql-50

-- [Try-1] : Incorrect
-- SELECT category,COUNT(*) AS accounts_count
-- FROM (SELECT account_id ,
-- CASE
--     WHEN income<20000 THEN "Low Salary"
--     WHEN income>5000 THEN "High Salary"
--     ELSE "Avergae Salary"
-- END
-- AS category
-- FROM Accounts) AS Temp
-- GROUP BY Temp.category
-- HAVING Temp.category="High Salary"
-- UNION
-- SELECT category,COUNT(*) AS accounts_count
-- FROM (SELECT account_id ,
-- CASE
--     WHEN income<20000 THEN "Low Salary"
--     WHEN income>5000 THEN "High Salary"
--     ELSE "Avergae Salary"
-- END
-- AS category
-- FROM Accounts) AS Temp
-- GROUP BY Temp.category
-- HAVING Temp.category="Low Salary"
-- UNION
-- SELECT category,COUNT(*) AS accounts_count
-- FROM (SELECT account_id ,
-- CASE
--     WHEN income<20000 THEN "Low Salary"
--     WHEN income>50000 THEN "High Salary"
--     ELSE "Avergae Salary"
-- END
-- AS category
-- FROM Accounts) AS Temp
-- WHERE Temp.category="Average Salary"
-- GROUP BY Temp.category;

-- Sol:
SELECT 'Low Salary' AS category, 
       COUNT(if(income<20000,1,null)) AS accounts_count
FROM Accounts
UNION ALL
SELECT 'Average Salary', 
       COUNT(if(income>=20000 and income<=50000,1,null))
FROM Accounts
UNION ALL
SELECT 'High Salary', 
       COUNT(if(income>50000,1,null))
FROM Accounts;

-- =======================================================================
--  NOTE: The COUNT(NULL) function always returns 0 because COUNT() counts only non-NULL values in the specified column or expression.
-- =======================================================================

