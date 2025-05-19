# import sqlite3
#
# def create_users_table():
#     #Подключаемся к БД
#     conn = sqlite3.connect("Lesson8.db")
#     #Для управления БД
#     cursor = conn.cursor()
#
#
#     # Метод execute нужен для щапуска SQL кода
#     cursor.execute(
#         """
#         CREATE TABLE users(
#         id INTEGER PRIMARY KEY AUTOINCREMENT,
#         username VARCHAR(255) NOT NULL
#         )
#         """
#     )
#
#     # Нужен чтобы сохранить изменение
#     conn.commit()
#     conn.close()
#
# def add_user(username):
#     #Подключаемся к БД
#     conn = sqlite3.connect("Lesson8.db")
#     #Для управления БД
#     cursor = conn.cursor()
#     cursor.execute(
#         """
#         INSERT INTO users(username)
#         VALUES(?)
#         """,(username, )
#     )
#
#     conn.commit()
#     conn.close()
#
# def get_all_users():
#     #Подключаемся к БД
#     conn = sqlite3.connect("Lesson8.db")
#     #Для управления БД
#     cursor = conn.cursor()
#     cursor.execute(
#         "SELECT * FROM users WHERE id=?",
#         (1, )
#     )
#
#     # users = cursor.fetchall()
#     user = cursor.fetchone()
#     print(user)
#     # print(users)
#
# # create_users_table()
# add_user("ruslan")
# # add_user("timur")
# get_all_users()



import sqlite3

def create_authors_table():
    conn = sqlite3.connect("Lesson8.db")
    cursor = conn.cursor()
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS authors(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fname VARCHAR(255) NOT NULL,
            lname VARCHAR(255) NOT NULL,
            date_of_birth DATE NOT NULL
        )
    """)
    conn.commit()
    conn.close()


def create_books_table():
    conn = sqlite3.connect("Lesson8.db")
    cursor = conn.cursor()
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS books(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name VARCHAR(255) NOT NULL,
            description TEXT,
            rating REAL,
            year INTEGER,
            author_id INTEGER,
            FOREIGN KEY(author_id) REFERENCES authors(id)
        )
    """)
    conn.commit()
    conn.close()

def add_author(fname, lname, date_of_birth):
    conn = sqlite3.connect("Lesson8.db")
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO authors(fname, lname, date_of_birth)
        VALUES(?, ?, ?)
    """, (fname, lname, date_of_birth))
    conn.commit()
    conn.close()

def add_book(name, description, rating, year, author_id):
    conn = sqlite3.connect("Lesson8.db")
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO books(name, description, rating, year, author_id)
        VALUES(?, ?, ?, ?, ?)
    """, (name, description, rating, year, author_id))
    conn.commit()
    conn.close()


def get_authors(min_date, max_date, fullname):
    conn = sqlite3.connect("Lesson8.db")
    cursor = conn.cursor()
    search_pattern = f"%{fullname}%"
    cursor.execute("""
        SELECT * FROM authors
        WHERE date_of_birth BETWEEN ? AND ?
        AND (fname || ' ' || lname) LIKE ?
    """, (min_date, max_date, search_pattern))
    authors = cursor.fetchall()
    conn.close()
    return authors


def get_books(name, min_rating, max_rating):
    conn = sqlite3.connect("Lesson8.db")
    cursor = conn.cursor()
    search_pattern = f"%{name}%"
    cursor.execute("""
        SELECT * FROM books
        WHERE name LIKE ? AND rating BETWEEN ? AND ?
    """, (search_pattern, min_rating, max_rating))
    books = cursor.fetchall()
    conn.close()
    return books


create_authors_table()
create_books_table()


add_author("Уильям", "Шекспир", "1564-04-23")
add_author("Лев", "Толстой", "1828-09-09")
add_author("Фёдор", "Достоевский", "1821-11-11")
add_author("Джейн", "Остин", "1775-12-16")
add_author("Габриэль Гарсиа", "Маркес", "1927-03-06")
add_author("Джордж", "Оруэлл", "1903-06-25")


add_book("1984", "Мир тотального контроля, в котором Большой брат следит за тобой. Мрачное будущее, где мысли становятся преступлением.", 4.2, 1949, 6)
add_book("Убить пересмешника", "История от лица девочки, отец которой защищает чернокожего в суде.", 4.3, 1960, 1)
add_book("Мастер и Маргарита", "Сатирическое и мистическое повествование о визите дьявола в атеистическую Москву.", 4.4, 1967, 2)
add_book("Преступление и наказание", "История студента, который решает убить старуху-процентщицу, чтобы доказать свою исключительность.", 4.2, 1866, 3)
add_book("Великий Гэтсби", "Портрет американской мечты, любви и иллюзий в эпоху джаза.", 3.9, 1925, 1)
add_book("Сто лет одиночества", "Эпическая сага о семье Буэндиа в вымышленном городе Макондо.", 4.1, 1967, 5)
add_book("Гарри Поттер и философский камень", "Начало приключений мальчика-волшебника, который узнаёт о своей судьбе и магическом мире.", 4.5, 1997, 5)
add_book("Анна Каренина", "История любви, измены и страдания в высшем обществе России.", 4.1, 1877, 2)
add_book("Маленький принц", "Притча о дружбе, любви и ответственности, рассказанная глазами ребёнка.", 4.3, 1943, 4)
add_book("Повелитель мух", "Группа детей оказывается на необитаемом острове, где цивилизация уступает дикости.", 3.7, 1954, 4)
add_book("451 градус по Фаренгейту", "Общество, в котором книги подлежат сожжению, а мышление — преступление.", 4.2, 1953, 1)
add_book("Атлант расправил плечи", "История борьбы индивидуализма против государственного вмешательства.", 4.2, 1949, 3)
add_book("Над пропастью во ржи", "Бунт подростка против фальшивого взрослого мира.", 4.2, 1951, 4)


authors = get_authors("1800-01-01", "1900-01-01", "")
print(authors)

books = get_books("0", 3, 9)
print(books)


