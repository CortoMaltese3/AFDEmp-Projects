USE [master]
GO
/****** Object:  Database [PrivateSchool]    Script Date: 09-Dec-18 11:47:23 PM ******/
CREATE DATABASE [PrivateSchool]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PrivateSchool', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PrivateSchool.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PrivateSchool_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PrivateSchool_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PrivateSchool] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PrivateSchool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PrivateSchool] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PrivateSchool] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PrivateSchool] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PrivateSchool] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PrivateSchool] SET ARITHABORT OFF 
GO
ALTER DATABASE [PrivateSchool] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PrivateSchool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PrivateSchool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PrivateSchool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PrivateSchool] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PrivateSchool] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PrivateSchool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PrivateSchool] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PrivateSchool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PrivateSchool] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PrivateSchool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PrivateSchool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PrivateSchool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PrivateSchool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PrivateSchool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PrivateSchool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PrivateSchool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PrivateSchool] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PrivateSchool] SET  MULTI_USER 
GO
ALTER DATABASE [PrivateSchool] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PrivateSchool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PrivateSchool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PrivateSchool] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PrivateSchool] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PrivateSchool] SET QUERY_STORE = OFF
GO
USE [PrivateSchool]
GO
/****** Object:  Table [dbo].[StudentDetails]    Script Date: 09-Dec-18 11:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentDetails](
	[studentID] [int] NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[birthDate] [date] NOT NULL,
	[bio] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[studentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainingSubjects]    Script Date: 09-Dec-18 11:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainingSubjects](
	[subjectID] [int] NOT NULL,
	[subjectName] [nvarchar](50) NOT NULL,
	[classroom] [nvarchar](50) NOT NULL,
	[startTime] [time](7) NOT NULL,
	[endTime] [time](7) NOT NULL,
	[discription] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCalendar]    Script Date: 09-Dec-18 11:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCalendar](
	[studentID] [int] NOT NULL,
	[subjectID] [int] NOT NULL,
 CONSTRAINT [pk_student_calendar] PRIMARY KEY CLUSTERED 
(
	[studentID] ASC,
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vStudentTimetable]    Script Date: 09-Dec-18 11:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--VIEW STUDENT's TIMETABLE ACCORDING TO ENROLLED CLASSES
CREATE VIEW [dbo].[vStudentTimetable] AS
select firstName, lastName, subjectName, CONVERT(varchar(15),CAST(StartTime AS TIME),100) as StartTime, CONVERT(varchar(15),CAST(endTime AS TIME),100) as EndTime, classroom
from StudentDetails s
inner join StudentCalendar c on s.studentID = c.studentID
inner join TrainingSubjects t on t.subjectID = c.subjectID
GO
/****** Object:  Table [dbo].[StudentAbsences]    Script Date: 09-Dec-18 11:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAbsences](
	[studentID] [int] NOT NULL,
	[absenceDate] [date] NOT NULL,
	[discription] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentPayments]    Script Date: 09-Dec-18 11:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPayments](
	[transactionID] [int] NOT NULL,
	[studentID] [int] NOT NULL,
	[amount] [decimal](7, 2) NOT NULL,
	[transactionDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[transactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainerCalendar]    Script Date: 09-Dec-18 11:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerCalendar](
	[trainerID] [int] NOT NULL,
	[subjectID] [int] NOT NULL,
 CONSTRAINT [pk_trainer_calendar] PRIMARY KEY CLUSTERED 
(
	[trainerID] ASC,
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainerDetails]    Script Date: 09-Dec-18 11:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerDetails](
	[trainerID] [int] NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[bio] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[trainerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainerPayments]    Script Date: 09-Dec-18 11:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerPayments](
	[paymentID] [int] NOT NULL,
	[trainerID] [int] NOT NULL,
	[amount] [decimal](7, 2) NOT NULL,
	[paymentDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[StudentAbsences] ([studentID], [absenceDate], [discription]) VALUES (2016001, CAST(N'2018-01-02' AS Date), N'too drunk to move around')
INSERT [dbo].[StudentAbsences] ([studentID], [absenceDate], [discription]) VALUES (2018003, CAST(N'2018-10-03' AS Date), N'call in sick')
INSERT [dbo].[StudentAbsences] ([studentID], [absenceDate], [discription]) VALUES (2018003, CAST(N'2018-10-30' AS Date), N'call in sick')
INSERT [dbo].[StudentAbsences] ([studentID], [absenceDate], [discription]) VALUES (2016051, CAST(N'2018-01-02' AS Date), N'personal issues')
INSERT [dbo].[StudentAbsences] ([studentID], [absenceDate], [discription]) VALUES (2018003, CAST(N'2018-10-20' AS Date), N'personal issues')
INSERT [dbo].[StudentCalendar] ([studentID], [subjectID]) VALUES (2015041, 303)
INSERT [dbo].[StudentCalendar] ([studentID], [subjectID]) VALUES (2015041, 402)
INSERT [dbo].[StudentCalendar] ([studentID], [subjectID]) VALUES (2016001, 101)
INSERT [dbo].[StudentCalendar] ([studentID], [subjectID]) VALUES (2016001, 107)
INSERT [dbo].[StudentCalendar] ([studentID], [subjectID]) VALUES (2016051, 201)
INSERT [dbo].[StudentCalendar] ([studentID], [subjectID]) VALUES (2016051, 303)
INSERT [dbo].[StudentCalendar] ([studentID], [subjectID]) VALUES (2018003, 101)
INSERT [dbo].[StudentCalendar] ([studentID], [subjectID]) VALUES (2018003, 301)
INSERT [dbo].[StudentCalendar] ([studentID], [subjectID]) VALUES (2018011, 201)
INSERT [dbo].[StudentCalendar] ([studentID], [subjectID]) VALUES (2018011, 301)
INSERT [dbo].[StudentDetails] ([studentID], [firstName], [lastName], [birthDate], [bio]) VALUES (2015041, N'Pantelis', N'Perantinos', CAST(N'1986-04-27' AS Date), N'Robotics and AI')
INSERT [dbo].[StudentDetails] ([studentID], [firstName], [lastName], [birthDate], [bio]) VALUES (2016001, N'Giorgos', N'Kalomalos', CAST(N'1986-12-15' AS Date), N'High energy particles enthusiast')
INSERT [dbo].[StudentDetails] ([studentID], [firstName], [lastName], [birthDate], [bio]) VALUES (2016051, N'Antonis', N'Georgalas', CAST(N'1986-04-04' AS Date), N'Physicist, major in Field Theory')
INSERT [dbo].[StudentDetails] ([studentID], [firstName], [lastName], [birthDate], [bio]) VALUES (2018003, N'Afroditi', N'Zevgoli', CAST(N'1990-10-30' AS Date), N'Archeology student advancing to astronomy studies')
INSERT [dbo].[StudentDetails] ([studentID], [firstName], [lastName], [birthDate], [bio]) VALUES (2018011, N'Maria', N'Lagoudi', CAST(N'1958-02-10' AS Date), N'Master in History of Physics')
INSERT [dbo].[StudentPayments] ([transactionID], [studentID], [amount], [transactionDate]) VALUES (1000, 2016001, CAST(200.00 AS Decimal(7, 2)), CAST(N'2018-02-01' AS Date))
INSERT [dbo].[StudentPayments] ([transactionID], [studentID], [amount], [transactionDate]) VALUES (1010, 2016001, CAST(200.00 AS Decimal(7, 2)), CAST(N'2018-05-01' AS Date))
INSERT [dbo].[StudentPayments] ([transactionID], [studentID], [amount], [transactionDate]) VALUES (1100, 2016001, CAST(100.00 AS Decimal(7, 2)), CAST(N'2018-08-01' AS Date))
INSERT [dbo].[StudentPayments] ([transactionID], [studentID], [amount], [transactionDate]) VALUES (2000, 2018003, CAST(500.00 AS Decimal(7, 2)), CAST(N'2018-02-01' AS Date))
INSERT [dbo].[StudentPayments] ([transactionID], [studentID], [amount], [transactionDate]) VALUES (3003, 2016051, CAST(200.00 AS Decimal(7, 2)), CAST(N'2018-05-31' AS Date))
INSERT [dbo].[StudentPayments] ([transactionID], [studentID], [amount], [transactionDate]) VALUES (3300, 2016051, CAST(250.00 AS Decimal(7, 2)), CAST(N'2018-01-31' AS Date))
INSERT [dbo].[StudentPayments] ([transactionID], [studentID], [amount], [transactionDate]) VALUES (4013, 2018011, CAST(450.00 AS Decimal(7, 2)), CAST(N'2018-03-01' AS Date))
INSERT [dbo].[StudentPayments] ([transactionID], [studentID], [amount], [transactionDate]) VALUES (5012, 2015041, CAST(200.00 AS Decimal(7, 2)), CAST(N'2018-09-01' AS Date))
INSERT [dbo].[StudentPayments] ([transactionID], [studentID], [amount], [transactionDate]) VALUES (5023, 2018011, CAST(200.00 AS Decimal(7, 2)), CAST(N'2018-06-01' AS Date))
INSERT [dbo].[StudentPayments] ([transactionID], [studentID], [amount], [transactionDate]) VALUES (5113, 2018011, CAST(150.00 AS Decimal(7, 2)), CAST(N'2018-03-01' AS Date))
INSERT [dbo].[TrainerCalendar] ([trainerID], [subjectID]) VALUES (1, 201)
INSERT [dbo].[TrainerCalendar] ([trainerID], [subjectID]) VALUES (1, 303)
INSERT [dbo].[TrainerCalendar] ([trainerID], [subjectID]) VALUES (2, 303)
INSERT [dbo].[TrainerCalendar] ([trainerID], [subjectID]) VALUES (2, 402)
INSERT [dbo].[TrainerCalendar] ([trainerID], [subjectID]) VALUES (3, 107)
INSERT [dbo].[TrainerCalendar] ([trainerID], [subjectID]) VALUES (3, 202)
INSERT [dbo].[TrainerCalendar] ([trainerID], [subjectID]) VALUES (4, 101)
INSERT [dbo].[TrainerDetails] ([trainerID], [firstName], [lastName], [bio]) VALUES (1, N'Nektarios', N'Vlahakis', N'teaches EM Theory and is head of Electronics Lab')
INSERT [dbo].[TrainerDetails] ([trainerID], [firstName], [lastName], [bio]) VALUES (2, N'Vasileios', N'Georgalas', N'teaches Quantum Mechanics and Mathematical Methods of Physics')
INSERT [dbo].[TrainerDetails] ([trainerID], [firstName], [lastName], [bio]) VALUES (3, N'Konstantinos', N'Simseridis', N'teaches Solid State Physics')
INSERT [dbo].[TrainerDetails] ([trainerID], [firstName], [lastName], [bio]) VALUES (4, N'Manos', N'Danezis', N'teaches Astrophysics and gives lectures on alien lifeforms')
INSERT [dbo].[TrainerPayments] ([paymentID], [trainerID], [amount], [paymentDate]) VALUES (111, 1, CAST(2000.00 AS Decimal(7, 2)), CAST(N'2018-02-15' AS Date))
INSERT [dbo].[TrainerPayments] ([paymentID], [trainerID], [amount], [paymentDate]) VALUES (122, 1, CAST(2000.00 AS Decimal(7, 2)), CAST(N'2018-04-15' AS Date))
INSERT [dbo].[TrainerPayments] ([paymentID], [trainerID], [amount], [paymentDate]) VALUES (211, 2, CAST(2200.00 AS Decimal(7, 2)), CAST(N'2018-02-22' AS Date))
INSERT [dbo].[TrainerPayments] ([paymentID], [trainerID], [amount], [paymentDate]) VALUES (222, 2, CAST(2200.00 AS Decimal(7, 2)), CAST(N'2018-04-22' AS Date))
INSERT [dbo].[TrainerPayments] ([paymentID], [trainerID], [amount], [paymentDate]) VALUES (311, 3, CAST(1800.00 AS Decimal(7, 2)), CAST(N'2018-02-18' AS Date))
INSERT [dbo].[TrainerPayments] ([paymentID], [trainerID], [amount], [paymentDate]) VALUES (322, 3, CAST(1800.00 AS Decimal(7, 2)), CAST(N'2018-04-18' AS Date))
INSERT [dbo].[TrainerPayments] ([paymentID], [trainerID], [amount], [paymentDate]) VALUES (411, 4, CAST(2500.00 AS Decimal(7, 2)), CAST(N'2018-02-05' AS Date))
INSERT [dbo].[TrainerPayments] ([paymentID], [trainerID], [amount], [paymentDate]) VALUES (422, 4, CAST(2500.00 AS Decimal(7, 2)), CAST(N'2018-04-05' AS Date))
INSERT [dbo].[TrainingSubjects] ([subjectID], [subjectName], [classroom], [startTime], [endTime], [discription]) VALUES (101, N'Astrophysics', N'Aristarchus', CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time), N'Introduction to Astrophysics and High Energy Cosmic Particles')
INSERT [dbo].[TrainingSubjects] ([subjectID], [subjectName], [classroom], [startTime], [endTime], [discription]) VALUES (107, N'Nuclear Physics', N'Democritus', CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time), N'Introduction to Nuclear Physics')
INSERT [dbo].[TrainingSubjects] ([subjectID], [subjectName], [classroom], [startTime], [endTime], [discription]) VALUES (201, N'Linear Calculus', N'Thales', CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time), N'Linear Algebra')
INSERT [dbo].[TrainingSubjects] ([subjectID], [subjectName], [classroom], [startTime], [endTime], [discription]) VALUES (202, N'Solid Matter Physics', N'Democritus', CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time), N'Introduction to Astrophysics and High Energy Cosmic Particles')
INSERT [dbo].[TrainingSubjects] ([subjectID], [subjectName], [classroom], [startTime], [endTime], [discription]) VALUES (301, N'Physics of the atmosphere', N'Thales', CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Studies the macroscopic movements of atmosphere''s air masses')
INSERT [dbo].[TrainingSubjects] ([subjectID], [subjectName], [classroom], [startTime], [endTime], [discription]) VALUES (303, N'ElectroDynamics', N'Thales', CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time), N'Studies the field of Electricity and Magnetism')
INSERT [dbo].[TrainingSubjects] ([subjectID], [subjectName], [classroom], [startTime], [endTime], [discription]) VALUES (402, N'Quantum Mechanics II', N'Democritus', CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Studies the quantum world')
ALTER TABLE [dbo].[StudentAbsences]  WITH CHECK ADD FOREIGN KEY([studentID])
REFERENCES [dbo].[StudentDetails] ([studentID])
GO
ALTER TABLE [dbo].[StudentAbsences]  WITH CHECK ADD FOREIGN KEY([studentID])
REFERENCES [dbo].[StudentDetails] ([studentID])
GO
ALTER TABLE [dbo].[StudentCalendar]  WITH CHECK ADD FOREIGN KEY([studentID])
REFERENCES [dbo].[StudentDetails] ([studentID])
GO
ALTER TABLE [dbo].[StudentCalendar]  WITH CHECK ADD FOREIGN KEY([studentID])
REFERENCES [dbo].[StudentDetails] ([studentID])
GO
ALTER TABLE [dbo].[StudentCalendar]  WITH CHECK ADD FOREIGN KEY([subjectID])
REFERENCES [dbo].[TrainingSubjects] ([subjectID])
GO
ALTER TABLE [dbo].[StudentCalendar]  WITH CHECK ADD FOREIGN KEY([subjectID])
REFERENCES [dbo].[TrainingSubjects] ([subjectID])
GO
ALTER TABLE [dbo].[StudentPayments]  WITH CHECK ADD FOREIGN KEY([studentID])
REFERENCES [dbo].[StudentDetails] ([studentID])
GO
ALTER TABLE [dbo].[StudentPayments]  WITH CHECK ADD FOREIGN KEY([studentID])
REFERENCES [dbo].[StudentDetails] ([studentID])
GO
ALTER TABLE [dbo].[TrainerCalendar]  WITH CHECK ADD FOREIGN KEY([subjectID])
REFERENCES [dbo].[TrainingSubjects] ([subjectID])
GO
ALTER TABLE [dbo].[TrainerCalendar]  WITH CHECK ADD FOREIGN KEY([subjectID])
REFERENCES [dbo].[TrainingSubjects] ([subjectID])
GO
ALTER TABLE [dbo].[TrainerCalendar]  WITH CHECK ADD FOREIGN KEY([trainerID])
REFERENCES [dbo].[TrainerDetails] ([trainerID])
GO
ALTER TABLE [dbo].[TrainerCalendar]  WITH CHECK ADD FOREIGN KEY([trainerID])
REFERENCES [dbo].[TrainerDetails] ([trainerID])
GO
ALTER TABLE [dbo].[TrainerPayments]  WITH CHECK ADD FOREIGN KEY([trainerID])
REFERENCES [dbo].[TrainerDetails] ([trainerID])
GO
ALTER TABLE [dbo].[TrainerPayments]  WITH CHECK ADD FOREIGN KEY([trainerID])
REFERENCES [dbo].[TrainerDetails] ([trainerID])
GO
/****** Object:  StoredProcedure [dbo].[Add_New_Student]    Script Date: 09-Dec-18 11:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_New_Student]
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
GO
/****** Object:  StoredProcedure [dbo].[Get_Student_Absences]    Script Date: 09-Dec-18 11:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Student_Absences]
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
GO
/****** Object:  StoredProcedure [dbo].[Get_Student_Timetable]    Script Date: 09-Dec-18 11:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Student_Timetable]
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
GO
/****** Object:  StoredProcedure [dbo].[Get_Trainer_Earnings]    Script Date: 09-Dec-18 11:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Trainer_Earnings]
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
GO
/****** Object:  StoredProcedure [dbo].[Get_Trainer_Timetable]    Script Date: 09-Dec-18 11:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Trainer_Timetable]
@trainerLastName VARCHAR(30)
AS
BEGIN
	SELECT subjectName as Course, CONVERT(varchar(15),CAST(StartTime AS TIME),100) as StartTime, CONVERT(varchar(15),CAST(endTime AS TIME),100) as EndTime, classroom
	FROM TrainerDetails d
	INNER JOIN TrainerCalendar c on d.trainerID = c.trainerID
	INNER JOIN TrainingSubjects t on t.subjectID = c.subjectID
	WHERE lastName = @trainerLastName
END
GO
/****** Object:  Trigger [dbo].[Absence_Check]    Script Date: 09-Dec-18 11:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Absence_Check] ON [dbo].[StudentAbsences]
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
GO
ALTER TABLE [dbo].[StudentAbsences] ENABLE TRIGGER [Absence_Check]
GO
USE [master]
GO
ALTER DATABASE [PrivateSchool] SET  READ_WRITE 
GO
