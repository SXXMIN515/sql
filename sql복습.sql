CREATE TABLE department (
  deptid NUMBER(10) PRIMARY KEY,
  deptname VARCHAR2(10),
  location VARCHAR2(10),
  tel VARCHAR2(15)
);

CREATE TABLE employee (
  empid NUMBER(10) PRIMARY KEY,
  empname VARCHAR2(10),
  hiredate DATE,
  addr VARCHAR2(12),
  tel VARCHAR2(15),
  deptid NUMBER(10),
  CONSTRAINT fk_deptid FOREIGN KEY (deptid)
  REFERENCES department (deptid)
);

ALTER TABLE employee
ADD birthday DATE;

INSERT INTO department (
  deptid
 ,deptname
 ,location
 ,tel
)
VALUES (
  1001
 ,'총무팀'
 ,'본101호'
 ,'053-777-8777'
);

INSERT INTO department (
  deptid
 ,deptname
 ,location
 ,tel
)
VALUES(
  1002
 ,'회계팀'
 ,'본102호'
 ,'053-888-9999'
);
INSERT INTO department (
  deptid
 ,deptname
 ,location
 ,tel
)
VALUES(
  1003
 ,'영업팀'
 ,'본103호'
 ,'053-222-3333'
);

SELECT * 
FROM department;

INSERT INTO employee (
  empid
 ,empname
 ,hiredate
 ,addr
 ,tel
 ,deptid
)
VALUES(
  20121945
 ,'박민수'
 ,'20120302'
 ,'대구'
 ,'010-1111-1234'
 ,1001
);

INSERT INTO employee (
  empid
 ,empname
 ,hiredate
 ,addr
 ,tel
 ,deptid
)
VALUES(
  20101817
 ,'박준식'
 ,'20100901'
 ,'경산'
 ,'010-2222-1234'
 ,1003
);

INSERT INTO employee (
  empid
 ,empname
 ,hiredate
 ,addr
 ,tel
 ,deptid
)
VALUES(
  20101817
 ,'박준식'
 ,'20100901'
 ,'경산'
 ,'010-2222-1234'
 ,1003
);

-- 9.
ALTER TABLE employee
MODIFY empname NOT NULL;

-- 10.
SELECT e.empname
      ,e.hiredate
      ,d.deptname
FROM employee e
JOIN department d
ON e.deptid = d.deptid
WHERE d.deptname = '총무팀';

-- 11.
DELETE FROM employee
WHERE addr = '대구';

-- 12.
UPDATE employee
SET deptid = (SELECT deptid
              FROM department
              WHER deptname = '회계팀')
WHERE deptid = (SELECT deptid
                FROM department
                WHER deptname = '영업팀');

-- 13.
SELECT e.empid
      ,e.empname
      ,e.birthday
      ,d.deptname
FROM employee e
JOIN department d
ON e.deptid = d.deptid
WHERE e.hiredate > (SELECT hiredate
                    FROM employee
                    WHERE empid = '20121729');

-- 14.
CREATE VIEW v_emp
AS
    SELECT e.empname
          ,e.addr
          ,d.deptname
    FROM employee e
    JOIN department d
    ON e.deptid = d.deptid
    WHERE d.deptname = '총무팀';
    
SELECT * 
FROM v_emp;


-- 1.
SELECT employee_id
      ,first_name
      ,last_name
      ,email
      ,phone_number
      ,hire_date
      ,job_id
FROM employees
WHERE hire_date >= '2002/01/01'
AND UPPER(job_id) = 'ST_CLERK';

-- 2.
SELECT last_name
      ,job_id
      ,salary
      ,commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC;

-- 3.
SELECT 'The salary of King after a 10% raise is ' || ROUND(salary * 1.1) AS "New salary"
FROM employees
WHERE commission_pct IS NULL
ORDER BY salary DESC;

-- 4.
SELECT last_name
      ,ROUND(MONTHS_BETWEEN(SYSDATE, hire_date) / 12) AS "YEARS"
      ,ROUND(MOD(MONTHS_BETWEEN(SYSDATE, hire_date), 12)) AS "MONTHS"
FROM employees;

-- 5.
SELECT last_name
FROM employees
WHERE last_name LIKE 'J%' 
   OR last_name LIKE 'K%' 
   OR last_name LIKE 'L%' 
   OR last_name LIKE 'M%';
   
SELECT last_name
FROM   employees
WHERE SUBSTR(last_name, 1, 1) IN ('J', 'K', 'L', 'M');

-- 6. 
SELECT last_name
      ,salary
      ,CASE WHEN commission_pct IS NOT NULL THEN 'Yes'
            WHEN commission_pct IS NULL     THEN 'No'
       END AS com
FROM   employees
ORDER BY salary DESC;

-- 6-1.
SELECT last_name
      ,salary
      ,CASE WHEN job_id = 'AC_ACCOUNT' THEN salary*1.1
            WHEN job_id = 'IT_PROG'    THEN salary*1.2
            WHEN job_id = 'ST_MAN'     THEN salary*1.3
                                       ELSE salary
       END AS "인상된 급여" 
FROM   employees
ORDER BY salary DESC;

-- 6-2.
SELECT last_name
      ,salary
      ,CASE WHEN salary <= 20000 THEN ROUND(salary*1.2)
            WHEN salary <= 30000 THEN ROUND(salary*1.15)
            WHEN salary <= 50000 THEN ROUND(salary*1.1)
                                 ELSE salary
       END AS "인상된 급여" 
FROM   employees
ORDER BY salary DESC;

-- 7.
SELECT d.department_name
      ,d.location_id
      ,e.last_name
      ,e.job_id
      ,e.salary
FROM   departments d
JOIN   employees e
  ON   d.department_id = e.department_id
WHERE  d.location_id = 1800;

-- 8.
SELECT COUNT(*)
FROM employees
WHERE last_name LIKE '%n';

SELECT COUNT(*)
FROM employees
WHERE SUBSTR(last_name, -1, 1) IN ('n'); 


SELECT *
FROM employees;
