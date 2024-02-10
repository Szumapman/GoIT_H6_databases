-- Uczeń (uczniowie) z najwyższą średnią ocen z wybranego przedmiotu.
SELECT s.student_name, c.course_name, AVG(g.grade) AS avg_grades
FROM students s
JOIN grades g ON s.id = g.student_id
JOIN courses c ON g.course_id = c.id
WHERE c.id = 2
GROUP BY s.id, c.id
ORDER BY avg_grades DESC
LIMIT 1;