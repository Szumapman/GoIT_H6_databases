-- Oceny uczniów w wybranej grupie z określonego przedmiotu na ostatnich zajęciach
SELECT g.date_of AS data, c.course_name AS przedmiot, s.student_name, g.grade AS ocena
FROM students s
JOIN grades g ON s.id = g.student_id
JOIN courses c ON g.course_id = c.id
WHERE c.id  = 2
  AND s.group_id = 2
  AND g.date_of = (SELECT MAX(date_of) FROM grades);