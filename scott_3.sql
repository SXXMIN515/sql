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