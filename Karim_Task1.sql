-- First Query :
SELECT * 
FROM Employee;

-- _____________________________________
-- Second Query :
SELECT Fname, Lname, Salary, Dno
FROM Employee;

-- _____________________________________
-- Third Query :
SELECT Pname, Plocation, Dnum
FROM Project;

-- _____________________________________
-- Fourth Query :
SELECT Fname + ' ' + Lname AS "Full Name", (salary * 12) * 0.1 AS "ANNUAL COMM"
FROM Employee;

-- _____________________________________
-- Fifth Query :
SELECT SSN, Fname + ' ' + Lname AS "Full Name"
FROM Employee
WHERE salary > 1000;

-- _____________________________________
-- Sixth Query :
SELECT SSN, Fname + ' ' + Lname AS "Full Name", salary
FROM Employee
WHERE (salary * 12) > 10000;

-- _____________________________________
-- Seventh Query :
SELECT SSN, Fname + ' ' + Lname AS "Full Name", salary
FROM Employee
WHERE Sex = 'F';

-- _____________________________________
-- Eighth Query :
SELECT Dnum, Dname
FROM Departments
WHERE MGRSSN = 968574;

-- _____________________________________
-- Ninth Query :
SELECT Pnumber, Pname, Plocation
FROM Project
WHERE Dnum = 10;