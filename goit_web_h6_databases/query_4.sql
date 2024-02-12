-- Średnia ocen dla wszystkich grup, uwzględniając wszystkie oceny (dodaano kolejność od najwyższej średniej).
SELECT g2.group_name AS klasa, ROUND(AVG(g.grade), 3) AS srednia_ocen_klasy
FROM grades g
JOIN students s ON g.student_id = s.id
JOIN courses c ON g.course_id = c.id
JOIN groups g2 ON s.group_id = g2.id
GROUP BY s.group_id
ORDER BY srednia_ocen_klasy DESC;