SET SERVEROUTPUT ON;

DECLARE
  NID users.NID%TYPE;
  username users.username%TYPE;
  name users.name%TYPE;
BEGIN
  SELECT NID, username, name INTO NID, username, name FROM users WHERE NID = 1907114;
  DBMS_OUTPUT.PUT_LINE('///////////////');
  DBMS_OUTPUT.PUT_LINE('/////PL/SQL variable declaration and print value/////');
  DBMS_OUTPUT.PUT_LINE('NID:      ' || NID);
  DBMS_OUTPUT.PUT_LINE('Username: ' || username);
  DBMS_OUTPUT.PUT_LINE('Name:    ' || name);
END;
/
delete  from users where NID=1907109;
SET SERVEROUTPUT ON;

DECLARE
  v_NID users.NID%TYPE := 1907109;
  v_age users.age%TYPE := 35;
  v_DOB users.DOB%TYPE := TO_DATE('1987-06-25', 'YYYY-MM-DD');
  v_username users.username%TYPE := 'rakib123';
  v_name users.name%TYPE := 'Rakib';
  v_address users.address%TYPE := 'New York';
BEGIN
  INSERT INTO users (NID, age, DOB, username, name, address)
  VALUES (v_NID, v_age, v_DOB, v_username, v_name, v_address);
  DBMS_OUTPUT.PUT_LINE('///////////////');
  DBMS_OUTPUT.PUT_LINE('/////Insert and set default value/////');
  DBMS_OUTPUT.PUT_LINE('New user= '||v_name);
END;
/

SET SERVEROUTPUT ON

DECLARE
  users_row users%ROWTYPE;
BEGIN
  SELECT username, NID, address INTO users_row.username,users_row.NID,users_row.address FROM users WHERE username = 'raha123';
  DBMS_OUTPUT.PUT_LINE('///////////////');
  DBMS_OUTPUT.PUT_LINE('/////Row type/////');
  DBMS_OUTPUT.PUT_LINE('Username= ' || users_row.username);
  DBMS_OUTPUT.PUT_LINE('NID= ' || users_row.NID);
  DBMS_OUTPUT.PUT_LINE('Address= ' || users_row.address);
END;
/

SET SERVEROUTPUT ON

DECLARE
  CURSOR train_cursor IS
    SELECT * FROM train;
  train_count NUMBER := 0;
  train_row train%ROWTYPE;
BEGIN
  OPEN train_cursor;
    DBMS_OUTPUT.PUT_LINE('///////////////');
    DBMS_OUTPUT.PUT_LINE('/////Cursor, row count, IF /ELSEIF /ELSE/////');
  LOOP
    FETCH train_cursor INTO train_row;
    EXIT WHEN train_cursor%NOTFOUND;
     train_count := train_count + 1;
    DBMS_OUTPUT.PUT_LINE('Train ID: ' || train_row.train_id);
    DBMS_OUTPUT.PUT_LINE('Train Name: ' || train_row.train_name);
    DBMS_OUTPUT.PUT_LINE('Number of seat = '|| train_row.seats);
    if train_row.seats > 40
    then
    DBMS_OUTPUT.PUT_LINE('=>The train has good quantity of seat');
    elsif train_row.seats <= 40 and train_row.seats > 30
    then
    DBMS_OUTPUT.PUT_LINE('=>The train has decent quantity of seat');
    else
    DBMS_OUTPUT.PUT_LINE('=>The train has not enough quantity of seat');
    end if;
    DBMS_OUTPUT.PUT_LINE('------------------------');
  END LOOP;
   DBMS_OUTPUT.PUT_LINE('Total numbers of Trains: ' || train_count);
  CLOSE train_cursor;
END;
/

SET SERVEROUTPUT ON

DECLARE
  TYPE NAMEARRAY IS VARRAY(5) OF train.train_name%TYPE; 
  A_NAME NAMEARRAY := NAMEARRAY();
BEGIN
  A_NAME.EXTEND(5);
  DBMS_OUTPUT.PUT_LINE('///////////////');
  DBMS_OUTPUT.PUT_LINE('/////FOR LOOP/WHILE LOOP/ARRAY with extend() function/////');
  SELECT train_name INTO A_NAME(1) FROM train WHERE train_id = 7;
  SELECT train_name INTO A_NAME(2) FROM train WHERE train_id = 13;
  SELECT train_name INTO A_NAME(3) FROM train WHERE train_id = 14;
  SELECT train_name INTO A_NAME(4) FROM train WHERE train_id = 15;
  SELECT train_name INTO A_NAME(5) FROM train WHERE train_id = 16;
  
  FOR i IN 1..A_NAME.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(A_NAME(i));
  END LOOP;
END;
/

SET SERVEROUTPUT ON

DECLARE
  TYPE NAMEARRAY IS VARRAY(5) OF train.train_name%TYPE; 
  A_NAME NAMEARRAY := NAMEARRAY('','','','','');
BEGIN
  SELECT train_name INTO A_NAME(1) FROM train WHERE train_id = 7;
  SELECT train_name INTO A_NAME(2) FROM train WHERE train_id = 13;
  SELECT train_name INTO A_NAME(3) FROM train WHERE train_id = 14;
  SELECT train_name INTO A_NAME(4) FROM train WHERE train_id = 15;
  SELECT train_name INTO A_NAME(5) FROM train WHERE train_id = 16;
  DBMS_OUTPUT.PUT_LINE('///////////////');
  DBMS_OUTPUT.PUT_LINE('/////ARRAY without extend() function/////');
  FOR i IN 1..A_NAME.COUNT LOOP
    IF A_NAME(i) IS NOT NULL THEN
      DBMS_OUTPUT.PUT_LINE(A_NAME(i));
    END IF;
  END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE train_details (
    p_train_id IN train.train_id%TYPE
) IS
    p_train_name train.train_name%TYPE;
    p_dep_time train.dep_time%TYPE;
    p_seats train.seats%TYPE;
    p_destination train.destination%TYPE;
    p_source train.source%TYPE;
    p_av_time train.av_time%TYPE;
BEGIN
    SELECT train_name, dep_time, seats, destination, source, av_time
    INTO p_train_name, p_dep_time, p_seats, p_destination, p_source, p_av_time
    FROM train
    WHERE train_id = p_train_id;
 DBMS_OUTPUT.PUT_LINE('///////////////');
 DBMS_OUTPUT.PUT_LINE('/////Procedure/////');
    DBMS_OUTPUT.PUT_LINE('Train ID: ' || p_train_id);
    DBMS_OUTPUT.PUT_LINE('Train Name: ' || p_train_name);
    DBMS_OUTPUT.PUT_LINE('Departure Time: ' || p_dep_time);
    DBMS_OUTPUT.PUT_LINE('Seats: ' || p_seats);
    DBMS_OUTPUT.PUT_LINE('Destination: ' || p_destination);
    DBMS_OUTPUT.PUT_LINE('Source: ' || p_source);
    DBMS_OUTPUT.PUT_LINE('Average Time: ' || p_av_time);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No train found with ID: ' || p_train_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLCODE || ' - ' || SQLERRM);
END;
/

BEGIN
    train_details(7); 
END;
/

CREATE OR REPLACE FUNCTION check_transaction_amount(p_transaction_id IN NUMBER) RETURN VARCHAR2 AS
  v_ticket_fare NUMBER;
  v_class_fare NUMBER;
  ticket_transaction_id NUMBER := p_transaction_id;
  value VARCHAR2(50);
BEGIN
  SELECT fare INTO v_class_fare
  FROM class
  WHERE train_id = (SELECT train_num FROM tickets WHERE ticket_num = (SELECT ticket_num FROM payment WHERE transaction_id = ticket_transaction_id));
  
  SELECT ammount INTO v_ticket_fare
  FROM payment
  WHERE transaction_id = ticket_transaction_id;
  
  IF v_ticket_fare = v_class_fare THEN
    value := 'The ammount is perfect for the desired ticket';

  ELSIF v_ticket_fare > v_class_fare THEN
    value := 'The ammount is more than the desired ticket';
  
  ELSE  
    value := 'Sorry, The ammount is not perfect for the desired tickets';
  END IF;
  
  RETURN value;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'error ';
END;
/

SET SERVEROUTPUT ON;
DECLARE
  value VARCHAR2(50);
BEGIN
  value := check_transaction_amount(1004);
   DBMS_OUTPUT.PUT_LINE('///////////////');
    DBMS_OUTPUT.PUT_LINE('/////Function/////');
  DBMS_OUTPUT.PUT_LINE(value);
END;
/
