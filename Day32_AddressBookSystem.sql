#UC1
create database Addressbook_System;
USE Addressbook_System;
SELECT DATABASE();

#UC2
CREATE TABLE address_book (
 first_name VARCHAR(150) NOT NULL,
 last_name 	VARCHAR(150) NOT NULL,
 address 	VARCHAR(250) NOT NULL,
 city 		VARCHAR(150) NOT NULL,
 state 		VARCHAR(150) NOT NULL,
 zip 		INT unsigned NOT NULL,
 phone 		BIGINT  NOT NULL,
 email 		VARCHAR(250) NOT NULL,
 PRIMARY KEY (first_name)
);

DESCRIBE address_book;

#UC3
INSERT INTO address_book VALUES  		
( 'Sippora', 'Toppo', '101 Abc', 'Ranchi', 'Jharkhand', 834004, 9876543219, 'abc.xyz@gmail.com' ),
( 'Ritu', 'Minz', '102 Abc', 'Ahemdabad','Gujarat', 110022, 9988776655, 'ritu123@gmail.com'),
( 'Toshita', 'Chaudhari', '103 Pqr', 'Mumbai', 'Maharashtra', 400706, 7143298723, 'ativDavid@gmail.com');

select * from address_book;

#UC4
UPDATE address_book SET zip = 834008 WHERE first_name = 'Sippora';
select * from address_book;

#UC5
DELETE FROM address_book WHERE first_name = 'Ritu';
select * from address_book;

#UC6
SELECT * FROM address_book WHERE city = 'Mumbai';
SELECT * FROM address_book WHERE state = 'Jharkhand';

#UC7
SELECT city, COUNT(city) FROM address_book GROUP BY city;
SELECT state, COUNT(state) FROM address_book GROUP BY state; 

#UC8
SELECT * FROM address_book WHERE city = 'Ranchi' ORDER BY first_name; 

#UC9
ALTER TABLE address_book ADD address_book_name VARCHAR(50) AFTER email;
ALTER TABLE address_book ADD address_book_type VARCHAR(50) AFTER address_book_name;
UPDATE address_book SET address_book_name='Anne Frank' WHERE first_name = 'Sippora';
UPDATE address_book SET address_book_type='Family' WHERE first_name = 'Sippora';
UPDATE address_book SET address_book_name='AddressBook 2020' WHERE first_name = 'Ativ';
UPDATE address_book SET address_book_type='Teacher' WHERE first_name = 'Toshita

#UC10
SELECT address_book_type, count(*) FROM address_book GROUP BY address_book_type;

#UC11
INSERT INTO address_book VALUES
('Surabhi', 'Thankur', '107 SHS Colony', 'Pen','MH', 443301, 7877452002, 'surabhi21@gmail.com','Addrress Book 2019','Family'),
('Suyog', 'Gabhane', '108 Anand Nagar', 'Bhopal','MP', 100101, 9171180256, 'gabhane123@gmail.com','Addrress Book 2020','Friend');

SELECT * FROM address_book;

#UC12
CREATE TABLE user_details( 
 user_id     INT            NOT NULL,
 first_name  VARCHAR(150)   NOT NULL,
 last_name   VARCHAR(150)   NOT NULL,
 PRIMARY KEY   (user_id)
);

CREATE TABLE location (
 user_id     INT    NOT NULL,
 address     VARCHAR(250) NOT NULL,
 city        VARCHAR(150) NOT NULL,
 state       VARCHAR(150)  NOT NULL,
 zip         INT           NOT NULL,
 PRIMARY KEY(user_id),
 FOREIGN KEY(user_id)  REFERENCES user_details(user_id)
); 

CREATE TABLE Contact(
 user_id INT,
 phone 	BIGINT,
 email 	VARCHAR(250),
 FOREIGN KEY(user_id)  REFERENCES user_details(user_id)
);

CREATE TABLE Contact_type(
 type_id INT,
 type_of_contact VARCHAR(150),
 PRIMARY KEY (type_id)
);

CREATE TABLE user_contact_type(
 user_id INT,
 type_id INT,
 FOREIGN KEY(user_id) REFERENCES user_details(user_id),
 FOREIGN KEY(type_id) REFERENCES Contact_type(type_id)
);
INSERT INTO user_details VALUES
(1, 'Sippora', 'Toppo'),
(2, 'Sanvita', 'Chaudhary'),
(3, 'Bhavya', 'Saproo');


INSERT INTO location VALUES
(1,'402Street', 'Mumbai', 'MH', '400706'),
(2,'AlbertRoad', 'Ranchi','JHK', '110201'),
(3,'1A GC', 'Bhopal', 'MP', '230601');

INSERT INTO Contact VALUES 
(1,'9988001101', 'abc.xyz@gmail.com'),
(2,'9112381809', 'abc12@gmail.com'),
(3,'7766871930', 'xyz123@gmail.com');

INSERT INTO Contact_type VALUES
(100,'Friends'),
(101,'Family');

INSERT INTO user_contact_type_link VALUES
(1,100),
(1,101),
(2,100),
(3,101);

#UC13
SELECT  * FROM  (user_details INNER JOIN location ON user_details.user_id = location.user_id) where city = 'Mumbai' or  state = 'MP';
SELECT first_name, count(user_details.user_id) FROM user_details INNER JOIN location ON user_details.user_id = location.user_id where city = 'Bhopal' or state= 'JHK';
SELECT * FROM user_details INNER JOIN location ON user_details.user_id=location.user_id WHERE city = 'Ranchi' ORDER BY first_name; 