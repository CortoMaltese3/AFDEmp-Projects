CREATE TABLE StudentDetails
(
	studentID INT NOT NULL PRIMARY KEY,
	firstName NVARCHAR(50) NOT NULL, 
	lastName NVARCHAR(50) NOT NULL,
	birthDate DATE NOT NULL,
	bio NVARCHAR(500)
);

CREATE TABLE StudentPayments
(
	transactionID INT NOT NULL PRIMARY KEY,
	studentID INT NOT NULL FOREIGN KEY REFERENCES StudentDetails(studentID), 
	amount DECIMAL(7,2) NOT NULL,
	transactionDate DATE NOT NULL
);

CREATE TABLE StudentAbsences
(
	studentID INT NOT NULL FOREIGN KEY REFERENCES StudentDetails(studentID),
	absenceDate DATE NOT NULL,
	discription NVARCHAR(500)
);

CREATE TABLE TrainingSubjects
(
	subjectID INT NOT NULL PRIMARY KEY,
	subjectName NVARCHAR(50) NOT NULL, 
	classroom NVARCHAR(50) NOT NULL,
	startTime TIME NOT NULL,
	endTime TIME NOT NULL,
	discription NVARCHAR(500)
);

CREATE TABLE StudentCalendar
(
	studentID INT NOT NULL FOREIGN KEY REFERENCES StudentDetails(studentID),
	subjectID INT NOT NULL FOREIGN KEY REFERENCES TrainingSubjects(subjectID),
	CONSTRAINT pk_student_calendar PRIMARY KEY(studentID, subjectID)
);

CREATE TABLE TrainerDetails
(
	trainerID INT NOT NULL PRIMARY KEY,
	firstName NVARCHAR(50) NOT NULL, 
	lastName NVARCHAR(50) NOT NULL,
	bio NVARCHAR(500)
);

CREATE TABLE TrainerCalendar
(
	trainerID INT NOT NULL FOREIGN KEY REFERENCES   TrainerDetails(trainerID),
	subjectID INT NOT NULL FOREIGN KEY REFERENCES TrainingSubjects(subjectID),
	CONSTRAINT pk_trainer_calendar PRIMARY KEY(trainerID, subjectID)
);

CREATE TABLE TrainerPayments
(
	paymentID INT NOT NULL PRIMARY KEY,
	trainerID INT NOT NULL FOREIGN KEY REFERENCES   TrainerDetails(trainerID),
	amount DECIMAL(7,2) NOT NULL,
	paymentDate DATE NOT NULL
);


