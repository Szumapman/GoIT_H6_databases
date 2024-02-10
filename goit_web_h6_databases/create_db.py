import sqlite3


def create_db(sql_file_name, db_file_name):
    with open(sql_file_name, "r") as f:
        sql = f.read()
    with sqlite3.connect(db_file_name) as con:
        cur = con.cursor()
        cur.executescript(sql)


if __name__ == "__main__":
    create_db("university.sql", "university.db")