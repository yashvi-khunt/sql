---while loop

use TASK

declare @temp int =10
while @temp <= 100
begin
select * from EMPLOYEES 
where Department_ID = @temp
set @temp = @temp+10
end