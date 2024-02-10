-- Przedmioty, które prowadzi wybrany wykładowca.
SELECT c.course_name, l.lecturer_name AS wykladowca
FROM courses c
JOIN lecturers l ON c.lecturer_id = l.id
WHERE lecturer_id = 1;