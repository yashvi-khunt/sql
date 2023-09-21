/*
--DEPARTMENTS TABLE - DEPARTMENT_ID - DEPARTMENT_NAME - MANAGER_ID - LOCATION_ID
CREATE TABLE DEPARTMENTS(
	Department_ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Department_Name VARCHAR(30) NOT NULL,
	Manager_ID INT NOT NULL,
	Location_ID INT NOT NULL,
)

insert into departments values
('General',2,3)

insert into departments values
('hr',2,3)
Select * from DEPARTMENTS



--JOBS TABLE - JOB_ID - JOB_TITLE - MIN_SALARY - MAX_SALARY
CREATE TABLE JOBS(
	Job_ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Job_Title VARCHAR(30) NOT NULL,
	Min_Salary INT NOT NULL,
	Max_Salary INT NOT NULL,
)

insert into jobs values
('receptionist',70000,50000)

insert into jobs values
('waiter',50000,20000)

insert into jobs values
('manager',200000,100000)

SELECT * FROM JOBS


--EMPLOYEE TABLE - EMPLOYEE_ID - FIRST_NAME - LAST_NAME - EMAIL - PHONE_NUMBER - HIRE_DATE - JOB_ID - SALARY - COMMISSION_PCT - MANAGER_ID - DEPARTMENT_ID

CREATE TABLE EMPLOYEE(
	Employee_ID INT	NOT NULL PRIMARY KEY IDENTITY(1,1),
	First_Name VARCHAR(30) NOT NULL,
	Last_Name VARCHAR(30) NOT NULL,
	Email VARCHAR(120),
	Phone_Number VARCHAR(15),
	Hire_Date DATE,
	Job_ID INT NOT NULL FOREIGN KEY REFERENCES JOBS(Job_ID),
	Salary INT NOT NULL,
	Commision_PCT INT,
	Manager_ID INT NOT NULL,
	Department_ID INT FOREIGN KEY REFERENCES DEPARTMENTS(DEPARTMENT_id),
)

insert into employee values
('abc','xyz','abc.xyz@gmail.com','8569646905','09-01-2022',1,20000,5000,3,1)

insert into employee values
('def','uvw','def.uvw@gmail.com','5986497455','03-15-2022',1,15000,3000,3,1)
insert into employee values
('ghi','rst','ghi.rst@gmail.com','5986497455','03-15-2022',2,15000,3000,3,1)

insert into employee values
('jkl','opq','jkl.opq@gmail.com','4564676757','11-30-2021',3,175000,15000,1,1)
SELECT * FROM EMPLOYEE

*/

--1. Given SQL query will execute successfully: TRUE/FALSE SELECT last_name, job_id, salary AS Sal FROM employees; 

--ANS : TRUE
SELECT LAST_NAME,JOB_id,SALARY AS SAL FROM [dbo].[EMPLOYEE]

--2. Identify errors in the following statement: SELECT employee_id, last_name, sal*12 ANNUAL SALARY FROM employees;
SELECT employee_id, last_name, (salARY*12) AS [ANNUAL SALARY] FROM employee

--3. Write a query to determine the structure of the table 'DEPARTMENTS'
select *
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='departments';

--4. Write a query to determine the unique Job IDs from the EMPLOYEES table.
sELECT dISTINCT JOB_ID FROM EMPLOYEE

--5. Write a query to display the employee number, lastname, salary (oldsalary), salary increased by 15.5% name it has NewSalary and subtract the (NewSalary from OldSalary) name the column as Increment.
select Employee_ID,Last_Name,Salary as [Old Salary], Salary+(Salary*0.155) as [New Salary],(Salary*0.155) as increment from EMPLOYEE


--6. Write a query to display the minimum, maximum, sum and average salary for each job type.
select jobs.Job_ID, Min_Salary,Max_Salary,sum(Salary) as [total salary],AVG(Salary) as [average salary] from JOBS
inner join EMPLOYEE
on EMPLOYEE.Job_ID = JOBS.Job_ID
group by jobs.Job_ID,Min_Salary,Max_Salary


--7. The HR department needs to find the names and hire dates of all employees who were hired before their managers, along with their managers’ names and hire dates.


Select *  from employee
left join (Select concat(First_Name,' ',Last_Name) as ManagerName,Employee_ID AS EMPid,Hire_Date as ManagerHireDate from EMPLOYEE) as a
on a.EMPid = EMPLOYEE.Manager_ID
where ManagerHireDate>Hire_Date

Select Employee.Employee_ID,EMPLOYEE.First_Name,EMPLOYEE.Last_Name,EMPLOYEE.Hire_Date as employeeHireDate,EMPLOYEE.Job_ID,EMPLOYEE.Salary,a.Employee_ID as Manager_id, CONCAT(a.First_Name,' ',a.Last_Name) as ManagerName,a.Hire_Date as ManagerHireDate  from employee
,EMPLOYEE a 
where a.Employee_ID = EMPLOYEE.Manager_ID and EMPLOYEE.Hire_Date > a.Hire_Date


--8. Create a report for the HR department that displays employee last names, department numbers, and all the employees who work in the same department as a given employee.
Select a.Last_Name as firstEMployee,b.Last_Name as secondEMployeeName,a.Department_ID from EMPLOYEE a, EMPLOYEE b
where a.Department_ID = b.Department_ID and a.First_Name<>b.First_Name


--9. Find the highest, lowest, sum, and average salary of all employees. Label the columns Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number.
select Max(Salary) as Maximum,Min(salary) as Minimum,Sum(salary) as Sum,AVG(salary) as Average from employee

--10. Create a report that displays list of employees whose salary is more than the salary of any employee from department 60.
select * from EMPLOYEE
where Salary > (select Salary from EMPLOYEE where Department_ID=60)
--return nothing for our data as there is no such department

--11. Create a report that displays last name and salary of every employee who reports to King(Use any manager name instead of King).
Select a.Last_Name as employeeLName,a.Salary,b.Last_Name as managerLName from EMPLOYEE a, EMPLOYEE b
where a.Manager_ID = b.Employee_ID and b.Last_Name = 'RST'


--12. Write a query to display the list of department IDs for departments that do not contain the job Id ST_CLERK(Add this job ST_CLERK to Job table). Use SET Operator for this query
UPDATE JOBS
SET Job_Title='st_clerk' WHERE Job_ID = 2


SELECT Department_ID,Department_Name FROM DEPARTMENTS
WHERE Department_ID NOT IN (Select DEPARTMENTS.Department_ID from DEPARTMENTS 
inner join EMPLOYEE
on EMPLOYEE.Department_ID = DEPARTMENTS.Department_ID
where Job_ID = (select Job_ID from JOBS where Job_Title = 'st_clerk'))



--13. Write a query to display the list of employees who work in department 50 and 80. Show employee Id, job Id and department Id by using set operators. - Add 50 and 80 department Id to department table
SELECT * FROM EMPLOYEE
sELECT * FROM DEPARTMENTS

SET IDENTITY_INSERT DEPARTMENTS ON
insert into DEPARTMENTS([Department_ID],Department_Name,Manager_ID,Location_ID)
values(80,'Cleaning',2,3)
SET IDENTITY_INSERT DEPARTMENTS off


select Employee_ID,Job_ID,Department_ID from EMPLOYEE where Department_ID=50
union
select Employee_ID,Job_ID,Department_ID FROM EMPLOYEE WHERE Department_ID=80
