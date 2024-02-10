-- Lista kursów, na które uczęszcza uczeń.
SELECT s.student_name AS student,  c.course_name AS przedmiot
FROM courses c
JOIN students s ON c.group_id = s.group_id
WHERE s.id = 11;