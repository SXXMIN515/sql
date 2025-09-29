SELECT 'PURGE TABLE "' || tname || '";' FROM tab;

SELECT *
FROM tab;

CREATE TABLE new_emp(
 no NUMBER(4) CONSTRAINT emp_no_pk PRIMARY KEY,
 name VARCHAR2(20) CONSTRAINT emp_name_nn NOT NULL,
 jumin VARCHAR2(13) CONSTRAINT emp_jumin_nn NOT NULL
                    CONSTRAINT emp_jumin_uk UNIQUE,
 loc_code NUMBER(1) CONSTRAINT emp_area_ck CHECK (loc_code < 5),
 deptno NUMBER(2) CONSTRAINT emp_dept_fk REFERENCES dept(deptno)
);

CREATE TABLE new_table (
  no NUMBER(3) PRIMARY KEY, -- ?��?��번호 1 ~ 999
  name VARCHAR2(100) NOT NULL, -- ?���? hongkildon
  birth DATE DEFAULT SYSDATE -- ?��?��?��?�� TO_DATE('2020-01-01', 'RRRR-MM-DD')
);

ALTER TABLE new_table ADD phone VARCHAR2(20);

ALTER TABLE new_table read only;

SELECT *
FROM new_table;
ALTER TABLE new_table ADD info GENERATED always AS (no || '-' || name);

ALTER TABLE new_table RENAME COLUMN phone TO tel; -- 컬럼�? ?��?��
ALTER TABLE new_table MODIFY tel VARCHAR2(30); -- ?��?��?�� ???�� ?��?��
ALTER TABLE new_table DROP COLUMN tel; -- 컬럼 ?��?��

-- 추�?
INSERT INTO new_table (no, name)
VALUES(1, '?��길동');
INSERT INTO new_table (no, name, birth)
VALUES(2, '?��길동', '2001-01-01');
INSERT INTO new_table (no, name, birth) -- read only�? 바꾼 ?�� 추�? 불�??�� 
VALUES(3, '?��길동', '2001-01-01');

-- ?��?��
UPDATE new_table
SET phone = '010-1111-1111'
WHERE no = 1;
UPDATE new_table
SET phone = '010-2222-2222',
    birth = TO_DATE('2001-02-02','RRRR-MM-DD')
WHERE no = 2;

DESC new_table;

TRUNCATE TABLE new_table; -- ?��?��?�� ?��?��
DROP TABLE new_table purge; -- ?��?���? ?��?�� purge 바로 ?��?�� ?���??�� X
SELECT *
FROM user_recyclebin; 
FLASHBACK TABLE new_table TO BEFORE DROP; -- 복구

SELECT *
FROM tab;

DELETE FROM new_table
WHERE no = 1;

ROLLBACK;

-----------------------------------------------------
SELECT *
FROM dept2
ORDER BY dcode;
DESC dept2;

INSERT INTO dept2 (dcode, dname, pdept, area)
VALUES('9000', 'temp_1', '1006', 'temp area');
INSERT INTO dept2 (dcode, pdept, dname, area)
VALUES('9001', '1006', 'temp_2', 'temp area');

CREATE TABLE professor3 
AS
SELECT *
FROM professor
WHERE 1 = 2; -- CTAS

INSERT INTO professor3
SELECT * FROM professor; -- ITAS

SELECT *
FROM professor3;

CREATE TABLE prof_1 ( -- ?��?��블�? ?��?�� COMMIT.
 profno NUMBER,
 name VARCHAR2(25)
);
CREATE TABLE prof_2 (
 profno NUMBER,
 name VARCHAR2(25)
);

INSERT ALL
 WHEN profno BETWEEN 1000 AND 1999 THEN INTO prof_1 VALUES (profno, name)
 WHEN profno BETWEEN 2000 AND 2999 THEN INTO prof_2 VALUES (profno, name)
SELECT profno, name
FROM professor;
 
SELECT *
FROM prof_1;
SELECT *
FROM prof_2;

INSERT ALL
 INTO prof_1 VALUES (profno, name)
 INTO prof_2 VALUES (profno, name)
SELECT profno, name
FROM professor;

SELECT *
FROM professor;

UPDATE professor
SET    bonus = DECODE(bonus, NULL, 100, bonus),
       pay = pay + (pay * 0.1),
       -- hpage�? ?��메일 ?��메인 주소�? ?��?��?�� ?��?��?���?�? �?�?.
       hpage = DECODE(hpage, NULL, 'http://www.' || SUBSTR(email, INSTR(email, '@')+1), hpage)
WHERE 1 = 1;

-- ?��?��
DELETE FROM professor
WHERE hpage IS NOT NULL;

-- dept ?��?��.
SELECT * FROM dept;

DELETE FROM dept
WHERE deptno = 30;

SELECT * FROM emp
--WHERE deptno = 30
;

UPDATE emp
SET deptno = 50
WHERE deptno = 20;

SELECT *
FROM emp e, dept d
WHERE e.deptno = d.deptno;

UPDATE emp e
SET    sal = sal + 100
WHERE EXISTS (SELECT 1
              FROM dept d
              WHERE e.deptno = d.deptno
              AND d.loc = 'DALLAS');
              
SELECT *
FROM emp e
WHERE EXISTS (SELECT 1
              FROM dept d
              WHERE e.deptno = d.deptno
              AND d.loc = 'DALLAS');
              
-- 개인 ?��로젝?��
-- 게시?��, ?��?���?�?, ?��?���?�? ->               
-- ?��?��?��?���? --- ?��?���?(?��?��) --- ?��?��?��?��?��(fetch)
SELECT *
FROM emp
ORDER BY hiredate;            

-- sal => 1000 �?�?. ?��?���?: emp
UPDATE emp
SET sal = 1000
WHERE sal < 1000;

-- SALESMAN직무 -> comm 500미만?�� ?��?�� => 500 �?�?.
UPDATE emp
SET comm = 500
WHERE job = 'SALESMAN'
AND comm < 500;

-- 1981?�� ?��반기?�� ?��?��?�� ?��?��(1~6?��) => 10% ?��?��.
UPDATE emp
SET sal = sal*1.1
WHERE hiredate < TO_DATE('1981/07', 'RRRR/MM')
AND hiredate >= TO_DATE('1981/01', 'RRRR/MM');


SELECT DISTINCT position
FROM professor;

SELECT *
FROM professor;

SELECT *
FROM student;

SELECT distinct height
FROM student
order by height desc;

SELECT *
FROM department;
-- Rene Russo ?��?��?�� ?��?��교수?�� 번호, ?���?, position ?��?��.
SELECT p.profno
      ,p.name
      ,p.position
FROM professor p
JOIN student s
ON s.profno = p.profno
WHERE s.name = 'Rene Russo';

-- ?���?(?���?1, ?���?2): 'Computer Engineering' => ?��?��?��?�� ?���?, ?��름을 ?��?��.
SELECT s.studno
      ,s.name
FROM student s
JOIN department d
ON s.deptno1 = d.deptno
OR s.deptno2 = d.deptno
WHERE d.dname = 'Computer Engineering';

-- ?��?��중에 ?���?1 'Computer Engineering' ?��?��?��?�� ?��?��교수?��
-- 교수번호, ?���?, position ?��?��.
SELECT DISTINCT p.profno
      ,p.name
      ,p.position
FROM professor p
JOIN student s
ON s.profno = p.profno
JOIN department d
ON s.deptno1 = d.deptno
WHERE d.dname = 'Computer Engineering';

-- ?��?��중에 ?��?��교수?�� position = 'assistant professor' ?�� ?��?�� ?��?��
SELECT s.*
FROM student s
JOIN professor p
ON s.profno = p.profno
WHERE p.position = 'assistant professor';

-- ?��?��?���? 'Computer Engineering' 몸무게의 ?��균보?�� ?�� ?��?�� ?��?��.
SELECT *
FROM student ss
WHERE ss.weight > (SELECT AVG(weight)
                   FROM student s
                   JOIN department d
                   ON s.deptno1 = d.deptno
                   WHERE d.dname = 'Computer Engineering');
                   
-- ?���?: Electronic Engineering ?��?��?��?�� ?��?��교수.
SELECT *
FROM professor pp
WHERE pp.profno IN (SELECT p.profno 
                    FROM professor p
                    JOIN student s
                    ON p.profno = s.profno
                    JOIN department d
                    ON s.deptno1 = d.deptno
                    WHERE d.dname = 'Electronic Engineering');  

SELECT *
FROM professor
ORDER BY pay ;
-- ?��?��교수 급여(pay)?�� ?���? ?��?�� 급여�? 받는 교수번호, ?���? ?��?��.
SELECT profno
      ,name
FROM professor 
WHERE pay > (SELECT AVG(pay)
             FROM professor);
             
-- 보너?���? 못받?�� ?��?��중에 ?��?��?��?�� �??�� 빠른 ?��?��보다 ?��?��?��?�� 빠른 ?��?�� ?��?��.
SELECT *
FROM professor
WHERE hiredate < (SELECT MIN(hiredate)
                  FROM professor
                  WHERE bonus IS NULL)
ORDER BY hiredate;

-- 보너?���? 못받?�� ?��?��보다 ?��급이 ?��?? ?��?�� ?���? 10% ?��?��.
UPDATE professor
SET pay = pay*1.1
WHERE bonus IS NOT NULL
AND pay < (SELECT MAX(pay)
                  FROM professor
                  WHERE bonus IS NULL);
                  
SELECT *
FROM dept;

SELECT *
FROM emp;

-- view
CREATE OR REPLACE VIEW emp_dept_v
AS
SELECT empno, ename, job, sal, e.deptno, dname, comm
FROM emp e
JOIN dept d
ON e.deptno = d.deptno;

SELECT *
FROM emp_dept_v;

CREATE OR REPLACE VIEW emp_v
AS
SELECT empno, ename, job, deptno
FROM emp;

UPDATE emp_v
SET ename = ''
   ,deptno = ''
WHERE empno = '9999';

SELECT * FROM emp_v;

SELECT * FROM tab;

SELECT v.*, d.dname
FROM stud_prof_v v
JOIN department d
ON v.deptno = d.deptno
WHERE position = 'a full professor';

-- ?��?��, ?��?��교수 �?.
CREATE OR REPLACE VIEW stud_prof_v
AS
SELECT s.studno
      ,s.name studname
      ,s.birthday
      ,s.tel
      ,s.deptno1 deptno
      ,p.profno
      ,p.name profname
      ,position
      ,p.email
FROM student s
LEFT OUTER JOIN professor p
ON s.profno = p.profno;

SELECT *
FROM stud_prof_v;
  
CREATE TABLE board_t (
  board_no NUMBER(5) PRIMARY KEY,
  title VARCHAR2(100) NOT NULL,
  content VARCHAR2(1000) NOT NULL,
  writer VARCHAR2(50) NOT NULL,
  write_date DATE DEFAULT SYSDATE,
  likes NUMBER(3) DEFAULT 0
);

SELECT *
FROM board_t;

SELECT MAX(board_no)+1 FROM board_t;

-- ?��???�� ?��?��
CREATE SEQUENCE board_t_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 9999999999999
MINVALUE 1
CYCLE -- MAX ?��?���? 1�??�� ?��?�� ?��?��
;

DROP SEQUENCE board_t_seq;
SELECT board_t_seq.nextval FROM dual;

DELETE FROM board_t
WHERE board_no =1;

-- 1, 게시?���??��?��, 게시?��?��?��?��?���? ?��?��?��?��?��, ?��길동
INSERT INTO board_t (board_no, title, content ,writer)
VALUES (board_t_seq.nextval, '게시?���??��?��', '게시?��?�� ?��?��?���? ?��?��?��?��?��', '?��길동');
-- 2
INSERT INTO board_t (board_no, title, content ,writer)
VALUES (board_t_seq.nextval, '?��?���?게시?��', '?��?���??�� 무섭?��?��?��', '�?길동');
-- 3
INSERT INTO board_t (board_no, title, content ,writer)
VALUES (board_t_seq.nextval, 'sql?��밌네', 'sql중에 join?? ?��?���?�? ?��밌네?��.', '박석�?');
-- 4
INSERT INTO board_t (board_no, title, content ,writer)
VALUES (board_t_seq.nextval, '?��?��?�� ?��?���? ?��?��', 'delete from ?��?���? where 조건?��', '�?민수');

SELECT *
FROM board_t
ORDER BY board_no;

INSERT INTO board_t (board_no, title, content, writer)
SELECT board_t_seq.nextval, title, content, writer
FROM board_t;

ALTER TABLE board_t MODIFY board_no NUMBER(10);