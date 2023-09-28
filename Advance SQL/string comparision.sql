
declare @temp varchar(20) = (select upper(FIRST_name) from EMPLOYEES
where Employee_ID=100)

print(@temp)
select * from EMPLOYEES
where First_Name=@temp

select * from EMPLOYEES
where First_Name = @temp collate SQL_Latin1_general_cp1_cs_as  --temp: STEVEN

