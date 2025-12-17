DECLARE
  v_myName VARCHAR2(20);
BEGIN 
  DBMS_OUTPUT.PUT_LINE('My name is: ' || v_myName);
  v_myName := 'John';
  DBMS_OUTPUT.PUT_LINE('My name is: ' || v_myName);
END;
/

-- SET SERVEROUTPUT ON;
-- SET VERIFY OFF
-- SET FEEDBACK OFF;

DECLARE
  v_myName VARCHAR2(20) := 'John';
BEGIN 
  DBMS_OUTPUT.PUT_LINE('My name is: ' || v_myName);
  v_myName := 'Steven';
  DBMS_OUTPUT.PUT_LINE('My name is: ' || v_myName);
END;
/

DECLARE 
  v_salary employees.salary%TYPE;
BEGIN
  SELECT salary
  INTO   v_salary
  FROM   employees
  WHERE  employee_id = 100;
  
  DBMS_OUTPUT.PUT_LINE(v_salary);
END;
/