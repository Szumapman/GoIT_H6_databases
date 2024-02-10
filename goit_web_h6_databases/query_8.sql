-- Średnia ocen wystawionych przez wykładowcę z danego przedmiotu.
SELECT c.course_name AS przedmiot, l.lecturer_name AS wykladowca, ROUND(AVG(g.grade), 3) AS srednia_ocen
FROM grades AS g
JOIN courses AS c ON g.course_id = c.id
JOIN lecturers AS l ON c.lecturer_id = l.id
WHERE c.id = 2;