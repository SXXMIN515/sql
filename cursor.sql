--set serveroutput on;
--set verify off;
--set feedback on;

DECLARE

BEGIN
  DELETE FROM emp
  WHERE sal < 1000;
  rollback;
  DBMS_OUTPUT.PUT_LINE(sql%rowcount || '건이 삭제됨');
  
  for dept in (select dname, build from department
               where build is not null
               order by 1) loop
    DBMS_OUTPUT.PUT_LINE(dept.dname || ' => ' || dept.build); 
    INSERT INTO dept_build
    VALUES (dept.dname, dept.build);
  end loop;
  commit;
  DBMS_OUTPUT.PUT_LINE('done');
END;
/