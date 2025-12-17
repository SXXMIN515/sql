-- 제어문 20251216 실습

-- if문
DECLARE
  v_profno professor.profno%type;
  v_name   professor.name%type;
  v_bonus  professor.bonus%type;
BEGIN
  SELECT profno
        ,name
        ,NVL(bonus, 0)
  INTO   v_profno
        ,v_name
        ,v_bonus
  FROM   professor
  WHERE  profno = &profno;
  
  -- 0 ~ 100인지 100 ~ 이상인지...
  IF v_bonus < 50 THEN
    DBMS_OUTPUT.PUT_LINE('bonus가 50보다 작습니다.');
  ELSIF (v_bonus >= 50 AND v_bonus < 100) THEN  
    DBMS_OUTPUT.PUT_LINE('bonus가 50에서 100 사이입니다.');
  ELSIF (v_bonus >= 100 AND v_bonus < 200) THEN  
    DBMS_OUTPUT.PUT_LINE('bonus가 100에서 200 사이입니다.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('bonus가 200 이상입니다.');   
  END IF;
  
  DBMS_OUTPUT.PUT_LINE('교수번호: ' || v_profno || ', 이름: ' || v_name || ', 보너스: ' || v_bonus);
END;
/

-- case문
DECLARE
  v_profno professor.profno%type;
  v_name   professor.name%type;
  v_bonus  professor.bonus%type;
BEGIN
  SELECT profno
        ,name
        ,NVL(bonus, 0)
  INTO   v_profno
        ,v_name
        ,v_bonus
  FROM   professor
  WHERE  profno = &profno;
  
  -- 0 ~ 100인지 100 ~ 이상인지...
  CASE 
    WHEN v_bonus < 50 THEN
      DBMS_OUTPUT.PUT_LINE('bonus가 50보다 작습니다.');
    WHEN (v_bonus >= 50 AND v_bonus < 100) THEN  
      DBMS_OUTPUT.PUT_LINE('bonus가 50에서 100 사이입니다.');
    WHEN (v_bonus >= 100 AND v_bonus < 200) THEN  
      DBMS_OUTPUT.PUT_LINE('bonus가 100에서 200 사이입니다.');
    ELSE
      DBMS_OUTPUT.PUT_LINE('bonus가 200 이상입니다.');   
  END CASE;
  
  DBMS_OUTPUT.PUT_LINE('교수번호: ' || v_profno || ', 이름: ' || v_name || ', 보너스: ' || v_bonus);
END;
/

select * from professor;

DECLARE
  v_dan NUMBER := &dan;
  v_no  NUMBER := 1;
BEGIN
  DBMS_OUTPUT.PUT_LINE('LOOP문');
  LOOP
    DBMS_OUTPUT.PUT_LINE(v_dan || ' x ' || v_no || ' = ' || (v_dan * v_no));
    v_no := v_no + 1;
  EXIT WHEN v_no = 10;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('');
  DBMS_OUTPUT.PUT_LINE('while문');
  -- while loop.
  v_no := 1;
  WHILE v_no < 10 loop
    DBMS_OUTPUT.PUT_LINE(v_dan || ' x ' || v_no || ' = ' || (v_dan * v_no));
    v_no := v_no + 1;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('');
  DBMS_OUTPUT.PUT_LINE('for문');
  -- for loop.
  FOR v_count in 1 .. 9 loop
    DBMS_OUTPUT.PUT_LINE(v_dan || ' x ' || v_count || ' = ' || (v_dan * v_count));
  END LOOP;
END;
/

DECLARE 
  TYPE prof_rec is record (
    profno professor.profno%type,
    name   professor.name%type,
    pay    professor.pay%type,
    deptno professor.deptno%type
  );
  
  TYPE prof_tab is table of prof_rec
  index by binary_integer;
  
  v_prof_table prof_tab;
  
  v_101 NUMBER := 0;
  v_102 NUMBER := 0;
  v_103 NUMBER := 0;

BEGIN
  SELECT profno
        ,name
        ,pay
        ,deptno
  BULK COLLECT
  INTO  v_prof_table
  FROM  professor;
  
  FOR v_cnt in 1 .. v_prof_table.count loop
    DBMS_OUTPUT.PUT_LINE(v_prof_table(v_cnt).profno);
    IF (v_prof_table(v_cnt).deptno = 101) THEN
      v_101 := v_101 + v_prof_table(v_cnt).pay;
    ELSIF (v_prof_table(v_cnt).deptno = 102) THEN
      v_102 := v_102 + v_prof_table(v_cnt).pay;
    ELSIF (v_prof_table(v_cnt).deptno = 103) THEN
      v_103 := v_103 + v_prof_table(v_cnt).pay;
    END IF;
  END LOOP;
  
  -- 101, 102, 103 교수급여 합계 출력. 101: 385, 102: 450, 103: 500
  DBMS_OUTPUT.PUT_LINE('');
  DBMS_OUTPUT.PUT_LINE('101학과: ' || v_101 || ', 102학과: ' || v_102 || ', 103학과: ' || v_103 );
  
END;
/