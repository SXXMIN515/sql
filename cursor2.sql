--set serveroutput on;
--set verify off;
--set feedback on;

DECLARE
  -- cursor 활용. emp의 sal<2000의 부서정보.
  CURSOR cur_under2000 IS
    SELECT empno, ename, sal, deptno
    FROM   emp
    WHERE  sal < 2000;
    
  v_empno  emp.empno%type;
  v_ename  emp.ename%type;
  v_sal    emp.sal%type;
  v_deptno emp.deptno%type; 
  v_dname  dept.dname%type;
  
BEGIN
  OPEN cur_under2000;
  
  LOOP
    FETCH cur_under2000 INTO v_empno, v_ename, v_sal, v_deptno;
    
    SELECT dname
    INTO   v_dname
    FROM   dept
    WHERE  deptno = v_deptno;
    DBMS_OUTPUT.PUT_LINE(v_deptno || '의 부서명 ' || v_dname);  
    EXIT WHEN cur_under2000%notfound; -- 종료조건.
  END LOOP;
  CLOSE cur_under2000;
  DBMS_OUTPUT.PUT_LINE('end');  
END;
/

-- Computer Engineering 학과의 교수를 대상으로 
-- bonus 있는 사람들은 10% 인상하고
-- bonus 없는 사람들은 30으로 지정.
DECLARE
  -- cursor 활용. emp의 sal<2000의 부서정보.
  CURSOR cur_ceProBonus IS
    SELECT profno, name, bonus 
    FROM   professor
    WHERE  deptno = (SELECT deptno
                     FROM   department
                     WHERE  dname = 'Computer Engineering');

  v_profno professor.profno%type;
  v_name   professor.name%type;
  v_bonus  professor.bonus%type;
  
BEGIN
  OPEN cur_ceProBonus;
  
  LOOP
    FETCH cur_ceProBonus INTO v_profno, v_name, v_bonus;
    EXIT WHEN cur_ceProBonus%notfound; -- 종료조건.
    IF (v_bonus is null) then
      v_bonus := 30;
    ELSE 
      v_bonus := v_bonus * 1.1;
    END IF;
      
      DBMS_OUTPUT.PUT_LINE(v_name || '의 인상된 bonus: ' || v_bonus);  
    
  END LOOP;
  CLOSE cur_ceProBonus;
END;
/
