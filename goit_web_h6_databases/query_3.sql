-- Średnia ocen w grupach dla wybranego przedmiotu.
SELECT c.course_name AS przedmiot, g2.group_name AS klasa, ROUND(AVG(g.grade), 3)
FROM grades g
JOIN students s ON g.student_id = s.id
JOIN courses c ON g.course_id = c.id
JOIN groups g2 ON s.group_id = g2.id
WHERE g.course_id = 2
GROUP BY s.group_id;