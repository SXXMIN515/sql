set serveroutput on;

DECLARE
  v_date VARCHAR2(15);
BEGIN
  SELECT TO_CHAR(hire_date, 'MON.DD,YYYY')
  INTO   v_date
  FROM   employees
  WHERE  employee_id = 100;
  
  DBMS_OUTPUT.PUT_LINE(v_date);
END;
/

DECLARE
  v_outer_variable VARCHAR2(20) := 'GLOBAL VARIABLE';
BEGIN
  DECLARE
    v_inner_variable VARCHAR2(20) := 'LOCAL VARIABLE';
  BEGIN
    DBMS_OUTPUT.PUT_LINE(v_inner_variable);
    DBMS_OUTPUT.PUT_LINE(v_outer_variable);
  END;
  
  DBMS_OUTPUT.PUT_LINE(v_outer_variable);
--  DBMS_OUTPUT.PUT_LINE(v_inner_variable);
END;
/

DECLARE
  v_father VARCHAR2(20) := 'Patrick';
  v_birth  DATE := '1972/04/20';
BEGIN
  DECLARE
    v_child VARCHAR2(20) := 'Mike';
    v_birth  DATE := '2002/12/12';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Father''s Name: ' || v_father);
    DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || v_birth);
    DBMS_OUTPUT.PUT_LINE('Child''s Name: ' || v_child);
  END;
  
  DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || v_birth);
END;
/

DECLARE
  v_fname employees.first_name%TYPE;
BEGIN
  SELECT first_name
  INTO   v_fname
  FROM   employees
  WHERE  employee_id = 200;
  
  DBMS_OUTPUT.PUT_LINE('First Name is : ' || v_fname);
END;
/

DECLARE
  v_emp_date employees.hire_date%TYPE;
  v_emp_sal  employees.salary%TYPE;
BEGIN
  SELECT hire_date, salary
  INTO   v_emp_date, v_emp_sal
  FROM   employees
  WHERE  employee_id = 100;
  
  DBMS_OUTPUT.PUT_LINE('Hire date is : ' || v_emp_date);
  DBMS_OUTPUT.PUT_LINE('Salary is : ' || v_emp_sal);
END;
/

DECLARE
  v_sum_sal NUMBER(10, 2);
BEGIN
  SELECT SUM(salary)
  INTO   v_sum_sal
  FROM   employees
  WHERE  department_id = &no;
  
  DBMS_OUTPUT.PUT_LINE('The sum of salary is : ' || v_sum_sal);
END;
/

DECLARE
  sal_increase employees.salary%TYPE := 800;
BEGIN
  UPDATE employees
  SET    salary = salary + sal_increase
  WHERE  job_id = 'ST_CLERK';
END;
/
--1.
--사원번호를 입력(치환변수사용&)할 경우
--사원번호, 사원이름, 부서이름  
--을 출력하는 PL/SQL을 작성하시오.
--힌트)
--select e.employee_id, e.last_name, d.department_name
--from   employees e, departments d
--where  e.department_id = d.department_id
--and    e.employee_id = &id;
DECLARE
  v_employee_id employees.employee_id%TYPE;
  v_last_name employees.last_name%TYPE;
  v_department_name departments.department_name%TYPE;
BEGIN
  SELECT e.employee_id, e.last_name, d.department_name
  INTO   v_employee_id, v_last_name, v_department_name
  FROM   employees e
  JOIN   departments d
    ON   e.department_id = d.department_id
  WHERE  e.employee_id = &id;
  
  DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_employee_id || ', 사원이름 : ' || v_last_name || ', 부서이름 : ' || v_department_name);
END;
/

--
--2.
--사원번호를 입력(치환변수사용&)할 경우 
--사원이름, 급여, 연봉->(급여*12+(nvl(급여,0)*nvl(커미션퍼센트,0)*12))
--을 출력하는  PL/SQL을 작성하시오.
DECLARE
  v_last_name employees.last_name%TYPE;
  v_salary employees.salary%TYPE;
  v_year_salary employees.salary%TYPE;
BEGIN
  SELECT last_name, salary, (salary*12+(NVL(salary, 0)*NVL(commission_pct, 0)*12)) AS year_salary
  INTO   v_last_name, v_salary, v_year_salary
  FROM   employees
  WHERE  employee_id = &id;
  
  DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_last_name || ', 급여 : ' || v_salary || ', 연봉 : ' || v_year_salary);
END;
/

select * from employees;


--3.
--사원번호를 입력(치환변수사용&)할 경우
--입사일이 2005년 이후(2005년 포함)이면 'New employee' 출력
--      2005년 이전이면 'Career employee' 출력
--힌트) case when then 구문 사용
DECLARE
  v_last_name employees.last_name%TYPE;
  v_emp_type VARCHAR2(20);

BEGIN
  SELECT last_name,
         CASE WHEN TO_CHAR(hire_date, 'YYYY/MM/DD') >= '2005/01/01' THEN 'New employee'
                                                                    ELSE 'Career employee'
         END
  INTO   v_last_name, v_emp_type
  FROM   employees
  WHERE  employee_id = &id;
  
  DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_last_name || ', 사원유형 : ' || v_emp_type);
END;
/

DECLARE
  v_empid employees.employee_id%TYPE;
  v_rows  VARCHAR2(30);
BEGIN
  SELECT employee_id
  INTO   v_empid
  FROM   employees
  WHERE  employee_id = &id;
  
  v_rows := (SQL%ROWCOUNT || ' row seleted.');
  DBMS_OUTPUT.PUT_LINE(v_rows);
END;
/

DECLARE 
  v_myage NUMBER := &age;
BEGIN
  IF v_myage < 11 THEN
    DBMS_OUTPUT.PUT_LINE('I am a child');
  ELSIF v_myage < 20 THEN
    DBMS_OUTPUT.PUT_LINE('I am a young');
  ELSIF v_myage < 30 THEN
    DBMS_OUTPUT.PUT_LINE('I am in my twenties');
  ELSIF v_myage < 40 THEN
    DBMS_OUTPUT.PUT_LINE('I am in my thirties');
  ELSE
    DBMS_OUTPUT.PUT_LINE('I am always young');
  END IF;
END;
/

DECLARE 
  v_grade CHAR(1) := UPPER('&grade');
  v_appraisal VARCHAR2(20);
BEGIN
  v_appraisal := CASE v_grade
                   WHEN 'A' THEN
                     'Excellent'
                   WHEN 'B' THEN
                     'Very Good'
                   WHEN 'C' THEN
                     'Good'
                   ELSE
                     'No such grade'
                 END;
  DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade || ' Appraisal ' || v_appraisal);                 
END;
/

create table test01(empid, ename, hiredate)
as
  select employee_id, last_name, hire_date
  from   employees
  where  employee_id = 0;

--사원번호를 입력하는 경우(&치환변수 사용)
--사원테이블(employees)로 부터
--해당사원의 
--사원번호(employee_id), 사원이름(last_name), 입사일(hire_date)을 가져와
--test01 테이블에 입력하는 PL/SQL을 작성하시오.
DECLARE
  v_empno employees.employee_id%TYPE;
  v_name  employees.last_name%TYPE;
  v_date  employees.hire_date%TYPE;
BEGIN
  SELECT employee_id, last_name, hire_date
  INTO   v_empno, v_name, v_date
  FROM   employees
  WHERE  employee_id = &id;

  INSERT INTO test01 (empid, ename, hiredate)
  VALUES (v_empno, v_name, v_date);
END;
/

--<if 문제>
create table emp00
as
  select employee_id, last_name, department_id
  from   employees
  where  employee_id = 0;

--emp20
--emp30
--emp40
--emp50
--emp00
--
--부서번호10->emp10, 부서번호20->emp20 ....
--
--사원번호를 입력(치환변수& 사용)할 경우
--부서별로 구분하여 각각의 테이블에 입력하는 PL/SQL 블록을 작성하시오.
--단, 해당 부서가 없는 사원은 emp00 테이블에 입력하시오.
DECLARE
  v_empno  employees.employee_id%TYPE;
  v_name   employees.last_name%TYPE;
  v_deptno departments.department_id%TYPE;
  v_table  VARCHAR2(20);
BEGIN
  SELECT e.employee_id, e.last_name, d.department_id
  INTO   v_empno, v_name, v_deptno
  FROM   employees e
  JOIN   departments d
    ON   e.department_id = d.department_id
  WHERE  e.employee_id = &id;
  
  IF v_deptno = 10 THEN
    INSERT INTO emp10 (employee_id, last_name, department_id)
    VALUES (v_empno, v_name, v_deptno);  
  ELSIF v_deptno = 20 THEN
    INSERT INTO emp20 (employee_id, last_name, department_id)
    VALUES (v_empno, v_name, v_deptno);  
  ELSIF v_deptno = 30 THEN
    INSERT INTO emp30 (employee_id, last_name, department_id)
    VALUES (v_empno, v_name, v_deptno);  
  ELSIF v_deptno = 40 THEN
    INSERT INTO emp40 (employee_id, last_name, department_id)
    VALUES (v_empno, v_name, v_deptno);  
  ELSIF v_deptno = 50 THEN
    INSERT INTO emp50 (employee_id, last_name, department_id)
    VALUES (v_empno, v_name, v_deptno);     
  ELSE
    INSERT INTO emp00 (employee_id, last_name, department_id)
    VALUES (v_empno, v_name, v_deptno);  
  END IF;  
END;
/

select * from emp50;

4.
drop table test01 purge;
drop table test02 purge;

create table test01(empid, ename, hiredate)
as
  select employee_id, last_name, hire_date
  from   employees
  where  employee_id = 0;

create table test02(empid, ename, hiredate)
as
  select employee_id, last_name, hire_date
  from   employees
  where  employee_id = 0;

--employees 테이블에서 사원번호를 입력(치환변수사용&)할 경우
--사원들 중 2005년 이후(2005년 포함)에 입사한 사원의 사원번호, 
--사원이름, 입사일을 test01 테이블에 입력하고, 2005년 이전에 
--입사한 사원의 사원번호,사원이름,입사일을 test02 테이블에 입력하시오.
DECLARE
  v_empno employees.employee_id%TYPE;
  v_name  employees.last_name%TYPE;
  v_hdate employees.hire_date%TYPE;
BEGIN
  SELECT employee_id, last_name, hire_date
  INTO   v_empno, v_name, v_hdate
  FROM   employees
  WHERE  employee_id = &id;
  
  IF TO_CHAR(v_hdate, 'YYYY/MM/DD') >= '2005/01/01' THEN
    INSERT INTO test01 (empid, ename, hiredate)
    VALUES (v_empno, v_name, v_hdate);
  ELSE 
    INSERT INTO test02 (empid, ename, hiredate)
    VALUES (v_empno, v_name, v_hdate);
  END IF;  
END;
/

select * from test02;
--5.
--급여가  5000이하이면 20% 인상된 급여
--급여가 10000이하이면 15% 인상된 급여
--급여가 15000이하이면 10% 인상된 급여
--급여가 15001이상이면 급여 인상없음
--
--사원번호를 입력(치환변수)하면 사원이름, 급여, 인상된 급여가 출력되도록 PL/SQL 블록을 생성하시오.
DECLARE
  v_name      employees.last_name%TYPE;
  v_salary    employees.salary%TYPE;
  v_in_salary employees.salary%TYPE;
BEGIN
  SELECT last_name, salary,
         CASE WHEN salary <= 5000  THEN salary*1.2
              WHEN salary <= 10000 THEN salary*1.15
              WHEN salary <= 15000 THEN salary*1.1
                                   ELSE salary
         END AS v_in_salary                    
  INTO   v_name, v_salary, v_in_salary
  FROM   employees
  WHERE  employee_id = &id;
  
  DBMS_OUTPUT.PUT_LINE('사원이름: ' || v_name || ', 급여: ' || v_salary || ', 인상된 급여: ' || v_in_salary);
END;
/


--6.
--사원번호를 입력할 경우
--해당 사원을 삭제하는 PL/SQL을 작성하시오.
--단, 해당사원이 없는 경우 "해당사원이 없습니다." 출력
--
--힌트> SQL%NOTFOUND
BEGIN
  DELETE FROM employees
  WHERE employee_id = &id;
  
  IF SQL%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('해당사원이 없습니다.');
  END IF;
END;
/
select * from employees;

--7.
--직원들이 사번, 급여 증가치(%)만 입력하면 Employees테이블에 쉽게 사원의 급여를 갱신할 수 있도록 PL/SQL을 작성하세요.
--만약 입력한 사원이 없는 경우에는 ‘No search employee!!’라는 메시지를 출력하세요.
--
--급여 = 급여*(1+급여증가치/100)
--or
--급여 = 급여+(급여*(급여증가치/100))
--
--힌트> SQL%NOTFOUND

DESC employees;

DECLARE
  v_empno employees.employee_id%TYPE := &id;
  v_pct employees.commission_pct%TYPE := &pct;
BEGIN
  UPDATE employees
  SET    salary = salary*(salary*(v_empno/100))
  WHERE  employee_id = v_pct;

  IF SQL%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('No search employee!!');
  END IF;
END;

--BEGIN
--  UPDATE employees
--  SET    salary = salary*(salary*(&pct/100))
--  WHERE  employee_id = &id;
--
--  IF SQL%NOTFOUND THEN
--    DBMS_OUTPUT.PUT_LINE('No search employee!!');
--  END IF;
--END;
/

DECLARE
  v_countryid locations.country_id%TYPE := 'CA';
  v_loc_id locations.location_id%TYPE;
  v_counter NUMBER(2) := 1;
  v_new_city locations.city%TYPE := 'Montreal';
BEGIN
  SELECT MAX(location_id) 
  INTO   v_loc_id 
  FROM   locations
  WHERE  country_id = v_countryid;

  LOOP
    INSERT INTO locations(location_id, city, country_id) 
    VALUES((v_loc_id + v_counter), v_new_city, v_countryid);

    v_counter := v_counter + 1;

    EXIT WHEN v_counter > 3;
  END LOOP;
END;
/

select *
from locations 
where country_id = 'CA';

DECLARE
  v_countryid locations.country_id%TYPE := 'CA';
  v_loc_id locations.location_id%TYPE;
  v_new_city locations.city%TYPE := 'Montreal';
  v_counter NUMBER := 1;
BEGIN
  SELECT MAX(location_id) 
  INTO   v_loc_id 
  FROM   locations
  WHERE  country_id = v_countryid;

  WHILE v_counter <= 3 LOOP
    INSERT INTO locations(location_id, city, country_id) 
    VALUES((v_loc_id + v_counter), v_new_city, v_countryid);

    v_counter := v_counter + 1;
  END LOOP;
END;
/

DECLARE
  v_countryid locations.country_id%TYPE := 'CA';
  v_loc_id locations.location_id%TYPE;
  v_new_city locations.city%TYPE := 'Montreal';
BEGIN
  SELECT MAX(location_id) 
  INTO   v_loc_id 
  FROM   locations
  WHERE  country_id = v_countryid;

  FOR i IN 1..3 LOOP
    INSERT INTO locations(location_id, city, country_id) 
    VALUES((v_loc_id + i), v_new_city, v_countryid );
  END LOOP;
END;
/

--1. 1부터 10까지 최종 합계 값을 구하는 PL/SQL을 작성하시오.
DECLARE
  v_sum NUMBER(10) := 0;
BEGIN
  FOR i in 1..10 LOOP
    v_sum := v_sum + i;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('1부터 10까지 최종 합계 값: ' || v_sum);
END;
/

--2. 1부터 10까지 짝수 최종 합계 값을 구하는 PL/SQL을 작성하시오. (if문 사용)
DECLARE
  v_sum NUMBER(10) := 0;
BEGIN
  FOR i in 1..10 LOOP
    IF MOD(i, 2)=0 THEN 
      v_sum := v_sum + i;
    END IF; 
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('1부터 10까지 짝수 최종 합계 값: ' || v_sum);
END;
/

--3. 다음과 같이 출력되도록 하시오.
--*
--**
--***
--****
--*****
DECLARE
  v_star VARCHAR2(10);
BEGIN
  FOR i in 1..5 LOOP
    v_star := v_star || '*';
    DBMS_OUTPUT.PUT_LINE(v_star);
  END LOOP; 
END;
/

--4. 치환변수(&)를 사용하면 숫자를 입력하면 해당 구구단이 출력되도록 하시오.
--예) 2 입력시
--2 * 1 = 2
--2 * 2 = 4
--2 * 3 = 6
--2 * 4 = 8
--2 * 5 = 10
--2 * 6 = 12
--2 * 7 = 14
--2 * 8 = 16
--2 * 9 = 18
DECLARE
  v_dan NUMBER(10) := &dan;
BEGIN
  FOR i in 1..9 LOOP
    DBMS_OUTPUT.PUT_LINE(v_dan || ' x ' || i || ' = ' || v_dan*i);
  END LOOP;
END;
/
--5. 구구단 2~9단까지 출력되도록 하시오.
BEGIN
  FOR i in 2..9 LOOP
    DBMS_OUTPUT.PUT_LINE('============='); 
    DBMS_OUTPUT.PUT_LINE(i || '단');
    FOR j in 1..9 LOOP
      DBMS_OUTPUT.PUT_LINE(i || ' x ' || j || ' = ' || i*j);
    END LOOP;
  END LOOP;
END;
/
--6. 구구단 1~9단까지 출력되도록 하시오.
--   (단, 홀수단 출력)
BEGIN
  FOR i in 1..9 LOOP
    IF MOD(i, 2)=1 THEN 
      DBMS_OUTPUT.PUT_LINE('============='); 
      DBMS_OUTPUT.PUT_LINE(i || '단'); 
      FOR j in 1..9 LOOP
        DBMS_OUTPUT.PUT_LINE(i || ' x ' || j || ' = ' || i*j);
      END LOOP;
    END IF;
  END LOOP;
END;
/

create table aaa
(a number(3));

create table bbb
(b number(3));

--1.
--aaa 테이블에 1부터10까지 입력되도록 PL/SQL 블록을 작성하시오.
--단, insert 문은 1번에 사용
--
--힌트) FOR i IN 1..10 LOOP
--       ~
--    END LOOP
BEGIN
  FOR i in 1..10 LOOP
    INSERT INTO aaa (a)
    VALUES (i);
  END LOOP;
END;
/
select * from aaa;

select * from bbb;
--2.
--bbb 테이블에 1부터 10까지 최종 합계 값을 PL/SQL 블록으로 작성하여 입력하시오.
--v_sum := v_sum + i;
DECLARE
  v_sum NUMBER(10) := 0;
BEGIN
  FOR i in 1..10 LOOP
    v_sum := v_sum + i;
  END LOOP;
  
  INSERT INTO bbb (b)
  VALUES (v_sum);
END;
/

--3
--aaa 테이블에 1부터 10까지 짝수만 입력되도록 PL/SQL 블록을 작성하시오.
--단, insert 문은 한번 사용, if문 사용
--힌트)
--IF MOD(i,2) = 0 THEN   -> java는 i%2 == 0
DECLARE
  v_sum NUMBER(10) := 0;
BEGIN
  FOR i in 1..10 LOOP
    IF MOD(i, 2) = 0 THEN
      INSERT INTO aaa (a)
      VALUES (i);
    END IF;  
  END LOOP;
END;
/

--4.
--bbb 테이블에 1부터 10까지 짝수 최종 합계 값을 PL/SQL 블록으로 작성하여 입력하시오.
--단, if문 사용
--힌트)
--IF MOD(i,2) = 0 THEN
DECLARE
  v_sum NUMBER(10) := 0;
BEGIN
  FOR i in 1..10 LOOP
    IF MOD(i, 2) = 0 THEN
      v_sum := v_sum + i;
    END IF;  
  END LOOP;
  
  INSERT INTO bbb (b)
  VALUES (v_sum);
END;
/

--5.
--1부터 10까지에서 짝수의 합계는 aaa 테이블에, 홀수의 합계는 bbb 테이블에 
--입력되도록 PL/SQL 블록을 작성하시오. (단, if 문 사용)
DECLARE
  v_a_sum NUMBER(10) := 0;
  v_b_sum NUMBER(10) := 0;
BEGIN
  FOR i in 1..10 LOOP
    IF MOD(i, 2) = 0 THEN
      v_a_sum := v_a_sum + i;
    ELSE 
      v_b_sum := v_b_sum + i;
    END IF;  
  END LOOP;
  
  INSERT INTO aaa (a)
  VALUES (v_a_sum);
  
  INSERT INTO bbb (b)
  VALUES (v_b_sum);
END;
/

DECLARE
  TYPE t_rec IS RECORD
    (v_sal       number(8),
     v_minsal    number(8) default 1000,
     v_hire_date employees.hire_date%type,
     v_rec1      employees%rowtype);

  v_myrec t_rec;
BEGIN
  v_myrec.v_sal := v_myrec.v_minsal + 500;
  v_myrec.v_hire_date := sysdate;

  SELECT * 
  INTO   v_myrec.v_rec1
  FROM   employees 
  WHERE employee_id = 100;

  DBMS_OUTPUT.PUT_LINE(v_myrec.v_rec1.last_name ||' '||
      to_char(v_myrec.v_hire_date) ||' '|| to_char(v_myrec.v_sal));
END;
/

create table retired_emps (empno, ename, job, mgr, hiredate,
                           leavedate, sal, comm, deptno)
as
  select employee_id, last_name, job_id, manager_id, hire_date,
         sysdate, salary, commission_pct, department_id
  from   employees
  where  employee_id = 0;
  
DECLARE
  v_employee_number number:= 124;
  v_emp_rec employees%ROWTYPE;
BEGIN
  SELECT * 
  INTO   v_emp_rec 
  FROM employees
  WHERE employee_id = v_employee_number;

  INSERT INTO retired_emps(empno, ename, job, mgr,
  hiredate, leavedate, sal, comm, deptno) 
  VALUES (v_emp_rec.employee_id, 
          v_emp_rec.last_name, 
          v_emp_rec.job_id, 
          v_emp_rec.manager_id,
          v_emp_rec.hire_date,
          SYSDATE, 
          v_emp_rec.salary,
          v_emp_rec.commission_pct, 
          v_emp_rec.department_id);
END;
/  

select * from retired_emps;

SET SERVEROUTPUT ON;
DECLARE
  TYPE dept_table_type IS TABLE OF
    departments%ROWTYPE INDEX BY PLS_INTEGER;
    
  dept_table dept_table_type;
BEGIN
  SELECT *
  INTO   dept_table(3)
  FROM   departments
  WHERE  department_id = 10;
  
  DBMS_OUTPUT.PUT_LINE(dept_table(3).department_id || ' '  ||
                       dept_table(3).department_name || ' '  ||
                       dept_table(3).manager_id);
END;
/

DECLARE
  TYPE emp_table_type IS TABLE OF
    employees%ROWTYPE INDEX BY PLS_INTEGER;
  my_emp_table emp_table_type;
  max_count NUMBER(3) := 104;
BEGIN
  FOR i IN 100 .. max_count LOOP
    SELECT *
    INTO   my_emp_table(i)
    FROM   employees
    WHERE  employee_id = i;
  END LOOP;
  
  FOR i IN my_emp_table.FIRST .. my_emp_table.LAST LOOP
    DBMS_OUTPUT.PUT_LINE(my_emp_table(i).last_name);
  END LOOP;  
END;
/

DECLARE
  TYPE dept_table_type IS TABLE OF
    NUMBER INDEX BY BINARY_INTEGER;
    
  dept_table dept_table_type;
  v_total NUMBER;
BEGIN
  FOR i IN 1 .. 50 LOOP
    dept_table(i) := i;
  END LOOP;  

  v_total := dept_table.COUNT;
  
  DBMS_OUTPUT.PUT_LINE(v_total);
  DBMS_OUTPUT.PUT_LINE(dept_table(20));
END;
/

CREATE TABLE emp(empid, empname)
AS
  SELECT employee_id, last_name
  FROM   employees
  WHERE  employee_id = 0;

DECLARE 
  TYPE emp_table_type IS TABLE OF 
    VARCHAR2(13)  INDEX BY PLS_INTEGER; 
  emp_table  emp_table_type;
BEGIN
  emp_table(1) := 'SCOTT';
  emp_table(3) := 'JONE';
  DBMS_OUTPUT.PUT_LINE(emp_table(1));
  DBMS_OUTPUT.PUT_LINE(emp_table(3));
  IF emp_table.EXISTS(1) THEN
    INSERT INTO emp (empid, empname)
    VALUES (100, 'Row 1 있음');
  ELSE
    INSERT INTO emp (empid, empname)
    VALUES (100, 'Row 1 없음');
  END IF;

  IF emp_table.EXISTS(2) THEN
    INSERT INTO emp (empid, empname)
    VALUES (200, 'Row 2 있음');
  ELSE
    INSERT INTO emp (empid, empname)
    VALUES (200, 'Row 2 없음');     
  END IF;
END;
/

select * from emp;

drop table emp00 purge;

--<record, if 문제>
create table emp00
as
  select *
  from   employees
  where  employee_id = 0;
--emp10
--emp20
--emp30
--emp40
--emp50
--emp00

--부서번호10->emp10, 부서번호20->emp20 ....
--
--사원번호를 입력(치환변수& 사용)할 경우
--부서별로 구분하여 각각의 테이블에 입력하는 PL/SQL 블록을 작성하시오.
--단, 해당 부서가 없는 사원은 emp00 테이블에 입력하시오.
DECLARE
  emp_rec employees%ROWTYPE;
BEGIN
  SELECT *
  INTO   emp_rec
  FROM   employees
  WHERE  employee_id = &id;

  IF    emp_rec.department_id = 10 THEN
    INSERT INTO emp10
    VALUES      emp_rec;
  ELSIF emp_rec.department_id = 20 THEN
    INSERT INTO emp20
    VALUES      emp_rec;
  ELSIF emp_rec.department_id = 30 THEN
    INSERT INTO emp30
    VALUES      emp_rec;
  ELSIF emp_rec.department_id = 40 THEN
    INSERT INTO emp40
    VALUES      emp_rec;
  ELSIF emp_rec.department_id = 50 THEN
    INSERT INTO emp50
    VALUES      emp_rec;
  ELSE
    INSERT INTO emp00
    VALUES      emp_rec;
  END IF;

END;
/

select * from emp50;

DECLARE
  CURSOR c_emp_cursor IS
    SELECT employee_id, last_name
    FROM   employees
    WHERE  department_id = 30;
    
  v_empno employees.employee_id%TYPE;
  v_lname employees.last_name%TYPE;
BEGIN
  OPEN c_emp_cursor;
  FETCH c_emp_cursor INTO v_empno, v_lname;
  
  DBMS_OUTPUT.PUT_LINE(v_empno || ' ' || v_lname);
END;
/

DECLARE
  CURSOR c_emp_cursor IS
    SELECT employee_id, last_name
    FROM   employees
    WHERE  department_id = 30;
    
  v_empno employees.employee_id%TYPE;
  v_lname employees.last_name%TYPE;
BEGIN
  OPEN c_emp_cursor;
  LOOP
    FETCH c_emp_cursor INTO v_empno, v_lname;
    EXIT WHEN c_emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_empno || ' ' || v_lname);
  END LOOP;  
  CLOSE c_emp_cursor;
END;
/

-- 커서 사용 이유 : 변수에는 값을 하나만 담을 수 있는데 여러 개 담을 수 있기 때문이다.
DECLARE
  CURSOR c_emp_cursor IS
    SELECT employee_id, last_name
    FROM   employees
    WHERE  department_id = 30;
    
  v_emp_record c_emp_cursor%ROWTYPE;

BEGIN
  OPEN c_emp_cursor;
  LOOP
    FETCH c_emp_cursor INTO v_emp_record;
    EXIT WHEN c_emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_emp_record.employee_id || ' ' || v_emp_record.last_name);
  END LOOP;  
  CLOSE c_emp_cursor;
END;
/

create table temp_list (empid, empname)
as
 select employee_id, last_name
 from   employees
 where  employee_id = 0;

--1.
--부서번호를 입력(&사용)하면 
--소속된 사원의 사원번호, 사원이름, 부서번호를 출력하는 PL/SQL을 작성하시오.
--(단, CURSOR 사용)
DECLARE
  CURSOR c_emp_cursor IS
    SELECT employee_id, last_name, department_id
    FROM   employees
    WHERE  department_id = &id;
  
  v_rec    c_emp_cursor%ROWTYPE;  
BEGIN
  OPEN c_emp_cursor;
  LOOP
    FETCH c_emp_cursor INTO v_rec;
    EXIT WHEN c_emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_rec.employee_id || ' ' || v_rec.last_name || ' ' || v_rec.department_id);
  END LOOP;  
  CLOSE c_emp_cursor;
END;
/

--2.
--부서번호를 입력할 경우(&치환변수 사용)
--해당하는 부서의 사원이름, 입사일자, 부서명을 출력하시오.
--(단, cursor 사용)
DECLARE
  CURSOR c_emp_cursor IS
    SELECT e.last_name
          ,e.hire_date
          ,d.department_name
    FROM   employees e
    JOIN   departments d
      ON   e.department_id = d.department_id
    WHERE  e.department_id = &id;
  
  v_rec    c_emp_cursor%ROWTYPE;  
BEGIN
  OPEN c_emp_cursor;
  LOOP
    FETCH c_emp_cursor INTO v_rec;
    EXIT WHEN c_emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_rec.last_name || ' ' || v_rec.hire_date || ' ' || v_rec.department_name);
  END LOOP;  
  CLOSE c_emp_cursor;
END;
/

--3.
--TRUNCATE TABLE test01;
--TRUNCATE TABLE test02;
--
--사원(employees) 테이블에서
--사원의 사원번호, 사원이름, 입사연도를 
--다음 기준에 맞게 각각 test01, test02에 입력하시오.
--
--입사년도가 2005년(포함) 이전 입사한 사원은 test01 테이블에 입력
--입사년도가 2005년 이후 입사한 사원은 test02 테이블에 입력
--** 반드시 cursor 사용
DECLARE
  CURSOR c_emp_cursor IS
    SELECT employee_id
          ,last_name
          ,hire_date
    FROM   employees;
  
  v_rec    c_emp_cursor%ROWTYPE;  
BEGIN
  OPEN c_emp_cursor;
  LOOP
    FETCH c_emp_cursor INTO v_rec;
    EXIT WHEN c_emp_cursor%NOTFOUND;
    IF (TO_CHAR(v_rec.hire_date, 'YYYY') <= '2005') THEN
      INSERT INTO test01
      VALUES v_rec;
    ELSE 
      INSERT INTO test02
      VALUES v_rec;
    END IF;  
  END LOOP;  
  CLOSE c_emp_cursor;
END;
/

-- FOR LOOP로 바꾸기
DECLARE
  CURSOR c_emp_cursor IS
    SELECT employee_id
          ,last_name
          ,hire_date
    FROM   employees;
  
BEGIN
  FOR emp_rec IN c_emp_cursor LOOP
    IF (TO_CHAR(emp_rec.hire_date, 'YYYY') <= '2005') THEN
      INSERT INTO test01
      VALUES emp_rec;
    ELSE 
      INSERT INTO test02
      VALUES emp_rec;
    END IF;  
  END LOOP;  
END;
/

select * from test01;


--4.
--사원(employees) 테이블에서
--사원의 사원번호, 사원이름, 입사연도를 
--다음 기준에 맞게 각각 test01, test02에 입력하시오.
--
--급여가 5000(포함) 이상이면 test01 테이블에 입력
--급여가 5000 미만이면 test02 테이블에 입력
--** 반드시 cursor 사용



DECLARE
  CURSOR c_emp_cursor IS
    SELECT employee_id, last_name
    FROM   employees
    WHERE  department_id = 30;

BEGIN
  FOR emp_record IN c_emp_cursor LOOP 
      DBMS_OUTPUT.PUT_LINE(emp_record.employee_id || ' ' || emp_record.last_name);
  END LOOP;
END;
/

BEGIN
  FOR emp_record IN (SELECT employee_id, last_name
                     FROM   employees
                     WHERE  department_id = 30) LOOP 
    DBMS_OUTPUT.PUT_LINE(emp_record.employee_id || ' ' || emp_record.last_name);
  END LOOP;
END;
/

DECLARE
  v_empno employees.employee_id%TYPE;
  v_ename employees.last_name%TYPE;
  CURSOR emp_cursor (v_deptno NUMBER, v_job VARCHAR2) IS
    SELECT employee_id, last_name
    FROM   employees
    WHERE  department_id = v_deptno
    AND    job_id = v_job;
BEGIN
  OPEN emp_cursor(60, 'IT_PROG');
    LOOP
      FETCH emp_cursor INTO v_empno, v_ename;
        EXIT WHEN emp_cursor%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_empno)||' '|| v_ename);
    END LOOP;
  CLOSE emp_cursor;
  COMMIT;
END;
/


DECLARE
  v_lname VARCHAR2(15);
BEGIN
  SELECT last_name
  INTO   v_lname
  FROM   employees;
  
  DBMS_OUTPUT.PUT_LINE('John''s last name is :' || v_lname);

EXCEPTION
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Selected multiple rows');

END;
/

DECLARE
  e_insert_excep EXCEPTION;
  PRAGMA EXCEPTION_INIT(e_insert_excep, -01400);
BEGIN
  INSERT INTO departments (department_id, department_name)
  VALUES (280, NULL);
  
EXCEPTION
  WHEN e_insert_excep THEN
    DBMS_OUTPUT.PUT_LINE('INSERT OPERATION FAILED');
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    DBMS_OUTPUT.PUT_LINE(SQLCODE);
END;
/

DECLARE 
  v_deptno NUMBER := 30;
  v_name   VARCHAR2(20) := 'Testing';
  e_invalid_department EXCEPTION;
BEGIN
  UPDATE departments
  SET    department_name = v_name
  WHERE  department_id = v_deptno;

  IF SQL%NOTFOUND THEN
    RAISE e_invalid_department;
  END IF;
  
EXCEPTION
  WHEN e_invalid_department THEN
    DBMS_OUTPUT.PUT_LINE('No such department id.');
END;
/

--1.
--drop table emp_test;
--
create table emp_test
as
  select employee_id, last_name
  from   employees
  where  employee_id < 200;
--
--emp_test 테이블에서 사원번호를 사용(&치환변수 사용)하여 사원을 삭제하는 PL/SQL을 작성하시오.
--(단, 사용자 정의 예외사항 사용)
--(단, 사원이 없으면 "해당사원이 없습니다.'라는 오류메시지 발생)
DECLARE 
  e_invalid_employee EXCEPTION;
BEGIN
  DELETE FROM emp_test
  WHERE  employee_id = &id;

  IF SQL%NOTFOUND THEN
    RAISE e_invalid_employee;
  END IF;
  
EXCEPTION
  WHEN e_invalid_employee THEN
    DBMS_OUTPUT.PUT_LINE('해당사원이 없습니다.');
END;
/



--2.
--사원(employees) 테이블에서
--사원번호를 입력(&사용)받아
--10% 인상된 급여로 수정하는 PL/SQL을 작성하시오.
--단, 2005년(포함) 이후 입사한 사원은 갱신하지 않고
--"2005년 이후 입사한 사원입니다." <-exception 절 사용
--라고 출력되도록 하시오.
DECLARE 
  v_empno employees.employee_id%TYPE;
  v_hdate employees.hire_date%TYPE;
BEGIN
  SELECT employee_id
        ,hire_date
  INTO   v_empno, v_hdate      
  FROM   employees
  WHERE  TO_CHAR(hire_date, 'YYYY') < '2005'
  AND    employee_id =&id;

  UPDATE employees
  SET    salary = salary * 1.1
  WHERE  employee_id = v_empno;
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('2005년 이후 입사한 사원입니다.');
END;
/


--3.
--사원(employees) 테이블에서
--부서번호를 입력(&사용)받아   <- cursor 사용
--10% 인상된 급여로 수정하는 PL/SQL을 작성하시오.
--단, 단 해당 부서에 사원이 없으면
--"해당 부서에는 사원이 없습니다." <-exception 절 사용
--라고 출력되도록 하시오.
DECLARE
  CURSOR e_emp_cursor IS
    SELECT employee_id, salary
    FROM   employees
    WHERE  department_id = &id;
    
  v_empno employees.employee_id%TYPE;
  v_hdate employees.hire_date%TYPE;
BEGIN
  SELECT employee_id
        ,hire_date
  INTO   v_empno, v_hdate      
  FROM   employees
  WHERE  TO_CHAR(hire_date, 'YYYY') < '2005'
  AND    department_id =&id;

  UPDATE employees
  SET    salary = salary * 1.1
  WHERE  employee_id = v_empno;
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('2005년 이후 입사한 사원입니다.');
END;
/

DECLARE
  e_name EXCEPTION;
BEGIN
  DELETE FROM employees
  WHERE  employee_id = &id;

  IF SQL%NOTFOUND THEN
    RAISE e_name;
  END IF;
EXCEPTION
  WHEN e_name THEN
    RAISE_APPLICATION_ERROR (-20999, '해당 사원이 없습니다.');
  --  DBMS_OUTPUT.PUT_LINE('해당 사원이 없습니다.');
END;
/


BEGIN
  DELETE FROM employees
  WHERE  employee_id = &id;

  IF SQL%NOTFOUND THEN
    RAISE_APPLICATION_ERROR (-20999, '해당 사원이 없습니다.');
  END IF;
END;
/

DROP TABLE dept PURGE;

CREATE TABLE dept
AS 
  SELECT *
  FROM   departments;

CREATE PROCEDURE add_dept
IS 
  v_dept_id dept.department_id%TYPE;
  v_dept_name dept.department_name%TYPE;
BEGIN
  v_dept_id := 280;
  v_dept_name := 'ST-Curriculum';
  INSERT INTO dept(department_id, department_name)
  VALUES (v_dept_id, v_dept_name);
  DBMS_OUTPUT.PUT_LINE(' Inserted ' || SQL%ROWCOUNT || ' row ');
END;
/

BEGIN
  add_dept;
END;
/

execute add_dept;

select * from dept;

CREATE OR REPLACE PROCEDURE raise_salary
  (p_id      IN employees.employee_id%TYPE,
   p_percent IN NUMBER)
IS
BEGIN
  UPDATE employees
  SET    salary = salary * (1 + p_percent/100)
  WHERE  employee_id = p_id;
END raise_salary;
/
 
EXECUTE raise_salary(176, 10);   

CREATE OR REPLACE PROCEDURE query_emp
  (p_id      IN  employees.employee_id%TYPE,
   p_name    OUT employees.last_name%TYPE,
   p_salary  OUT employees.salary%TYPE) 
IS
BEGIN
  SELECT last_name, salary 
  INTO   p_name, p_salary
  FROM   employees   
  WHERE  employee_id = p_id;
END query_emp;
/

DECLARE
  v_emp_name employees.last_name%TYPE;
  v_emp_sal  employees.salary%TYPE;
BEGIN
  query_emp(171, v_emp_name, v_emp_sal);
  DBMS_OUTPUT.PUT_LINE(v_emp_name || ' earns ' || 
    TO_CHAR(v_emp_sal, '$999,999.00'));
END;
/

CREATE OR REPLACE PROCEDURE format_phone
  (p_phone_no IN OUT VARCHAR2) 
IS
BEGIN
  p_phone_no := '(' || SUBSTR(p_phone_no,1,3) ||
                ')' || SUBSTR(p_phone_no,4,3) ||
                '-' || SUBSTR(p_phone_no,7);
END format_phone;
/

VARIABLE b_phone_no VARCHAR2(15);
EXECUTE :b_phone_no := '0534212460';
PRINT b_phone_no;
EXECUTE format_phone (:b_phone_no);
PRINT b_phone_no;

-- <모든 문제 IN 매개변수 모드 사용>

-- 1.
-- 주민등록번호를 입력하면 
-- 다음과 같이 출력되도록 yedam_ju 프로시저를 작성하시오.

-- EXECUTE yedam_ju(9501011667777)
--   -> 950101-1******
CREATE OR REPLACE PROCEDURE yedam_ju
  (jumin IN OUT VARCHAR2) 
IS
BEGIN
  jumin := SUBSTR(jumin,1,6) || '-' || 
           SUBSTR(jumin,7,1) ||
           RPAD('*', LENGTH(jumin)-7, '*');
END yedam_ju;
/

VARIABLE jumin VARCHAR2(13);
EXECUTE :jumin := '9501011667777';
PRINT jumin;
EXECUTE yedam_ju(:jumin);
PRINT jumin;
EXECUTE yedam_ju(:jumin);

-- 2.
-- 사원번호를 입력할 경우
-- 삭제하는 TEST_PRO 프로시저를 생성하시오.
-- 단, 해당사원이 없는 경우 "해당사원이 없습니다." 출력
-- 예) EXECUTE TEST_PRO(176)
CREATE OR REPLACE PROCEDURE TEST_PRO
  (empno IN NUMBER) 
IS
BEGIN
  DELETE FROM employees
  WHERE  employee_id = empno;
  
  IF SQL%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('해당사원이 없습니다.');
  END IF;
END TEST_PRO;
/

EXECUTE TEST_PRO(176);

-- 3.
-- 다음과 같이 PL/SQL 블록을 실행할 경우 
-- 사원번호를 입력할 경우 사원의 이름(last_name)의 첫번째 글자를 제외하고는
-- '*'가 출력되도록 yedam_emp 프로시저를 생성하시오.

-- 실행) EXECUTE yedam_emp(176)
-- 실행결과) TAYLOR -> T*****  <- 이름 크기만큼 별표(*) 출력
CREATE OR REPLACE PROCEDURE yedam_emp
  (empno IN NUMBER) 
IS
  v_lname employees.last_name%TYPE;
BEGIN
  SELECT last_name
  INTO   v_lname
  FROM   employees
  WHERE  employee_id = empno;
  
  v_lname := SUBSTR(v_lname, 1, 1) || 
             RPAD('*', LENGTH(v_lname) - 1, '*');
  DBMS_OUTPUT.PUT_LINE(v_lname);
END yedam_emp;
/

EXECUTE yedam_emp(176);


------------ practice ----------------------
-- 2.
DECLARE
  v_deptno   employees.department_id%TYPE;
  v_jobno    employees.job_id%TYPE;
  v_sal      employees.salary%TYPE;
  v_year_sal employees.salary%TYPE;
BEGIN
  SELECT department_id, job_id, salary, ROUND((salary+salary*NVL(commission_pct,0))*12)
  INTO   v_deptno, v_jobno, v_sal, v_year_sal
  FROM   employees
  WHERE  employee_id = &id;
  
  DBMS_OUTPUT.PUT_LINE('부서번호:' || v_deptno || ', 직무:' || v_jobno || ', 급여:' || v_sal || ', 연봉:' || v_year_sal);
END;
/

-- 3.
DECLARE
  v_lname employees.last_name%TYPE;
  v_emp_type VARCHAR2(40);
BEGIN
  SELECT last_name,
         CASE WHEN TO_CHAR(hire_date, 'YYYY/MM/DD') >= '2005/01/01' THEN 'New employee'
                                                                    ELSE 'Career employee'
         END
  INTO   v_lname, v_emp_type
  FROM   employees 
  WHERE  employee_id = &id;
  
  DBMS_OUTPUT.PUT_LINE(v_lname || '은 ' || v_emp_type);
END;
/

-- 4.
BEGIN
  FOR i IN 1 .. 9 LOOP
    IF MOD(i, 2) = 1 THEN
      FOR j IN 1 .. 9 LOOP
        DBMS_OUTPUT.PUT_LINE(i || ' x ' || j || ' = ' || i*j);  
      END LOOP;                     
    END IF;  
  END LOOP;                           
END;
/

-- 5.
DECLARE
  CURSOR c_emp_cursor IS
    SELECT employee_id, last_name, salary
    FROM   employees
    WHERE  department_id = &id;
    
  v_emp_record c_emp_cursor%ROWTYPE;   
BEGIN
  OPEN c_emp_cursor;
  
  LOOP
    FETCH c_emp_cursor INTO v_emp_record;
    EXIT WHEN c_emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(c_emp_cursor%ROWCOUNT || ' ' || v_emp_record.employee_id || v_emp_record.last_name || v_emp_record.salary);
  END LOOP;
  CLOSE c_emp_cursor;
END;
/

-- 6.
CREATE OR REPLACE PROCEDURE sal_update
  (empno IN employees.employee_id%TYPE,
   pct   IN NUMBER)
IS
  e_emp_not_found EXCEPTION;
BEGIN
  UPDATE employees
  SET    salary = salary + (salary*pct/100)
  WHERE  employee_id = empno;
  
  IF SQL%ROWCOUNT = 0 THEN
    RAISE e_emp_not_found;
  END IF;  
  
EXCEPTION
  WHEN e_emp_not_found THEN
    DBMS_OUTPUT.PUT_LINE('No Search employee!!');    
END sal_update;
/
EXECUTE sal_update(190, 10);

-- 11.
DECLARE
  v_star VARCHAR2(10);
BEGIN
  FOR i IN 1 .. 8 LOOP
    v_star := v_star || '*';
    DBMS_OUTPUT.PUT_LINE(v_star);
  END LOOP;
END;
/
