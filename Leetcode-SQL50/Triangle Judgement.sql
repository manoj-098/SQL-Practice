--Question: https://leetcode.com/problems/triangle-judgement/?envType=study-plan-v2&envId=top-sql-50

--Sol[1]
SELECT x,y,z,
CASE
    WHEN (x+y>z) AND (y+z>x) AND (x+z>y) THEN 'Yes'
    ELSE 'No'
END AS triangle
FROM Triangle;

--Sol[2]
SELECT * ,
IF((X + Y > Z) AND (X + Z > Y) AND(Y + Z > X),'Yes','No') AS triangle
FROM Triangle;
