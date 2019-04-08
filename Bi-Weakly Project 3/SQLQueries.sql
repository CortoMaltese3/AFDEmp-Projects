---------------------------------------------------------------------------------------------------------------------------------------------
--VIEW STUDENT's TIMETABLE ACCORDING TO ENROLLED CLASSES
CREATE VIEW vStudentTimetable AS
select firstName, lastName, subjectName, CONVERT(varchar(15),CAST(StartTime AS TIME),100) as StartTime, CONVERT(varchar(15),CAST(endTime AS TIME),100) as EndTime, classroom
from StudentDetails s
inner join StudentCalendar c on s.studentID = c.studentID
inner join TrainingSubjects t on t.subjectID = c.subjectID

CREATE PROCEDURE Get_Student_Timetable
@studentLastName VARCHAR(30)
AS
BEGIN
	DECLARE @count INT
	SET @count =
	(SELECT COUNT(*) 
	FROM TrainingSubjects t INNER JOIN StudentCalendar c on t.subjectID = c.subjectID INNER JOIN StudentDetails d on d.studentID = c.studentID
	WHERE lastName = @studentLastName)

	SELECT subjectName, StartTime, endTime, classroom
	FROM vStudentTimetable
	WHERE lastName = @studentLastName

	IF (@count = 0)
	BEGIN
		PRINT 'Student ' + CAST(@studentLastName AS NVARCHAR(50)) + ' hasn''t enrolled in any courses'
	END
END

--Student that hasn't enrolled in any classes
EXECUTE Get_Student_Timetable @studentLastName = 'Aleksiou'

--Student that has a set timetable
EXECUTE Get_Student_Timetable @studentLastName = 'Kalomalos'

---------------------------------------------------------------------------------------------------------------------------------------------
--VIEW TRAINER's TIMETABLE
CREATE PROCEDURE Get_Trainer_Timetable
@trainerLastName VARCHAR(30)
AS
BEGIN
	SELECT subjectName as Course, CONVERT(varchar(15),CAST(StartTime AS TIME),100) as StartTime, CONVERT(varchar(15),CAST(endTime AS TIME),100) as EndTime, classroom
	FROM TrainerDetails d
	INNER JOIN TrainerCalendar c on d.trainerID = c.trainerID
	INNER JOIN TrainingSubjects t on t.subjectID = c.subjectID
	WHERE lastName = @trainerLastName
END

EXECUTE Get_Trainer_Timetable @trainerLastName = 'Georgalas'
 
---------------------------------------------------------------------------------------------------------------------------------------------
--VIEW TRAINER's TOTAL EARNINGS SINCE THE BEGINNING OF THE YEAR
CREATE PROCEDURE Get_Trainer_Earnings
@trainerLastName VARCHAR(30)
AS
BEGIN
	SELECT d.lastName as Trainer, SUM(t.amount) as TotalEarnings
	FROM TrainerPayments t, TrainerDetails d
	WHERE t.trainerID = d.trainerID and lastName = @trainerLastName
	GROUP BY lastName

	DECLARE @earnings INT
	SET @earnings = (SELECT SUM(t.amount)
	FROM TrainerPayments t INNER JOIN TrainerDetails d on  t.trainerID = d.trainerID where lastName = @trainerLastName)
	PRINT 'Trainer ' + @trainerLastName + ' has received a total of ' + CAST(@earnings as VARCHAR(10)) + ' since the beginning of the year'
END

EXECUTE Get_Trainer_Earnings @trainerLastName = 'Vlahakis'

---------------------------------------------------------------------------------------------------------------------------------------------
--VIEW STUDENT's TOTAL ABSENCES
CREATE PROCEDURE Get_Student_Absences
@studentLastName VARCHAR(30)
AS
BEGIN
	DECLARE @total INT
	SET @total = (
	SELECT COUNT(a.studentID)
	FROM StudentAbsences a, StudentDetails d
	WHERE a.studentID = d.studentID and lastName = @studentLastName
	)

	IF @total < 4
	BEGIN
		PRINT @studentLastName + ' has a total of ' + CAST(@total AS VARCHAR(3)) + ' absences and has ' + CAST(3 - @total AS VARCHAR(3))  + ' more available'
	END

	ELSE
	BEGIN
		PRINT @studentLastName + ' has a total of ' + CAST(@total AS VARCHAR(3)) + ' absences and has exceeded the available ones'
	END
END

EXECUTE Get_Student_Absences @StudentLastName = 'Kalomalos'

---------------------------------------------------------------------------------------------------------------------------------------------
--ADD NEW STUDENT IN SCHOOL's DATABASE

CREATE PROCEDURE Add_New_Student
@studentID INT, @firstName NVARCHAR(50), @lastName NVARCHAR(50), @birthDate DATE, @bio NVARCHAR(500)
AS
BEGIN
	DECLARE @existing_student INT
	SET @existing_student = (
	SELECT COUNT(*)
	FROM StudentDetails
	WHERE firstName = @firstName and lastName = @lastName)

	IF(@existing_student = 0)
	BEGIN
		INSERT INTO StudentDetails
		VALUES (@studentID, @firstName, @lastName, @birthDate, @bio)

		PRINT 'Student ' + CAST(@firstName AS NVARCHAR(50)) + ' ' + CAST(@lastName AS NVARCHAR(50)) + ' has been successfully added to the database'
	END

	ELSE
	BEGIN
		PRINT 'Student already exists in the Student Database'
	END
END

--Not existing student
EXECUTE Add_New_Student @studentID = 2017007, @firstName = 'Panagiota', @lastName = 'Karatza', @birthDate = '1987-06-30', @bio = 'Pursuing an academic career'

--Existing student
EXECUTE Add_New_Student @studentID = 2017007, @firstName = 'Giorgos', @lastName = 'Kalomalos', @birthDate = '1986-12-15', @bio = 'Excels at nothing'
---------------------------------------------------------------------------------------------------------------------------------------------
--ADD ABSENCES AND TRIGGER THE Get_Student_Absences PROCEDURE

CREATE TRIGGER Absence_Check ON StudentAbsences
AFTER INSERT
AS
BEGIN
	DECLARE @studentID INT,  @absence_date DATE, @absence_discription NVARCHAR(50)
	SET @studentID = (SELECT studentID FROM INSERTED)
	SET @absence_date = (SELECT absenceDate FROM INSERTED)
	SET @absence_discription = (SELECT discription FROM INSERTED)

	PRINT 'Student''s absence has been catalogued'
	DECLARE @lastname VARCHAR(50)
	SET @lastname = (SELECT lastName FROM StudentDetails WHERE @studentID = studentID)
	EXECUTE Get_Student_Absences @StudentLastName = @lastname
END

--EXAMPLE
INSERT INTO StudentAbsences
VALUES (2018003, '2018-10-20', 'personal issues')
delete StudentAbsences where StudentAbsences.absenceDate = '2018-10-20'
---------------------------------------------------------------------------------------------------------------------------------------------
