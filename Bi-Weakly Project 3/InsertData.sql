INSERT INTO StudentDetails (studentID, firstName, lastName, birthDate, bio)
VALUES
(2016001,'Giorgos', 'Kalomalos', '1986-12-15', 'High energy particles enthusiast'),
(2018003,'Afroditi', 'Zevgoli', '1990-10-30', 'Archeology student advancing to astronomy studies'),
(2016051,'Antonis', 'Georgalas', '1986-04-04', 'Physicist, major in Field Theory'),
(2018011,'Maria', 'Lagoudi', '1958-02-10', 'Master in History of Physics'),
(2015041,'Pantelis', 'Perantinos', '1986-04-27', 'Robotics and AI');

INSERT INTO TrainerDetails(trainerID, firstName, lastName, bio)
VALUES
(001, 'Nektarios', 'Vlahakis', 'teaches EM Theory and is head of Electronics Lab'),
(002, 'Vasileios', 'Georgalas', 'teaches Quantum Mechanics and Mathematical Methods of Physics'),
(003, 'Konstantinos', 'Simseridis', 'teaches Solid State Physics'),
(004, 'Manos', 'Danezis', 'teaches Astrophysics and gives lectures on alien lifeforms');

INSERT INTO StudentPayments(transactionID, studentID, amount, transactionDate)
VALUES
(1000, 2016001, 200, '2018-02-01'),
(1010, 2016001, 200, '2018-05-01'),
(1100, 2016001, 100, '2018-08-01'),
(2000, 2018003, 500, '2018-02-01'),
(3300, 2016051, 250, '2018-01-31'),
(3003, 2016051, 200, '2018-05-31'),
(4013, 2018011, 450, '2018-03-01'),
(5113, 2018011, 150, '2018-03-01'),
(5023, 2018011, 200, '2018-06-01'),
(5012, 2015041, 200, '2018-09-01');

INSERT INTO StudentAbsences(studentID, absenceDate, discription)
VALUES
(2016001, '2018-01-02', 'too drunk to move around'),
(2018003, '2018-10-03', 'call in sick'),
(2018003, '2018-10-30', 'call in sick'),
(2016051, '2018-01-02', 'personal issues');

INSERT INTO TrainingSubjects(subjectID, subjectName, classroom, startTime, endTime, discription)
VALUES
(101, 'Astrophysics', 'Aristarchus', '09:00:00', '12:00:00','Introduction to Astrophysics and High Energy Cosmic Particles'),
(107, 'Nuclear Physics', 'Democritus', '12:00:00', '15:00:00', 'Introduction to Nuclear Physics'),
(201, 'Linear Calculus', 'Thales', '09:00:00', '12:00:00', 'Linear Algebra'),
(202, 'Solid Matter Physics', 'Democritus', '09:00:00', '12:00:00', 'Introduction to Astrophysics and High Energy Cosmic Particles'),
(301, 'Physics of the atmosphere', 'Thales', '15:00:00', '18:00:00','Studies the macroscopic movements of atmosphere''s air masses'), 
(303, 'ElectroDynamics', 'Thales', '12:00:00', '15:00:00', 'Studies the field of Electricity and Magnetism'),
(402, 'Quantum Mechanics II', 'Democritus', '15:00:00', '18:00:00', 'Studies the quantum world');

INSERT INTO TrainerCalendar(trainerID, subjectID)
VALUES
(001, 303),
(001, 201),
(002, 402),
(002, 303),
(003, 107),
(003, 202),
(004, 101);

INSERT INTO StudentCalendar(studentID, subjectID)
VALUES
(2016001, 101),
(2016001, 107),
(2018003, 101),
(2018003, 301),
(2016051, 201),
(2016051, 303),
(2018011, 201),
(2018011, 301),
(2015041, 402),
(2015041, 303);

INSERT INTO TrainerPayments(paymentID, trainerID, amount, paymentDate)
VALUES
(111, 001, 2000, '2018-02-15'),
(122, 001, 2000, '2018-04-15'),
(211, 002, 2200, '2018-02-22'),
(222, 002, 2200, '2018-04-22'),
(311, 003, 1800, '2018-02-18'),
(322, 003, 1800, '2018-04-18'),
(411, 004, 2500, '2018-02-05'),
(422, 004, 2500, '2018-04-05');