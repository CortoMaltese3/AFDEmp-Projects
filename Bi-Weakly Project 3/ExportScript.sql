USE [master]
GO
/****** Object:  Database [private_school]    Script Date: 07-Dec-18 9:48:44 PM ******/
CREATE DATABASE [private_school]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'private_school', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\private_school.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'private_school_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\private_school_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [private_school] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [private_school].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [private_school] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [private_school] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [private_school] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [private_school] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [private_school] SET ARITHABORT OFF 
GO
ALTER DATABASE [private_school] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [private_school] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [private_school] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [private_school] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [private_school] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [private_school] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [private_school] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [private_school] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [private_school] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [private_school] SET  DISABLE_BROKER 
GO
ALTER DATABASE [private_school] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [private_school] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [private_school] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [private_school] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [private_school] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [private_school] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [private_school] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [private_school] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [private_school] SET  MULTI_USER 
GO
ALTER DATABASE [private_school] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [private_school] SET DB_CHAINING OFF 
GO
ALTER DATABASE [private_school] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [private_school] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [private_school] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [private_school] SET QUERY_STORE = OFF
GO
USE [private_school]
GO
/****** Object:  Table [dbo].[StudentDetails]    Script Date: 07-Dec-18 9:48:44 PM ******/
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
/****** Object:  Table [dbo].[TrainingSubjects]    Script Date: 07-Dec-18 9:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainingSubjects](
	[subjectID] [int] NOT NULL,
	[subjectName] [nvarchar](50) NOT NULL,
	[classroom] [nvarchar](50) NOT NULL,
	[startTime] [time](7) NOT NULL,
	[discription] [nvarchar](500) NULL,
	[endTime] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCalendar]    Script Date: 07-Dec-18 9:48:44 PM ******/
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
/****** Object:  View [dbo].[vStudentTimetable]    Script Date: 07-Dec-18 9:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vStudentTimetable] AS
select firstName, lastName, subjectName, CONVERT(varchar(15),CAST(StartTime AS TIME),100) as StartTime, CONVERT(varchar(15),CAST(endTime AS TIME),100) as EndTime, classroom
from StudentDetails s
inner join StudentCalendar c on s.studentID = c.studentID
inner join TrainingSubjects t on t.subjectID = c.subjectID
GO
/****** Object:  Table [dbo].[StudentAbsences]    Script Date: 07-Dec-18 9:48:44 PM ******/
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
/****** Object:  Table [dbo].[StudentPayments]    Script Date: 07-Dec-18 9:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPayments](
	[transactionID] [int] NOT NULL,
	[amount] [decimal](7, 2) NOT NULL,
	[transactionDate] [date] NOT NULL,
	[studentID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[transactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainerCalendar]    Script Date: 07-Dec-18 9:48:44 PM ******/
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
/****** Object:  Table [dbo].[TrainerDetails]    Script Date: 07-Dec-18 9:48:44 PM ******/
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
/****** Object:  Table [dbo].[TrainerPayments]    Script Date: 07-Dec-18 9:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerPayments](
	[paymentID] [int] NOT NULL,
	[amount] [decimal](7, 2) NOT NULL,
	[paymentDate] [date] NOT NULL,
	[trainerID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentAbsences]  WITH CHECK ADD FOREIGN KEY([studentID])
REFERENCES [dbo].[StudentDetails] ([studentID])
GO
ALTER TABLE [dbo].[StudentCalendar]  WITH CHECK ADD FOREIGN KEY([studentID])
REFERENCES [dbo].[StudentDetails] ([studentID])
GO
ALTER TABLE [dbo].[StudentCalendar]  WITH CHECK ADD FOREIGN KEY([subjectID])
REFERENCES [dbo].[TrainingSubjects] ([subjectID])
GO
ALTER TABLE [dbo].[StudentPayments]  WITH CHECK ADD FOREIGN KEY([studentID])
REFERENCES [dbo].[StudentDetails] ([studentID])
GO
ALTER TABLE [dbo].[TrainerCalendar]  WITH CHECK ADD FOREIGN KEY([subjectID])
REFERENCES [dbo].[TrainingSubjects] ([subjectID])
GO
ALTER TABLE [dbo].[TrainerCalendar]  WITH CHECK ADD FOREIGN KEY([trainerID])
REFERENCES [dbo].[TrainerDetails] ([trainerID])
GO
ALTER TABLE [dbo].[TrainerPayments]  WITH CHECK ADD FOREIGN KEY([trainerID])
REFERENCES [dbo].[TrainerDetails] ([trainerID])
GO
/****** Object:  StoredProcedure [dbo].[Add_New_Student]    Script Date: 07-Dec-18 9:48:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Get_Student_Absences]    Script Date: 07-Dec-18 9:48:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Get_Student_Timetable]    Script Date: 07-Dec-18 9:48:44 PM ******/
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

	select subjectName, StartTime, endTime, classroom
	from vStudentTimetable
	where lastName = @studentLastName

	IF (@count = 0)
	BEGIN
		PRINT 'Student ' + CAST(@studentLastName AS NVARCHAR(50)) + ' hasn''t enrolled in any courses'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Get_Trainer_Earnings]    Script Date: 07-Dec-18 9:48:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Get_Trainer_Timetable]    Script Date: 07-Dec-18 9:48:44 PM ******/
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
USE [master]
GO
ALTER DATABASE [private_school] SET  READ_WRITE 
GO
