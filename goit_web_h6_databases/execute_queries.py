import sqlite3

QUERIES = {
    1: "5 uczniów z najwyższą średnią ocen ze wszystkich przedmiotów.",
    2: "Uczeń z najwyższą średnią ocen z wybranego przedmiotu.",
    3: "Średnia ocen w grupach dla wybranego przedmiotu.",
    4: "Średnia ocen dla wszystkich grup, uwzględniając wszystkie oceny.",
    5: "Przedmioty, które prowadzi wybrany wykładowca.",
    6: "Lista uczniów w wybranej grupie.",
    7: "Oceny uczniów w wybranej grupie z określonego przedmiotu.",
    8: "Średnia ocen wystawionych przez wykładowcę z danego przedmiotu.",
    9: "Lista kursów, na które uczęszcza uczeń.",
    10: "Lista kursów prowadzonych przez wybranego wykładowcę dla określonego ucznia.",
    # zadanie dodatkowe
    11: "Średnia ocen wybranego ucznia wystawionych przez określonego wykładowcę.",
    12: "Oceny uczniów w wybranej grupie z określonego przedmiotu na ostatnich zajęciach.",
}


def execute_query(db_name: str, sql_query: str) -> list:
    with sqlite3.connect(db_name) as con:
        cur = con.cursor()
        cur.execute(sql_query)
        return cur.fetchall()


def get_sql_query(sql_file_name: str) -> str:
    with open(sql_file_name, "r") as f:
        sql = f.read()
    return sql


if __name__ == "__main__":
    for number, query in QUERIES.items():
        print(f"Zadanie {number}: {query}")
        print(execute_query("university.db", get_sql_query(f"query_{number}.sql")))
        print("-" * 20)
