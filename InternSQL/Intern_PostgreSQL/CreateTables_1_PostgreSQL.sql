-- Создание таблицы университет
CREATE TABLE University (
    Univ_Id int PRIMARY KEY,
    Univ_Name varchar(255),
    Rating smallint,
    City varchar(255)
);

-- Создание таблицы студентов
CREATE TABLE Student (
    Student_Id int PRIMARY KEY,
    Name varchar(255),
    Surname varchar(255),
    Middle_Name varchar(255),
    City varchar(255),
    Birthday date,
    Univ_Id int,
    FOREIGN KEY (Univ_Id) REFERENCES University(Univ_Id)
);

CREATE TABLE Lecturer(
	Lecturer_Id int PRIMARY KEY,
	Surname varchar(255),
	Name varchar(255),
	Middle_Name varchar(255),
	City varchar(255),
	Birthday date,
	Univ_Id int,
	FOREIGN KEY (Univ_Id) REFERENCES University(Univ_Id)
);
--Создание таблицы предметов
CREATE TABLE Subject(
	Subj_Id int PRIMARY KEY,
	Subj_Name varchar(255),
	Hour smallint
);

--Создание таблицы экзаменов
CREATE TABLE Exam_Mark(
	Exam_Id int PRIMARY KEY,
	Student_Id int,
	Subj_Id int,
	Mark decimal(3,2),
	Exam_Date date,
	FOREIGN KEY (Student_Id) REFERENCES Student(Student_Id),
	FOREIGN KEY (Subj_Id) REFERENCES Subject(Subj_Id)
);


--Создание индекса для каждого студента, чтобы быстро осуществлять поиск оценок по датам.
CREATE INDEX Exam_Date_Index
	ON Exam_Mark(Exam_Date);