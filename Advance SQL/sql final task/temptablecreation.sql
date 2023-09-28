Select Employee_ID, First_Name, Last_Name, Phone_Number, Email 
into #tempEmp
from Employees

select * from #tempEmp