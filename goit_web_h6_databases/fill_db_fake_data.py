from datetime import datetime
from random import randint, choice
import sqlite3

import faker


NUMBER_OF_STUDENTS = 50
NUMBER_OF_LECTURERS = 5
COURSES = [
    "Podstawy programowania",
    "Analiza matematyczna",
    "Bazy danych",
    "Administracja systemem operacyjnym",
    "Technologie sieciowe",
    "Programowanie obiektowe",
    "Metody analizy danych",
    "Inżynieria oprogramowania",
]
GROUPS = [
    ("1A",),
    ("1B",),
    ("1C",),
]
GRADES_SCOPE = [
    2,
    3,
    3.5,
    4,
    4.5,
    5,
]


def generate_fake_data(
    number_of_students, number_of_lecturers, courses, groups, grades_scope
) -> tuple[list, list, list, list]:
    """Function to generate fake data for students, lecturers, courses and grades"""
    for_students = []
    for_lecturers = []
    for_courses = []
    for_grades = []

    fake_data = faker.Faker("pl_PL")

    for _ in range(number_of_students):
        for_students.append(
            (
                fake_data.name(),
                fake_data.ascii_free_email(),
                randint(1, len(groups)),
            )
        )

    for _ in range(number_of_lecturers):
        for_lecturers.append((fake_data.name(), fake_data.ascii_free_email()))

    for course in courses:
        for_courses.append(
            (
                course,
                randint(1, number_of_lecturers),
                randint(1, len(groups)),
            )
        )

    for student_id in range(1, number_of_students + 1):
        for _ in range(randint(15, 20)):
            grade_date = datetime(2024, 1, randint(2, 31)).date()
            for_grades.append(
                (
                    choice(grades_scope),
                    grade_date,
                    randint(1, len(courses)),
                    student_id,
                )
            )
    return for_students, for_lecturers, for_courses, for_grades


def insert_data_to_db(for_students, for_lecturers, for_courses, for_grades):
    """Function to insert data to database"""
    with sqlite3.connect("university.db") as con:
        cur = con.cursor()

        sql_to_lecturers = (
            """INSERT INTO lecturers (lecturer_name, email) VALUES (?,?)"""
        )
        cur.executemany(sql_to_lecturers, for_lecturers)

        sql_to_groups = """INSERT INTO groups (group_name) VALUES (?)"""
        cur.executemany(sql_to_groups, GROUPS)

        sql_to_courses = """INSERT INTO courses (course_name, lecturer_id, group_id) VALUES (?,?,?)"""
        cur.executemany(sql_to_courses, for_courses)

        sql_to_students = (
            """INSERT INTO students (student_name, email, group_id) VALUES (?,?,?)"""
        )
        cur.executemany(sql_to_students, for_students)

        sql_to_grades = """INSERT INTO grades (grade, date_of, course_id, student_id) VALUES (?,?,?,?)"""
        cur.executemany(sql_to_grades, for_grades)

        con.commit()


if __name__ == "__main__":
    for_students, for_lecturers, for_courses, for_grades = generate_fake_data(
        NUMBER_OF_STUDENTS, NUMBER_OF_LECTURERS, COURSES, GROUPS, GRADES_SCOPE
    )
    insert_data_to_db(for_students, for_lecturers, for_courses, for_grades)
