--회원관리(헬스장)
--회원테이블(회원번호(pk, seq), 회원아이디(not null), 비밀번호(not null), 이름(not null), 전화번호(not null), 수업번호, 락커번호)
DROP SEQUENCE member_no_seq;

CREATE SEQUENCE member_no_seq
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 100000
  MINVALUE 1
  CYCLE;
  
CREATE TABLE member (
  member_no NUMBER(6, 0) CONSTRAINT member_merber_no_pk PRIMARY KEY,
  member_id VARCHAR2(15) NOT NULL,
  member_pw VARCHAR2(15) NOT NULL,
  member_name VARCHAR2(20) NOT NULL,
  member_tel VARCHAR2(20) NOT NULL,
  class_no NUMBER(6, 0),
  locker_no NUMBER(6, 0)
);

select *
from member;

INSERT INTO member (member_no, member_id, member_pw, member_name, member_tel)
VALUES(member_no_seq.nextval, 'user01', '1111', '홍길동', '010-1111-2222');
INSERT INTO member (member_no, member_id, member_pw, member_name, member_tel)
VALUES(member_no_seq.nextval, 'user02', '2222', '김길동', '010-2222-3333');
INSERT INTO member (member_no, member_id, member_pw, member_name, member_tel)
VALUES(member_no_seq.nextval, 'user03', '3333', '김민수', '010-3333-4444');


--수업목록테이블(수업번호(pk, seq), 수업명(not null), 수강인원(not null), 신청인원) 
DROP SEQUENCE class_no_seq;

CREATE SEQUENCE class_no_seq
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 100000
  MINVALUE 1
  CYCLE;

DROP TABLE class;

CREATE TABLE class (
  class_no NUMBER(6, 0) CONSTRAINT class_class_no_pk PRIMARY KEY,
  class_name VARCHAR2(30) NOT NULL,
  class_capacity NUMBER(6, 0) NOT NULL,
  class_enrolled NUMBER(6, 0)
);

select *
from class;
INSERT INTO class (class_no, class_name, class_capacity)
VALUES(class_no_seq.nextval, '헬스', 100);
INSERT INTO class (class_no, class_name, class_capacity)
VALUES(class_no_seq.nextval, '파워 요가', 25);
INSERT INTO class (class_no, class_name, class_capacity)
VALUES(class_no_seq.nextval, '필라테스', 20);
INSERT INTO class (class_no, class_name, class_capacity)
VALUES(class_no_seq.nextval, '아쿠아로빅', 35);
INSERT INTO class (class_no, class_name, class_capacity)
VALUES(class_no_seq.nextval, '자유 수영', 40);
INSERT INTO class (class_no, class_name, class_capacity)
VALUES(class_no_seq.nextval, '퍼스널 트레이닝(PT)', 10);
INSERT INTO class (class_no, class_name, class_capacity)
VALUES(class_no_seq.nextval, '크로스핏', 20);
INSERT INTO class (class_no, class_name, class_capacity)
VALUES(class_no_seq.nextval, 'HIIT(고강도 인터벌)', 15);
INSERT INTO class (class_no, class_name, class_capacity)
VALUES(class_no_seq.nextval, '줌바 댄스', 30);
INSERT INTO class (class_no, class_name, class_capacity)
VALUES(class_no_seq.nextval, '스피닝', 25);
INSERT INTO class (class_no, class_name, class_capacity)
VALUES(class_no_seq.nextval, '근력 강화 클래스', 30);
INSERT INTO class (class_no, class_name, class_capacity)
VALUES(class_no_seq.nextval, '스트레칭, 릴렉스', 20);
INSERT INTO class (class_no, class_name, class_capacity)
VALUES(class_no_seq.nextval, '다이어트 댄스', 30);
INSERT INTO class (class_no, class_name, class_capacity)
VALUES(class_no_seq.nextval, '케틀벨 트레이닝', 15);
INSERT INTO class (class_no, class_name, class_capacity)
VALUES(class_no_seq.nextval, '복싱, 킥복싱', 20);
INSERT INTO class (class_no, class_name, class_capacity)
VALUES(class_no_seq.nextval, 'TRX 서스펜션 트레이닝', 15);


--락커테이블(락커번호(pk, seq), 회원번호)
CREATE SEQUENCE locker_no_seq
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 100000
  MINVALUE 1
  CYCLE;

CREATE TABLE locker (
  locker_no NUMBER(6, 0) CONSTRAINT locker_locker_no_pk PRIMARY KEY,
  member_no NUMBER(6, 0)
);

--입퇴실테이블(입퇴실날짜(default sysdate), 회원번호, 입실시간, 퇴실시간)
CREATE TABLE attendance(
  access_date DATE DEFAULT SYSDATE,
  member_no NUMBER(6, 0),
  check_in_time DATE,
  check_out_time DATE
);