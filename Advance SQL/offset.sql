--- off set - db: task

select * from EMPLOYEES

SELECT Employee_ID, first_Name, Department_ID, Salary FROM employees ORDER BY Salary ASC LIMIT 2 OFFSET 2

select Employee_id,first_name,last_name, salary from EMPLOYEES 
order by Employee_ID
offset 5 rows


select Employee_id,first_name,last_name, salary from EMPLOYEES 
order by Employee_ID
offset 0 rows
fetch next 2 rows only

select Employee_id,first_name,last_name, salary from EMPLOYEES 
order by Employee_ID
offset 1 rows
fetch first 5 row only


declare @page int = 20
select Employee_id,first_name,last_name, salary from EMPLOYEES 
order by Employee_ID
offset 1 rows
fetch first @page row only
