-- +++++++++++++++++++++++++++++++++++++++++++++ CREATE AND USE DATABASE++++++++++++++++++++++++
create database Learning;
use Learning;

-- +++++++++++++++++++++++++++++++++++Create Tables+++++++++++++++++++++++++++++++++++

create table BookRooms(
room_id int,
room_type VARCHAR(20),
attached_balcony VARCHAR(10) CHECK(attached_balcony In ('Y','N')),
firstName varchar(50) NOT NULL,
lastName varchar(40) NOT NULL,
Gender varchar(10) CHECK(Gender In('M','F'))
);

create table Address(
addressId VARCHAR(13),
Street varchar(30),
city varchar(30),
zipcode INT,
state_province varchar(30),
country varchar(50)
);

create table hotel(
hotel_id int PRIMARY KEY,
hotel_name  VARCHAR(40),
hotel_rating Int,
chargePerRoom FLOAT4,
number_of_staffs INT
);

CREATE INDEX idx_room_id ON BookRooms(room_id);
CREATE INDEX idx_address_id ON Address(addressId);

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ADDING DATA IN TABLES
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Insert into BookRooms (room_id,room_type,attached_balcony,firstName,lastName,Gender) values
(1,'single','Y','Aditya','Sharma','M');
Insert into BookRooms values(2,'double','N','Akansha','Tiwari','F');
Insert into BookRooms values(3,'single','Y','Sumit','khanna','M'),
(4,'double','Y','Kaveri','Patirdaar','F');

Insert into Address (addressId,Street,city,zipcode,state_province,country) values ('11A','xyz-uhd','Rewa',123343,'MP','INDIA');
Insert into Address values('11B','asfs-ghdf','Bhopal',235743,'MP','INDIA');
Insert into Address values('12A','sgddj-udfhfd','Indore',4537434,'MP','INDIA'),
('13A','fghdshddshj-iodi','Jabalpur',984784,'MP','INDIA');


Insert into Hotel (hotel_id,hotel_name,hotel_rating,chargePerRoom,number_of_staffs) values (101,'Radison',3,4890.00,14);
Insert into Hotel values(102,'The Fern',4,89078.098,13);
Insert into Hotel VALUES (103,'Saya Jii',4,9087.90,89),
(104,'Marriot',5,6754.90,45);


-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ALTERING TABLE BY ADDING FOREIGN KEY COLUMN
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ALTER TABLE BookRooms  ADD PRIMARY KEY (room_id);
ALTER Table Address ADD PRIMARY KEY(addressId);

ALTER TABLE BookRooms MODIFY room_type VARCHAR(20) NOT NULL;
ALTER TABLE Address Change zipcode  PostalCode INT;

ALTER TABLE hotel ADD COLUMN room_id int;
Alter table BookRooms ADD Column addressId varchar(13);


ALTER table hotel change room_id fk_room_id int;
Alter table BookRooms ADD COLUMN fk_addressId varchar(13);

ALTER TABLE hotel ADD CONSTRAINT room_id FOREIGN KEY (fk_room_id) REFERENCES BookRooms (room_id);
ALTER TABLE BookRooms ADD CONSTRAINT addressId FOREIGN KEY (fk_addressId) REFERENCES Address (addressId);

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- UPDATING EXISTING DATA IN TABLE -> Basic and intermediate
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

UPDATE  hotel set number_of_staffs = 29 where hotel_id = 101;
Update hotel set hotel_name='The Radison',hotel_rating=4 where hotel_id=101;

Update hotel
Set number_of_staffs=CASE
 WHEN hotel_id=101 THEN number_of_staffs*10
WHEN hotel_id BETWEEN 102 and 104 THEN number_of_staffs*5
ELSE number_of_staffs * 2
END
Where hotel_rating = 3;

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

DESCRIBE Address;
DROP table Address;
DESCRIBE BookRooms;




