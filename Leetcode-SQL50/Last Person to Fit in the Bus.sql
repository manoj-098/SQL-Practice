-- Question : https://leetcode.com/problems/last-person-to-fit-in-the-bus/?envType=study-plan-v2&envId=top-sql-50

SELECT Tablel2.Name as person_name
FROM
(SELECT turn AS Turn, person_id AS ID, person_name as Name, 
weight AS Weight, SUM(weight) OVER (ORDER BY turn) AS Total_Weight
FROM Queue) AS Tablel2
WHERE Tablel2.Total_Weight<=1000
ORDER BY Tablel2.Total_Weight DESC
LIMIT 1;

-- SELECT New_Table.turn AS person_name
-- FROM (SELECT turn AS Turn, person_id AS ID, person_name as Name, 
-- weight AS Weight, SUM(weight) OVER (ORDER BY turn) AS Total_Weight
-- FROM Queue) AS New_Table 
-- WHERE New_Table.Total_Weight>1000
-- LIMIT 1;

-- SELECT person_name
-- FROM Queue
-- WHERE turn = (SELECT New_Table.turn AS person_name
-- FROM (SELECT turn AS Turn, person_id AS ID, person_name as Name, 
-- weight AS Weight, SUM(weight) OVER (ORDER BY turn) AS Total_Weight
-- FROM Queue) AS New_Table 
-- WHERE New_Table.Total_Weight>1000
-- LIMIT 1) - 1 ;
