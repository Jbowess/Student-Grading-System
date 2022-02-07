
create database if not exists school6;

use school6;

drop table if exists AcademicStaff;
drop table if exists Course;
drop table if exists AdminStaff;
drop table if exists Student;
drop table if exists Enrolment;
drop table if exists Grade;


Create table AcademicStaff(
	StaffID char(10) not null,
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	Pos varchar(20) not null,
	Campus varchar(20) not null,
	CourseID varchar(25) not null,
	constraint PK_AcademicStaff primary key (StaffID));

Create table Course(
	CourseID char(6) not null,
	CourseName varchar(50) not null,
	Convenor varchar(20) not null,
	StaffID char(10) not null,
	Trimester varchar(30) not null,
	Campus varchar(20) not null,
	constraint PK_Course primary key (CourseID),
	constraint FK_Course foreign key (StaffID) references AcademicStaff (StaffID));

Create table AdminStaff(
	StaffID char(6) not null,
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	Duty varchar(20) not null,
	constraint PK_AdminStaff primary key (StaffID));

Create table Student(
	StudentID char(6) not null,
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	DOB Date not null,
	Sex varchar(8) not null,
	Phone char(10) not null,
	constraint PK_Student primary key (StudentID));

Create table Enrolment(
	EnrolID char(6) not null,
	CourseID char(6) not null,
	StudentID char(6) not null,
	StudentName varchar(40) not null,
	Year char(6) not null,
	Trimester varchar(20) not null,
	Campus varchar(30) not null,
	constraint PK_Enrolment primary key (EnrolID),
	constraint FK_Enrolment foreign key (CourseID) references Course (CourseID) ON UPDATE CASCADE ON DELETE CASCADE,
	constraint FK_Enrolment2 foreign key (StudentID) references Student (StudentID) ON UPDATE CASCADE ON DELETE CASCADE);

Create table Grade(
	EnrolID char(6) not null,
	Score char(4) not null,
	Grade varchar(10) not null,
	constraint FK_Grade foreign key (EnrolID) references Enrolment (EnrolID));

Insert into AcademicStaff values('a01', 'Seb', 'Binary', 'Professor', 'GC', '101ICT and 101CS');
Insert into AcademicStaff values('a02', 'Jazz', 'Wood', 'Asso Professor', 'GC and NA', '102ICT and 101STA');
Insert into AcademicStaff values('a03', 'Miguel', 'Franco', 'Lecturer', 'GC', '102CS');

Insert into Course values('101ICT', 'Information Management', 'Seb Binary', 'a01', '1 and 2', 'GC');
Insert into Course values('102ICT', 'Object Orientated Programming', 'Jazz Wood', 'a02', '2', 'NA');
Insert into Course values('101STA', 'Statistics', 'Jazz Wood', 'a02', '1', 'GC and NA');
Insert into Course values('101CS', 'Data Analytics', 'Seb Binary', 'a01', '1', 'GC');
Insert into Course values('102CS', 'Information Retrieval', 'Miguel Franco', 'a03', '1 and 3', 'GC');

Insert into AdminStaff values('f01', 'Cristiano', 'Penaldo', 'Enrolment');
Insert into AdminStaff values('f02', 'Lionel', 'Missy', 'Courses');

Insert into Student values('s01', 'Angela', 'Merkal', 01/01/1991, 'F', '543210');
Insert into Student values('s02', 'Donaldo', 'True', 02/02/1992, 'M', '123456');
Insert into Student values('s03', 'Hillarious', 'Blinton', 03/03/1993, 'F', '112233');
Insert into Student values('s04', 'Tarra', 'Obana', 04/04/1994, 'M', '221134');

Insert into Enrolment values('e01', '101ICT', 's01', 'Angela Merkal', '2017', '1', 'GC');
Insert into Enrolment values('e02', '101STA', 's01', 'Angela Merkal', '2017', '1', 'GC');
Insert into Enrolment values('e03', '101CS', 's01', 'Angela Merkal', '2017', '1', 'GC');
Insert into Enrolment values('e04', '102ICT', 's02', 'Donaldo True', '2018', '2', 'NA');
Insert into Enrolment values('e05', '101CS', 's02', 'Donaldo True', '2017', '1', 'GC');
Insert into Enrolment values('e06', '102CS', 's03', 'Hillarious Blintion', '2018', '3', 'GC');
Insert into Enrolment values('e07', '102ICT', 's04', 'Tarra Obana', '2018', '2', 'NA');
Insert into Enrolment values('e08', '101STA', 's04', 'Tarra Obana', '2017', '1', 'NA');
Insert into Enrolment values('e09', '101CS', 's04', 'Tarra Obana', '2017', '1', 'GC');
Insert into Enrolment values('e10', '102CS', 's04', 'Tarra Obana', '2018', '1', 'GC');

Insert into Grade values('e01', '75', '6');
Insert into Grade values('e02', '80', '6');
Insert into Grade values('e03', '92', '7');
Insert into Grade values('e04', '86', '7');
Insert into Grade values('e05', '71', '5');
Insert into Grade values('e06', '65', '5');
Insert into Grade values('e07', '55', '4');
Insert into Grade values('e08', '66', '5');
Insert into Grade values('e09', '80', '6');
Insert into Grade values('e10', '86', '7');





CREATE USER 'Tarra'@'%' IDENTIFIED BY '1234';
CREATE USER 'Donaldo'@'%' IDENTIFIED BY 'Donizzle';
CREATE USER 'Jazz'@'%' IDENTIFIED BY 'j123';
CREATE USER 'Seb'@'%' IDENTIFIED BY 'password';
CREATE USER 'Lionel'@'%' IDENTIFIED BY 'Messi';
CREATE USER 'Cristiano'@'%' IDENTIFIED BY 'Ronaldo';

GRANT DELETE, INSERT, UPDATE ON school6.Enrolment TO 'Cristiano'@'%';
GRANT DELETE, INSERT, UPDATE ON school6.Course TO 'Lionel'@'%';

GRANT SELECT ON school6.Course To'Seb'@'%';
GRANT SELECT ON school6.Course To'Jazz'@'%';
GRANT SELECT ON school6.Course To'Donaldo'@'%';
GRANT SELECT ON school6.Course To'Tarra'@'%';

GRANT SELECT (FirstName, LastName, Sex) ON school6.Student TO 'Jazz'@'%';
GRANT SELECT (FirstName, LastName, Sex) ON school6.Student TO 'Seb'@'%';

CREATE VIEW Tarra AS
Select EnrolID, Score
from school6.Grade
where EnrolID = 'e07' or 'e08' or 'e09' or 'e10';

CREATE VIEW Donaldo AS
Select EnrolID, Score
from school6.Grade
where EnrolID = 'e04' or 'e05';


CREATE VIEW Seb AS
Select CourseID, StaffID
from school6.Course
where StaffID = 'a01';

CREATE VIEW Jazz AS
Select CourseID, StaffID
from school6.Course
where StaffID = 'a02';


