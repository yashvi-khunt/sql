use TASK

--1. Create a scalar function that accepts string as a parameter and return whether the string is correct mail Id or not
create function checkMail(@email email)
returns varchar(100)
begin
	if(@email like '%.%@%.%')
	return 'correct'
	else return 'incorrect'
	return ''
end

declare @temp varchar(10) = (select email from EMPLOYEES where Employee_ID = 100)
update EMPLOYEES
set Email = @temp+'.xyz@gmail.com'

select email,dbo.checkmail(email) from EMPLOYEES

update EMPLOYEES
set email='SKING' where Employee_ID= 100

select email,dbo.checkmail(email) from EMPLOYEES

--2. Create a tabular function that accepts one parameter as employee department and return the employees working in that department.

CREATE function getEmployeesByDepartment(@department_id int)
returns table as
return (select Employee_ID,First_Name,Last_Name,Department_ID from EMPLOYEES 
		where Department_ID = @department_id);

select * from dbo.getEmployeesByDepartment(50)

--3. Create a function that returns the data of employee records based on the page number passed. Parameters required are PageNumber, PageSize (Hint: use Row_Number, Partition by)
create function paging(@PageNumber int, @PageSize int)
returns table as 
return (select * from EMPLOYEES
		order by Employee_ID
		offset (@pageNumber-1)*@PageSize rows
		fetch next @pagesize rows only)


select * from dbo.paging(2,10)


--4. ‘Select EmpId, FirstName, LastName, PhoneNumber, Email from Employees’ check the execution plan for the given query and save it. Now, optimize the query and then check the execution plan and save it.

Select Employee_ID, First_Name, Last_Name, Phone_Number, Email from Employees

--5. Create a stored procedure that prints the employee info in the following format: 'employeename' hired on 'hiredate' has a salary package of 'salarypackage' Print only for 10 employees Implement it using cursor and then with while loop also

