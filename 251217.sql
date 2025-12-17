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