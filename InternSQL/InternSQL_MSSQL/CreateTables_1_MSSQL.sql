--Создание таблицы университет
CREATE TABLE University(
	Univ_Id int,
	Univ_Name varchar(max),
	Rating smallint,
	City varchar(max)
);

--Создание таблицы студентов
CREATE TABLE Student(
	Student_Id int,
	Name varchar(max),
	Surname varchar(max),
	Middle_Name varchar(max),
	City varchar(max),
	Birthday date,
	Univ_Id int,
);

--Создание таблицы лекторов
CREATE TABLE Lecturer(
	Lecturer_Id int,
	Surname varchar(max),
	Name varchar(max),
	Middle_Name varchar(max),
	City varchar(Max),
	Birthday date,
	Univ_Id int,
);

--Создание таблицы предметов
CREATE TABLE Subject(
	Subj_Id int,
	Subj_Name varchar(max),
	Hour smallint
);

--Создание таблицы экзаменов
CREATE TABLE Exam_Mark(
	Exam_Id int,
	Student_Id int,
	Subj_Id int,
	Mark decimal(3,2),
	Exam_Date date,
);


--Создание индекса для каждого студента, чтобы быстро осуществлять поиск оценок по датам.
CREATE INDEX Exam_Date_Index
	ON Exam_Mark(Exam_Date);