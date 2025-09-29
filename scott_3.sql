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
  no NUMBER(3) PRIMARY KEY, -- 회원번호 1 ~ 999
  name VARCHAR2(100) NOT NULL, -- 이름 hongkildon
  birth DATE DEFAULT SYSDATE -- 생년월일 TO_DATE('2020-01-01', 'RRRR-MM-DD')
);

ALTER TABLE new_table ADD phone VARCHAR2(20);

ALTER TABLE new_table read only;

SELECT *
FROM new_table;
ALTER TABLE new_table ADD info GENERATED always AS (no || '-' || name);

ALTER TABLE new_table RENAME COLUMN phone TO tel; -- 컬럼명 수정
ALTER TABLE new_table MODIFY tel VARCHAR2(30); -- 데이터 타입 수정
ALTER TABLE new_table DROP COLUMN tel; -- 컬럼 삭제

-- 추가
INSERT INTO new_table (no, name)
VALUES(1, '홍길동');
INSERT INTO new_table (no, name, birth)
VALUES(2, '홍길동', '2001-01-01');
INSERT INTO new_table (no, name, birth) -- read only로 바꾼 후 추가 불가능 
VALUES(3, '홍길동', '2001-01-01');

-- 수정
UPDATE new_table
SET phone = '010-1111-1111'
WHERE no = 1;
UPDATE new_table
SET phone = '010-2222-2222',
    birth = TO_DATE('2001-02-02','RRRR-MM-DD')
WHERE no = 2;

DESC new_table;

TRUNCATE TABLE new_table; -- 데이터 삭제
DROP TABLE new_table purge; -- 테이블 삭제 purge 바로 삭제 휴지통 X
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

CREATE TABLE prof_1 ( -- 테이블은 자동 COMMIT.
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
       -- hpage를 이메일 도메인 주소를 회사의 홈페이지로 변경.
       hpage = DECODE(hpage, NULL, 'http://www.' || SUBSTR(email, INSTR(email, '@')+1), hpage)
WHERE 1 = 1;

-- 삭제
DELETE FROM professor
WHERE hpage IS NOT NULL;

-- dept 삭제.
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
              
-- 개인 프로젝트
-- 게시판, 회원관리, 상품관리 ->               
-- 오라클서버 --- 웹서버(노드) --- 클라이언트(fetch)
SELECT *
FROM emp
ORDER BY hiredate;            

-- sal => 1000 변경. 테이블: emp
UPDATE emp
SET sal = 1000
WHERE sal < 1000;

-- SALESMAN직무 -> comm 500미만인 사원 => 500 변경.
UPDATE emp
SET comm = 500
WHERE job = 'SALESMAN'
AND comm < 500;

-- 1981년 전반기에 입사한 사원(1~6월) => 10% 인상.
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
-- Rene Russo 학생의 담당교수의 번호, 이름, position 확인.
SELECT p.profno
      ,p.name
      ,p.position
FROM professor p
JOIN student s
ON s.profno = p.profno
WHERE s.name = 'Rene Russo';

-- 전공(전공1, 전공2): 'Computer Engineering' => 학생들의 학번, 이름을 확인.
SELECT s.studno
      ,s.name
FROM student s
JOIN department d
ON s.deptno1 = d.deptno
OR s.deptno2 = d.deptno
WHERE d.dname = 'Computer Engineering';

-- 학생중에 전공1 'Computer Engineering' 학생들의 담당교수의
-- 교수번호, 이름, position 확인.
SELECT DISTINCT p.profno
      ,p.name
      ,p.position
FROM professor p
JOIN student s
ON s.profno = p.profno
JOIN department d
ON s.deptno1 = d.deptno
WHERE d.dname = 'Computer Engineering';

-- 학생중에 담당교수의 position = 'assistant professor' 인 학생 확인
SELECT s.*
FROM student s
JOIN professor p
ON s.profno = p.profno
WHERE p.position = 'assistant professor';

-- 학생전공 'Computer Engineering' 몸무게의 평균보다 큰 학생 확인.
SELECT *
FROM student ss
WHERE ss.weight > (SELECT AVG(weight)
                   FROM student s
                   JOIN department d
                   ON s.deptno1 = d.deptno
                   WHERE d.dname = 'Computer Engineering');
                   
-- 전공: Electronic Engineering 학생들의 담당교수.
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
-- 담당교수 급여(pay)의 평균 이상 급여를 받는 교수번호, 이름 확인.
SELECT profno
      ,name
FROM professor 
WHERE pay > (SELECT AVG(pay)
             FROM professor);
             
-- 보너스를 못받는 사람중에 입사일이 가장 빠른 사람보다 입사일이 빠른 사람 확인.
SELECT *
FROM professor
WHERE hiredate < (SELECT MIN(hiredate)
                  FROM professor
                  WHERE bonus IS NULL)
ORDER BY hiredate;

-- 보너스를 못받는 사람보다 월급이 적은 사람 월급 10% 인상.
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

-- 학생, 담당교수 뷰.
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

-- 시퀀스 사용
CREATE SEQUENCE board_t_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 9999999999999
MINVALUE 1
CYCLE -- MAX 넘으면 1부터 다시 시작
;

DROP SEQUENCE board_t_seq;
SELECT board_t_seq.nextval FROM dual;

DELETE FROM board_t
WHERE board_no =1;

-- 1, 게시판글연습, 게시판이잘되는지 연습합니다, 홍길동
INSERT INTO board_t (board_no, title, content ,writer)
VALUES (board_t_seq.nextval, '게시판글연습', '게시판이 잘되는지 연습합니다', '홍길동');
-- 2
INSERT INTO board_t (board_no, title, content ,writer)
VALUES (board_t_seq.nextval, '두더지게시판', '두더지는 무섭습니다', '김길동');
-- 3
INSERT INTO board_t (board_no, title, content ,writer)
VALUES (board_t_seq.nextval, 'sql재밌네', 'sql중에 join은 어렵지만 재밌네요.', '박석민');
-- 4
INSERT INTO board_t (board_no, title, content ,writer)
VALUES (board_t_seq.nextval, '삭제는 어떻게 해요', 'delete from 테이블 where 조건절', '김민수');

SELECT *
FROM board_t
ORDER BY board_no;

INSERT INTO board_t (board_no, title, content, writer)
SELECT board_t_seq.nextval, title, content, writer
FROM board_t;

ALTER TABLE board_t MODIFY board_no NUMBER(10);