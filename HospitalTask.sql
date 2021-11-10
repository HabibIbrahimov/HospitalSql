USE FirstDb
CREATE TABLE Departments (
	Id INT  IDENTITY PRIMARY KEY,
	Name varchar(255) NOT NULL	
)

CREATE TABLE Doctors (
	Id INT  IDENTITY PRIMARY KEY,
	Name varchar(255) NOT NULL,
    DepartmentId INT REFERENCES Departments(Id)
)

CREATE TABLE Nurses (
	Id INT  IDENTITY PRIMARY KEY,
	Name varchar(255) NOT NULL,
	DepartmentId INT REFERENCES Departments(Id)
)

CREATE TABLE Bills (
	Id INT  IDENTITY PRIMARY KEY,
	Amount DECIMAL(3,1) NOT NULL
)
CREATE TABLE Patients (
	Id INT  IDENTITY PRIMARY KEY,
	Name varchar(255) NOT NULL,
	LastName varchar(255) NOT NULL,
	Birth_Date varchar(255) NOT NULL,
	Age INT NOT NULL,
	Gender varchar(255) NOT NULL UNIQUE,
	Number INT UNIQUE,
	NurseId INT REFERENCES Nurses(Id),
	BillsId INT REFERENCES Bills(Id)
)
CREATE TABLE DocPat (
	Id INT  IDENTITY PRIMARY KEY,
	DoctorId INT  REFERENCES Doctors(Id),
	PatientId INT REFERENCES Patients(Id)	
)
CREATE TABLE Tests (
	Id INT  IDENTITY PRIMARY KEY,
	Test_Name varchar(255) NOT NULL,
	Test_Result varchar(255) NOT NULL,
	Test_Date varchar(255) NOT NULL,
	PatientId INT REFERENCES Patients(Id),
	DoctorId INT REFERENCES Doctors(Id),
	DepartmentId INT REFERENCES Departments(Id)	
)

CREATE TABLE Rooms (
	Id INT  IDENTITY PRIMARY KEY,
	Name varchar(200) NOT NULL,
	Number_of_Beds INT NOT NULL,
	Capacity INT NOT NULL,
	DepartmentId INT REFERENCES Departments(Id)
)
ALTER TABLE Patients 
ADD RoomId INT 

CREATE VIEW PATIENTINFO 
AS

SELECT  P.Name 'Patient Name' ,
        P.LastName 'Patient LastName' ,
	    D.Name 'Doctor Name',
		N.Name 'Nurse Name' ,
		DP.Name 'Departament Name',
		R.Name 'Room Name' ,
		T.Test_Name 'Test Name' ,
		T.Test_Result 'Test Result' ,
		T.Test_Date 'Test Date' FROM Patients P
JOIN 
Doctors D
ON
P.Id=D.Id
JOIN
Nurses N
ON
P.Id=N.Id
JOIN
Tests T
ON
P.Id=T.PatientId
FULL JOIN 
Rooms R
ON
P.RoomId=R.Id
JOIN
Departments DP
ON
DP.Id=D.Id













