-- Question: https://leetcode.com/problems/biggest-single-number/?envType=study-plan-v2&envId=top-sql-50

--Sol[1]
SELECT COALESCE(
    (
        SELECT num
        FROM MyNumbers
        GROUP BY num
        HAVING COUNT(*) = 1
        ORDER BY num DESC
        LIMIT 1
    ), NULL) AS num;

--Sol[2]
SELECT 
    (SELECT num 
     FROM MyNumbers
     GROUP BY num
     HAVING COUNT(*) = 1
     ORDER BY num DESC
     LIMIT 1) AS largest_unique_num;

-- Sol[3]
SELECT 
(CASE
    WHEN EXISTS (SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(*)=1 LIMIT 1) 
    THEN (SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(*)=1 ORDER BY num DESC LIMIT 1)
    ELSE NULL
END) AS num;
