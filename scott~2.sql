select * from professor;

create table dept_build (
    dname varchar2(100),
    build varchar2(100)
);

select * from department;

SELECT deptno
FROM   department
WHERE  dname = 'Computer Engineering';

SELECT *
FROM   professor;

select studno, name
from   student;

SELECT profno
      ,bonus
      ,TRUNC(MONTHS_BETWEEN(sysdate, hiredate) / 12) AS "work_year"
FROM   professor
WHERE  bonus is not null
ORDER BY hiredate;
    
create table prof_bonus_grade (
  from_year number, -- 시작연차
  to_year number, -- 종료연차
  up_point number -- 증가%
);

insert into prof_bonus_grade values(1, 5, 2);
insert into prof_bonus_grade values(6, 10, 3);
insert into prof_bonus_grade values(11, 15, 4);
insert into prof_bonus_grade values(16, 40, 5);
insert into prof_bonus_grade values(41, 50, 6);


select * from prof_bonus_grade order by 3;

SELECT up_point
FROM   prof_bonus_grade;