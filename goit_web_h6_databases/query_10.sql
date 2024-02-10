-- Lista kursów prowadzonych przez wybranego wykładowcę dla określonego ucznia.
SELECT c.course_name AS przedmiot, l.lecturer_name AS wykladowca, s.student_name AS student
FROM courses AS c
JOIN lecturers AS l ON c.lecturer_id = l.id
JOIN students AS s ON s.group_id  = c.group_id
WHERE l.id = 1 AND s.id = 6;