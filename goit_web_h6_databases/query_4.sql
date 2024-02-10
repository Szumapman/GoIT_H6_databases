-- Średnia ocen dla wszystkich grup, uwzględniając wszystkie oceny (dodaano kolejność od najwyższej średniej).
SELECT g.group_name, ROUND(AVG(subquery.avg_grade), 3) AS srednia_ocen_grupy
FROM groups g
JOIN (
    SELECT s.group_id, AVG(g.grade) AS avg_grade
    FROM students s
    JOIN grades g ON s.id = g.student_id
    GROUP BY s.group_id
) subquery ON g.id = subquery.group_id
GROUP BY g.group_name
ORDER BY srednia_ocen_grupy DESC;