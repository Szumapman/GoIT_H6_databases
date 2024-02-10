-- Średnia ocen w grupach dla wybranego przedmiotu.
WITH CourseGrades AS (
    SELECT g.student_id, g.course_id, AVG(g.grade) AS avg_grade
    FROM grades g
    WHERE g.course_id = 3
    GROUP BY g.student_id, g.course_id
)
SELECT gr.group_name, ROUND(AVG(cg.avg_grade), 3) AS srednia_ocen, c.course_name AS przedmiot
FROM groups gr
JOIN CourseGrades cg ON gr.id = cg.student_id
JOIN courses c ON cg.course_id = c.id
GROUP BY gr.group_name, c.course_name;