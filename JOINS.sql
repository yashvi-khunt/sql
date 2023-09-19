--JOINS

--INNER JOIN
--selects all orders with customer information
SELECT * FROM customers AS C
INNER JOIN orders AS O
ON C.CustomerID = O.CustomerID;

--all orders with customer and shipper information
SELECT * FROM customers AS C
INNER JOIN orders AS O
ON C.CustomerID = O.CustomerID
INNER JOIN shippers AS S
ON O.ShipperID = S.ShipperID;

--LEFT OUTER JOIN
--select all customers, and any orders they might have
SELECT customers.CustomerName,orders.OrderID FROM customers
LEFT OUTER JOIN orders
ON customers.CustomerID = orders.CustomerID
ORDER BY CustomerName

--RIGHT OUTER JOIN
 --return all employees, and any orders they might have placed
 SELECT employees.FirstName,employees.LastName,orders.OrderID FROM orders
RIGHT OUTER JOIN employees
ON employees.EmployeeID = orders.EmployeeID
ORDER BY Orders.OrderID;


 --FULL OUTER JOIN

--selects all customers, and all orders
SELECT * FROM customers
FULL OUTER JOIN orders
ON customers.CustomerID = orders.CustomerID


--UNION

--statement returns the cities (only distinct values) from both the "Customers" and the "Suppliers" table
SELECT CITY FROM customers
UNION 
SELECT CITY FROM suppliers

--returns the cities (duplicate values also) from both the "Customers" and the "Suppliers" table
SELECT CITY FROM customers
UNION ALL
SELECT CITY FROM suppliers
ORDER BY CITY

--SQL statement returns the German cities (only distinct values) from both the "Customers" and the "Suppliers" table
SELECT CITY FROM customers
WHERE Country = 'GERMANY'
UNION 
SELECT CITY FROM suppliers
WHERE Country = 'GERMANY'
ORDER BY CITY

 --returns the German cities (duplicate values also) from both the "Customers" and the "Suppliers" table
 SELECT CITY FROM customers
WHERE Country = 'GERMANY'
UNION ALL
SELECT CITY FROM suppliers
WHERE Country = 'GERMANY'
ORDER BY CITY

 --all customers and suppliers
  SELECT 'CUSTOMER' AS TYPE, CustomerID,CustomerName,ContactName FROM customers
  UNION
  SELECT 'SUPPLIER', SupplierID,SupplierName,ContactName FROM suppliers

 --GROUP BY
 -- SQL statement lists the number of customers in each country
 SELECT  COUNTRY,COUNT(*) AS CUSTOMERS FROM customers
 GROUP BY Country

 -- SQL statement lists the number of customers in each country, sorted high to low
 SELECT  COUNTRY,COUNT(*) AS CUSTOMERS FROM customers
 GROUP BY Country
ORDER BY COUNT(CustomerID) DESC

 --SQL statement lists the number of orders sent by each shipper
 SELECT shippers.ShipperID,shippers.ShipperName, COUNT(orders.OrderID) FROM ORDERS
 INNER JOIN shippers
 ON orders.ShipperID=shippers.ShipperID
 GROUP BY shippers.ShipperName, shippers.ShipperID

 
 --HAVING
 --statement lists the number of customers in each country. Only include countries with more than 5 customers
 Select Country,COUNT(customerID) from customers
 GROUP BY COUNTRY
 HAVING COUNT(CustomerID) > 5;
 

 --statement lists the number of customers in each country, sorted high to low (Only include countries with more than 5 customers)
 Select Country,COUNT(customerID) from customers
 GROUP BY COUNTRY
 HAVING COUNT(CustomerID) > 5
 ORDER BY COUNT(CustomerID) DESC

 SELECT * FROM employees
 SELECT * FROM orders

 -- SQL statement lists the employees that have registered more than 10 orders
 SELECT employees.EmployeeID,employees.FirstName,employees.LastName ,COUNT(ORDERS.OrderID) AS OrderCount FROM employees
 INNER JOIN orders
 ON employees.EmployeeID=orders.EmployeeID
 GROUP BY employees.EmployeeID,employees.FirstName, employees.LastName
 HAVING COUNT(ORDERS.OrderID)>10

 --SQL statement lists if the employees "Davolio" or "Fuller" have registered more than 25 orders
 SELECT employees.EmployeeID,employees.FirstName,employees.LastName ,COUNT(ORDERS.OrderID) AS OrderCount FROM employees
 INNER JOIN orders
 ON employees.EmployeeID=orders.EmployeeID
 WHERE employees.LastName IN ('Davolio','Fuller')
 GROUP BY employees.EmployeeID,employees.FirstName, employees.LastName
 HAVING COUNT(ORDERS.OrderID)>25

 --EXISTS
 -- lists the suppliers with a product price less than 20
 SELECT SupplierID,SupplierName FROM suppliers 
 WHERE EXISTS (SELECT ProductID FROM products WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20)

 -- lists the suppliers with a product price equal to 22
 SELECT SupplierID,SupplierName FROM suppliers 
 WHERE EXISTS (SELECT ProductID FROM products WHERE Products.SupplierID = Suppliers.supplierID AND Price = 22)

 -- ANY / ANY ALL
 SELECT * FROM products
 SELECT * FROM order_details
 --SQL statement lists the ProductName if it finds ANY records in the OrderDetails table has Quantity equal to 10
 SELECT PRODUCTid,ProductName FROM products
 WHERE ProductID = ANY (SELECT ProductID FROM order_details WHERE Quantity=10)

 --SQL statement lists the ProductName if it finds ANY records in the OrderDetails table has Quantity larger than 99
  SELECT PRODUCTid,ProductName FROM products
 WHERE ProductID = ANY (SELECT ProductID FROM order_details WHERE Quantity>99)

 -- SQL statement lists the ProductName if it finds ANY records in the OrderDetails table has Quantity larger than 1000 (this will return FALSE because the Quantity column has no values larger than 1000):
   SELECT PRODUCTid,ProductName FROM products
 WHERE ProductID = ANY (SELECT ProductID FROM order_details WHERE Quantity>1000)

 --ALL the product names
 sELECT ALL ProductName FROM products
 WHERE 1=1

 -- SQL statement lists the ProductName if ALL the records in the OrderDetails table has Quantity equal to 10. This will of course return FALSE because the Quantity column has many different values (not only the value of 10):
  sELECT ProductName FROM products
 WHERE ProductID = ALL (SELECT ProductID FROM order_details WHERE Quantity=10)