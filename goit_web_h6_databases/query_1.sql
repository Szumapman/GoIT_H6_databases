-- 5 uczniów z najwyższą średnią ocen ze wszystkich przedmiotów
SELECT s.id, s.student_name, ROUND(AVG(g.grade), 3) as avg_grades
FROM students s
JOIN grades g ON s.id = g.student_id
GROUP BY s.id
ORDER BY avg_grades DESC
LIMIT 5;