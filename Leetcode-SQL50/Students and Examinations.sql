-- Question: https://leetcode.com/problems/students-and-examinations/description/?envType=study-plan-v2&envId=top-sql-50

select st.student_id, st.student_name  ,su.subject_name , COUNT(ex.subject_name) as attended_exams 
from students as st
    cross join subjects as su on 1=1
    left join examinations as ex on st.student_id=ex.student_id
    and su.subject_name = ex.subject_name
group by st.student_id,st.student_name,su.subject_name
order by  st.student_id,su.subject_name;

-- EXPLANATION BELOW 

-- Let's break this down step by step, explaining how to get the desired result using joins, and showing intermediate results at each step.

-- ### 1. Understanding the Tables

-- ### 2. First Step: Cross Join Students and Subjects

-- To ensure that all subjects are listed for each student, even if they haven't attended an exam for a subject, we first need a list of all combinations of students and subjects. 

-- This is done by performing a **CROSS JOIN** between the **Students** table and the **Subjects** table. This will give us every possible pair of student and subject.

-- **Intermediate Result After CROSS JOIN**:

-- | student_id | student_name | subject_name |
-- |------------|--------------|--------------|
-- | 1          | Alice        | Math         |
-- | 1          | Alice        | Physics      |
-- | 1          | Alice        | Programming  |
-- | 2          | Bob          | Math         |
-- | 2          | Bob          | Physics      |
-- | 2          | Bob          | Programming  |
-- | 13         | John         | Math         |
-- | 13         | John         | Physics      |
-- | 13         | John         | Programming  |
-- | 6          | Alex         | Math         |
-- | 6          | Alex         | Physics      |
-- | 6          | Alex         | Programming  |

-- This cross join creates a combination of all students and all subjects, even if the student hasn't attended any exam for that subject.

-- ### 3. Second Step: Left Join with Examinations Table

-- Now, we perform a **LEFT JOIN** with the **Examinations** table on `student_id` and `subject_name`. The reason we use a LEFT JOIN is to keep all students and subjects from the previous step, even if no record of an exam exists for that combination.

-- The LEFT JOIN ensures that:
-- - If the student has attended an exam for the subject, we get that record.
-- - If no exam record exists for the combination of student and subject, we still get the student-subject pair, but with NULL for the examination data.

-- **Intermediate Result After LEFT JOIN with Examinations Table**:

-- | student_id | student_name | subject_name | student_id (exam) | subject_name (exam) |
-- |------------|--------------|--------------|-------------------|---------------------|
-- | 1          | Alice        | Math         | 1                 | Math                |
-- | 1          | Alice        | Physics      | 1                 | Physics             |
-- | 1          | Alice        | Programming  | 1                 | Programming         |
-- | 2          | Bob          | Math         | 2                 | Math                |
-- | 2          | Bob          | Physics      | NULL              | NULL                |
-- | 2          | Bob          | Programming  | 2                 | Programming         |
-- | 13         | John         | Math         | 13                | Math                |
-- | 13         | John         | Physics      | 13                | Physics             |
-- | 13         | John         | Programming  | 13                | Programming         |
-- | 6          | Alex         | Math         | NULL              | NULL                |
-- | 6          | Alex         | Physics      | NULL              | NULL                |
-- | 6          | Alex         | Programming  | NULL              | NULL                |

-- Here, we can see the `NULL` values for students who haven't attended an exam for a particular subject.

-- ### 4. Third Step: Counting the Number of Examinations Attended

-- Now, we need to count the number of exams attended for each student and subject. Since the `LEFT JOIN` brought NULLs for subjects that weren't attended, we can count the number of non-null `subject_name` values from the Examinations table to get the number of attended exams.

-- We'll use `COUNT(ex.subject_name)` in our SELECT clause, which will count only the non-NULL values of `subject_name` in the Examinations table.

-- **Final Result After COUNT**:

-- | student_id | student_name | subject_name | attended_exams |
-- |------------|--------------|--------------|----------------|
-- | 1          | Alice        | Math         | 3              |
-- | 1          | Alice        | Physics      | 2              |
-- | 1          | Alice        | Programming  | 1              |
-- | 2          | Bob          | Math         | 1              |
-- | 2          | Bob          | Physics      | 0              |
-- | 2          | Bob          | Programming  | 1              |
-- | 6          | Alex         | Math         | 0              |
-- | 6          | Alex         | Physics      | 0              |
-- | 6          | Alex         | Programming  | 0              |
-- | 13         | John         | Math         | 1              |
-- | 13         | John         | Physics      | 1              |
-- | 13         | John         | Programming  | 1              |

-- ### 5. Sorting the Final Result

-- Finally, the result is sorted by `student_id` and `subject_name`, as per the problem's requirements.

-- ### Full Query:

-- ```sql
-- SELECT st.student_id, 
--        st.student_name, 
--        su.subject_name, 
--        COUNT(ex.subject_name) AS attended_exams
-- FROM students AS st
-- JOIN subjects AS su
--     ON 1 = 1  -- Cross join to include all subjects for each student
-- LEFT JOIN examinations AS ex 
--     ON st.student_id = ex.student_id 
--     AND su.subject_name = ex.subject_name
-- GROUP BY st.student_id, st.student_name, su.subject_name
-- ORDER BY st.student_id, su.subject_name;
-- ```

-- ### Explanation of Query:
-- 1. **Cross Join**: Ensures that every student gets every subject, even if they haven't attended an exam.
-- 2. **LEFT JOIN**: Brings in the `Examinations` data, linking students to subjects they attended exams for. If no exam record exists, we still get the student-subject pair.
-- 3. **COUNT()**: Counts the number of attended exams (non-null subject names).
-- 4. **GROUP BY**: Groups the result by `student_id`, `student_name`, and `subject_name` so that we can count exams per student and subject.
-- 5. **ORDER BY**: Orders the result by `student_id` and `subject_name` to match the expected output.

-- This query will give you the exact result where you have all students and all subjects, and it counts how many times each student attended each subject's exam.
