--date functions

use TASK
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

use MOVIES_W3
select mov_dt_rel 
	   ,convert(date,mov_dt_rel)
	   ,cast(mov_dt_rel as date)
from movie