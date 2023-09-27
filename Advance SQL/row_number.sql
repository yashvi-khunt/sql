-- row number - db: task

select * from EMPLOYEES
select Employee_ID,Salary,ROW_NUMBER() over (order by salary) as r_n from EMPLOYEES

select Employee_ID
	   ,Salary
	   ,ROW_NUMBER() over (order by salary) as rn 
from EMPLOYEES
order by Employee_ID

select  Employee_ID
	   ,Salary
	   ,ROW_NUMBER() over (order by salary) as s_rn 
	   ,Hire_Date
	   ,ROW_NUMBER() over (order by hire_date) as hr_rn
from EMPLOYEES
 

 select Employee_ID
	   ,Salary
	   ,Hire_Date
	   ,ROW_NUMBER() over (order by salary,hire_date) as s_rn 
from EMPLOYEES


select Employee_ID
	   ,Salary
	   ,hire_date
	   ,ROW_NUMBER() over (partition by hire_date order by hire_date) as s_rn 
from employees