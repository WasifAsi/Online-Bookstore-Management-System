create database Book_Heaven;

use Book_Heaven;


#Table Creating

Create table Customer
(
	Customer_Id varchar(6),
	F_name varchar(15) not null,
	L_name varchar(15) not null,
	Email varchar(50) not null,
	Tel_Number bigint not null,

	constraint primary key (Customer_Id)
);

create table Supplier 
(
	Supplier_Id varchar(6) ,
	Name varchar(20) not null,
	Tel_Number bigint not null, 
	Email varchar(50) not null,
	Street_address varchar(30) not null,
	City varchar(15) not null,
	Province varchar(25) not null,
	Postal_code int not null,
	Country varchar(15) default "Sri lanka",

	constraint primary key(Supplier_Id)
);


create table Bank_Payment
(
	Bank_Pay_Id varchar (6) unique,
	Amount decimal(8,2) not null,
	Paid_date date not null,
	Paid_time time not null,
	reference_No bigint unique not null,
	Ac_Number bigint not null,
	Bank_name varchar(20)not null,
	Brach_name Varchar(20)not null,

	constraint primary key (Bank_Pay_Id)
);


create table Online_Payment
(
	Online_Pay_Id varchar(6) unique ,
	Amount decimal(8,2) not null,
	Paid_date date not null,
	Paid_time time not null,
	Transition_Id bigint unique not null,

	constraint primary key (Online_Pay_Id)
);


create table Delivery
(
	Delivery_Id  varchar(6),
	Reciver_Fname varchar(15) not null,
	Reciver_Lname varchar(15) not null,
	Contact_No bigint not null, 
	Street_address varchar(30) not null,
	City varchar(15) not null,
	Province varchar(25) not null,
	Postal_code int not null,
	Country varchar(15) default "Sri lanka",
	Delivery_Date date not null,

	constraint primary key(Delivery_Id)
);


create table order_table
(
	Order_Id varchar(6),
	Order_date date not null,	
	Customer_Id varchar(6) not null,
	Bank_Pay_Id varchar (6) unique  ,
	Online_Pay_Id varchar(6) unique ,
	Delivery_Id varchar (6) unique not null,

	constraint primary key(Order_Id ),
	constraint foreign key(Customer_Id) references Customer(Customer_Id),
	constraint foreign key(Bank_Pay_Id) references Bank_Payment(Bank_Pay_Id),
	constraint foreign key(Online_Pay_Id) references Online_Payment(Online_Pay_Id),
	constraint foreign key(Delivery_Id) references Delivery(Delivery_Id)
);


create table Item
(
	Item_code varchar(6),
	Price decimal(8,2) not null,
	Stock_level int not null,
	Reorder_level int not null,
	Supplier_Id varchar (6) not null,

	constraint primary key(Item_code),
	constraint foreign key(Supplier_Id) references Supplier(Supplier_Id)
);



create table Book_Item 
(
	Item_code varchar(6),
	ISBN varchar(20) unique not null,
	Title varchar(100) not null,
	Genre varchar(20),
	Category  varchar(20),
	Author  varchar(30) not null,
	Publisher varchar(50) not null,
	Year_of_Publication year not null ,


	constraint primary key(Item_code),
	constraint foreign key(Item_code) references Item(Item_code)
);


create table Stationary_Item 
(
	Item_code varchar(6),
	Product_type varchar(20) not null,
	Brand varchar(20),

	constraint primary key(Item_code),
	constraint foreign key(Item_code) references Item(Item_code)
);



create table Order_Item
(
	Order_Id varchar(6),
	Item_code varchar(6),
	Quantity int not null,

	constraint primary key(Order_Id ,Item_code , Quantity),
	constraint foreign key(Order_Id) references Order_table(Order_Id),
	constraint foreign key(Item_code) references  Item(Item_code)
);

#Data Inserting

insert into customer(Customer_Id,F_name,L_name,Email,Tel_Number)
values
('CI1001','Alison','Hill','alison@gmail.com',00947911111),
('CI1002','Connor','Ross','Conner2@gmail.com',00947911112),
('CI1003','Dheva','Smith','Dhava43@gmail.com',00947911113),
('CI1004','Ruth','Howard','ruthho@gmail.com',00947911114),
('CI1005','Kevin','Lee','Lee25@gmail.com',00947911115),
('CI1006','Ahmad','Khan','akhan89@gmail.com',00947911116);



insert into supplier(Supplier_Id,Name,Tel_Number,Email ,Street_address,City ,Province,Postal_code,country)
values
('SI1001','Simon Martin	',009479111001,'simon12@gmail.com','354, Main Street','Kalmunai','Eastern Province',32312,'Sri lanka'),
('SI1002','Atlas',009479111002 ,'atlas@gmail.com','96, Parakrama Road','Colombo','Western Province',11830,'Sri lanka'),
('SI1003','Araliya',009479111003,'araliya@gmail.com','177/A , Dehianga , Muruthalawa','Kandy','Central Province',20003,'Sri lanka'),
('SI1004','Ryan Smith',009479111004,'rayan58@gmail.com','25, Hill Street','Batticalo','Eastern Province',30450,'Sri lanka'),
('SI1005','Rathna',009479111005,'rathna@gmail.com','86/B, Galle Road','Colombo','Western Province',11831,'Sri lanka'),
('SI1006','Promate',009479111006,'promate@gmail.com','55 , Lax Street','Colombo','Western Province',11832,'Sri lanka'),
('SI1007','Watson Brown',009479111007,'wastson46@gmail.com','257 , Upper Lake Road','Nuwaraeliya','Central Province',20000,'Sri lanka'),
('SI1008','Megan Carr',009479111008,'meg689@gmail.com','65, Alaveddy Road','Jaffna','Northern Province',40012,'Sri lanka'),
('SI1009','Oliver Blake',009479111009,'oliver6@gmail.com','647, Crips Road','Galle','Southern Province',80280,'Sri lanka'),
('SI1010','Thomas Ellison',009479111010,'thomas72@gmail.com','54,Bambarell Road','Kandy','Central Province',20000,'Sri lanka');


insert into bank_payment(Bank_Pay_Id,Amount,Paid_date,Paid_time,reference_No,Ac_Number,Bank_name,Brach_name)
values
('BP1001','2000.00','2023-02-24','13:56:00','12341114','13894758','Sampath','Colombo'),
('BP1002','450.00','2023-04-09','16:54:00','12341113','12893546','Bank Of Ceylon','Kandy'),
('BP1003','6000.00','2023-06-09','10:16:00','12341115','12698457',',Comercial Bank','Kalmunai'),
('BP1004','600.00','2023-07-06','13:56:00','12341112','14896591','Comercial Bank','Jaffna'),
('BP1005','2500.00','2023-10-06','10:45:00','12341111','14896543','Bank Of Ceylon','Colombo');


insert into online_payment(Online_Pay_Id,Amount,Paid_date,Paid_time,Transition_Id)
values
('OP1001','500.00','2023-03-12','13:26:00','216542131'),
('OP1002','8000.00','2023-07-06','09:45:00','894522131'),
('OP1003','4000.00','2023-08-10','12:23:00','456512389'),
('OP1004','600.00','2023-09-23','14:58:00','291213564'),
('OP1005','3500.00','2023-10-12','10:23:00','858644313');


insert into delivery(Delivery_Id,Reciver_Fname,Reciver_Lname,Contact_No,Street_address,City,Province,Postal_code,Country,Delivery_Date)
values
('DI1001','Alison','Hill',00947911111,'31, Nalloor','Jaffna','Northern Province',40012,'Sri Lanka','2023-03-10'),
('DI1002','Liam','Brown',00947911122,'289, Ravikirana Street','Kandy','Central Province',20023,'Sri Lanka','2023-03-22'),
('DI1003','Dheva','Smith',00947911113,'67, Main Street','Batticalo','Eastern Province',30365,'Sri Lanka','2023-04-19'),
('DI1004','Noah','Williams',00947911313,'15, Hill Street','Colombo','Western Province',11830,'Sri Lanka','2023-06-19'),
('DI1005','Connor','Ross',00947911112,'65, Eliot Road','Galle','Sothern Province',80032,'Sri Lanka','2023-07-16'),
('DI1006','Dheva','Smith',00947911113,'67, Main Street','Batticalo','Eastern Province',30365,'Sri Lanka','2023-07-17'),
('DI1007','Kevin','Lee',00947911115,'655, Main Street','Jaffna','Northern Province',40013,'Sri Lanka','2023-08-21'),
('DI1008','Alison','Hill',00947911111,'31, Nalloor','Jaffna','Northern Province',40012,'Sri Lanka','2023-10-06'),
('DI1009','Ahmad','Khan',00947911116,'258, Zahira Road','Kalmunai','Eastern Province',32312,'Sri Lanka','2023-10-18'),
('DI1010','Ruth','Howard',00947911114,'64, main street','Maruthamunai','Eastern Province',32314,'Sri Lanka','2023-10-30');


insert into order_table(Order_Id,Order_date,Customer_Id,Bank_Pay_Id,Online_Pay_Id,Delivery_Id)
values
('OI1001','2023-02-24','CI1001','BP1001',null,'DI1001'),
('OI1002','2023-03-12','CI1004',null,'OP1001','DI1002'),
('OI1003','2023-04-09','CI1003','BP1002',null,'DI1003'),
('OI1004','2023-06-09','CI1006','BP1003',null,'DI1004'),
('OI1005','2023-07-06','CI1005','BP1004',null,'DI1005'),
('OI1006','2023-07-06','CI1003',null,'OP1002','DI1006'),
('OI1007','2023-08-10','CI1005',null,'OP1003','DI1007'),
('OI1008','2023-09-23','CI1001',null,'OP1004','DI1008'),
('OI1009','2023-10-06','CI1006','BP1005',null,'DI1009'),
('OI1010','2023-10-12','CI1004',null,'OP1005','DI1010');


insert into item (Item_code,Price,Stock_level,Reorder_level,Supplier_Id)
values
('IC1001',2000,10,20,'SI1001'),
('IC1002',6000,	6,32,'SI1004'),
('IC1003',8000,15,5,'SI1007'),
('IC1004',2500,40,10,'SI1008'),
('IC1005',1900,22,20,'SI1009'),
('IC1006',3000,3,20,'SI1010'),
('IC1007',40,200,100,'SI1002'),
('IC1008',50,150,100,'SI1003'),
('IC1009',30,180,180,'SI1005'),
('IC1010',20,150,60,'SI1006'),
('IC1011',150,50,20,'SI1003'),
('IC1012',300,60,100,'SI1002'),
('IC1013',3500,60,0,'SI1001'),
('IC1014',4000,25,5,'SI1010'),
('IC1015',6000,40,5,'SI1008'),
('IC1016',3500,10,20,'SI1004'),
('IC1017',4500,28,30,'SI1007'),
('IC1018',2000,10,0,'SI1001');


insert into book_item(Item_code,ISBN,Title,Genre,Category,Author,Publisher,Year_of_Publication)
values
('IC1001','978-9-012345-67-8','Educated','Memoir','Non-Fiction','Tara Westover','Random House',2018),
('IC1002','978-7-890123-45-6','The Power of Habit: Why We Do What We Do in Life and Business','Self-Help','Non-Fiction','Charles Duhigg','Random House',2012),
('IC1003','978-8-901234-56-7','Sapiens: A Brief History of Humankind','History','Non-Fiction','Yuval Noah Harari','HarperCollins',2014),
('IC1004','978-5-678901-23-4','The Art of Serenity','Self-Help','Non-Fiction','Grace Tranquil','Zen Publications',2020),
('IC1005','978-6-789012-34-5','In the Shadows of Time','Historical Fiction','Fiction','Benjamin Tempus','Timeless Books',2018),
('IC1006','978-2-345678-90-1','Echoes of Eternity','Fantasy','Fiction','Alexander Wells','Mythical Books',2022),
('IC1013','978-1-234567-89-0','Whispers in the Wind','Mystery','Fiction','Emily Harper','Enigma Press',2021),
('IC1014','978-1-292455-61-7','Modern Database Management','Educational','Database','Jeffrey A. Hoffer','Pearson',2023),
('IC1015','978-1-292097-61-9','Fundamentals of Database Systems Global Edition, 7th edition','Educatonal','Database','Ramez Elmasri','Pearson',2016),
('IC1016','978-1-292436-36-4','Database Systems: A Practical Approach to Design, Implementation, and Management','Educatonal','Database','Thomas Connolly','Pearson',2023),
('IC1017','978-1-4842-9710-0','Database Performance at Scale','Educational','Database','Felipe Cardeneti Mendes','Springer',2019),
('IC1018',' 978-0-136-8620-8','Fundamentals of Database Systems Global Edition, 6th edition','Educatonal','Database','Ramez Elmasri','Pearson',2011);

insert into stationary_item (Item_code,Product_type,Brand)
values
('IC1007','Ball Pen','Atlas'),
('IC1008','Ink Pen','Araliya'),
('IC1009','Pencils','Rathna'),
('IC1010','Erasers','Promate'),
('IC1011','Sticky Notes','Araliya'),
('IC1012','Notebook','Atlas');


insert into order_item(Order_Id,Item_code,Quantity)
values
('OI1001','IC1001',1),
('OI1002','IC1008',10),
('OI1003','IC1009',15),
('OI1004','IC1002',1),
('OI1005','IC1010',30),
('OI1006','IC1003',1),
('OI1007','IC1001',2),
('OI1008','IC1011',4),
('OI1009','IC1004',1),
('OI1010','IC1013',1);


#section 4
#Part a

select Isbn,Title,Category,Author
from book_item
where 
Category = 'DataBase' and 
(
	Publisher='pearson' or 
	Publisher='Springer' or 
	Author='Ramez Elmasri'
);


#part B

select concat(F_name,' ',L_name) as 'Full Name',Email,Tel_Number ,count(order_id) as 'Totel orders' 
from Customer as C right outer join order_table as O
on C.Customer_Id= o.Customer_Id 
where (o.Order_date >= date_sub(current_date(), interval 6 month)) 
group by o.Customer_Id
having count(order_id)>=2;
