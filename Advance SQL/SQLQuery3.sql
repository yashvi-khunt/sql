--scaler functions --SUM, AVG, MAX, MIN, COUNT, UPPER, LOWER, LEN, CONCAT, SUBSTRING, DATEPART

select sum(employee_id) as sumOfID
	   ,avg(employee_id) as avgOfID
	   ,sum(employee_id) as sumOfID
	   ,max(employee_id) as maxOfID
	   ,min(employee_id) as minOfID
	   ,count(employee_id) as countOfID
from EMPLOYEEs


select 
	upper(First_Name) as upr
	,lower(First_Name) as lwr
	,len(First_Name) as l_ength
	,concat(First_Name,' ',last_name) as con
	,substring(First_Name,2,5) as substr
	,left(first_name,3) as leftalphabets
	,right(first_name,3) as rightalphabets
	,REPLACE(phone_number ,'.','') AS REPLACE_
from EMPLOYEES

select 
	getdate() as curr_date
	,CURRENT_TIMESTAMP as curr_timestamp
	,DATEPART(YEAR,hire_date) as hireYear
	,DATEADD(year,3,hire_date) as threeyears
	,DATEDIFF(year,'06-01-1999','06-01-2005') as differencebetween
	,year(hire_date) as hire_year
	,MONTH(hire_date) as hire_month
	,DAY(hire_date) as hire_day
	,EOMONTH(hire_date) as endofmonth
	,FORMAT(hire_date,'dd-MM-yyyy')
from EMPLOYEES

select * from EMPLOYEEs
select convert(varchar,salary) as covertString,cast(salary as varchar(2)) as castString,try_parse(phone_number as int) as parseString from employees

