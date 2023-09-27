---temporary tables and table variables ---
-- db: task
use TASK 
/*  temp table method 1 */
select * into 
#temp_emp
from EMPLOYEES
where Department_ID = 50


select * from #temp_emp
/*  temp table method 2 */
create table #temp2
(
	employee_id int,
	fname varchar(50),
	lname varchar(50),
)

insert into #temp2
select Employee_ID,First_Name,Last_Name from EMPLOYEES
where Department_ID=10

select * from #temp2


-------- variable table ----------

declare @var_table table(emp_id int,salary int)

insert @var_table
select Employee_ID,Salary from EMPLOYEES

select * from @var_table


declare @VAR_TABLE2 TABLE(EMP_ID INT,SALARY INT)
INSERT INTO @VAR_TABLE2 VALUES
(100,24000),
(101,17000)
SELECT * FROM @VAR_TABLE2