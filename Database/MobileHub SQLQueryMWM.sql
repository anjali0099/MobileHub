--Usertable

CREATE TABLE User_tb (
    UID int NOT NULL identity(1,1) Primary Key ,
    FirstName varchar(255) NOT NULL,
    LastName varchar(255) NOT NULL,
	Address varchar(255),
	Email varchar(255),
	Phone varchar(10),
    Username varchar(255) unique NOT NULL,
	Password varchar(255),
    Userrole varchar(150),
);
Select * from User_tb
Delete from User_tb
Drop table User_tb

--Category Table--

create table Category_tb
(
Cat_id int NOT NULL identity(1,1) primary key,
Cat_Name   nvarchar(MAX)
);
Select * from Category_tb
Delete from Category_tb
Drop table Category_tb


--Product Table--

create table Product_tb
(
PID int NOT NULL identity(1,1) primary key,
PName   varchar(MAX),
Cat_id int,
Pimage varchar(255),
Description varchar(255),
Price varchar(150),
Constraint [FK_Product_tb_ToTable] FOREIGN KEY ([Cat_id]) REFERENCES [Category_tb] ([Cat_id]),
);

Select * from Product_tb
Delete from Product_tb
Drop table Product_tb

alter table product_tb ALTER column PName varchar(255)
alter table product_tb ALTER column Description text



--Cart Table--

create table Cart_tb
(
Cart_ID int NOT NULL identity(1,1) primary key,
PID int,
UID int,
Username varchar(200),
PName   nvarchar(MAX),
Pimage varchar(255),
Quantity varchar(200),
Price money,
TotalPrice money,

Constraint [FK_Cart_tb_ToTable1] FOREIGN KEY (PID) REFERENCES Product_tb (PID),

);
alter table Cart_tb ALTER column PName varchar(255)
INSERT INTO Cart_tb (PID,UID, PName,Username, Pimage, Quantity, Price,TotalPrice) VALUES(2,1,'soo','anjali','null', 6, 1000.00, 60000)
Select * from Cart_tb
Delete from Cart_tb
Delete from Cart_tb where Cart_id='5';
Drop table Cart_tb
SELECT * FROM Cart_tb where Username='anjali';
delete  from Cart_tb where Cart_ID='19';

SELECT SUM(TotalPrice) FROM Cart_tb WHERE Username ='anjali';
SELECT SUM(TotalPrice) as Amountsum FROM Cart_tb WHERE Username='anjali';

ALTER TABLE Cart_tb ALTER COLUMN Price 'DOUBLE';


-- Order Table--

create table Order_tb
(
Order_ID int NOT NULL identity(1,1) primary key,

	
	FirstName varchar(255) NOT NULL,
    LastName varchar(255) NOT NULL,
	Address varchar(255) NOT NULL,
	City varchar(255) NOT NULL,
	Area varchar(255) NOT NULL,
    PhoneNumber varchar(10) NOT NULL,

Username varchar(200),
PName   varchar(MAX),
PID int,
Quantity varchar(200),
GrandTotal money,

PaymentThrough varchar (255),
Order_Status varchar (255),
Order_date dateTime,
Constraint [FK_Order_tb_ToTable5] FOREIGN KEY (PID) REFERENCES Product_tb (PID),
);

Select * from Order_tb
Delete from Order_tb
Drop table Order_tb

--Customer Feedback Table--

create table Feedback_tb
(
Feed_Id int NOT NULL identity(1,1) primary key,
PID int,
Name varchar(200),
Email varchar(200),
Message nvarchar(max),
Ratings varchar (255),
Feedback_date dateTime,
Constraint [FK_Feedback_tb_ToTable6] FOREIGN KEY (PID) REFERENCES Product_tb (PID),

);
Select * from Feedback_tb
Delete from Feedback_tb
Drop table Feedback_tb

create table ContactUs_tb
(
ContactUs_id int NOT NULL identity(1,1) primary key,

FullName varchar(200),
Email varchar(200),
Message nvarchar(max),

);
Select * from ContactUs_tb
Delete from ContactUs_tb
Drop table ContactUs_tb