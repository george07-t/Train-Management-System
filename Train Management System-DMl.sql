--drop table

drop table payment; 
drop table tickets;
drop table class;
drop table route;
drop table train;
drop table users;

--set screen

set linesize 150
set pagesize 100

--Table create

create table users(
NID number(20) not null,
age number(5),
DOB date,
username varchar(20) not null,
name varchar(20),
address varchar(30),
primary key(NID),
CONSTRAINT positive_NID CHECK (NID >= 0)
);

create table train (
train_id number(20) not null,
train_name varchar(20) not null,
dep_time varchar(20),
seats number(10) not null,
destination varchar(20) not null,
source varchar(20) not null,
av_time varchar(20),
CONSTRAINT positive_train_id CHECK (train_id >= 0),
primary key(train_id)
);


create table class (
class_type varchar(10) not null,
fare number(20) not null,
train_id number(20) not null,
foreign key(train_id) references train(train_id) on delete cascade
);

create table route(
stop_no number(10) not null,
stop_name varchar(20) not null,
train_id number(20) not null,
CONSTRAINT positive_stop_no CHECK (stop_no >= 0),
primary key(stop_no),
foreign key(train_id) references train(train_id) on delete cascade
);

create table tickets(
ticket_num number(20) not null,
train_num number(20) not null,
j_date date not null,
passenger_name varchar(20),
class varchar(10) not null,
source varchar(20) not null,
destnation varchar(20) not null,
seat_no number(10) not null,
NID number(20) not null,
primary key(ticket_num),
CONSTRAINT positive_num CHECK (ticket_num >= 0),
foreign key(NID) references users(NID) on delete set null,
foreign key(train_num) references train(train_id) on delete set null
);

create table payment (
ticket_num number(20),
card_num number(20),
bank varchar(20),
ammount number(20),
transaction_id number(10),
CONSTRAINT positive_id CHECK (transaction_id >= 0),
primary key(transaction_id),
foreign key(ticket_num) references tickets(ticket_num) on delete cascade
);



--SHOW TABLE DESCRIPTION

select table_name from user_tables;

DESCRIBE users;
DESCRIBE train;
DESCRIBE class;
DESCRIBE route;
DESCRIBE tickets;
DESCRIBE payment;
--Inset into table



--USERS TABLE

INSERT INTO users (NID, age, DOB, username, name, address) VALUES (1907114, 22, TO_DATE('2001-07-29', 'YYYY-MM-DD'), 'gtr', 'george', 'Barishal');
INSERT INTO users (NID, age, DOB, username, name, address) VALUES (1907115, 28, TO_DATE('1995-02-10', 'YYYY-MM-DD'), 'rahim123', 'Rahim', 'Dhaka');
INSERT INTO users (NID, age, DOB, username, name, address) VALUES (1907116, 32, TO_DATE('1989-09-15', 'YYYY-MM-DD'), 'karim123', 'Karim', 'Rajshahi');
INSERT INTO users (NID, age, DOB, username, name, address) VALUES (1907117, 25, TO_DATE('1998-07-12', 'YYYY-MM-DD'), 'sami123', 'Sami', 'Sylhet');
INSERT INTO users (NID, age, DOB, username, name, address) VALUES (1907118, 30, TO_DATE('1992-03-20', 'YYYY-MM-DD'), 'raha123', 'Raha', 'Rangpur');
INSERT INTO users (NID, age, DOB, username, name, address) VALUES (1907119, 25, TO_DATE('1996-08-10', 'YYYY-MM-DD'), 'samir123', 'Samir', 'Dhaka');
INSERT INTO users (NID, age, DOB, username, name, address) VALUES (1907120, 35, TO_DATE('1986-12-05', 'YYYY-MM-DD'), 'rabbi123', 'Rabbi', 'Vola');
INSERT INTO users (NID, age, DOB, username, name, address) VALUES (1907121, 28, TO_DATE('1993-07-15', 'YYYY-MM-DD'), 'alex123', 'Alex', 'Chittagong');
INSERT INTO users (NID, age, DOB, username, name, address) VALUES (1907122, 32, TO_DATE('1989-11-02', 'YYYY-MM-DD'), 'lisa123', 'Lisa', 'Dhaka');
INSERT INTO users (NID, age, DOB, username, name, address) VALUES (1907123, 29, TO_DATE('1994-04-25', 'YYYY-MM-DD'), 'doinel123', 'Doniel', 'Tripura');



--TRAIN TABLE

INSERT INTO train (train_id, train_name, dep_time, seats, destination, source, av_time) VALUES (07, 'Sundarban Express','13:00:00', 20, 'dhaka', 'khulna', '20:00:00');
INSERT INTO train (train_id, train_name, dep_time, seats, destination, source, av_time) VALUES (13, 'Bangladesh Express', '10:00:00', 50, 'Chittagong', 'Dhaka', '18:00:00');
INSERT INTO train (train_id, train_name, dep_time, seats, destination, source, av_time) VALUES (14, 'Rajshahi Express', '08:30:00', 40, 'Rajshahi', 'Dhaka', '15:00:00');
INSERT INTO train (train_id, train_name, dep_time, seats, destination, source, av_time) VALUES (15, 'Dhaka Express', '09:00:00', 40, 'Dhaka', 'Sylhet', '15:30:00');
INSERT INTO train (train_id, train_name, dep_time, seats, destination, source, av_time) VALUES (16, 'Kirtonkhola Express', '11:30:00', 60, 'Barishal', 'Dhaka', '20:00:00');
INSERT INTO train (train_id, train_name, dep_time, seats, destination, source, av_time) VALUES (17, 'Jamuna Express', '12:15:00', 70, 'Sylhet', 'Dhaka', '21:30:00');
INSERT INTO train (train_id, train_name, dep_time, seats, destination, source, av_time) VALUES (18, 'Padma Express', '10:45:00', 50, 'Rajshahi', 'Chittagong', '18:20:00');
INSERT INTO train (train_id, train_name, dep_time, seats, destination, source, av_time) VALUES (19, 'Parabat Express', '08:30:00', 60, 'Sylhet', 'Dhaka', '17:15:00');
INSERT INTO train (train_id, train_name, dep_time, seats, destination, source, av_time) VALUES (20, 'Dhumketu Express', '06:45:00', 80, 'Rajshahi', 'Dhaka', '14:50:00');
INSERT INTO train (train_id, train_name, dep_time, seats, destination, source, av_time) VALUES (21, 'Chattala Express', '09:20:00', 30, 'Chittagong', 'Dhaka', '16:40:00');



--CLASS TABLE

INSERT INTO class (class_type, fare, train_id) VALUES('ka', 500, 07);
INSERT INTO class (class_type, fare, train_id) VALUES ('kha', 1500, 13);
INSERT INTO class (class_type, fare, train_id) VALUES ('ga', 800, 14);
INSERT INTO class (class_type, fare, train_id) VALUES ('gha', 1200, 15);
INSERT INTO class (class_type, fare, train_id) VALUES ('uma', 1800, 16);
INSERT INTO class (class_type, fare, train_id) VALUES ('ka', 500, 13);
INSERT INTO class (class_type, fare, train_id) VALUES ('ga', 800, 19);
INSERT INTO class (class_type, fare, train_id) VALUES ('kha', 1500, 20);
INSERT INTO class (class_type, fare, train_id) VALUES ('uma', 1800, 21);
INSERT INTO class (class_type, fare, train_id) VALUES ('gha', 1200, 18);



--ROUTRE TABLE

INSERT INTO route (stop_no, stop_name, train_id) VALUES (5, 'jossore', 07);
INSERT INTO route (stop_no, stop_name, train_id) VALUES (1, 'Comilla', 13);
INSERT INTO route (stop_no, stop_name, train_id) VALUES (2, 'Natore', 14);
INSERT INTO route (stop_no, stop_name, train_id) VALUES (3, 'Hobigonj', 15);
INSERT INTO route (stop_no, stop_name, train_id) VALUES (4, 'Vanga', 16);
INSERT INTO route (stop_no, stop_name, train_id) VALUES (10, 'Chandpur', 17);
INSERT INTO route (stop_no, stop_name, train_id) VALUES (6, 'Laxmipur', 18);
INSERT INTO route (stop_no, stop_name, train_id) VALUES (7, 'Feni', 19);
INSERT INTO route (stop_no, stop_name, train_id) VALUES (8, 'Comilla', 20);
INSERT INTO route (stop_no, stop_name, train_id) VALUES (9, 'Dhaka', 21);



--TICKETS TABLE

INSERT INTO tickets (ticket_num, train_num, j_date, passenger_name, class, source, destnation, seat_no,NID)
SELECT 1907,t.train_id,TO_DATE('2023-05-20','YYYY-MM-DD'),'george', c.class_type,t.source,t.destination,18,1907114
FROM train t
JOIN class c ON t.train_id = c.train_id
JOIN users u ON u.username = 'gtr'
WHERE t.train_id =07 AND c.class_type = 'ka';

INSERT INTO tickets (ticket_num, train_num, j_date, passenger_name, class, source, destnation, seat_no, NID)
SELECT 2001, t.train_id, TO_DATE('2023-05-20', 'YYYY-MM-DD'), 'Rahim', c.class_type, t.source, t.destination, 5, u.NID
FROM train t
JOIN class c ON t.train_id = c.train_id
JOIN users u ON u.username = 'rahim123'
WHERE t.train_id = 13 AND c.class_type = 'kha';

INSERT INTO tickets (ticket_num, train_num, j_date, passenger_name, class, source, destnation, seat_no, NID)
SELECT 2002, t.train_id, TO_DATE('2023-06-10', 'YYYY-MM-DD'), 'Karim', c.class_type, t.source, t.destination, 12, u.NID
FROM train t
JOIN class c ON t.train_id = c.train_id
JOIN users u ON u.username = 'karim123'
WHERE t.train_id = 14 AND c.class_type = 'ga';

INSERT INTO tickets (ticket_num, train_num, j_date, passenger_name, class, source, destnation, seat_no, NID)
SELECT 2003, t.train_id, TO_DATE('2023-07-05', 'YYYY-MM-DD'), 'Sami', c.class_type, t.source, t.destination, 7, u.NID
FROM train t
JOIN class c ON t.train_id = c.train_id
JOIN users u ON u.username = 'sami123'
WHERE t.train_id = 15 AND c.class_type = 'gha';

INSERT INTO tickets (ticket_num, train_num, j_date, passenger_name, class, source, destnation, seat_no, NID)
SELECT 2004, t.train_id, TO_DATE('2023-08-15', 'YYYY-MM-DD'), 'Raha', c.class_type, t.source, t.destination, 15, u.NID
FROM train t
JOIN class c ON t.train_id = c.train_id
JOIN users u ON u.username = 'raha123' 
WHERE t.train_id = 16 AND c.class_type = 'uma';

INSERT INTO tickets (ticket_num, train_num, j_date, passenger_name, class, source, destnation, seat_no, NID)
SELECT 2005, t.train_id, TO_DATE('2023-08-15', 'YYYY-MM-DD'), 'Raha', c.class_type, t.source, t.destination, 16, u.NID
FROM train t
JOIN class c ON t.train_id = c.train_id
JOIN users u ON u.username = 'raha123' 
WHERE t.train_id = 19 AND c.class_type = 'ga';

INSERT INTO tickets (ticket_num, train_num, j_date, passenger_name, class, source, destnation, seat_no, NID)
SELECT 2006, t.train_id, TO_DATE('2023-08-15', 'YYYY-MM-DD'), 'Lisa', c.class_type, t.source, t.destination, 17, u.NID
FROM train t
JOIN class c ON t.train_id = c.train_id
JOIN users u ON u.username = 'lisa123' 
WHERE t.train_id = 21 AND c.class_type = 'uma';

INSERT INTO tickets (ticket_num, train_num, j_date, passenger_name, class, source, destnation, seat_no, NID)
SELECT 2007, t.train_id, TO_DATE('2023-08-15', 'YYYY-MM-DD'), 'Doniel', c.class_type, t.source, t.destination, 18, u.NID
FROM train t
JOIN class c ON t.train_id = c.train_id
JOIN users u ON u.username = 'doinel123'
WHERE t.train_id = 20 AND c.class_type = 'kha';

INSERT INTO tickets (ticket_num, train_num, j_date, passenger_name, class, source, destnation, seat_no, NID)
SELECT 2008, t.train_id, TO_DATE('2023-08-15', 'YYYY-MM-DD'), 'Rabbi', c.class_type, t.source, t.destination, 19, u.NID
FROM train t
JOIN class c ON t.train_id = c.train_id
JOIN users u ON u.username = 'rabbi123' 
WHERE t.train_id = 18 AND c.class_type = 'gha';

INSERT INTO tickets (ticket_num, train_num, j_date, passenger_name, class, source, destnation, seat_no, NID)
SELECT 2009, t.train_id, TO_DATE('2023-08-15', 'YYYY-MM-DD'), 'Samir', c.class_type, t.source, t.destination, 20, u.NID
FROM train t
JOIN class c ON t.train_id = c.train_id
JOIN users u ON u.username = 'samir123' 
WHERE t.train_id = 16 AND c.class_type = 'uma';



--PAYMENT TABLLE

INSERT INTO payment (ticket_num, card_num, bank, ammount, transaction_id) VALUES (1907, 423450543, 'JANATA Bank', 500, 7110);
INSERT INTO payment (ticket_num, card_num, bank, ammount, transaction_id) VALUES (2001, 123456789, 'UCB Bank', 1500, 1001);
INSERT INTO payment (ticket_num, card_num, bank, ammount, transaction_id) VALUES (2002, 987654321, 'IFIC Bank', 800, 1002);
INSERT INTO payment (ticket_num, card_num, bank, ammount, transaction_id) VALUES (2003, 654321987, 'ONE Bank', 1200, 1003);
INSERT INTO payment (ticket_num, card_num, bank, ammount, transaction_id) VALUES (2004, 123456789, 'RUPALI Bank', 1900, 1004);
INSERT INTO payment (ticket_num, card_num, bank, ammount, transaction_id) VALUES (2005, 987654321, 'Sonali Bank', 800, 1005);
INSERT INTO payment (ticket_num, card_num, bank, ammount, transaction_id) VALUES (2006, 246813579, 'Janata Bank', 1800, 1006);
INSERT INTO payment (ticket_num, card_num, bank, ammount, transaction_id) VALUES (2007, 135792468, 'Agrani Bank', 1500, 1007);
INSERT INTO payment (ticket_num, card_num, bank, ammount, transaction_id) VALUES (2008, 864209753, 'Islami Bank', 1200, 1008);
INSERT INTO payment (ticket_num, card_num, bank, ammount, transaction_id) VALUES (2009, 975318642, 'Pubali Bank', 1800, 1009);



--SHOW TABLE

SELECT * FROM users;
SELECT * FROM train;
SELECT * FROM class;
SELECT * FROM route;
SELECT * FROM tickets;
SELECT * FROM payment;

--COMMIT

commit;


