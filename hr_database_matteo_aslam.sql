-- CREAZIONE DEL DATABASE

DROP SCHEMA IF EXISTS hr;

CREATE SCHEMA hr;

USE hr;
-- IMPORTAZIONE FILE CSV TRAMITE TABLE DATA IMPORT WIZARD (HRDATASETV14.csv)

SELECT 
    *
FROM
    hr;

-- PULIZIA NOME COLONNA
ALTER TABLE hr
CHANGE ï»¿Employee_Name Employee_Name VARCHAR(50);

SELECT * FROM hr;

-- PULIZIA FORMATO DATA
UPDATE hr
SET LastPerformanceReview_Date = STR_TO_DATE(LastPerformanceReview_Date, '%m/%d/%Y');

UPDATE hr
SET DateofHire = STR_TO_DATE(DateofHire, '%m/%d/%Y');

UPDATE hr
SET DateofTermination = 
  CASE WHEN DateofTermination = '' THEN NULL
       WHEN DateofTermination IS NOT NULL THEN STR_TO_DATE(DateofTermination, '%m/%d/%Y')
  END;


UPDATE hr 
SET 
    DOB = STR_TO_DATE(DOB, '%m/%d/%y')
WHERE
    DOB IS NOT NULL;

-- CREAZIONE COLONNA AGE

ALTER TABLE hr
ADD COLUMN age VARCHAR (20);

UPDATE hr
SET age = ABS(timestampdiff(year, DOB, CURDATE()));

-- PULIZIA DUPLICATI

SELECT * from hr where DeptID = 1 and Department = "Software Engineering";

UPDATE hr 
SET 
    DeptID = 4
WHERE
    DeptID = 1
        AND Department = 'Software Engineering';

SELECT 
    *
FROM
    hr
WHERE
    DeptID = 1
        AND Department = 'Software Engineering';

SELECT 
    PerformanceScore, PerfScoreID
FROM
    hr
GROUP BY PerfScoreID , PerformanceScore;

UPDATE hr 
SET 
    PerfScoreID = 3
WHERE
    PerformanceScore = 'Fully Meets'
        AND PerfScoreID = 1;

UPDATE hr 
SET 
    PerfScoreID = 1
WHERE
    PerformanceScore = 'PIP'
        AND PerfScoreID = 3;

SELECT PositionID, Position
FROM hr
GROUP BY PositionID, Position;

UPDATE hr 
SET 
    PositionID = 24
WHERE
    PositionID = 23
        AND Position = 'Software Engineer';

UPDATE hr 
SET 
    DeptID = 5
WHERE
    DeptID = 6 AND Department = 'Production';

SELECT * FROM hr;

-- CREAZIONE DELLE TABELLE

CREATE TABLE Manager (
    ManagerID INT PRIMARY KEY,
    ManagerName VARCHAR(255)
);

INSERT INTO Manager (ManagerID, ManagerName)
SELECT DISTINCT ManagerID, ManagerName
FROM hr
ORDER BY ManagerID;


CREATE TABLE department (
    DeptID INT PRIMARY KEY,
    Department VARCHAR(255)
);

INSERT INTO department (DeptID, Department)
SELECT DeptID, MIN(Department)
FROM hr
GROUP BY DeptID
ORDER BY DeptID;

CREATE TABLE performance_score (
    PerfScoreID INT PRIMARY KEY,
    PerformanceScore VARCHAR(255)
);

INSERT INTO performance_score (PerfScoreID, PerformanceScore)
SELECT DISTINCT PerfScoreID, PerformanceScore
FROM hr
ORDER BY PerfScoreID;

CREATE TABLE Marital_Status (
    MaritalStatusID INT PRIMARY KEY,
    MaritalDesc VARCHAR(255)
);

INSERT INTO Marital_Status (MaritalStatusID, MaritalDesc)
SELECT DISTINCT MaritalStatusID, MaritalDesc
FROM hr
ORDER BY MaritalStatusID;

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    Employee_Name VARCHAR(255),
    Sex CHAR(1),
    DOB DATE,
    MaritalStatusID INT,
    State VARCHAR(50),
    Zip VARCHAR(10),
    CitizenDesc VARCHAR(50),
    HispanicLatino VARCHAR(10),
    RaceDesc VARCHAR(50),
    Age INT,
    FromDiversityJobFairID BOOLEAN,
    Termination BOOLEAN,
    DateofHire DATE,
    DateofTermination DATE,
    TermReason VARCHAR(255),
    FOREIGN KEY (MaritalStatusID)
        REFERENCES Marital_Status (MaritalStatusID)
);

INSERT INTO Employee (EmpID, Employee_Name, Sex, DOB, MaritalStatusID, State, Zip, CitizenDesc, HispanicLatino, RaceDesc, Age, FromDiversityJobFairID,Termination, DateofHire, DateofTermination, TermReason)
SELECT EmpID, Employee_Name, Sex, DOB, MaritalStatusID, State, Zip, CitizenDesc, HispanicLatino, RaceDesc, Age, FromDiversityJobFairID,TermD, DateofHire, DateofTermination, TermReason
FROM hr
ORDER BY EmpID;

CREATE TABLE Position_table (
    PositionID INT PRIMARY KEY,
    Position VARCHAR(255)
);

INSERT INTO Position_table (PositionID, Position)
SELECT PositionID, MIN(Position)
FROM hr
GROUP BY PositionID
ORDER BY PositionID;





-- Creazione della tabella Employee_Performances
CREATE TABLE Employee_Performances(
    PerfID INT AUTO_INCREMENT PRIMARY KEY,
    EmpID INT,
    Salary DECIMAL(10 , 2 ),
    PerfScoreID INT,
    EngagementSurvey DECIMAL(5 , 2 ),
    EmpSatisfaction DECIMAL(5 , 2 ),
    SpecialProjectsCount INT,
    LastPerformanceReview_Date DATE,
    DaysLateLast30 INT,
    Absences INT,
    DeptID INT,
    ManagerID INT,
    PositionID INT,
    FOREIGN KEY (EmpID) REFERENCES Employee (EmpID),
    FOREIGN KEY (PerfScoreID) REFERENCES performance_score (PerfScoreID),
    FOREIGN KEY (DeptID) REFERENCES department (DeptID),
    FOREIGN KEY (ManagerID) REFERENCES Manager (ManagerID),
    FOREIGN KEY (PositionID) REFERENCES position_table(PositionID)
);


INSERT INTO Employee_Performances (
    EmpID, Salary, PerfScoreID, EngagementSurvey, EmpSatisfaction, SpecialProjectsCount,
    LastPerformanceReview_Date, DaysLateLast30, Absences, DeptID, ManagerID, PositionID
)
SELECT
    hr.EmpID,
    hr.Salary,
    hr.PerfScoreID,
    hr.EngagementSurvey,
    hr.EmpSatisfaction,
    hr.SpecialProjectsCount,
    hr.LastPerformanceReview_Date,
    hr.DaysLateLast30,
    hr.Absences,
    hr.DeptID,
    hr.ManagerID,
    hr.PositionID
FROM hr;

select * from hr;

-- GENERAZIONE DELL'ER TRAMITE REVERSE ENGINEERING

-- CONNESSIONE SU POWERBI TRAMITE CONNETTORE MYSQL;