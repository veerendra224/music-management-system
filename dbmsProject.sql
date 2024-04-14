-- Create database
create database musicDB;
use musicDB;

-- Create Album table
create table Album (
    Album_id int primary key not null,
    Album_title Varchar(20) not null,
    Album_price int,
    release_date date
);

-- Create Artist table
create table Artist (
    Artist_id int primary key not null,
    Artist_name Varchar(20) not null,
    Debut_date date
);

-- Create Song table
create table Song (
    Song_id int primary key not null,
    Song_title Varchar(20) not null,
    play_time int not null,
    Album_id int,
    Artist_id int,
    foreign key (Album_id) REFERENCES Album(Album_id),
	foreign key (Artist_id) REFERENCES Artist(Artist_id)
);

 -- Create Genre table
create table Genre (
    genre_id int primary key not null,
    genre_name Varchar(20) not null
);

-- Create Belongs table
create table Belongs (
    genre_id int,
    Song_id int,
    foreign key (genre_id) REFERENCES Genre(genre_id),
	foreign key (Song_id) REFERENCES Song(Song_id)
);

-- Create Customer table
create table Customer (
    Customer_id int primary key not null,
    Customer_name Varchar(20) not null,
    Birthday date,
    Phone_Number Varchar(20) check(length(Phone_Number)=10),
    postal_code int
);

ALTER TABLE Customer ADD INDEX idx_postal_code (postal_code);

-- Create Address table
create table Address (
    postal_code int primary key,
    city Varchar(20) not null,
    FOREIGN KEY (postal_code) REFERENCES Customer(postal_code)
);

-- Create Purchases table
create table Purchases (
    Album_id int,
    Customer_id int,
    quantitiesOrdered int,
    foreign key (Album_id) REFERENCES Album(Album_id),
	foreign key (Customer_id) REFERENCES Customer(Customer_id)
);

-- Create Orders table
create table Orders (
    Order_id int primary key not null,
    Order_date date,
    payment_method Varchar(20),
    total_price int,
    Customer_id int,
	foreign key (Customer_id) REFERENCES Customer(Customer_id)
);

-- Insert into Album table
insert into Album (Album_id,Album_title,Album_price,release_date) values(7701,"MELODY_HITS",500,"2002-05-20"),
																		(7823,"AR_RAHMAN_HITS",1500,"2013-06-10"),
																		(7093,"PAWAN_KALYAN_HITS", 25000, "2019-11-13"),
																		(7983, "THAMAN_HITS",400, "2005-08-11"),
																		(7121, "DSP_HITS" ,1500 ,"2008-07-07"),
																		(7345, "MAD_HIT_SONGS", 2000,"2020-12-08");

-- Insert into Artist table                                                                        
insert into Artist (Artist_id,Artist_name,Debut_date) values(8769,"BALASUBRAMANYAM","1981-05-20"),
															(8469,"AR_RAHMAN","1982-06-10"),
															(8596,"ANIRUDH","1981-11-13"),
															(8367, "THAMAN","1982-08-11"),
															(8473, "DSP","1982-07-07"),
															(8639, "BHEEM","1981-12-08");

-- Insert into Song table
insert into Song (Song_id,Song_title,play_time,Album_id,Artist_id)values(9769,"BALAPAMPATTI",189,7701,8769),
																		(9469,"AGAR_TUM_SATH_HO",256,7823, 8469),
																		(9596,"WHY_THIS_KOLEVERI", 90, 7093, 8596),
																		(9367, "AKANDA",110,7983, 8367),
																		(9473, "OH_MADHU" ,153,7121, 8473),
																		(9639, "SWATHI_REDDY",152,7345, 8639);

-- Insert into Genre table
insert into Genre (genre_id,genre_name) values(1769,"MELODY"),
											  (1469,"ROMANTIC"),
											  (1596,"RAP"),
											  (1367, "MIX"),
											  (1473, "MASS"),
											  (1639, "JUST_FEEL");

-- Insert into Belongs table
insert into Belongs (genre_id,Song_id) values(1769,9769),
											 (1469,9469),
											 (1596,9596),
											 (1367,9367),
											 (1473,9473),
											 (1639,9639);

-- Insert into Customer table
insert into Customer (Customer_id,Customer_name,Birthday,Phone_Number,postal_code)values(3769,"MADHAVAN","2004-03-21","4567890123",534101),
																						(3469,"VEERENDRA","2005-04-07","5678901234",533342),
																						(3596,"ISSAC", "2004-08-01","7890123456",502355),
																						(3367, "TEJA","2003-09-07","8901234567",532201),
																						(3473, "SRINIVAS","1986-09-25" ,"9012345678",531001),
																						(3639, "CHANDU","1999-10-17","3456789012",535001);    
                       
-- Insert into Address table
insert into Address (postal_code,city)values(534101,"TADEPALLIGUDEM"),
											(533342,"ANAPARTHI"),
											(502355,"VIJAYAWADA"),
											(532201, "TEKKALI"),
											(531001, "ANAKAPALLI"),
											(535001, "VIZIANAGARAM");

-- Insert into Purchases table
insert into Purchases (Album_id,Customer_id,quantitiesOrdered)values(7701,3769,5),
																	(7823,3469,2),
																	(7093,3596,0),
																	(7983,3367,6),
																	(7121,3473,10),
																	(7345,3639,6);

-- Insert into Orders table
insert into Orders (Order_id,Order_date,payment_method,total_price,Customer_id)values(4769,"2023-09-08","COD",2500,3769),
																					 (4469,"2024-01-02","UPI",500, 3469),
																					 (4596,"2020-07-15", "COD", 1032, 3596),
																					 (4367, "2021-09-09","RUPAY",561, 3367),
																					 (4473, "2022-10-09" ,"RUPAY",861, 3473),
																					 (4639, "2023-01-10","UPI",259, 3639);
                                                                                     
select * from Album;
select * from Song;
select * from Artist;
select * from Genre;
select * from Belongs;
select * from Customer;
select * from Address;
select * from Orders;
select * from Purchases;