--set serveroutput on;
--set verify off;
--set feedback on;

declare
  -- 파라미터 커서.
  cursor cur_prof (v_deptno in number) is
  select profno, name, pay
  from   professor
  where  deptno = v_deptno;

  -- 학과정보.
  cursor cur_dept is
  select deptno, dname
  from   department;
  
BEGIN

  for rec_dept in cur_dept loop
    dbms_output.put_line('===' || rec_dept.dname || '===');
    for rec_prof in cur_prof(rec_dept.deptno) loop
      dbms_output.put_line('번호: ' || rec_prof.profno || ', 이름: ' || rec_prof.name);
    end loop;
  end loop;
  dbms_output.put_line('end');
END;
/
