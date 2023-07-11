--set screen

set linesize 200
set pagesize 100

-- Add the 'email' column to the 'users' table
ALTER TABLE users ADD email varchar(50);
describe users;

-- Modify the data type of the 'email' column in the 'users' table
ALTER TABLE users MODIFY email char(20);
describe users;

-- Rename the 'class_type' column to 'class_name' in the 'class' table
ALTER TABLE users RENAME COLUMN email TO email_address;
describe users;

-- Drop the 'email_address' column from the 'users' table
ALTER TABLE users DROP COLUMN email_address;
describe users;

--display tain from 'train' from train table where train has number of seats is 40
SELECT * FROM train WHERE seats=40;

--display the train info where the train has of class ka
SELECT * FROM train WHERE train_id IN ( SELECT train_id FROM class WHERE class_type = 'ka');


--Update the seat number from tickets table
UPDATE  tickets SET seat_no=20 WHERE ticket_num=1907;
SELECT * FROM tickets WHERE seat_no=20;

--Deleting a row from class table
--add an extra row to perform the delete operation in the class table
INSERT INTO class (class_type, fare, train_id) VALUES ('cha', 800, 16);
SELECT * FROM class WHERE class_type='cha';

DELETE FROM class WHERE class_type='cha';
SELECT * FROM class;

--UNION, INTERSECT, and EXCEPT

SELECT bank FROM payment WHERE bank LIKE 'U%'
UNION
SELECT bank FROM payment WHERE bank LIKE '%A%';

-- Using INTERSECT
SELECT bank FROM payment WHERE bank LIKE 'U%'
INTERSECT
SELECT bank FROM payment WHERE bank LIKE '%C%';

-- Using EXCEPT
SELECT bank FROM payment WHERE bank LIKE 'O%'
EXCEPT
SELECT bank FROM payment WHERE bank LIKE '%C%';


--with clause
WITH max_amount AS ( SELECT MAX(ammount) AS max_amount FROM payment) SELECT * FROM payment, max_amount WHERE payment.ammount = max_amount.max_amount;

--Save the SQL command output in txt file
SPOOL G:\CSE(3-1)\CSE-3110\Savefile.txt
SELECT * FROM tickets;
SPOOL OFF

--Aggregate function
SELECT count(*) FROM users;
SELECT count(ticket_num) as number_of_tickets FROM tickets;
SELECT avg(seats) FROM train;
SELECT sum(seats) FROM train;
SELECT max(ammount) FROM payment;
SELECT min(ammount) FROM payment;

--Group by and Having
SELECT train_name,avg(seats) FROM train GROUP BY train_name;
SELECT train_name,avg(seats) FROM train GROUP BY train_name HAVING avg(seats)>42;

--Nested subquery

SELECT t.ticket_num, t.passenger_name, t.j_date FROM tickets t WHERE t.NID IN ( SELECT NID FROM users WHERE age >= ( SELECT MAX(age) FROM users));

--and,or,not
SELECT * FROM train WHERE train_name = 'Bangladesh Express' AND train_id IN ( SELECT train_id FROM train WHERE train_name LIKE 'Bangladesh%');

--some/all/exists/unique

--some
SELECT * FROM route WHERE stop_no = SOME (SELECT stop_no FROM route WHERE train_id = 07);

--all
SELECT * FROM route WHERE stop_no > ALL (SELECT stop_no FROM route WHERE train_id = 13);

--exists
SELECT * FROM route r WHERE EXISTS (SELECT 1 FROM train t WHERE r.train_id = t.train_id AND t.dep_time < '12:00');

--unique
SELECT train_id FROM route GROUP BY train_id HAVING max(stop_no) >= 3;

--String operation
SELECT * FROM users WHERE username LIKE '________';
SELECT * FROM users WHERE username LIKE '%a%';

--Join Operation
SELECT * FROM train NATURAL JOIN route WHERE train_id = 07;

SELECT train_name, class_type FROM train JOIN class USING(train_id);

SELECT train_name, class_type FROM train JOIN class ON train.train_id = class.train_id;

--left outer
SELECT train_name,class_type FROM train LEFT OUTER JOIN class USING (train_id);

--right outer
SELECT train_name,class_type FROM train LEFT OUTER JOIN class USING (train_id);

--full outer
SELECT train_name,class_type FROM train LEFT OUTER JOIN class USING (train_id);

--View
DROP VIEW ticket_details;
create VIEW ticket_details AS SELECT ticket_num,train_num FROM tickets;
SELECT * FROM ticket_details;
