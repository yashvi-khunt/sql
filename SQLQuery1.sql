
-- get all the columns from the Customers table.
SELECT * FROM dbo.customers;

-- Write a statement that will select the City column from the Customers table. 
SELECT City FROM dbo.customers;

--Select all the different values from the Country column in the Customers table. 
SELECT DISTINCT Country FROM dbo.customers ;

--select all the customers from the country "Mexico", in the "Customers" table 
select * from dbo.customers
where Country = 'Mexico';

-- not equal
select * from dbo.customers
where Country != 'Mexico';

--select all the customers from counteries germany,switzerland
select * from dbo.customers
where Country in ('Germany','Switzerland');

select * from dbo.customers
where Country='Germany' OR Country='Switzerland';

--Select all records where the City column has the value "Berlin".
select * from dbo.customers
where City='Berlin'

--all customers from the "Customers" table, sorted by the "Country" column
select * from dbo.customers
order by Country,CustomerID;

--Select all records from the Customers table, sort the result alphabetically by the column City.
select * from dbo.customers
order by City;

--Select all customers from Spain that starts with the letter 'G'
select * from dbo.customers
where Country='Spain' AND CustomerName LIKE	'G%';

--all fields from Customers where Country is "Germany" AND City is "Berlin" AND PostalCode is higher than 12000
SELECT * FROM dbo.customers
WHERE Country='Germany'
AND City='Berlin'
AND PostalCode > 12000;

-- all Spanish customers that starts with either "G" or "R"
SELECT * FROM dbo.customers 
WHERE Country = 'Spain' AND (CustomerName LIKE 'G%' OR CustomerName LIKE  'R%');

--Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 12209
Select * from dbo.customers
where City='Berlin' And PostalCode=12209;

--Select all customers from Germany or Spain
SELECT * FROM dbo.customers
WHERE Country ='Germany' OR Country='Spain';

--all fields from Customers where either City is "Berlin", CustomerName starts with the letter "G" or Country is "Norway"
SELECT * FROM dbo.customers
WHERE City='Berlin' OR CustomerName LIKE 'G%' OR Country='Norway'

--Select all records where the City column has the value 'Berlin' or 'London'.
SELECT * FROM dbo.customers
WHERE City='Berlin' OR City='London';

--Select only the customers that are NOT from Spain
SELECT * FROM dbo.customers
WHERE NOT Country='Spain';

--Select customers that does not start with the letter 'A'
SELECT * FROM dbo.customers
WHERE CustomerName NOT LIKE 'A%';

--Select customers with a customerID not between 10 and 60
SELECT * FROM dbo.customers
WHERE CustomerID NOT BETWEEN 10 AND  60;

--Select customers that are not from Paris or London
SELECT * FROM dbo.customers
WHERE NOT City in ('Paris','London');

--Select customers with a CustomerId not greater than 50
SELECT * FROM dbo.customers
WHERE NOT CustomerID > 50; 

--Select customers with a CustomerID not less than 50
SELECT * FROM dbo.customers
WHERE NOT CustomerID < 50; 

--select all records where City is NOT "Berlin"
SELECT * FROM dbo.customers
WHERE NOT City='Berlin';

--Insert a new record in the Customers table: 'Hekkan Burger','Gateveien 15','Sandnes','4306','Norway'
INSERT INTO dbo.customers(CustomerName,Address,City,PostalCode,Country)
VALUES('Hekkan Burger','Gateveien 15','Sandnes','4306','Norway');

--all customers with a NULL value in the "Address" field
SELECT * FROM dbo.customers
WHERE Address is NULL;

--all customers with a value in the "Address" field
SELECT * FROM dbo.customers
WHERE Address is NOT NULL;

--Select all records from the Customers where the PostalCode column is empty
SELECT * FROM dbo.customers
WHERE PostalCode is NULL;

--first customer (CustomerID = 1) with a new contact person and a new city - ContactName = 'Alfred Schmidt' = City= 'Frankfurt .
Update customers
set CustomerName = 'Alfred Schmidt', city='Frankfurt'
where CustomerID = 1;

--delete the customer "Alfreds Futterkiste" from the "Customers" table
Delete from customers
where CustomerName='Alfreds Futterkiste';

--Delete all the records from the Customers table where the Country value is 'Norway'
Delete from customers
where Country='Norway'

 --the first three records from the "Customers" table
 SELECT TOP 3 * FROM customers

 --the first 50% of the records from the "Customers" table
 SELECT TOP 50 PERCENT * from customers

 --first three records from the "Customers" table, where the country is "Germany" 
 Select TOP 3 * from customers
 where Country = 'Germany';
 
 select * from products

--Find the lowest price from products table
Select min(price) as MinimumPrice from products ;

--Find the highest price from products table
Select max(price) as MaximumPrice from products ;

--total number of products in the Products table
Select count(*) FROM products;

--Find the number of products where Price is higher than 20
Select COUNT(*) FROM products where Price > 20;

-- number of products where the ProductName is not null
Select COUNT(*) from products where ProductName is NOT NULL;

--how many different prices are there in the Products table
select COUNT(DISTINCT Price) from products;

-- the number of records that have the Price value set to 18.
Select COUNT(*) from products where price=18;

select * from order_details;
--sum of all Quantity fields in the OrderDetails table
select Sum(Quantity) from order_details;

--number of orders made for the product with ProductID 11
select Count(*) from order_details where ProductID=11;

--Join OrderDetails with Products, and use SUM() to find the total amount
select SUM(price*Quantity) from order_details as od
join products as p
on od.ProductID = p.ProductID;

--calculate the sum of all the Price column values in the Products table
Select SUM(Price)from products;

--Find the average price of all products
Select AVG(Price) from products;

--Return the avarege price of products in category 1
Select AVG(Price) from products
where CategoryID = 1;

--Return all products with a higher price than the average price
Select * from products
where price>(select AVG(Price) from products);

--Select all customers that starts with the letter "a"
Select * from customers
where CustomerName LIKE 'a%';

--Return all customers from a city that starts with 'L' followed by one wildcard character, then 'nd' and then two wildcard characters
Select * from customers
where City LIKE 'L_nd__';

--Return all customers from a city that contains the letter 'L'.
Select * from customers
where City LIKE '%L%';

--Return all customers that starts with 'La'.
Select * from customers
where CustomerName LIKE 'LA%';

--Return all customers that starts with 'a' or starts with 'b'.
Select * from customers
where CustomerName LIKE 'A%' OR CustomerName LIKE 'B%';

--Return all customers that ends with 'a'
Select * from customers
where CustomerName LIKE '%A';

--Return all customers that starts with "b" and ends with "s".
Select * from customers
where CustomerName LIKE 'B%S';

--Return all customers that contains the phrase 'or'
Select * from customers
where CustomerName LIKE '%OR%';

--Return all customers that starts with "a" and are at least 3 characters in length
Select * from customers
where CustomerName LIKE 'A__%';

--Return all customers that have "r" in the second position
Select * from customers
where CustomerName LIKE '_R%';

--Return all customers from Spain
Select * from customers
where Country LIKE 'SPAIN';

--Return all customers that ends with the pattern 'es'
Select * from customers
where CustomerName LIKE '%ES';

--Return all customers that contains the pattern 'mer'
Select * from customers
where CustomerName LIKE '%MER%';

--Return all customers with a City starting with any character, followed by "ondon".
Select * from customers
where CITY LIKE '_ondon' COLLATE SQL_Latin1_General_Cp1_CS_AS;

--Return all customers with a City starting with "L", followed by any 3 characters, ending with "on"
Select * from customers
where city like 'L___on';

--Return all customers starting with either "b", "s", or "p"
Select * FROM customers
WHERE City LIKE '[B,S,P]%'
ORDER BY CITY

--Return all customers starting with "a", "b", "c", "d", "e" or "f"
SELECT * FROM customers
WHERE CustomerName LIKE '[A-F]%'
ORDER BY CustomerName;

--Select all records where the second letter of the City is an "a"
SELECT * FROM customers
WHERE City LIKE '_A%';

--Return all customers from 'Germany', 'France', or 'UK'
sELECT * FROM customers
WHERE Country IN ('GERMANY','FRANCE','UK')
ORDER BY Country;

--Return all customers that are NOT from 'Germany', 'France', oR 'UK'
SELECT * FROM customers
WHERE Country NOT IN ('GERMANY','FRANCE','UK')
ORDER BY Country;

--Return all customers that have an order in the Orders table
SELECT * FROM customers
WHERE CustomerID IN (SELECT CustomerID FROM orders);

--Return all customers that have NOT placed any orders in the Orders table
SELECT * FROM customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM orders);

-- all products with a price between 10 and 20'
SELECT * FROM products
WHERE Price BETWEEN 10 AND 20;

--display the products outside the range of the previous example, use NOT BETWEEN
SELECT * FROM products
WHERE Price NOT BETWEEN 10 AND 20;

--all products with a price between 10 and 20. In addition; do not show products with a CategoryID of 1,2, or 3
SELECT * FROM products
WHERE Price BETWEEN 10 AND 20 AND CategoryID NOT IN (1,2,3);

-- selects all products with a ProductName between Carnarvon Tigers and Mozzarella di Giovanni
SELECT * FROM products 
WHERE ProductName BETWEEN 'CARNARVON TIGERS' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

--selects all products with a ProductName between Carnarvon Tigers and Chef Anton's Cajun Seasoning
SELECT * FROM products 
WHERE ProductName BETWEEN 'CARNARVON TIGERS' AND 'Chef Anton''s Cajun Seasoning'
ORDER BY ProductName;

--all products with a ProductName not between Carnarvon Tigers and Mozzarella di Giovanni
SELECT * FROM products 
WHERE ProductName NOT BETWEEN 'CARNARVON TIGERS' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

--all orders with an OrderDate between '01-July-1996' and '31-July-1996'
SELECT * FROM orders 
WHERE OrderDate BETWEEN '01-July-1996' and '31-July-1996';

-- SQL statement creates an alias named "Address" that combine four columns (Address, PostalCode, City and Country)
SELECT CONCAT(Address,',',PostalCode,',',City,',',Country) AS ADDRESS FROM customers;

--all the orders from the customer with CustomerID=4 (Around the Horn). We use the "Customers" and "Orders" tables, and give them the table aliases of "c" and "o" respectively 
SELECT * FROM orders AS O, customers AS C
WHERE C.CustomerID = 4 AND C.CustomerID = O.CustomerID;

--When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead
SELECT CustomerID, CustomerName,ContactName,Address,City,POSTALCODE AS pno,Country FROM customers;