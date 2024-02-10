-- Średnia ocen wybranego ucznia wystawionych przez określonego wykładowcę.
SELECT l.lecturer_name AS wykladowca, s.student_name AS strudent, ROUND(AVG(grade), 3) AS srednia_ocen
FROM grades g
JOIN courses c ON g.course_id = c.id
JOIN students s ON g.student_id = s.id
JOIN lecturers l ON c.lecturer_id = l.id
WHERE l.id = 1 AND s.id = 2;