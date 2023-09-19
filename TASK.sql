--employee list with count of how many orders per employee taken, and which is the last date of selling WITH CUSTOMER NAME ORDERBY-START BY D THEN NUM OF MAX CUSTOMERS(IF SAME = ORDER BY LATEST SELL) 

SELECT * from employees;

SELECT * from customers;

SELECT * FROM employees AS emp
INNER JOIN orders as odr
ON emp.EmployeeID = odr.EmployeeID;

-- LIST OF EMPLOYEES WITH THEIR ORDER COUNT
SELECT employees.EmployeeID ,COUNT(ORDERS.OrderID) AS OrderCount,MAX(OrderDate) AS [LATEST ORDERDATE] FROM employees
INNER JOIN orders
ON employees.EmployeeID=orders.EmployeeID
GROUP BY employees.EmployeeID


SELECT employees.EmployeeID,LastName,customers.CustomerID,CustomerName,orders.OrderID,OrderDate FROM employees
INNER JOIN orders
ON employees.EmployeeID=orders.EmployeeID
inner join customers 
on customers.CustomerID = orders.CustomerID
where orderDate in (Select Max(orderDAte) from employees inner JOIN orders ON employees.EmployeeID=orders.EmployeeID GROUP BY employees.EmployeeID )
order by EmployeeID,OrderDate desc

Select employees.employeeId,Max(orderDAte) from employees inner JOIN orders ON employees.EmployeeID=orders.EmployeeID GROUP BY employees.EmployeeID
