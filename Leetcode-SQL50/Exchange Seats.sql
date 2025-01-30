
-- Sol[1] Using Window Function
SELECT id,
CASE
    WHEN (id%2)!=0 THEN IFNULL(LEAD(student,1) OVER (ORDER BY id),student)
    ELSE LAG(student,1) OVER (ORDER BY id)
END AS student
FROM Seat;

-- Sol[2] Using sub-query
SELECT S2.id,
CASE
    WHEN (id%2)!=0 THEN IFNULL((SELECT S.student FROM Seat S WHERE S2.id+1=S.id),S2.student)
    ELSE (SELECT S.student FROM Seat S WHERE S.id=S2.id-1)
END AS student
FROM Seat S2;
