--USER DEFINED FUNCTIONS- DB: TASK
			
			---------- SCALER VALUED FUNCTION ----------
--create udf 
/*
CREATE FUNCTION dbo.GetFullName (@firstName VARCHAR(50), @lastName VARCHAR(50)) 
RETURNS VARCHAR(100) AS 
BEGIN
	RETURN @firstName + ' ' + @lastName;
END;
*/

--alter udf
select Employee_ID,First_Name,Last_Name,dbo.GetFullName(first_name,last_name) as fullName from EMPLOYEES
/*
alter function GetFullName(@firstName varchar(50),@lastName varchar(50))
returns varchar(100) as
begin
	return @firstName +' - '+ @lastName;
end;
*/

select Employee_ID,First_Name,Last_Name,dbo.GetFullName(first_name,last_name) as fullName from EMPLOYEES

--delete
--drop function getFullName



--CREATE FUNCTION TO CALCULATE YEARLY SALARY OF EMPLOYEES
/*
create function calcYearlySalary(@salary int)
returns int as
begin
	return @salary*12;
end;
*/
select Employee_ID,Salary,dbo.calcYearlySalary(salary) as yearlySalary from EMPLOYEES


--create function which calculates yearly salary and returns it with RS.
/*
create function calcSalary(@salary int)
returns varchar(100) as
begin
	declare @temp varchar(100)
	set @temp = convert(varchar,@salary)
	return @temp+' Rs.';
end;
*/
select Employee_ID,Salary,dbo.calcSalary(salary) as yearlySalary from EMPLOYEES

				---------- SCALER VALUED FUNCTION ----------


				---------- TABLE VALUED FUNCTION ----------
select * from EMPLOYEES

/*
CREATE function getEmployeesByDepartment(@department_id int)
returns table as
return (select Employee_ID,First_Name,Last_Name,Department_ID from EMPLOYEES 
		where Department_ID = @department_id);
*/
select * from dbo.getEmployeesByDepartment(60)

/*  IDEALLY SHOULD NOT USE JOINS INSIDE FUNCTIONS
alter function getEmployeesByDepartment(@department_name varchar(100))
returns table as
return (select Employee_ID,First_Name,Last_Name,Department_name from EMPLOYEES e
		inner join DEPARTMENTS d
		on e.Department_ID=d.Department_ID
		where d.Department_Name = @department_name);

		
select * from dbo.getEmployeesByDepartment('it')
*/


--Hallowe'en Party
--The God of Small Things