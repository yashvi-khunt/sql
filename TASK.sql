--employee list with count of how many orders per employee taken, and which is the lastest date of selling WITH CUSTOMER NAME ORDERBY-START BY D THEN NUM OF MAX CUSTOMERS(IF SAME = ORDER BY LATEST SELL) 
/*
SELECT * from employees;
SELECT * from orders;
SELECT * from customers;

SELECT * FROM employees AS emp
INNER JOIN orders as odr
ON emp.EmployeeID = odr.EmployeeID
inner join customers AS C
ON C.CustomerID=odr.CustomerID;


SELECT employees.EmployeeID,LastName,customers.CustomerID,CustomerName,orders.OrderID,OrderDate FROM employees
INNER JOIN orders
ON employees.EmployeeID=orders.EmployeeID
inner join customers 
on customers.CustomerID = orders.CustomerID
--where orderDate in (Select Max(orderDAte) from employees inner JOIN orders ON employees.EmployeeID=orders.EmployeeID GROUP BY employees.EmployeeID )
order by EmployeeID,OrderID desc

--Select employees.employeeId,Max(orderDAte) from employees inner JOIN orders ON employees.EmployeeID=orders.EmployeeID GROUP BY employees.EmployeeID

--employee id with orders ordered by date and id
SELECT employees.EmployeeID,MAX(OrderDate) AS [LATEST ORDERDATE],OrderID FROM employees
INNER JOIN orders
ON employees.EmployeeID=orders.EmployeeID
GROUP BY employees.EmployeeID, OrderID
order by employees.EmployeeID,OrderID desc

--employee details along with latest order - customerName  and orderdate
Select employees.EmployeeID as empID,FirstName as empName,customerName,OrderDate from customers
inner join orders
on customers.CustomerID = orders.CustomerID
inner join employees
on employees.EmployeeID = orders.EmployeeID
where OrderID in (SELECT MAX(OrderID) AS [LATEST ORDERID] FROM employees INNER JOIN orders ON employees.EmployeeID=orders.EmployeeID GROUP BY employees.EmployeeID)
group by employees.EmployeeID,employees.FirstName,CustomerName,OrderDate


--count of orders per employee
SELECT COUNT(ORDERS.OrderID) AS OrderCount FROM employees
INNER JOIN orders
ON employees.EmployeeID=orders.EmployeeID
GROUP BY employees.EmployeeID

SELECT employees.EmployeeID,LastName,customers.CustomerID,CustomerName,orders.OrderID,OrderDate FROM employees
INNER JOIN orders
ON employees.EmployeeID=orders.EmployeeID
inner join customers 
on customers.CustomerID = orders.CustomerID
where OrderID in (SELECT MAX(OrderID) AS [LATEST ORDERID] FROM employees INNER JOIN orders ON employees.EmployeeID=orders.EmployeeID GROUP BY employees.EmployeeID)
order by EmployeeID,OrderDate desc

-- LIST OF EMPLOYEES WITH THEIR ORDER COUNT
--table1

SELECT emp.EmployeeID as EmpID, COUNT(ORDERS.OrderID) AS OrderCount,MAX(OrderID) AS LatestOrderID
FROM employees as emp
INNER JOIN orders
ON emp.EmployeeID=orders.EmployeeID
INNER JOIN customers
ON customers.CustomerID = orders.CustomerID
GROUP BY emp.EmployeeID 

--table2
select employees.EmployeeID as empID,Max(CustomerName) as CustomerName from customers
inner join orders
on customers.CustomerID=orders.CustomerID
inner join employees
on employees.employeeId = orders.EmployeeID
where OrderID in (SELECT MAX(OrderID) AS [LATEST ORDERID] FROM employees
				  INNER JOIN orders 
				  ON employees.EmployeeID=orders.EmployeeID 
				  GROUP BY employees.EmployeeID)
group by employees.EmployeeID



-- LIST OF EMPLOYEES WITH THEIR ORDER COUNT
SELECT employees.EmployeeID as EmpID ,COUNT(ORDERS.OrderID) AS OrderCount,MAX(OrderID) AS LatestOrderID,MAX(OrderDate) FROM employees
INNER JOIN orders
ON employees.EmployeeID=orders.EmployeeID

GROUP BY employees.EmployeeID


select CustomerName as cname,OrderID as orderID  from customers
inner join orders
on orders.CustomerID=customers.CustomerID
where OrderID in (10411,10422,10442,10405,10439,10397,10428,10443,10440)
*/

Select EmpID,LastName,FirstName,OrderCount,t1.LatestOrderID,OrderDate,cname,BirthDate,photo,Notes,DATEDIFF(YEAR,birthdate,dateName(year,getdate())) as age
from (SELECT employees.EmployeeID as EmpID,COUNT(ORDERS.OrderID) AS OrderCount,MAX(OrderID) AS LatestOrderId FROM employees
	  INNER JOIN orders
	  ON employees.EmployeeID=orders.EmployeeID
	  GROUP BY employees.EmployeeID) as t1

inner join (select CustomerName as cname,OrderID as orderID  from customers
			inner join orders
			on orders.CustomerID=customers.CustomerID) as t2

on t1.LatestOrderID=t2.orderID
inner join employees
on employees.EmployeeID=t1.EmpID
inner join orders
on orders.OrderID = t1.LatestOrderId
order by (CASE
				WHEN LastName like 'd%' then 0
				else 1
		 END )asc,
		  orderCount desc, orders.OrderID

