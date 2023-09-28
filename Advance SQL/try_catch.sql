--try-catch

use task
begin try
declare @result int = 10/0
end try
begin catch
	print('an error occured : '+error_message())
end catch


begin try
update EMPLOYEES
set Department_ID=220 where Employee_ID=100
end try
begin catch
	print(error_message())
end catch

