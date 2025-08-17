-- Problem 1:
select pname Project_name, sum(hours) Hours
from Works_for, Project
where pno = pnumber
group by pname;

-- Problem 2:
SELECT D.*
FROM Departments D JOIN Employee E 
ON D.Dnum = E.Dno
WHERE E.SSN = (SELECT MIN(SSN) FROM Employee);

-- Problem 3:
select dname, max(salary) Max_Salary, min(salary) Min_Salary, AVG(isnull(salary,0)) Avg_Salary
from Departments, Employee
where Dno = Dnum
group by dname;

-- Problem 4:
select dname, dnum, count(SSN) No_Employees
from Departments, employee
where Dno = Dnum
group by dname, dnum
having avg(isnull(salary,0)) < (SELECT avg(isnull(salary,0)) FROM employee);

-- Problem 5:
select salary
from employee
where salary in (select top(2) salary from employee order by salary DESC);

-- Problem 6:
select fname + ' ' + lname 'Full Name'
from employee E join Dependent D
on E.SSN = D.ESSN
where fname + ' ' + lname = D.Dependent_name;

-- Problem 7:
insert into employee(fname, lname, bdate, address, sex, dno, SSN, Superssn, salary)
values ('Ali', 'Khaled', '1-1-2000', 'Cairo', 'M', 10, 112233, 102672, 5600);
commit;

-- Problem 8:
insert into employee(fname, lname, bdate, address, sex, dno, SSN)
values ('Sara', 'Mohamed', '5-12-1998', 'Alex', 'F', 20, 223344);
commit;

-- Problem 9:
update employee
set salary = salary + (salary * 0.2)
where SSN = 102672;
commit;

-- Problem 10:
insert into Departments values ('DEPT_IT', 100, 112233, '1-11-2006');

-- Problem 11:
-- A
update Departments
set mgrssn = 968574
where dnum = 100;

-- B
update Departments
set mgrssn = 102672
where dnum = 20;

-- C
update Employee
set Superssn = 102672
where SSN = 102660;
commit;

-- Problem 12:
-- im taking his department
update Departments 
set MGRSSN = 102672
where MGRSSN = 223344;

-- im taking his supervision on employees
update Employee 
set Superssn = 102672
where Superssn = 223344;

-- im taking his projects
update Works_for 
set ESSN = 102672
where ESSN = 223344;

-- remove his dependents
delete from Dependent
where Essn = 223344;

-- remove him from the company
delete from employee
where ssn = 223344;
commit;

-- Problem 13:
update employee 
set salary = salary + (salary * 0.3)
where SSN in (select ESSN from Works_for
              where Pno = (select pnumber from Project
                           where Pname = 'Al Rabwah'));
commit;

-- Problem 14:
select SSN, Fname + ' ' + Lname 'Full Name'
from Employee
where exists (select * from employee E, Dependent D 
              where E.SSN = D.ESSN);

-- Problem 15:
select Fname + ' ' + Lname 'Full Name', pname, p.dnum
from Employee E join Departments D
on E.Dno = D.Dnum
join Project P
on D.Dnum = p.Dnum
order by p.Dnum, Lname, Fname;