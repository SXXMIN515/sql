SELECT *
FROM tab;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'RRRR/MM/DD') AS "system"
      ,TO_CHAR(12345.6, '$099,999.99') AS "num"
FROM dual;

SELECT empno
      ,ename
      ,job
      ,TO_CHAR(sal, '999,999') AS "salary"
FROM emp;

SELECT *
FROM professor
WHERE hiredate >= TO_DATE('1990/01/01 09:00:00', 'RRRR/MM/DD HH24:MI:SS')
AND hiredate < TO_DATE('2000/01/01 00:00:00', 'RRRR/MM/DD HH24:MI:SS');

SELECT *
FROM emp
WHERE sal + NVL(comm, 0) >= 2000;

-- NVL ?��?�� ?�즈 p.112
SELECT profno
      ,name
      ,pay
      ,NVL(bonus, 0)
      ,(pay * 12 + NVL(bonus, 0)) AS "TOTAL"
FROM professor
WHERE deptno = 201;

SELECT profno
      ,name
      ,NVL2(bonus, (pay*12)+bonus, (pay*12)) AS "total"
FROM professor;

-- NVL2 ?��?�� ?�즈 p.113
SELECT empno
      ,ename
      ,comm
      ,NVL2(comm, 'Exist', 'NULL') AS "NVL2"
FROM emp
WHERE deptno = 30;

-- sal > 30 ? '�?' : '�?2'
SELECT empno
      ,ename
      ,DECODE(job, 'SALESMAN', '?��?���??��', DECODE(job, 'MANAGER', '�?리�??��', '기�?�??��')) AS "dept"
      ,job
FROM emp;

-- DECODE ?�즈 1
SELECT name
      ,jumin
      ,DECODE(SUBSTR(jumin, 7, 1), 1, 'MAN', 2, 'WOMAN') AS "Gender"
FROM student
WHERE deptno1= 101;

-- DECODE ?�즈 2
SELECT name
      ,tel
      ,DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '02', 'SEOUL'
                                               , '031', 'GYEONGGI'
                                               , '051', 'BUSAN'
                                               , '052', 'ULSAN'              
                                               , '055', 'GYEONGNAM'
      )  AS "LOC"
FROM student
WHERE deptno1 = 101;

SELECT name
      ,tel
      ,CASE SUBSTR(tel, 1, INSTR(tel, ')')-1) WHEN '02' THEN 'SEOUL'
                                              WHEN '031' THEN 'GYEONGGI'
                                              WHEN '051' THEN 'BUSAN'
                                              WHEN '052' THEN 'ULSAN'
                                              WHEN '055' THEN 'GYEONGNAM'
                                                         ELSE '기�?'
      END AS "LOC"
FROM student
WHERE deptno1 = 101;

SELECT profno
      ,name
      ,position
      ,pay*12 AS "pay"
      ,CASE WHEN pay*12 > 5000 THEN 'High'
            WHEN pay*12 > 4000 THEN 'Mid'
            WHEN pay*12 > 3000 THEN 'Low'
                               ELSE 'Etc'
      END AS "Sal"
FROM professor
WHERE CASE WHEN pay*12 > 5000 THEN 'High'
           WHEN pay*12 > 4000 THEN 'Mid'
           WHEN pay*12 > 3000 THEN 'Low'
                              ELSE 'Etc'
      END = 'High';
      
-- CASE�? ?�즈 p.123
SELECT empno
      ,ename
      ,sal
      ,CASE WHEN sal BETWEEN 1 AND 1000 THEN 'LEVEL 1'
            WHEN sal BETWEEN 1001 AND 2000 THEN 'LEVEL 2'
            WHEN sal BETWEEN 2001 AND 3000 THEN 'LEVEL 3'
            WHEN sal BETWEEN 3001 AND 4000 THEN 'LEVEL 4'
            WHEN 4001<=sal THEN 'LEVEL 5'
      END AS "LEVEL"
FROM emp
ORDER BY sal DESC;

SELECT *
FROM department;

SELECT profno
      ,name
      ,'Professon'
      ,pay
FROM professor
WHERE deptno = 101
UNION
SELECT studno
      ,name
      ,'Student'
      ,0
FROM student
WHERE deptno1 = 101;

SELECT MIN(job)
      ,COUNT(*) AS "?��?��"
      ,SUM(sal) AS "직무 급여 ?���?"
      ,AVG(sal) AS "급여?���?"
      ,STDDEV(sal) AS "?���??���?"
      ,VARIANCE(sal) AS "분산"
FROM emp
GROUP BY job;

SELECT TO_CHAR(hiredate, 'RRRR') AS "HD"
      ,COUNT(*) AS "?��?��"
FROM emp
GROUP BY TO_CHAR(hiredate, 'RRRR');

-- ?��?��, ?��과별 ?��?��.
SELECT deptno1
      ,COUNT(*) AS "?��?��"
FROM student
GROUP BY deptno1
HAVING COUNT(*) > 2;

-- 교수, position, pay?���?, 최고급여, 최�?급여 출력
SELECT position
      ,SUM(pay) AS "급여?���?"
      ,MAX(pay) AS "최고급여"
      ,MIN(pay) AS "최�?급여"
FROM professor
GROUP BY position;

-- ?��?��, �??���? ?��균급?��, ?��?��.
-- ?��?��, �??��, 직무�? ?��균급?��, ?��?��
-- ?��?��, ?��균급?��, ?��?��.

SELECT deptno
      ,NULL
      ,ROUND(AVG(sal)) AS "?��균급?��"
      ,COUNT(*) AS "?��?��"
      ,'a'
FROM emp
GROUP BY deptno
UNION
SELECT deptno
      ,job
      ,ROUND(AVG(sal)) AS "?��균급?��"
      ,COUNT(*) AS "?��?��"
      ,'b'
FROM emp
GROUP BY deptno, job
UNION
SELECT NULL
      ,NULL
      ,ROUND(AVG(sal)) AS "?��균급?��"
      ,COUNT(*) AS "?��?��"
      ,'c'
FROM emp
ORDER BY 1, 2;

SELECT DECODE(NVL(deptno, 999), 999, '?���?', deptno) AS "�??��"
      ,NVL(job, '?���?') AS "직무"
      ,ROUND(AVG(sal)) AS "?��균급?��"
      ,COUNT(*) AS "?��?��?��"
FROM emp
GROUP BY ROLLUP(deptno, job)
ORDER BY 1, 2;

SELECT DECODE(NVL(deptno, 999), 999, '?���?', deptno) AS "�??��"
      ,NVL(job, '?���?') AS "직무"
      ,ROUND(AVG(sal)) AS "?��균급?��"
      ,COUNT(*) AS "?��?��?��"
FROM emp
GROUP BY CUBE(deptno, job)
ORDER BY 1, 2;

SELECT COUNT(*) -- 12�?.
FROM emp;
SELECT COUNT(*) -- 4�?.
FROM dept;

SELECT COUNT(*) --dept.*, emp.*
FROM emp, dept;

SELECT studno
      ,s.name AS "?��?���?"
      ,s.grade
      ,p.name AS "교수�?"
      ,s.deptno1
      ,d.dname AS "?��과명"
FROM student s -- 교수번호
LEFT OUTER JOIN professor p
ON s.profno = p.profno
JOIN department d
ON s.deptno1 = d.deptno;

SELECT p.profno
      ,p.name
      ,s.studno
      ,s.name
      ,s.profno AS "?��?��교수"
FROM professor p
LEFT OUTER JOIN student s
ON p.profno = s.profno;

SELECT *
FROM student;

SELECT *
FROM salgrade;

SELECT s.grade
      ,e.*
FROM emp e
JOIN salgrade s
ON e.sal >= s.losal
AND e.sal <= s.hisal
WHERE s.grade = 2;

-- oracle join.
SELECT e.*
      ,d.*
FROM emp e, dept d
WHERE e.deptno = d.deptno;

SELECT e1.empno AS "?��?��번호"
      ,e1.ename AS "?��?���?"
      ,e2.empno AS "�?리자번호"
      ,e2.ename AS "�?리자�?"
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno(+);

-- ?��?��문제 1 p.254
SELECT s.name AS "STU_NAME"
      ,s.deptno1
      ,d.dname AS "DEPT_NAME"
FROM student s
JOIN department d
ON S.deptno1 = d.deptno;

-- ?��?��문제 2 p.254
SELECT e.name
      ,e.position
      ,TO_CHAR(e.pay, '99,999,999') AS "PAY"
      ,TO_CHAR(p.s_pay, '99,999,999') AS "Low Pay"
      ,TO_CHAR(p.e_pay, '99,999,999') AS "High Pay"
FROM emp2 e
JOIN p_grade p
ON e.position = p.position;

-- ?��?��문제 3 p.255
SELECT e.name
      ,TRUNC(MONTHS_BETWEEN('2013/09/25', e.birthday)/12) AS "AGE"
      ,e.position AS "CURR_POSITION"
      ,p.position AS "BE_POSITION"
FROM emp2 e
LEFT OUTER JOIN p_grade p
ON TRUNC(MONTHS_BETWEEN('2013/09/25', e.birthday)/12) >= p.s_age
AND TRUNC(MONTHS_BETWEEN('2013/09/25', e.birthday)/12) <= p.e_age
ORDER BY 2;

-- ?��?��문제 4 p.255
SELECT c.gname AS "CUST_NAME"
      ,c.point
      ,g.gname AS "GIFT_NAME"
FROM customer c
JOIN gift g
ON c.point >= g.g_start
--AND c.point <= g.g_end
AND g.gname = 'Notebook';

SELECT *
FROM gift;

SELECT *
FROM customer;

-- ?��?��문제 5 p.256
SELECT p1.profno
      ,p1.name
      ,TO_CHAR(p1.hiredate, 'RRRR/MM/DD') AS "HIREDATE"
      ,COUNT(p2.profno) AS "COUNT"
FROM professor p1
LEFT OUTER JOIN professor p2
ON p2.hiredate < p1.hiredate
GROUP BY p1.profno, p1.name, p1.hiredate
ORDER BY COUNT ASC;

-- �������� 6 p.257
SELECT e1.empno
      ,e1.ename
      ,TO_CHAR(e1.hiredate, 'RR/MM/DD') AS "HIREDATE"
      ,COUNT(e2.empno) AS "COUNT"
FROM emp e1
LEFT OUTER JOIN emp e2
ON e2.hiredate < e1.hiredate
GROUP BY e1.empno, e1.ename, e1.hiredate
ORDER BY COUNT ASC;

SELECT *
FROM emp;

SELECT *
FROM professor;
