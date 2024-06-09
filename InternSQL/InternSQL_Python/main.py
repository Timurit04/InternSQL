import random
from datetime import datetime, timedelta

# Примерные списки фамилий, имен, отчеств и городов
last_names = ["Иванов", "Петров", "Сидоров", "Кузнецов", "Смирнов", "Попов", "Лебедев", "Козлов", "Новиков", "Морозов"]
first_names = ["Алексей", "Сергей", "Дмитрий", "Михаил", "Андрей", "Владимир", "Николай", "Иван", "Александр", "Юрий"]
middle_names = ["Алексеевич", "Сергеевич", "Дмитриевич", "Михайлович", "Андреевич", "Владимирович", "Николаевич", "Иванович", "Александрович", "Юрьевич"]
cities = ["Москва", "Санкт-Петербург", "Новосибирск", "Екатеринбург", "Казань", "Нижний Новгород", "Челябинск", "Самара", "Омск", "Ростов-на-Дону"]

# Примерные списки университетов и рейтинги
univ_names = ["УГНТУ", "МГУ", "СПбГУ", "НГУ", "УрФУ", "КФУ", "НГТУ", "ЮУрГУ", "ТГУ", "РГУ"]
univ_ratings = list(range(50, 101))

# Примерные списки предметов
subjects = ["Математика", "Физика", "Химия", "Биология", "История", "Литература", "Английский язык", "Информатика", "Экономика", "Философия"]


# Генерация случайного номера телефона
def generate_phone_number():
    return f"+7{random.randint(900, 999)}{random.randint(1000000, 9999999)}"

# Генерация случайного возраста
def generate_age():
    return random.randint(18, 80)

# Генерация случайной даты рождения
def generate_birthday(start_year=1980, end_year=2005):
    start_date = datetime(start_year, 1, 1)
    end_date = datetime(end_year, 12, 31)
    delta = end_date - start_date
    random_days = random.randint(0, delta.days)
    birthday = start_date + timedelta(days=random_days)
    return birthday.strftime('%Y-%m-%d')

# Генерация случайной даты экзамена
def generate_exam_date(start_year=2022, end_year=2024):
    start_date = datetime(start_year, 1, 1)
    end_date = datetime(end_year, 12, 31)
    delta = end_date - start_date
    random_days = random.randint(0, delta.days)
    exam_date = start_date + timedelta(days=random_days)
    return exam_date.strftime('%Y-%m-%d')

# Функция для генерации одного студента
def generate_student(student_id):
    first_name = random.choice(first_names)
    last_name = random.choice(last_names)
    middle_name = random.choice(middle_names)
    city = random.choice(cities)
    birthday = generate_birthday()
    univ_id = random.randint(1, 50)
    return f"({student_id}, '{first_name}', '{last_name}', '{middle_name}', '{city}', '{birthday}', {univ_id})"

# Функция для генерации одного лектора
def generate_lecturer(student_id):
    first_name = random.choice(first_names)
    last_name = random.choice(last_names)
    middle_name = random.choice(middle_names)
    city = random.choice(cities)
    birthday = generate_birthday()
    univ_id = random.randint(1, 50)
    return f"({student_id}, '{first_name}', '{last_name}', '{middle_name}', '{city}', '{birthday}', {univ_id})"

# Функция для генерации одного университета
def generate_university(univ_id):
    univ_name = random.choice(univ_names)
    rating = random.choice(univ_ratings)
    city = random.choice(cities)
    return f"({univ_id}, '{univ_name}', {rating}, '{city}')"

# Функция для генерации одного предмета
def generate_subject(subj_id):
    subj_name = random.choice(subjects)
    hours = random.randint(100, 300)
    return f"({subj_id}, '{subj_name}', {hours})"


# Функция для генерации одного экзамена
def generate_exam(exam_id, student_id):
    subj_id = random.randint(1, 10)
    mark = round(random.uniform(2, 5), 2)
    exam_date = generate_exam_date()
    return f"({exam_id}, {student_id}, {subj_id}, {mark}, '{exam_date}')"

# Генерация 1000 студентов и запись в файл
with open('students.txt', 'w', encoding='utf-8') as f:
    for student_id in range(1, 1001):
        student = generate_student(student_id)
        f.write(student + ',\n')

# Генерация 50 университетов и запись в файл
with open('universities.txt', 'w', encoding='utf-8') as f:
    for univ_id in range(1, 51):
        university = generate_university(univ_id)
        f.write(university + ',\n')

# Генерация 50 преподавателей и запись в файл
with open('lecturer.txt', 'w', encoding='utf-8') as f:
    for lecturer_id in range(1, 51):
        lecturer = generate_student(lecturer_id)
        f.write(lecturer + ',\n')
        
# Генерация 10 предметов и запись в файл
with open('subjects.txt', 'w', encoding='utf-8') as f:
    for subj_id in range(1, 11):
        subject = generate_subject(subj_id)
        f.write(subject + ',\n')

# Генерация 1000 экзаменов и запись в файл
with open('exams.txt', 'w', encoding='utf-8') as f:
    for exam_id in range(1, 1001):
        student_id = random.randint(1, 1000)
        exam = generate_exam(exam_id, student_id)
        f.write(exam + ',\n')