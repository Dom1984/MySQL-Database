DROP DATABASE IF EXISTS GUITARWORLD;
CREATE DATABASE GUITARWORLD;

USE GUITARWORLD;
DROP TABLE IF EXISTS CUSTOMER;
CREATE TABLE CUSTOMER(
CustomerID INT NOT NULL,
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(20) NOT NULL,
Email VARCHAR(30) NOT NULL,
PhoneNo INT NOT NULL,
StreetAddress VARCHAR(40),
City VARCHAR(20),
OrderID INT NOT NULL,
PRIMARY KEY (CustomerID)

);

INSERT INTO CUSTOMER(CustomerID,FirstName,LastName,Email,PhoneNo,StreetAddress,City,OrderID)
VALUES (13579246,'David','Casey','dcasey@gmail.com',012826363,'34 Bray Rd','Dublin',94724274);

INSERT INTO CUSTOMER(CustomerID,FirstName,LastName,Email,PhoneNo,StreetAddress,City,OrderID)
VALUES (16579946,'Donal','Smith','dsmith@gmail.com',013826563,'78 Ballybrack Rd','Dublin',14724274);

INSERT INTO CUSTOMER(CustomerID,FirstName,LastName,Email,PhoneNo,StreetAddress,City,OrderID)
VALUES (17579946,'Steve','Reidy','sreidy@gmail.com',013827563,'22 Conna Rd','Cork',64724274);

INSERT INTO CUSTOMER(CustomerID,FirstName,LastName,Email,PhoneNo,StreetAddress,City,OrderID)
VALUES (18579946,'Michael','Yule','myule@gmail.com',014827563,'44 Blasket Rd','Kilkenny',44424274);
 

USE GUITARWORLD;
DROP TABLE IF EXISTS ORDERS;
CREATE TABLE ORDERS(
OrderID INT NOT NULL,
OrderDate DATE,
OrderMonth CHAR(10),
OrderPrice FLOAT(7,2),
Quantity INT,
CustomerID INT NOT NULL,
ProductID INT,
PRIMARY KEY(OrderID)
);

INSERT INTO ORDERS(OrderID,OrderDate, OrderMonth, OrderPrice,Quantity,CustomerID,ProductID)
VALUES (94724274,'2018-03-02', 'March',167.95,1,13579246,00456734);

INSERT INTO ORDERS(OrderID,OrderDate, OrderMonth, OrderPrice,Quantity,CustomerID,ProductID)
VALUES (14724274,'2018-03-04', 'March',287.50,1,16579946,00873287);

INSERT INTO ORDERS(OrderID,OrderDate, OrderMonth, OrderPrice,Quantity,CustomerID,ProductID)
VALUES (64724274,'2018-03-06', 'March',397.00,1,17579946,00357844);

INSERT INTO ORDERS(OrderID,OrderDate, OrderMonth, OrderPrice,Quantity,CustomerID,ProductID)
VALUES (44424274,'2018-03-06', 'March', 523.50,1,18579946,00465829);

INSERT INTO ORDERS(OrderID,OrderDate, OrderMonth, OrderPrice,Quantity,CustomerID,ProductID)
VALUES (96724264,'2018-04-02','April', 187.95,1,13579246,00456735);

INSERT INTO ORDERS(OrderID,OrderDate, OrderMonth, OrderPrice,Quantity,CustomerID,ProductID)
VALUES (84424274,'2018-04-06','April', 593.50,1,18579946,00465429);

INSERT INTO ORDERS(OrderID,OrderDate, OrderMonth, OrderPrice,Quantity,CustomerID,ProductID)
VALUES (12346543,'2018-05-09', 'May', 187.95, 1, 13579246, 456735);

INSERT INTO ORDERS(OrderID,OrderDate, OrderMonth, OrderPrice,Quantity,CustomerID,ProductID)
VALUES (17254356, '2018-06-20', 'June', 593.5,1, 16579946, 465429);

INSERT INTO ORDERS(OrderID,OrderDate, OrderMonth, OrderPrice,Quantity,CustomerID,ProductID)
VALUES (98765447, '2018-07-21', 'July', 287.5, 1, 17579946, 873287);

INSERT INTO ORDERS(OrderID,OrderDate, OrderMonth, OrderPrice,Quantity,CustomerID,ProductID)
VALUES (98674635, '2018-08-15', 'August', 187.95, 2, 13579246, 456735);

INSERT INTO ORDERS(OrderID,OrderDate, OrderMonth, OrderPrice,Quantity,CustomerID,ProductID)
VALUES (25078533, '2018-09-10', 'September', 167.95, 1, 16579946, 456734);

INSERT INTO ORDERS(OrderID,OrderDate, OrderMonth, OrderPrice,Quantity,CustomerID,ProductID)
VALUES (88857565, '2018-10-05', 'October', 287.5, 1, 13579246, 873287);

INSERT INTO ORDERS(OrderID,OrderDate, OrderMonth, OrderPrice,Quantity,CustomerID,ProductID)
VALUES (22222222, '2018-11-23', 'November', 187.95, 1, 18579946, 456735);

INSERT INTO ORDERS(OrderID,OrderDate, OrderMonth, OrderPrice,Quantity,CustomerID,ProductID)
VALUES (45454545, '2018-12-11', 'December', 167.95, 1, 17579946, 456734);



USE GUITARWORLD;
DROP TABLE IF EXISTS PRODUCT;
CREATE TABLE PRODUCT(
ProductID INT,
ProductType VARCHAR(30),
Stocklevel INT,
SupplierID INT,
PRIMARY KEY(ProductID)

);

INSERT INTO PRODUCT(ProductID,ProductType,Stocklevel,SupplierID)
VALUES (00456734,'Fender Guitar',45,23);

INSERT INTO PRODUCT(ProductID,ProductType,Stocklevel,SupplierID)
VALUES (00873287,'Gibson Guitar',67,23);

INSERT INTO PRODUCT(ProductID,ProductType,Stocklevel,SupplierID)
VALUES (00357844,'Tanglewood Guitar',87,25);

INSERT INTO PRODUCT(ProductID,ProductType,Stocklevel,SupplierID)
VALUES (00465829,'PRS Guitar',29,25);

INSERT INTO PRODUCT(ProductID,ProductType,Stocklevel,SupplierID)
VALUES (00456735,'Rickenbacker Guitar',12,23);

INSERT INTO PRODUCT(ProductID,ProductType,Stocklevel,SupplierID)
VALUES (00465429,'Ibanez Guitar',10,23);

USE GUITARWORLD;
DROP TABLE IF EXISTS SUPPLIER;
CREATE TABLE SUPPLIER(
 SupplierID INT,
 SupplierName VARCHAR(30) NOT NULL,
 SupplierAddress VARCHAR(30),
 SupplierPhNo INT,
 PRIMARY KEY(SupplierID)
 );
 
 INSERT INTO SUPPLIER(SupplierID,SupplierName,SupplierAddress,SupplierPhNo)
 VALUES (23,'MusicMaker','1 Exchequer St, Dublin 1', 016547839);
 
INSERT INTO SUPPLIER(SupplierID,SupplierName,SupplierAddress,SupplierPhNo)
 VALUES (25,'Perfect Pitch','18 Westmoreland St, Dublin 1', 012345673);
 
DELIMITER //
 CREATE PROCEDURE Question1()
BEGIN
   

# 1. Show all transactions from any given week: #COMPLETE
SELECT * FROM ORDERS
WHERE OrderDate BETWEEN '2018-03-01' AND '2018-03-08'
ORDER BY OrderDate ASC;

END//



# 2. Create a Trigger that stores stock levels once a sale takes place 

#Firstly, let's view existing stock numbers, utilising the code from the answer to question 3, 
#making a note of the number of Fender guitars that we have in stock:

CREATE OR REPLACE VIEW Stock_by_supplier AS
SELECT PRODUCT.ProductType, PRODUCT.StockLevel, PRODUCT.SupplierID, SUPPLIER.SupplierName
FROM PRODUCT, SUPPLIER
WHERE PRODUCT.SupplierID = SUPPLIER.SupplierID
ORDER BY SUPPLIER.SupplierName;

SELECT * FROM Stock_by_supplier;

#The code for the Trigger is the following:

CREATE TRIGGER UpdateStock
AFTER INSERT ON ORDERS
FOR EACH ROW
	

UPDATE PRODUCT
SET StockLevel = StockLevel - New.Quantity
WHERE ProductID = NEW.ProductID;
   

#Next, let's insert an order for one Fender guitar, here is the code to do this:

INSERT INTO ORDERS(OrderID,OrderDate,OrderMonth,OrderPrice,Quantity,CustomerID,ProductID)
VALUES (155539849,'2018-07-18','July', 167.95,1,18579946,00456734);

#Finally, we view our stock numbers again, noting that the number of Fender Guitars in stock has reduced by one, 
#proving that the Trigger is functioning correctly:Question1

SELECT *
FROM Stock_by_Supplier;

DELIMITER //
 CREATE PROCEDURE Question3()
BEGIN

# 3. Create a View of stock (grouped by supplier) purchased by you.

CREATE OR REPLACE VIEW Stock_by_supplier AS
SELECT PRODUCT.ProductType, PRODUCT.StockLevel, PRODUCT.SupplierID, SUPPLIER.SupplierName
FROM PRODUCT, SUPPLIER
WHERE PRODUCT.SupplierID = SUPPLIER.SupplierID
ORDER BY SUPPLIER.SupplierName;

SELECT * FROM Stock_by_supplier;

END//



DELIMITER //
 CREATE PROCEDURE Question4()
BEGIN
# 4. Display total stock sold to general public (by supplier). (Group By with RollUp)


SELECT COALESCE(SUPPLIER.SupplierName, 'TOTAL') AS SupplierName, PRODUCT.SupplierID, SUM(ORDERS.OrderPrice) AS 'Total Amount'
FROM ((ORDERS
INNER JOIN PRODUCT ON ORDERS.ProductID = PRODUCT.ProductID)
INNER JOIN SUPPLIER ON PRODUCT.SupplierID = SUPPLIER.SupplierID)
GROUP BY SupplierName WITH ROLLUP;

END//


DELIMITER //
 CREATE PROCEDURE Question5()
BEGIN
# 5. Detail and total all transactions for the month-to-date. (A Group By with RollUp)

SELECT coalesce (OrderID, 'GrandTotal') AS OrderID,
SUM(OrderPrice) as TotalOrderPrice, OrderDate
FROM ORDERS	
WHERE MONTH(OrderDate) = MONTH(CURRENT_DATE())
GROUP BY OrderID WITH ROLLUP;

END//


DELIMITER //
 CREATE PROCEDURE Question6()
BEGIN
# 6. Detail and total all revenue for the year-to-date. (A Group By with Roll-Up)

SELECT * FROM (
SELECT Coalesce(PRODUCT.ProductType, 'Grand Total') AS ProductType, ORDERS.OrderDate, ORDERS.ProductID, SUM(ORDERS.OrderPrice) as TotalOrderPrice  
FROM (ORDERS INNER JOIN PRODUCT ON ORDERS.ProductID = PRODUCT.ProductID)
WHERE OrderDate BETWEEN '2018-01-01' AND DATE(CURRENT_DATE)
GROUP BY PRODUCT.ProductType with ROLLUP
)
AS T;

END//


DELIMITER //
 CREATE PROCEDURE Question7()
BEGIN
#7. Detail & total transactions broken down on a monthly basis for 1 year. (A Group By with Roll-Up)

SELECT * FROM (
SELECT Coalesce(MONTHNAME(ORDERS.OrderDate), 'Grand Total') AS OrderDate, SUM(ORDERS.OrderPrice) as TotalOrderPrice  
FROM ORDERS
WHERE OrderDate BETWEEN '2018-01-01' AND '2018-12-31'
GROUP BY MONTH(ORDERS.OrderDate) with ROLLUP)
AS T;

END//

DELIMITER //
 CREATE PROCEDURE Question8()
BEGIN
# 8. Display the growth in sales/services (as a percentage) for your business, from the 1st month of opening until the end of the year. 

SELECT Coalesce(OrderDate, 'Grand Total') AS OrderDate
      ,TotalOrderPrice
FROM (
SELECT MONTHNAME(ORDERS.OrderDate) as OrderDate, 
SUM(ORDERS.OrderPrice) as TotalOrderPrice,
MONTH(ORDERS.OrderDate) as MonthNum
FROM ORDERS
WHERE OrderDate BETWEEN '2018-01-01' AND '2018-12-31'
GROUP BY MONTHNAME(ORDERS.OrderDate),
MONTH(ORDERS.OrderDate) with ROLLUP)
AS T
ORDER BY COALESCE(MonthNum,13);

#(Fozz, RD)
SET @Last_Month_TotalOrderPrice := 0;

SELECT OrderDate, TotalOrderPrice, MonthlyPercentChange
FROM (
      SELECT OrderDate
            ,TotalOrderPrice
            ,CASE WHEN @Last_Month_TotalOrderPrice = 0
               THEN NULL
               ELSE (TotalOrderPrice - @Last_Month_TotalOrderPrice) * 100.00 / @Last_Month_TotalOrderPrice
             END as MonthlyPercentChange
            ,@Last_Month_TotalOrderPrice := TotalOrderPrice
            ,MonthNum
      FROM (
      #Order the months from Jan to Dec, rather than alphabetically
            SELECT MONTHNAME(ORDERS.OrderDate) as OrderDate, 
                   SUM(ORDERS.OrderPrice) as TotalOrderPrice,
                   MONTH(ORDERS.OrderDate) as MonthNum
            FROM ORDERS
            WHERE OrderDate BETWEEN '2018-01-01' AND '2018-12-31'
            GROUP BY MONTHNAME(ORDERS.OrderDate),
                     MONTH(ORDERS.OrderDate)
           ) AS T
      ORDER BY MonthNum) as SQ
ORDER BY MonthNum;



#References:

#Fozz, R.D.. “Stack Exchange Network.” dba.stackexchange.com. https://dba.stackexchange.com/questions/204123/calculating-percentage-growth-month-by-month (accessed April 21, 2018).
END//
	