--����� ������������ ��������� (Subj_Name) � ���������� ����� (Hour) ��� ������ ����������.

	SELECT Subj_Name, Hour FROM Subject

--������, ����������� �������� �� ������� Exam_mark �������� ������� Mark (��������������� ������)
--��� ���� ���������, �������� �� ������ ���������� ���������� �����.

	SELECT DISTINCT Mark FROM Exam_mark

--�������� � ������� Student ������� Kurs, ����� ���������� ������,
--������� ������� ������ ������� ���������, ����������� �� ������� � ����������� ������.
 
	ALTER TABLE Student
	ADD Kurs smallint;

	UPDATE Student
	SET Kurs = (SELECT (ABS(CHECKSUM(NEWID())) % 5) + 1)
	WHERE Kurs = NULL;

	SELECT Surname FROM Student WHERE Kurs >= 3;

-- ������ �� ����� ����������� � ������� Exam_mark ������� ���������, �������� �� ������� ��������� ����� 10 � 21 ������ 2023 ����.

	SELECT Subj_Id, Exam_Date FROM Exam_mark WHERE Exam_Date BETWEEN '2023-01-10' AND '2023-01-21'

-- ��������� ������ ��� ������� Student ����� �������, ����� �������� ������� ��������� ���� �������,
-- ���������� ������������������ ����������� �������� ";" (����� � �������) 
-- �������� ���� �������� ���� �������, � ��� ���� ��������� �������� ������ ������������ ���������� ��������� (������� �������)

	SELECT CONCAT(UPPER(Surname), '; ', UPPER(Name), '; ', UPPER(City), '; ', CONVERT(varchar, Birthday, 103), '; ', Univ_Id, '.')
	FROM Student;


-- ��������� ������ ��� ������� Student ����� �������, ����� �������� ������� ��������� ����� ���� ������� � ��������� ����:

	SELECT CONCAT(Surname, ' ', Name, ' ������� � ', EXTRACT(YEAR FROM Birthday), ' ����') 
	AS result FROM Student;


-- �������� ������, ���������� ������ �� ������ ���� ���������, �������� � ������������ c ��������������� 5,
-- ������ ������ ������� ���� ������ �������� �������.

	SELECT Name, Surname
	FROM Student
	WHERE Student.Univ_Id = 5 AND Student_Id IN (
	SELECT Student_id 
	FROM Exam_Mark
	WHERE Mark > (SELECT AVG(Mark) 
			       FROM Exam_Mark))


-- �������� ������ � EXISTS, ����������� ������� ������ ��� ���� �����������, ��� ������, ������� ���� 3. 

	SELECT *
	FROM Student AS S
	WHERE EXISTS (
  		SELECT *
  		FROM Exam_Mark AS E
  		WHERE E.Student_id = S.Student_id AND E.Mark > 3);



