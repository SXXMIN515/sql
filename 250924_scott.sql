SELECT SYSDATE, TO_CHAR(SYSDATE, 'RRRR/MM/DD HH24:MI:SS') AS "today"
FROM dual
WHERE 1 = 1;

SELECT TO_DATE('2025-05-05 13', 'RRRR-MM-DD HH24') AS "date"
FROM dual;

SELECT empno, ename
FROM emp;

SELECT *
FROM student;

UPDATE student
SET score = 0
WHERE sno = 300;

COMMIT;

SELECT empno
      ,ename
      ,job
      ,mgr
FROM emp;

SELECT *
FROM emp;

-- 표현식사용.
SELECT empno AS "사원번호" -- 별칭(alias)
      ,ename AS "사원명" -- 
      ,'Good Morning !! ' || ename AS "welcome 메세지" -- 메세지
      ,ename || '''s 급여' || sal AS "급여" -- kim's salary
FROM emp;    

-- distinct
SELECT DISTINCT job, deptno
FROM emp
ORDER BY job DESC;

-- 연습문제 1 p.39
SELECT name || '''s ID: ' || id || ' , WEIGHT is ' || weight || 'Kg' AS "ID AND WEIGHT"
FROM student;

-- 연습문제 2 p.39
SELECT ename || '(' || job || '), ' || ename || '''' || job || '''' AS "NAME AND JOB"
FROM emp;
 
-- 연습문제 3 p.40
SELECT ename || '''s sal is $' || sal AS "Name And Sal"
FROM emp;

-- 조건절.
SELECT empno
      ,ename
      ,job
      ,mgr
      ,hiredate
      ,sal AS "Salary"
      ,comm
      ,deptno
FROM emp
WHERE empno >= 7900 and empno < 8000
AND hiredate >= '82/01/01';

SELECT *
FROM professor
WHERE 1=1
AND pay + nvl(bonus, 0) >= 300;

-- 단일행 함수 
SELECT profno
      ,LOWER(name) AS "low_name"
      ,UPPER(id) as "upp_id"
      ,INITCAP(position) as "pos"
      ,pay
      ,CONCAT(CONCAT(name, '-'), id) as "name_id"
FROM  professor
WHERE LENGTH(name) <> 10;      

SELECT name
      ,LENGTH(name) AS "length"
      ,LENGTHB('홍길동') AS "lengthb"
      ,SUBSTR(name, 1, 5) AS "substr"
      ,INSTR(name, 'a') AS "instr"
      ,pay
      ,bonus
      ,LPAD(id, 10, '*') AS "lpad"
      ,LTRIM(LPAD(id, 10, '*'), '*') AS "ltrim"
      ,RTRIM('   Hello, World    ') as "str"
      ,REPLACE('Hello', 'H', 'h') as "rep"
FROM professor
WHERE INSTR(UPPER(name), 'A') > 0;

SELECT *
FROM student;

-- SUBSTR/INSTR 퀴즈 p.79
SELECT name
      ,tel
      ,SUBSTR(tel, 1, INSTR(tel, ')')-1) AS "AREA CODE"
      ,INSTR(tel, ')')-1 AS "val"
FROM student
WHERE deptno1 = 201;

select *
from emp;

-- LPAD 퀴즈 p.81
SELECT LPAD(ename, 9, '12345') AS "LPAD"
FROM emp
WHERE deptno = 10;

-- RPAD 퀴즈 p.82
SELECT RPAD(ename, 9, '56789')
FROM emp
WHERE deptno = 10;

-- REPLACE 퀴즈 1 p.84
SELECT ename
      ,REPLACE(ename, SUBSTR(ename, 2, 2), '--') AS "REPLACE"
FROM emp
WHERE deptno = 20;

-- REPLACE 퀴즈 2 p.84
SELECT name
      ,jumin
      ,REPLACE(jumin, SUBSTR(jumin, 7, 7), '-/-/-/-') AS "REPLACE"
FROM student
WHERE deptno1 = 101;

-- REPLACE 퀴즈 3 p.85
SELECT name
      ,tel
      ,REPLACE(tel, SUBSTR(tel, (INSTR(tel, ')')+1), 3), '***') AS "REPLACE"
FROM student
WHERE deptno1 = 102;

-- REPLACE 퀴즈 4 p.85
SELECT name
      ,tel
      ,REPLACE(tel, SUBSTR(tel, INSTR(tel, '-')+1, 4), '****') AS "REPLACE"
FROM student
WHERE deptno1 = 101;

SELECT empno
      ,ename
      ,job
      ,ROUND(sal / 12, 2) AS "month"
      ,TRUNC(sal / 12) AS "trunc"
      ,MOD(sal, 12) AS "mod"
      ,CEIL(sal / 12) AS "ceil"
      ,FLOOR(sal / 12) AS "floor"
      ,POWER(4, 3) AS "pow"
FROM emp;   

SELECT MONTHS_BETWEEN('15/01/01', '10/01/02')
FROM dual;

SELECT ADD_MONTHS(SYSDATE, 2), NEXT_DAY(SYSDATE+1, '목') AS "next_day"
      ,LAST_DAY(ADD_MONTHS(SYSDATE,1)) AS "last"
FROM dual;
