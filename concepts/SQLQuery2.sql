select * from CUSTOMER
select * from ORDER_DETAILS
select * FROM SHIPPING_TYPE
SELECT * FROM SHOPPING_CART
SELECT * FROM PURCHASE_HISTORY
SELECT * FROM BOOKS

-- 2. Create the view for the Customer_Details. View should include the columns: Customer Name, Customer Address and details of the order placed by customer.

/*
CREATE VIEW CUSTOMER_DETAILS AS
select Customer_Name as cName, concat(Street_Address,',',City) as address,Order_ID,Date_Of_Purchase,Book_Name,SHOPPING_CART.PRICE,SHIPPING_TYPE.Shipping_Type,Shipping_Price from customer 
inner join ORDER_DETAILS
on ORDER_DETAILS.Customer_ID = CUSTOMER.Customer_ID
INNER JOIN SHIPPING_TYPE
ON ORDER_DETAILS.Shipping_Type = SHIPPING_TYPE.Shipping_Type
INNER JOIN SHOPPING_CART
ON ORDER_DETAILS.Shopping_Cart_ID = SHOPPING_CART.Shopping_Cart_ID
INNER JOIN BOOKS
ON SHOPPING_CART.Book_ID = BOOKS.Book_ID
*/
SELECT * FROM CUSTOMER_DETAILS

-- 3. Create a report that contains each customer's history of purchasing books. Be sure to include the cusotmer name, customer ID, book ID, DOP and shopping card ID.

/*
CREATE VIEW REPORT AS
Select Customer_Name,CUSTOMER.Customer_ID,Book_ID,Date_Of_Purchase,SHOPPING_CART.Shopping_Cart_ID from PURCHASE_HISTORY
INNER JOIN CUSTOMER
ON CUSTOMER.Customer_ID=PURCHASE_HISTORY.Customer_ID
inner join ORDER_DETAILS
ON ORDER_DETAILS.Order_ID = PURCHASE_HISTORY.Order_ID
INNER JOIN SHOPPING_CART
ON SHOPPING_CART.Shopping_Cart_ID = ORDER_DETAILS.Shopping_Cart_ID
*/
sELECT * FROM REPORT