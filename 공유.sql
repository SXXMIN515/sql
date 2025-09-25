drop table p_grade purge ;

create table p_grade
( position  varchar2(30) ,
  s_age number ,
  e_age number ,
  s_year number ,
  e_year number ,
  s_pay  number ,
  e_pay  number );

insert into p_grade values ('Manager',0,24,1,2,12000000,29990000);
insert into p_grade values ('Deputy Section chief',25,28,3,5,30000000,45000000);
insert into p_grade values ('Section head',29,32,6,8,45010000,51000000);
insert into p_grade values ('Deputy department head',33,36,9,10,51010000,60000000);
insert into p_grade values ('Department head',37,40,11,13,60010000,75000000);
insert into p_grade values ('Director',41,55,14,99,75010000,100000000);

commit ;
