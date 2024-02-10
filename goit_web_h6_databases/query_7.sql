-- Oceny uczniów w wybranej grupie z określonego przedmiotu.
SELECT s.student_name, g.grade, c.course_name, gr.group_name
FROM students AS s
JOIN grades AS g ON s.id = g.student_id
JOIN courses AS c ON g.course_id = c.id
JOIN groups gr ON s.group_id = gr.id
WHERE c.id = 1 AND gr.id = 3
ORDER BY s.student_name;