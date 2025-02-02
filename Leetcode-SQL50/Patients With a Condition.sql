-- Question: https://leetcode.com/problems/patients-with-a-condition/submissions/1528425758/?envType=study-plan-v2&envId=top-sql-50

SELECT * 
FROM Patients
WHERE conditions LIKE "DIAB1%" OR 
      conditions LIKE "% DIAB1%";
