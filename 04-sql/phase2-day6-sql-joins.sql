/*
Objective:
Use SQL joins to analyze student enrollment across
multiple courses and identify overlaps and differences.
*/

# INNER JOIN - Which students are enrolled in BOTH Course A and Course B?
select a.student_id, a.student_name, a.city from course_a_students a inner join course_b_students b on a.student_id = b.student_id;
-- INNER JOIN returns only students present in both tables,
-- which helps identify overlapping enrollments.

# LEFT JOIN - Which students are enrolled in Course A, including those NOT enrolled in Course B?
select a.student_id, a.student_name, a.city from course_a_students a left join course_b_students b on a.student_id = b.student_id;
-- LEFT JOIN preserves all Course A students,
-- allowing identification of students exclusive to Course A.

# LEFT JOIN + NULL CHECK - Which students are enrolled ONLY in Course A?
select a.student_id, a.student_name, a.city from course_a_students a left join course_b_students b on a.student_id = b.student_id WHERE b.student_id IS NULL;

# Students in Course B but NOT in Course A?
select b.student_id, b.student_name, b.city from course_b_students b left join course_a_students a on b.student_id = a.student_id WHERE a.student_id IS NULL;

# Right Join - Which students are enrolled in Course B, including those NOT enrolled in Course A?
select a.student_id, a.student_name, a.city from course_a_students a right join course_b_students b on a.student_id = b.student_id;
-- RIGHT JOIN preserves all Course B students,
-- allowing identification of students exclusive to Course B.


# Outer join using Union
select * from course_a_students a left join course_b_students b on a.student_id = b.student_id
Union
select * from course_a_students a right join course_b_students b on a.student_id = b.student_id;


/*
Join Logic Insights:
- INNER JOIN identifies overlapping records between two datasets.
- LEFT JOIN ensures all records from the primary table are retained.
- NULL checks after a LEFT JOIN help identify non-matching records.
- Join selection depends on whether missing or unmatched data
  is important for the business question.
*/
