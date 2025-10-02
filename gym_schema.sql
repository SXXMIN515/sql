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
  join_date DATE DEFAULT SYSDATE
);

-- 샘플데이터
INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user01', 'pw01', '홍길동', TO_DATE('1990-01-15','YYYY-MM-DD'), '010-1111-1111', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user02', 'pw02', '김철수', TO_DATE('1988-05-20','YYYY-MM-DD'), '010-2222-2222', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user03', 'pw03', '이영희', TO_DATE('1992-11-03','YYYY-MM-DD'), '010-3333-3333', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user04', 'pw04', '박민수', TO_DATE('1995-07-08','YYYY-MM-DD'), '010-4444-4444', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user05', 'pw05', '최지은', TO_DATE('1993-03-12','YYYY-MM-DD'), '010-5555-5555', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user06', 'pw06', '정우성', TO_DATE('1987-09-25','YYYY-MM-DD'), '010-6666-6666', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user07', 'pw07', '한가인', TO_DATE('1991-12-30','YYYY-MM-DD'), '010-7777-7777', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user08', 'pw08', '오세훈', TO_DATE('1989-02-17','YYYY-MM-DD'), '010-8888-8888', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user09', 'pw09', '서지수', TO_DATE('1994-06-22','YYYY-MM-DD'), '010-9999-9999', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user10', 'pw10', '장동건', TO_DATE('1986-04-10','YYYY-MM-DD'), '010-1010-1010', SYSDATE);



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

INSERT INTO class (class_id, class_name, start_date, end_date, class_img, class_description, class_capacity) VALUES
(class_id_seq.nextval, '헬스 초급', TO_DATE('2025-10-07', 'YYYY-MM-DD'), TO_DATE('2025-12-31', 'YYYY-MM-DD'), NULL, '기초 헬스 트레이닝 수업', 30);

INSERT INTO class (class_id, class_name, start_date, end_date, class_img, class_description, class_capacity) VALUES
(class_id_seq.nextval, 'PT 맞춤 프로그램', TO_DATE('2025-10-10', 'YYYY-MM-DD'), TO_DATE('2025-12-31', 'YYYY-MM-DD'), NULL, '개인 맞춤 운동 프로그램', 10);

INSERT INTO class (class_id, class_name, start_date, end_date, class_img, class_description, class_capacity) VALUES
(class_id_seq.nextval, '요가 초급', TO_DATE('2025-10-15', 'YYYY-MM-DD'), TO_DATE('2025-12-30', 'YYYY-MM-DD'), NULL, '기초 요가 자세와 호흡법', 20);

INSERT INTO class (class_id, class_name, start_date, end_date, class_img, class_description, class_capacity) VALUES
(class_id_seq.nextval, '요가 중급', TO_DATE('2025-10-20', 'YYYY-MM-DD'), TO_DATE('2026-01-10', 'YYYY-MM-DD'), NULL, '중급 요가 자세와 스트레칭', 15);

INSERT INTO class (class_id, class_name, start_date, end_date, class_img, class_description, class_capacity) VALUES
(class_id_seq.nextval, '필라테스', TO_DATE('2025-10-25', 'YYYY-MM-DD'), TO_DATE('2026-01-15', 'YYYY-MM-DD'), NULL, '근력과 코어 강화 필라테스', 20);

INSERT INTO class (class_id, class_name, start_date, end_date, class_img, class_description, class_capacity) VALUES
(class_id_seq.nextval, '스피닝', TO_DATE('2025-11-01', 'YYYY-MM-DD'), TO_DATE('2026-02-01', 'YYYY-MM-DD'), NULL, '유산소와 하체 강화 스피닝', 25);

INSERT INTO class (class_id, class_name, start_date, end_date, class_img, class_description, class_capacity) VALUES
(class_id_seq.nextval, '스트레칭 / 릴렉스', TO_DATE('2025-11-05', 'YYYY-MM-DD'), TO_DATE('2026-02-05', 'YYYY-MM-DD'), NULL, '전신 스트레칭과 릴렉스', 30);

INSERT INTO class (class_id, class_name, start_date, end_date, class_img, class_description, class_capacity) VALUES
(class_id_seq.nextval, '크로스핏 입문', TO_DATE('2025-11-10', 'YYYY-MM-DD'), TO_DATE('2026-02-10', 'YYYY-MM-DD'), NULL, '크로스핏 기초와 근력 훈련', 12);

INSERT INTO class (class_id, class_name, start_date, end_date, class_img, class_description, class_capacity) VALUES
(class_id_seq.nextval, '아쿠아로빅', TO_DATE('2025-11-15', 'YYYY-MM-DD'), TO_DATE('2026-02-15', 'YYYY-MM-DD'), NULL, '수중 유산소 운동', 18);

INSERT INTO class (class_id, class_name, start_date, end_date, class_img, class_description, class_capacity) VALUES
(class_id_seq.nextval, '복싱 기초', TO_DATE('2025-11-20', 'YYYY-MM-DD'), TO_DATE('2026-03-01', 'YYYY-MM-DD'), NULL, '복싱 기본 스킬과 체력 강화', 20);



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