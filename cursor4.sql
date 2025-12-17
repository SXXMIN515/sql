--set serveroutput on;
--set verify off;
--set feedback on;

DECLARE
  CURSOR cur_prof IS
    SELECT profno,
           hiredate
    FROM   professor
    WHERE  bonus is not null;
  
  v_hiredate NUMBER := 0;
  v_point NUMBER := 0;

BEGIN
  FOR rec_prof IN cur_prof LOOP
    -- 연차
    SELECT TRUNC(MONTHS_BETWEEN(sysdate, rec_prof.hiredate) / 12)
    INTO   v_hiredate
    FROM   dual;
    -- 증가포인트
    BEGIN
      SELECT up_point
      INTO   v_point
      FROM   prof_bonus_grade
      WHERE  from_year <= v_hiredate and to_year >= v_hiredate;
    END;
    DBMS_OUTPUT.PUT_LINE(rec_prof.profno || ', ' || v_point);  
    -- db반영.
    UPDATE professor
    SET    bonus = bonus * ((100+v_point)/100)
    WHERE  profno = rec_prof.profno;
    DBMS_OUTPUT.PUT_LINE(rec_prof.profno || 'updated');  
  END LOOP;
  
  COMMIT;
END;
/
