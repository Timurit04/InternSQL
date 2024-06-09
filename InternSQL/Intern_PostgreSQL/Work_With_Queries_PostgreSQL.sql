--Вывод наименования дисциплин (Subj_Name) и количество часов (Hour) для каждой дисциплины.

	SELECT Subj_Name, Hour FROM Subject

--Запрос, позволяющий получить из таблицы Exam_mark значения столбца Mark (экзаменационная оценка)
--для всех студентов, исключив из списка повторение одинаковых строк.

	SELECT DISTINCT Mark FROM Exam_mark

--Добавлен в таблицу Student столбец Kurs, затем реализован запрос,
--который выводит список фамилий студентов, обучающихся на третьем и последующих курсах.

	ALTER TABLE Student
	ADD Kurs smallint;
 
	UPDATE Student
	SET Kurs = (SELECT TRUNC(RANDOM() * 4 + 1))
	WHERE Kurs = NULL;

	SELECT Surname FROM Student WHERE Kurs >= 3;

-- Запрос на вывод находящихся в таблице Exam_mark номеров дисциплин, экзамены по которым сдавались между 10 и 21 января 2023 года.

	SELECT Subj_Id, Exam_Date FROM Exam_mark WHERE Exam_Date BETWEEN '2023-01-10' AND '2023-01-21'

-- Составьте запрос для таблицы Student таким образом, чтобы выходная таблица содержала один столбец,
-- содержащий последовательность разделенных символом ";" (точка с запятой) 
-- значений всех столбцов этой таблицы, и при этом текстовые значения должны отображаться прописными символами (верхний регистр)

	SELECT CONCAT(UPPER(Surname), '; ', UPPER(Name), '; ', UPPER(City), '; ', to_char(Birthday, 'DD/MM/YYYY'), '; ', Univ_Id, '.')
	FROM Student;


-- Составьте запрос для таблицы Student таким образом, чтобы выходная таблица содержала всего один столбец в следующем виде:

	SELECT CONCAT(Surname, ' ', Name, ' родился в ', EXTRACT(YEAR FROM Birthday), ' году') 
	AS result FROM Student;


-- Напишите запрос, выбирающий данные об именах всех студентов, учащихся в университете c идентификатором 5,
-- статус оценки которых выше общего среднего статуса.

	SELECT Name, Surname
	FROM Student
	WHERE Student.Univ_Id = 5 AND Student_Id IN (
	SELECT Student_id 
	FROM Exam_Mark
	WHERE Mark > (SELECT AVG(Mark) 
			       FROM Exam_Mark));


-- Напишите запрос с EXISTS, позволяющий вывести данные обо всех сотрудниках, все оценки, которых выше 3. 

	SELECT *
	FROM Student AS S
	WHERE EXISTS (
  		SELECT *
  		FROM Exam_Mark AS E
  		WHERE E.Student_id = S.Student_id AND E.Mark > 3);



