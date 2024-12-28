--Question: https://leetcode.com/problems/classes-more-than-5-students/submissions/1490524797/?envType=study-plan-v2&envId=top-sql-50

SELECT class
FROM Courses
GROUP BY 1
HAVING COUNT(*)>=5;
