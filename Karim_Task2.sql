-- Problem 1:
select Dnum, Dname, Superssn, Fname + ' ' + Lname as 'Full Name'
from Departments inner join Employee
on MGRSSN = Superssn;

-- -------------------------------------------------------------
-- Problem 2:
select Dname Department_Name, Pname Project_Name
from Departments D inner join Project P
on D.Dnum = P.Dnum;

-- -------------------------------------------------------------
-- Problem 3:
select ESSN, Dependent_name, D.Sex, D.Bdate, Fname + ' ' + Lname as 'Full Name'
from Dependent D inner join Employee E
on ESSN = SSN;

-- -------------------------------------------------------------
-- Problem 4:
select Pnumber, Pname, Plocation
from Project
where City in ('Cairo', 'Alex');

-- -------------------------------------------------------------
-- Problem 5:
select *
from Project
where Pname like 'a%';

-- -------------------------------------------------------------
-- Problem 6:
select Fname + ' ' + Lname as 'Full Name', Dno, salary
from Employee
where salary between 1000 and 2000 and Dno = 30;

-- -------------------------------------------------------------
-- Problem 7:
select Fname + ' ' + Lname as 'Full Name', Pname, Hours
from Employee inner join Works_for
on SSN = ESSN
inner join Project
on Pno = Pnumber
where Hours >= 10 and Pname = 'Al Rabwah';

-- -------------------------------------------------------------
-- Problem 8:
select E.Fname + ' ' + E.Lname as 'Employees Name', MGR.Fname + ' ' + MGR.Lname as 'Manager Name'
from Employee E inner join Employee MGR
on E.superssn = MGR.SSN
where MGR.Fname like ('Kamel') and MGR.Lname like ('Mohamed');

-- -------------------------------------------------------------
-- Problem 9:
select E.Fname + ' ' + E.Lname as 'Employees Name', Pname as 'Project Name'
from Employee E inner join Works_for
on SSN = ESSN
inner join Project
on Pno = Pnumber
order by pname;

-- -------------------------------------------------------------
-- Problem 10:
select E.Fname + ' ' + E.Lname as 'Employees Name', Dname
from Employee E left outer join Departments
on Dno = Dnum;

-- -------------------------------------------------------------
-- Problem 11:
select MGR.Lname, MGR.Address, MGR.Bdate, pnumber, dname, City
from Project P inner join Departments D
on P.dnum = D.dnum
inner join Employee MGR
on MGRSSN = Superssn
where city like ('Cairo');

-- -------------------------------------------------------------
-- Problem 12:
select DISTINCT MGR.*
from Employee E inner join Employee MGR
on MGR.SSN = E.Superssn;

-- -------------------------------------------------------------
-- Problem 13:
select Dependent_name, D.Sex
from dependent D inner join Employee E
on E.SSN = D.ESSN
where d.Sex like ('f%') and E.Sex like ('f%')

union all

select Dependent_name, D.Sex
from dependent D inner join Employee E
on E.SSN = D.ESSN
where d.Sex like ('m%') and E.Sex like ('m%');

-- -------------------------------------------------------------
-- Problem 14:
select fname + ' ' + lname as 'Full Name'
from Employee

intersect

select Dependent_name
from Dependent;

-- -------------------------------------------------------------
-- Problem 15:
select DISTINCT D.*
from Departments D inner join Employee
on d.dnum = dno
left join Dependent
on ESSN = SSN
where ESSN IS NULL;