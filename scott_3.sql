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
  no NUMBER(3) PRIMARY KEY, -- ?öå?õêÎ≤àÌò∏ 1 ~ 999
  name VARCHAR2(100) NOT NULL, -- ?ù¥Î¶? hongkildon
  birth DATE DEFAULT SYSDATE -- ?Éù?ÖÑ?õî?ùº TO_DATE('2020-01-01', 'RRRR-MM-DD')
);

ALTER TABLE new_table ADD phone VARCHAR2(20);

ALTER TABLE new_table read only;

SELECT *
FROM new_table;
ALTER TABLE new_table ADD info GENERATED always AS (no || '-' || name);

ALTER TABLE new_table RENAME COLUMN phone TO tel; -- Ïª¨ÎüºÎ™? ?àò?†ï
ALTER TABLE new_table MODIFY tel VARCHAR2(30); -- ?ç∞?ù¥?Ñ∞ ???ûÖ ?àò?†ï
ALTER TABLE new_table DROP COLUMN tel; -- Ïª¨Îüº ?Ç≠?†ú

-- Ï∂îÍ?
INSERT INTO new_table (no, name)
VALUES(1, '?ôçÍ∏∏Îèô');
INSERT INTO new_table (no, name, birth)
VALUES(2, '?ôçÍ∏∏Îèô', '2001-01-01');
INSERT INTO new_table (no, name, birth) -- read onlyÎ°? Î∞îÍæº ?õÑ Ï∂îÍ? Î∂àÍ??ä• 
VALUES(3, '?ôçÍ∏∏Îèô', '2001-01-01');

-- ?àò?†ï
UPDATE new_table
SET phone = '010-1111-1111'
WHERE no = 1;
UPDATE new_table
SET phone = '010-2222-2222',
    birth = TO_DATE('2001-02-02','RRRR-MM-DD')
WHERE no = 2;

DESC new_table;

TRUNCATE TABLE new_table; -- ?ç∞?ù¥?Ñ∞ ?Ç≠?†ú
DROP TABLE new_table purge; -- ?Öå?ù¥Î∏? ?Ç≠?†ú purge Î∞îÎ°ú ?Ç≠?†ú ?ú¥Ïß??Üµ X
SELECT *
FROM user_recyclebin; 
FLASHBACK TABLE new_table TO BEFORE DROP; -- Î≥µÍµ¨

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

CREATE TABLE prof_1 ( -- ?Öå?ù¥Î∏îÏ? ?ûê?èô COMMIT.
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
       -- hpageÎ•? ?ù¥Î©îÏùº ?èÑÎ©îÏù∏ Ï£ºÏÜåÎ•? ?öå?Ç¨?ùò ?ôà?éò?ù¥Ïß?Î°? Î≥?Í≤?.
       hpage = DECODE(hpage, NULL, 'http://www.' || SUBSTR(email, INSTR(email, '@')+1), hpage)
WHERE 1 = 1;

-- ?Ç≠?†ú
DELETE FROM professor
WHERE hpage IS NOT NULL;

-- dept ?Ç≠?†ú.
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
              
-- Í∞úÏù∏ ?îÑÎ°úÏ†ù?ä∏
-- Í≤åÏãú?åê, ?öå?õêÍ¥?Î¶?, ?ÉÅ?íàÍ¥?Î¶? ->               
-- ?ò§?ùº?Å¥?ÑúÎ≤? --- ?õπ?ÑúÎ≤?(?Ö∏?ìú) --- ?Å¥?ùº?ù¥?ñ∏?ä∏(fetch)
SELECT *
FROM emp
ORDER BY hiredate;            

-- sal => 1000 Î≥?Í≤?. ?Öå?ù¥Î∏?: emp
UPDATE emp
SET sal = 1000
WHERE sal < 1000;

-- SALESMANÏßÅÎ¨¥ -> comm 500ÎØ∏Îßå?ù∏ ?Ç¨?õê => 500 Î≥?Í≤?.
UPDATE emp
SET comm = 500
WHERE job = 'SALESMAN'
AND comm < 500;

-- 1981?ÖÑ ?†ÑÎ∞òÍ∏∞?óê ?ûÖ?Ç¨?ïú ?Ç¨?õê(1~6?õî) => 10% ?ù∏?ÉÅ.
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
-- Rene Russo ?ïô?Éù?ùò ?ã¥?ãπÍµêÏàò?ùò Î≤àÌò∏, ?ù¥Î¶?, position ?ôï?ù∏.
SELECT p.profno
      ,p.name
      ,p.position
FROM professor p
JOIN student s
ON s.profno = p.profno
WHERE s.name = 'Rene Russo';

-- ?†ÑÍ≥?(?†ÑÍ≥?1, ?†ÑÍ≥?2): 'Computer Engineering' => ?ïô?Éù?ì§?ùò ?ïôÎ≤?, ?ù¥Î¶ÑÏùÑ ?ôï?ù∏.
SELECT s.studno
      ,s.name
FROM student s
JOIN department d
ON s.deptno1 = d.deptno
OR s.deptno2 = d.deptno
WHERE d.dname = 'Computer Engineering';

-- ?ïô?ÉùÏ§ëÏóê ?†ÑÍ≥?1 'Computer Engineering' ?ïô?Éù?ì§?ùò ?ã¥?ãπÍµêÏàò?ùò
-- ÍµêÏàòÎ≤àÌò∏, ?ù¥Î¶?, position ?ôï?ù∏.
SELECT DISTINCT p.profno
      ,p.name
      ,p.position
FROM professor p
JOIN student s
ON s.profno = p.profno
JOIN department d
ON s.deptno1 = d.deptno
WHERE d.dname = 'Computer Engineering';

-- ?ïô?ÉùÏ§ëÏóê ?ã¥?ãπÍµêÏàò?ùò position = 'assistant professor' ?ù∏ ?ïô?Éù ?ôï?ù∏
SELECT s.*
FROM student s
JOIN professor p
ON s.profno = p.profno
WHERE p.position = 'assistant professor';

-- ?ïô?Éù?†ÑÍ≥? 'Computer Engineering' Î™∏Î¨¥Í≤åÏùò ?èâÍ∑†Î≥¥?ã§ ?Å∞ ?ïô?Éù ?ôï?ù∏.
SELECT *
FROM student ss
WHERE ss.weight > (SELECT AVG(weight)
                   FROM student s
                   JOIN department d
                   ON s.deptno1 = d.deptno
                   WHERE d.dname = 'Computer Engineering');
                   
-- ?†ÑÍ≥?: Electronic Engineering ?ïô?Éù?ì§?ùò ?ã¥?ãπÍµêÏàò.
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
-- ?ã¥?ãπÍµêÏàò Í∏âÏó¨(pay)?ùò ?èâÍ∑? ?ù¥?ÉÅ Í∏âÏó¨Î•? Î∞õÎäî ÍµêÏàòÎ≤àÌò∏, ?ù¥Î¶? ?ôï?ù∏.
SELECT profno
      ,name
FROM professor 
WHERE pay > (SELECT AVG(pay)
             FROM professor);
             
-- Î≥¥ÎÑà?ä§Î•? Î™ªÎ∞õ?äî ?Ç¨?ûåÏ§ëÏóê ?ûÖ?Ç¨?ùº?ù¥ Í∞??û• Îπ†Î•∏ ?Ç¨?ûåÎ≥¥Îã§ ?ûÖ?Ç¨?ùº?ù¥ Îπ†Î•∏ ?Ç¨?ûå ?ôï?ù∏.
SELECT *
FROM professor
WHERE hiredate < (SELECT MIN(hiredate)
                  FROM professor
                  WHERE bonus IS NULL)
ORDER BY hiredate;

-- Î≥¥ÎÑà?ä§Î•? Î™ªÎ∞õ?äî ?Ç¨?ûåÎ≥¥Îã§ ?õîÍ∏âÏù¥ ?†Å?? ?Ç¨?ûå ?õîÍ∏? 10% ?ù∏?ÉÅ.
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

-- ?ïô?Éù, ?ã¥?ãπÍµêÏàò Î∑?.
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

-- ?ãú???ä§ ?Ç¨?ö©
CREATE SEQUENCE board_t_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 9999999999999
MINVALUE 1
CYCLE -- MAX ?Ñò?úºÎ©? 1Î∂??Ñ∞ ?ã§?ãú ?ãú?ûë
;

DROP SEQUENCE board_t_seq;
SELECT board_t_seq.nextval FROM dual;

DELETE FROM board_t
WHERE board_no =1;

-- 1, Í≤åÏãú?åêÍ∏??ó∞?äµ, Í≤åÏãú?åê?ù¥?ûò?êò?äîÏß? ?ó∞?äµ?ï©?ãà?ã§, ?ôçÍ∏∏Îèô
INSERT INTO board_t (board_no, title, content ,writer)
VALUES (board_t_seq.nextval, 'Í≤åÏãú?åêÍ∏??ó∞?äµ', 'Í≤åÏãú?åê?ù¥ ?ûò?êò?äîÏß? ?ó∞?äµ?ï©?ãà?ã§', '?ôçÍ∏∏Îèô');
-- 2
INSERT INTO board_t (board_no, title, content ,writer)
VALUES (board_t_seq.nextval, '?ëê?çîÏß?Í≤åÏãú?åê', '?ëê?çîÏß??äî Î¨¥ÏÑ≠?äµ?ãà?ã§', 'Íπ?Í∏∏Îèô');
-- 3
INSERT INTO board_t (board_no, title, content ,writer)
VALUES (board_t_seq.nextval, 'sql?û¨Î∞åÎÑ§', 'sqlÏ§ëÏóê join?? ?ñ¥?†µÏß?Îß? ?û¨Î∞åÎÑ§?öî.', 'Î∞ïÏÑùÎØ?');
-- 4
INSERT INTO board_t (board_no, title, content ,writer)
VALUES (board_t_seq.nextval, '?Ç≠?†ú?äî ?ñ¥?ñªÍ≤? ?ï¥?öî', 'delete from ?Öå?ù¥Î∏? where Ï°∞Í±¥?†à', 'Íπ?ÎØºÏàò');

SELECT *
FROM board_t
ORDER BY board_no;

INSERT INTO board_t (board_no, title, content, writer)
SELECT board_t_seq.nextval, title, content, writer
FROM board_t;

ALTER TABLE board_t MODIFY board_no NUMBER(10);