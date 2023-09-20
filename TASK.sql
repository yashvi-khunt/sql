--employee list with count of how many orders per employee taken, and which is the last date of selling WITH CUSTOMER NAME ORDERBY-START BY D THEN NUM OF MAX CUSTOMERS(IF SAME = ORDER BY LATEST SELL) 

SELECT * from employees;
SELECT * from orders;
SELECT * from customers;

SELECT * FROM employees AS emp
INNER JOIN orders as odr
ON emp.EmployeeID = odr.EmployeeID
inner join customers AS C
ON C.CustomerID=odr.CustomerID;

-- LIST OF EMPLOYEES WITH THEIR ORDER COUNT
SELECT employees.EmployeeID ,COUNT(ORDERS.OrderID) AS OrderCount,MAX(OrderID) AS [LATEST ORDERID] FROM employees
INNER JOIN orders
ON employees.EmployeeID=orders.EmployeeID
GROUP BY employees.EmployeeID


SELECT employees.EmployeeID,LastName,customers.CustomerID,CustomerName,orders.OrderID,OrderDate FROM employees
INNER JOIN orders
ON employees.EmployeeID=orders.EmployeeID
inner join customers 
on customers.CustomerID = orders.CustomerID
--where orderDate in (Select Max(orderDAte) from employees inner JOIN orders ON employees.EmployeeID=orders.EmployeeID GROUP BY employees.EmployeeID )
order by EmployeeID,CustomerName desc

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

SELECT emp.EmployeeID,COUNT(ORDERS.OrderID) AS OrderCount,MAX(OrderID) AS [LATEST ORDERID]
FROM employees as emp
INNER JOIN orders
ON emp.EmployeeID=orders.EmployeeID
INNER JOIN customers
ON customers.CustomerID = orders.CustomerID
GROUP BY emp.EmployeeID 

select employees.EmployeeID,Max(CustomerName) from customers
inner join orders
on customers.CustomerID=orders.CustomerID
inner join employees
on employees.employeeId = orders.EmployeeID
where OrderID in (SELECT MAX(OrderID) AS [LATEST ORDERID] FROM employees
				  INNER JOIN orders 
				  ON employees.EmployeeID=orders.EmployeeID 
				  GROUP BY employees.EmployeeID)
group by employees.EmployeeID