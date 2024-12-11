create database Revision;
use Revision;

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- BASIC -> CREATING AND ALTERING TABLE
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

create table practice(
serial_no int,
Lang varchar(20),
Name varchar(30) );

ALTER TABLE practice ADD column user_Id int;

select * from practice;

ALTER table practice ADD column proficientIn varchar(50);
ALTER table practice ADD column sourceOfInterest varchar(40);

ALTER TABLE practice
ADD temp_col VARCHAR(25),
ADD extra_col INT;

-- //altering datatype of a column//
ALTER TABLE practice CHANGE extra_col EXTRA_COLUMN varchar(20);

-- //make an existing column a Primary Key after creating a table using the ALTER TABLE statement.
ALTER table practice Add PRIMARY KEY (serial_no);
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- INSERTING INTO TABLE
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Insert into practice (serial_no,Lang,Name,proficientIn,sourceOfInterest,temp_col,extra_col) values
(1,'Java','Ravari','SQL','BackEnd','Temporaru Data',1);

INSERT INTO practice
VALUES (2, 'Python', 'kausiki',101, 'SQL', 'Development', 'NotTemporary', 2);

select * from practice;

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- UPDATING INTO TABLE
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

update practice SET temp_col='NotTemproary' where serial_no=1;

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DELETING FROM A TABLE
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

DELETE FROM practice where serial_no=2;