--partition by

use task

select *,count(*) over(partition by department_id) as sepByDept from EMPLOYEES
select *,ROW_NUMBER() over (partition by department_id order by department_id) as rn_dept from EMPLOYEES
select *,ROW_NUMBER() over (partition by department_id order by department_id) as rn_dept
		,sum(salary) over(partition by department_id order by department_id )
from EMPLOYEES
