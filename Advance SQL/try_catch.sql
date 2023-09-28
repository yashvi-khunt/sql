--try-catch

use task
begin try
declare @result int = 10/0
end try
begin catch
	print('an error occured : '+error_message())
end catch


