
--db: task
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

--mathematical functions(ABS, ROUND, CEILING, FLOOR, POWER, SQRT, EXP, LOG, SIN, COS, TAN)
select abs(-100.111),abs(-100.111)
select round(100.111,1),round(100.111,2)
select CEILING(100.111)
select FLOOR(100.111)
select POWER(9,2)
select sqrt(9)
select exp(2)
select log(10)
select log10(10)
select sin(2)
select cos(2)
select tan(2)

--window functions( RANK, DENSE_RANK, NTILE, LEAD, LAG, first_value, last_value)

--RANK
select *,rank() over(order by department_id) as rank_dep from EMPLOYEES 

--dense rank
select *,dense_rank() over(order by department_id) as dRank_dep from EMPLOYEES 


--NTILE
SELECT *,
NTILE(12) OVER(ORDER BY department_id) ntile_dep
from EMPLOYEES 

--lead
select Employee_ID,First_Name,Last_Name,Hire_Date,Salary,LEAD(Salary,1) over (order by salary) next_salary from EMPLOYEES

--lag
select Employee_ID,First_Name,Last_Name,Hire_Date,Salary,lag(Salary,1) over (order by salary) prev_salary from EMPLOYEES

--first_value --last_value
SELECT *,
FIRST_VALUE(department_id) OVER( ORDER BY department_id) first_department
FROM EMPLOYEES

SELECT *,
LAST_VALUE(department_id) OVER(ORDER BY department_id asc) last_department
FROM EMPLOYEES

