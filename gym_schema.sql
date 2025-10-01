--회원관리(헬스장)

--회원테이블
--회원아이디(시퀀스)
DROP SEQUENCE member_id_seq;
CREATE SEQUENCE member_id_seq
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 100000
  MINVALUE 1
  CYCLE;

DROP TABLE member CASCADE CONSTRAINTS purge;
CREATE TABLE member (
  member_id NUMBER(6, 0) CONSTRAINT member_merber_id_pk PRIMARY KEY, --회원아이디(pk, seq)
  login_id VARCHAR2(15) NOT NULL, --아이디(not null)
  login_pw VARCHAR2(15) NOT NULL, --비밀번호(not null)
  member_name VARCHAR2(20) NOT NULL, --이름(not null)
  birth DATE NOT NULL, --생년월일(not null)
  tel VARCHAR2(20) NOT NULL, --휴대폰번호(not null)
  join_date DATE DEFAULT SYSDATE NOT NULL--가입날짜(default sysdate)
);


--수업테이블
--수업아이디(시퀀스)
DROP SEQUENCE class_id_seq;
CREATE SEQUENCE class_id_seq
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 100000
  MINVALUE 1
  CYCLE;

DROP TABLE class CASCADE CONSTRAINTS purge;
CREATE TABLE class (
  class_id NUMBER(6, 0) CONSTRAINT class_class_id_pk PRIMARY KEY, --수업아이디(pk, seq)
  class_name VARCHAR2(30) NOT NULL, --수업명(not null)
  start_date DATE NOT NULL, --수업시작날짜(not null)
  end_date DATE NOT NULL, --수업종료날짜(not null)
  class_img BLOB, --수업이미지
  class_description CLOB, --수업설명
  class_capacity NUMBER(6, 0) NOT NULL --수강정원(not null)
);


--수강 신청 테이블(회원 - 수업 연결)
--수강신청아이디(시퀀스)
DROP SEQUENCE enrollment_id_seq;
CREATE SEQUENCE enrollment_id_seq
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 100000
  MINVALUE 1
  CYCLE;

DROP TABLE enrollment CASCADE CONSTRAINTS purge;
CREATE TABLE enrollment (
  enrollment_id NUMBER(6, 0) CONSTRAINT enrollment_enrollment_id_pk PRIMARY KEY, --신청아이디(pk, seq)
  member_id NUMBER(6, 0) NOT NULL, --회원아이디(not null)
  class_id NUMBER(6, 0) NOT NULL, --수업아이디(not null)
  enrollment_date DATE DEFAULT SYSDATE NOT NULL, --수업신청날짜(default sysdate)
  CONSTRAINT enrollment_member_fk FOREIGN KEY (member_id) REFERENCES member(member_id), --외래키
  CONSTRAINT enrollment_class_fk FOREIGN KEY (class_id) REFERENCES class(class_id), --외래키
  CONSTRAINT member_class_uq UNIQUE (member_id, class_id) --같은 수업 중복 방지
);


--출석테이블
--출석아이디(시퀀스)
DROP SEQUENCE attendance_id_seq;
CREATE SEQUENCE attendance_id_seq
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 100000
  MINVALUE 1
  CYCLE;
  
DROP TABLE attendance CASCADE CONSTRAINTS purge;
CREATE TABLE attendance(
  attendance_id NUMBER(6, 0) CONSTRAINT attendance_attendance_id_pk PRIMARY KEY, --출석번호(pk, seq)
  member_id NUMBER(6, 0) NOT NULL, --회원아이디
  check_in_time DATE DEFAULT SYSDATE NOT NULL, --입실시간
  check_out_time DATE, --퇴실시간
  CONSTRAINT attendance_member_fk FOREIGN KEY (member_id) REFERENCES member(member_id) --외래키
);