select *
from tab;

select *
from employees;

SELECT *
FROM jobs;

SELECT *
FROM departments;

SELECT *
FROM locations;

-- 198번 
SELECT e.first_name
      ,e.department_id
      ,d.department_name
      ,l.city
      ,l.street_address
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
WHERE e.employee_id = 198;

-- 직무가 programmer인 사람들이 어떤 도시에 있는지
SELECT DISTINCT l.city
      ,l.street_address
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
WHERE j.job_title = 'Programmer';

-- IT 부서의 매니저 정보
SELECT DISTINCT e2.*
FROM departments d
JOIN employees e1
ON d.manager_id = e1.manager_id
JOIN employees e2
ON e1.manager_id = e2.employee_id
WHERE d.department_name = 'IT';

-- jobs 테이블의 min_salary, max_salary
-- employees job_id 직무 salary 급여.
-- where 조건 not exists (select ... from ...)
SELECT /*+ INDEX(e EMP_EMP_ID_PK)*/ e.*
FROM employees e
WHERE NOT EXISTS (SELECT 1
                  FROM jobs j
                  WHERE e.job_id = j.job_id
                  AND e.salary BETWEEN j.min_salary AND j.max_salary); 
                  
UPDATE employees
SET salary = 20000
WHERE employee_id = 198;

------------------------------------------
--1.
SELECT employee_id AS "사원번호"
      ,last_name AS "이름"
      ,salary AS "급여"
      ,department_id AS "부서번호"
FROM employees
WHERE salary BETWEEN 7000 AND 12000
AND last_name LIKE 'H%';

--2.
SELECT employee_id AS "사원번호"
      ,last_name AS "이름"
      ,job_id AS "업무"
      ,salary AS "급여"
      ,department_id AS "부서번호"
FROM employees
WHERE department_id IN (50, 60)
AND salary > 5000;

--3.
SELECT last_name AS "사원이름"
      ,salary AS "급여"
      ,CASE WHEN salary <= 5000 THEN salary*1.2
            WHEN salary <= 10000 THEN salary*1.15
            WHEN salary <= 15000 THEN salary*1.1
                                 ELSE salary
       END AS "인상된 급여"                                 
FROM employees
WHERE employee_id = &empid;

--4.
SELECT d.department_id AS "부서번호"
      ,d.department_name AS "부서이름"
      ,l.city AS "도시명"
FROM departments d
JOIN locations l
ON d.location_id = l.location_id;

--5.
SELECT employee_id AS "사원번호"
      ,last_name AS "이름"
      ,job_id AS "업무"
FROM employees
WHERE department_id = (SELECT department_id
                       FROM departments
                       WHERE department_name = 'IT');
                    
--6.
SELECT employee_id
      ,first_name
      ,last_name
      ,email
      ,phone_number
      ,TO_CHAR(hire_date, 'DD-MON-RR') AS "HIRE_DATE"
      ,job_id
FROM employees
WHERE hire_date < '2004/01/01'
AND job_id = 'ST_CLERK';

--7.
SELECT last_name
      ,job_id
      ,salary
      ,commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC;

--8.
CREATE TABLE prof (
  profno NUMBER(4),
  name VARCHAR2(15) NOT NULL,
  id VARCHAR2(15) NOT NULL,
  hiredate DATE,
  pay NUMBER(4)
);

--9.(1).
INSERT INTO prof (profno, name, id, hiredate, pay)
VALUES (1001, 'Mark', 'm1001', '07/03/01', 800);
INSERT INTO prof (profno, name, id, hiredate)
VALUES (1003, 'Adam', 'a1003', '11/03/02');
COMMIT;
--9.(2).
UPDATE prof
SET pay = 1200
WHERE profno = 1001;
--9.(3).
DELETE FROM prof
WHERE profno = 1003;

--10.(1)
ALTER TABLE prof MODIFY profno PRIMARY KEY;
--10.(2)
ALTER TABLE prof ADD gender CHAR(3);
--10.(3)
ALTER TABLE prof MODIFY name VARCHAR2(20);