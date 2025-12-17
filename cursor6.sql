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
  
  -- 학생정보.
  cursor cur_stud (v_profno in number) is
  select studno, name
  from   student
  where  profno = v_profno;
  
  v_count NUMBER := 1;
BEGIN

  for rec_dept in cur_dept loop
    dbms_output.put_line('=== 학과: ' || rec_dept.dname || ' ===');
    for rec_prof in cur_prof(rec_dept.deptno) loop
      dbms_output.put_line('');
      dbms_output.put_line(' == 교수: ' || rec_prof.name || ' == ');
      for rec_stud in cur_stud(rec_prof.profno) loop
         dbms_output.put_line(' == 학생' || v_count || ') ' || rec_stud.name);
         v_count := v_count + 1;
      end loop;
      v_count := 1;
      dbms_output.put_line('');
    end loop;
  end loop;
  dbms_output.put_line('end');
END;
/
