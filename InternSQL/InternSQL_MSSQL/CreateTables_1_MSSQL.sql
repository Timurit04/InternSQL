--�������� ������� �����������
CREATE TABLE University(
	Univ_Id int,
	Univ_Name varchar(max),
	Rating smallint,
	City varchar(max)
);

--�������� ������� ���������
CREATE TABLE Student(
	Student_Id int,
	Name varchar(max),
	Surname varchar(max),
	Middle_Name varchar(max),
	City varchar(max),
	Birthday date,
	Univ_Id int,
);

--�������� ������� ��������
CREATE TABLE Lecturer(
	Lecturer_Id int,
	Surname varchar(max),
	Name varchar(max),
	Middle_Name varchar(max),
	City varchar(Max),
	Birthday date,
	Univ_Id int,
);

--�������� ������� ���������
CREATE TABLE Subject(
	Subj_Id int,
	Subj_Name varchar(max),
	Hour smallint
);

--�������� ������� ���������
CREATE TABLE Exam_Mark(
	Exam_Id int,
	Student_Id int,
	Subj_Id int,
	Mark decimal(3,2),
	Exam_Date date,
);


--�������� ������� ��� ������� ��������, ����� ������ ������������ ����� ������ �� �����.
CREATE INDEX Exam_Date_Index
	ON Exam_Mark(Exam_Date);