--CREATE DATABASE TASK


/*
create table AUTHOR(
	Author_ID int primary key not null identity(1,1),	
	Author_Name VARCHAR(50) not null,
);

insert into author values
('Agatha Cristie'),
('Arundhati Roy')
SELECT * FROM author
*/


/*
CREATE TABLE PUBLISHER(
		Publisher_ID int PRIMARY KEY not null identity(1,1),
		Publisher_Name VARCHAR(50) not null,
)

insert into publisher values
('Collins Crime Club'),
('Random House')
SELECT * FROM PUBLISHER


*/

/*
CREATE TABLE BOOKS(
	Book_ID int PRIMARY KEY not null identity(1,1),
	Book_Name VARCHAR(50) not null,
	Author_ID int not null FOREIGN KEY REFERENCES author(author_id),
	Price INT not null,
	Publisher_ID int not null FOREIGN KEY REFERENCES PUBLISHER(Publisher_ID),
)
insert into books values
('Hallowe''en Party',1,549,1),
('The God of Small Things',2,699,2)

SELECT * FROM BOOKS
*/


/*
CREATE TABLE CREDIT_CARD_DETAILS(
	Credit_Card_Number int PRIMARY KEY not null identity(1,1),
	Credit_Card_Type VARCHAR(50) not null,
	Expiry_Date DATE not null,
)

insert into credit_card_details values
('business', '09-16-2050'),
('student', '06-21-2042')
SELECT * FROM CREDIT_CARD_DETAILS
*/


/*
CREATE TABLE CUSTOMER(
	Customer_ID	int PRIMARY KEY not null identity(1,1),
	Customer_Name VARCHAR(50) not null,
	Street_Address	VARCHAR(100) not null,
	City VARCHAR(50) not null,
	Phone_Number VARCHAR(15) not null,
	Credit_Card_Number int not null FOREIGN KEY REFERENCES  CREDIT_CARD_DETAILS(Credit_Card_Number)
)

insert into customer values
('abc','big ben','rajkot','9874534748',2),
('xyz','eiffel tower','mrobi','4735843745',1)
SELECT * FROM CUSTOMER
*/



/*
CREATE TABLE SHIPPING_TYPE(
		Shipping_Type int PRIMARY KEY not null identity(1,1),
		Shipping_Price INT not null,
)
insert into shipping_type values
('100'),
('70')
SELECT * FROM  SHIPPING_TYPE
*/



/*
CREATE TABLE SHOPPING_CART(
		Shopping_Cart_ID int PRIMARY KEY not null identity(1,1),
		Book_ID int not null FOREIGN KEY REFERENCES BOOKS(Book_ID),
		Price INT not null,
		Date DATE not null,
		Quantity INT not null,
)
insert into shopping_cart values 
(2,570,'09-24-2037',10),
(1,650,'10-23-2037',15)
SELECT * FROM SHOPPING_CART
*/

/*
CREATE TABLE ORDER_DETAILS(
		Order_ID int PRIMARY KEY not null identity(1,1),
		Customer_ID int not null FOREIGN KEY REFERENCES CUSTOMER(Customer_ID),
		Shipping_Type int not null FOREIGN KEY REFERENCES SHIPPING_TYPE(Shipping_Type),
		Date_Of_Purchase DATE not null ,
		Shopping_Cart_ID int not null FOREIGN KEY REFERENCES SHOPPING_CART(Shopping_Cart_ID),
)

insert into order_details values
(1,2,'06-11-2035',2),
(2,1,'11-06-2035',1)
SELECT * FROM ORDER_DETAILS
*/



/*
CREATE TABLE PURCHASE_HISTORY(
		Customer_ID int not null FOREIGN KEY REFERENCES CUSTOMER(Customer_ID),
		Order_ID int not null FOREIGN KEY REFERENCES ORDER_DETAILS(Order_ID),
)
insert into purchase_history values
(1,2),
(2,3)
SELECT * FROM PURCHASE_HISTORY
*/



