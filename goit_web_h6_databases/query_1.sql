-- 5 uczniów z najwyższą średnią ocen ze wszystkich przedmiotów
SELECT students.student_name, ROUND(AVG(grades.grade), 3) AS average_grade
FROM students
JOIN grades ON students.id = grades.student_id
JOIN courses ON grades.course_id = courses.id
GROUP BY students.id
ORDER BY average_grade DESC
LIMIT 5;