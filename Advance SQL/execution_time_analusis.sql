/*
Select *  from employees
left join (Select concat(First_Name,' ',Last_Name) as ManagerName,Employee_ID AS EMPid,Hire_Date as ManagerHireDate from EMPLOYEES) as a
on a.EMPid = EMPLOYEES.Manager_ID
where ManagerHireDate > Hire_Date


Select Employees.Employee_ID,EMPLOYEES.First_Name,EMPLOYEES.Last_Name,EMPLOYEES.Hire_Date as employeeHireDate, CONCAT(manager.First_Name,' ',manager.Last_Name) as ManagerName,EMPLOYEES.Job_ID,EMPLOYEES.Salary,manager.Employee_ID as Manager_id,manager.Hire_Date as ManagerHireDate  from employees
,EMPLOYEES manager
where manager.Employee_ID = EMPLOYEES.Manager_ID and EMPLOYEES.Hire_Date < manager.Hire_Date

SELECT LAST_NAME,JOB_id,SALARY AS SAL FROM [dbo].[EMPLOYEES]

SELECT employee_id, last_name, salary,(salARY*12) AS [ANNUAL SALARY] FROM employees

select *
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='departments';


sELECT dISTINCT JOB_ID FROM EMPLOYEES

select Employee_ID,Last_Name,Salary as [Old Salary], Salary+(Salary*0.155) as [New Salary],(Salary*0.155) as increment from EMPLOYEES

select jobs.Job_ID, Min_Salary,Max_Salary,sum(Salary) as [total salary],AVG(Salary) as [average salary] from JOBS
inner join EMPLOYEES
on EMPLOYEES.Job_ID = JOBS.Job_ID
group by jobs.Job_ID,Min_Salary,Max_Salary

Select a.Last_Name as firstEMployee,b.Last_Name as secondEMployeeName,a.Department_ID from EMPLOYEEs a, EMPLOYEEs b
where a.Department_ID = b.Department_ID and a.First_Name<>b.First_Name

select Max(Salary) as Maximum,Min(salary) as Minimum,Sum(salary) as Sum,AVG(salary) as Average from employees

select * from EMPLOYEES
where not Salary = any (select Salary from EMPLOYEES where Department_ID=60)

SELECT Department_ID,Department_Name FROM DEPARTMENTS
except 
select Department_ID,department_name from DEPARTMENTS
where Department_ID =  any (select Department_ID from EMPLOYEEs where job_id='st_clerk')
*/


/* DB - moview_w3 */

select dir_fname,dir_lname,mov_title from movie m
left join movie_direction md
on m.mov_id=md.mov_id
left join director dir
on dir.dir_id = md.dir_id
left join movie_cast as movc
on movc.mov_id=m.mov_id
where role='Sean Maguire'

select mov_title from movie m
inner join movie_direction md
on m.mov_id=md.mov_id
--inner join director dir
--on dir.dir_id = md.dir_id
inner join movie_cast as movc
on movc.mov_id=m.mov_id
INNER JOIN rating 
ON rating.mov_id = m.mov_id
--INNER JOIN actor 
--ON actor.act_id = movc.act_id

SELECT * FROM rating;

select m.mov_id,mov_title,mov_year,mov_dt_rel,dir_fname,dir_lname,act_fname,act_lname
from movie as m 
inner join ( select director.dir_id,dir_fname,dir_lname,mov_id from director
			 inner join movie_direction
			 on movie_direction.dir_id = director.dir_id)as md
on md.mov_id=m.mov_id
inner join  ( select actor.act_id,act_fname,act_lname,mov_id from actor
			 inner join movie_cast
			 on movie_cast.act_id= actor.act_id)as act
on act.mov_id = m.mov_id
where m.mov_id = any(select mov_id from rating
				where rev_id = any(select rev_id from reviewer
								   where rev_name is null or rev_name=''))