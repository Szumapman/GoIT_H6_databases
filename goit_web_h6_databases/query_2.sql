-- Uczeń (uczniowie) z najwyższą średnią ocen z wybranego przedmiotu.
WITH CourseGrades AS (
    SELECT g.student_id, g.course_id, AVG(g.grade) AS avg_grade
    FROM grades g
    WHERE g.course_id = 3
    GROUP BY g.student_id, g.course_id
)
SELECT s.student_name, cg.avg_grade, c.course_name
FROM students s
JOIN CourseGrades cg ON s.id = cg.student_id
JOIN courses c ON cg.course_id = c.id
WHERE cg.avg_grade = (
    SELECT MAX(avg_grade)
    FROM CourseGrades
);