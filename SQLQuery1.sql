
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

--Find the number of products where Price is higher than 20

-- number of products where the ProductName is not null

--many different prices are there in the Products table

-- the number of records that have the Price value set to 18.


--sum of all Quantity fields in the OrderDetails table

--number of orders made for the product with ProductID 11

--Join OrderDetails with Products, and use SUM() to find the total amount

--calculate the sum of all the Price column values in the Products table