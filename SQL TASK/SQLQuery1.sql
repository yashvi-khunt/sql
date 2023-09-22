/*
--DEPARTMENTS TABLE - DEPARTMENT_ID - DEPARTMENT_NAME - MANAGER_ID - LOCATION_ID
CREATE TABLE DEPARTMENTS(
	Department_ID INT NOT NULL PRIMARY KEY ,
	Department_Name VARCHAR(30) NOT NULL,
	Manager_ID INT NOT NULL,
	Location_ID INT NOT NULL,
)

Select * from DEPARTMENTS



--JOBS TABLE - JOB_ID - JOB_TITLE - MIN_SALARY - MAX_SALARY
CREATE TABLE JOBS(
	Job_ID varchar(20) NOT NULL PRIMARY KEY ,
	Job_Title VARCHAR(30) NOT NULL,
	Min_Salary INT NOT NULL,
	Max_Salary INT NOT NULL,
)

SELECT * FROM JOBS


--EMPLOYEE TABLE - EMPLOYEE_ID - FIRST_NAME - LAST_NAME - EMAIL - PHONE_NUMBER - HIRE_DATE - JOB_ID - SALARY - COMMISSION_PCT - MANAGER_ID - DEPARTMENT_ID

CREATE TABLE EMPLOYEES(
	Employee_ID INT	NOT NULL PRIMARY KEY ,
	First_Name VARCHAR(30) NOT NULL,
	Last_Name VARCHAR(30) NOT NULL,
	Email VARCHAR(120),
	Phone_Number VARCHAR(15),
	Hire_Date DATE,
	Job_ID varchar(20) NOT NULL FOREIGN KEY REFERENCES JOBS(Job_ID) on delete cascade,
	Salary INT NOT NULL,
	Commision_PCT INT,
	Manager_ID INT NOT NULL,
	Department_ID INT FOREIGN KEY REFERENCES DEPARTMENTS(DEPARTMENT_id) on delete cascade,
)
select * from employees


*/


--1. Given SQL query will execute successfully: TRUE/FALSE SELECT last_name, job_id, salary AS Sal FROM employees; 

--ANS : TRUE
SELECT LAST_NAME,JOB_id,SALARY AS SAL FROM [dbo].[EMPLOYEES]

--2. Identify errors in the following statement: SELECT employee_id, last_name, sal*12 ANNUAL SALARY FROM employees;
SELECT employee_id, last_name, salary,(salARY*12) AS [ANNUAL SALARY] FROM employees

--3. Write a query to determine the structure of the table 'DEPARTMENTS'
select *
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='departments';

--4. Write a query to determine the unique Job IDs from the EMPLOYEES table.
sELECT dISTINCT JOB_ID FROM EMPLOYEES

--5. Write a query to display the employee number, lastname, salary (oldsalary), salary increased by 15.5% name it has NewSalary and subtract the (NewSalary from OldSalary) name the column as Increment.
select Employee_ID,Last_Name,Salary as [Old Salary], Salary+(Salary*0.155) as [New Salary],(Salary*0.155) as increment from EMPLOYEES


--6. Write a query to display the minimum, maximum, sum and average salary for each job type.
SELECT * FROM JOBS
SELECT * FROM EMPLOYEES
select jobs.Job_ID, Min_Salary,Max_Salary,sum(Salary) as [total salary],AVG(Salary) as [average salary] from JOBS
inner join EMPLOYEES
on EMPLOYEES.Job_ID = JOBS.Job_ID
group by jobs.Job_ID,Min_Salary,Max_Salary


--7. The HR department needs to find the names and hire dates of all employees who were hired before their managers, along with their managers’ names and hire dates.

Select *  from employees
left join (Select concat(First_Name,' ',Last_Name) as ManagerName,Employee_ID AS EMPid,Hire_Date as ManagerHireDate from EMPLOYEES) as a
on a.EMPid = EMPLOYEES.Manager_ID
where ManagerHireDate>Hire_Date

Select Employees.Employee_ID,EMPLOYEES.First_Name,EMPLOYEES.Last_Name,EMPLOYEES.Hire_Date as employeeHireDate, CONCAT(manager.First_Name,' ',manager.Last_Name) as ManagerName,EMPLOYEES.Job_ID,EMPLOYEES.Salary,manager.Employee_ID as Manager_id,manager.Hire_Date as ManagerHireDate  from employees
,EMPLOYEES manager
where manager.Employee_ID = EMPLOYEES.Manager_ID and EMPLOYEES.Hire_Date < manager.Hire_Date


--8. Create a report for the HR department that displays employee last names, department numbers, and all the employees who work in the same department as a given employee.
Select a.Last_Name as firstEMployee,b.Last_Name as secondEMployeeName,a.Department_ID from EMPLOYEEs a, EMPLOYEEs b
where a.Department_ID = b.Department_ID and a.First_Name<>b.First_Name


--9. Find the highest, lowest, sum, and average salary of all employees. Label the columns Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number.
select Max(Salary) as Maximum,Min(salary) as Minimum,Sum(salary) as Sum,AVG(salary) as Average from employees

--10. Create a report that displays list of employees whose salary is more than the salary of any employee from department 60.
select * from EMPLOYEES
where not Salary = any (select Salary from EMPLOYEES where Department_ID=60)


--11. Create a report that displays last name and salary of every employee who reports to King(Use any manager name instead of King).
Select a.Last_Name as employeeLName,a.Salary,b.Last_Name as managerLName from EMPLOYEES a, EMPLOYEES b
where a.Manager_ID = b.Employee_ID and b.Last_Name = 'king'

select * from EMPLOYEEs

--12. Write a query to display the list of department IDs for departments that do not contain the job Id ST_CLERK(Add this job ST_CLERK to Job table). Use SET Operator for this query

SELECT Department_ID,Department_Name FROM DEPARTMENTS
except 
select Department_ID,department_name from DEPARTMENTS
where Department_ID =  any (select Department_ID from EMPLOYEEs where job_id='st_clerk')



--13. Write a query to display the list of employees who work in department 50 and 80. Show employee Id, job Id and department Id by using set operators. - Add 50 and 80 department Id to department table
SELECT * FROM EMPLOYEEs where Department_ID=80
sELECT * FROM DEPARTMENTS


select Employee_ID,Job_ID,Department_ID from EMPLOYEES where Department_ID=50
union
select Employee_ID,Job_ID,Department_ID FROM EMPLOYEES WHERE Department_ID=80
