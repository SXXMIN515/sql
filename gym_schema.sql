--?��?���?�?(?��?��?��)

--?��?��?��?���?
--?��?��?��?��?��(?��???��)
DROP SEQUENCE member_id_seq;
CREATE SEQUENCE member_id_seq
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 100000
  MINVALUE 1
  CYCLE;

DROP TABLE member CASCADE CONSTRAINTS purge;
CREATE TABLE member (
  member_id NUMBER(6, 0) CONSTRAINT member_merber_id_pk PRIMARY KEY, --?��?��?��?��?��(pk, seq)
  login_id VARCHAR2(15) NOT NULL, --?��?��?��(not null)
  login_pw VARCHAR2(15) NOT NULL, --비�?번호(not null)
  member_name VARCHAR2(20) NOT NULL, --?���?(not null)
  birth DATE NOT NULL, --?��?��?��?��(not null)
  tel VARCHAR2(20) NOT NULL, --?��???��번호(not null)
  join_date DATE DEFAULT SYSDATE
);

-- ?��?��?��?��?��
INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user01', 'pw01', 'ȫ�浿', TO_DATE('1990-01-15','YYYY-MM-DD'), '010-1111-1111', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user02', 'pw02', '��ö��', TO_DATE('1988-05-20','YYYY-MM-DD'), '010-2222-2222', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user03', 'pw03', '�̿���', TO_DATE('1992-11-03','YYYY-MM-DD'), '010-3333-3333', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user04', 'pw04', '�ڹμ�', TO_DATE('1995-07-08','YYYY-MM-DD'), '010-4444-4444', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user05', 'pw05', '������', TO_DATE('1993-03-12','YYYY-MM-DD'), '010-5555-5555', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user06', 'pw06', '���켺', TO_DATE('1987-09-25','YYYY-MM-DD'), '010-6666-6666', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user07', 'pw07', '�Ѱ���', TO_DATE('1991-12-30','YYYY-MM-DD'), '010-7777-7777', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user08', 'pw08', '������', TO_DATE('1989-02-17','YYYY-MM-DD'), '010-8888-8888', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user09', 'pw09', '������', TO_DATE('1994-06-22','YYYY-MM-DD'), '010-9999-9999', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user10', 'pw10', '�嵿��', TO_DATE('1986-04-10','YYYY-MM-DD'), '010-1010-1010', SYSDATE);


--?��?��?��?���?
--?��?��?��?��?��(?��???��)
DROP SEQUENCE class_id_seq;
CREATE SEQUENCE class_id_seq
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 100000
  MINVALUE 1
  CYCLE;

DROP TABLE class CASCADE CONSTRAINTS purge;
CREATE TABLE class (
  class_id NUMBER(6, 0) CONSTRAINT class_class_id_pk PRIMARY KEY, --?��?��?��?��?��(pk, seq)
  category VARCHAR2(30), -- ?��?�� 카테고리
  class_name VARCHAR2(50) NOT NULL, --?��?���?(not null)
  registration_start DATE NOT NULL, -- ?��?�� ?���? ?��?��?��(?��?��?��?��?���? 1~2?��?��)
  registration_end DATE NOT NULL, -- ?��?�� ?���? 마감?��(?��?��?��?��?���? ?��루전)
  start_date DATE NOT NULL, --?��?��?��?��?���?(not null)
  end_date DATE NOT NULL, --?��?��종료?���?(not null)
  class_description VARCHAR2(1000), --?��?��?���?
  class_capacity NUMBER(6, 0) NOT NULL, --?��강정?��(not null)
  class_date DATE DEFAULT SYSDATE NOT NULL -- ?��?��?��?��?���?
);


SET DEFINE OFF;
BEGIN
  FOR i IN 1..200 LOOP
    INSERT INTO class(class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
    VALUES(class_id_seq.NEXTVAL, '피트니스 & PT',
           'PT 클래스 ' || i,
           TO_DATE('2025-09-01','YYYY-MM-DD'), TO_DATE('2025-09-30','YYYY-MM-DD'),
           TO_DATE('2025-10-01','YYYY-MM-DD'), TO_DATE('2026-01-31','YYYY-MM-DD'),
           '전신 운동과 체력 강화에 초점을 맞춘 PT 클래스 ' || i,
           15 + MOD(i, 10));
  END LOOP;

  FOR i IN 1..200 LOOP
    INSERT INTO class(class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
    VALUES(class_id_seq.NEXTVAL, '요가 & 피트니스',
           '요가 클래스 ' || i,
           TO_DATE('2025-09-01','YYYY-MM-DD'), TO_DATE('2025-09-30','YYYY-MM-DD'),
           TO_DATE('2025-10-01','YYYY-MM-DD'), TO_DATE('2026-01-31','YYYY-MM-DD'),
           '마음과 몸의 균형을 위한 요가 클래스 ' || i,
           10 + MOD(i, 10));
  END LOOP;

  FOR i IN 1..200 LOOP
    INSERT INTO class(class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
    VALUES(class_id_seq.NEXTVAL, '유산소 & 댄스',
           '댄스 클래스 ' || i,
           TO_DATE('2025-09-01','YYYY-MM-DD'), TO_DATE('2025-09-30','YYYY-MM-DD'),
           TO_DATE('2025-10-01','YYYY-MM-DD'), TO_DATE('2026-01-31','YYYY-MM-DD'),
           '심폐 지구력 향상과 재미를 위한 댄스 클래스 ' || i,
           20 + MOD(i, 10));
  END LOOP;
END;
/







--?���? ?���? ?��?���?(?��?�� - ?��?�� ?���?)
--?��강신�??��?��?��(?��???��)
DROP SEQUENCE enrollment_id_seq;
CREATE SEQUENCE enrollment_id_seq
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 100000
  MINVALUE 1
  CYCLE;

DROP TABLE enrollment CASCADE CONSTRAINTS purge;
CREATE TABLE enrollment (
  enrollment_id NUMBER(6, 0) CONSTRAINT enrollment_enrollment_id_pk PRIMARY KEY, --?���??��?��?��(pk, seq)
  member_id NUMBER(6, 0) NOT NULL, --?��?��?��?��?��(not null)
  class_id NUMBER(6, 0) NOT NULL, --?��?��?��?��?��(not null)
  enrollment_date DATE DEFAULT SYSDATE NOT NULL, --?��?��?���??���?(default sysdate)
  CONSTRAINT enrollment_member_fk FOREIGN KEY (member_id) REFERENCES member(member_id), --?��?��?��
  CONSTRAINT enrollment_class_fk FOREIGN KEY (class_id) REFERENCES class(class_id), --?��?��?��
  CONSTRAINT member_class_uq UNIQUE (member_id, class_id) --같�? ?��?�� 중복 방�?
);

-- ?��강신�? ?��?��?��?��?�� 10�?
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 1, 1, SYSDATE);

INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 2, 2, SYSDATE);

INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 3, 3, SYSDATE);

INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 4, 4, SYSDATE);

INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 5, 5, SYSDATE);

INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 6, 6, SYSDATE);

INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 7, 7, SYSDATE);

INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 8, 8, SYSDATE);

INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 9, 9, SYSDATE);

INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 10, 10, SYSDATE);

-- ?��로운 ?��강신�? ?��?��?��?��?�� 10�?
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 1, 2, SYSDATE); -- ?��길동 ?�� PT 맞춤 ?��로그?��
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 1, 5, SYSDATE); -- ?��길동 ?�� ?��?��?��?��
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 2, 1, SYSDATE); -- �?철수 ?�� ?��?�� 초급
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 2, 3, SYSDATE); -- �?철수 ?�� ?���? 초급
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 3, 6, SYSDATE); -- ?��?��?�� ?�� ?��?��?��
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 4, 2, SYSDATE); -- 박�?�수 ?�� PT 맞춤 ?��로그?��
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 5, 4, SYSDATE); -- 최�??? ?�� ?���? 중급
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 6, 3, SYSDATE); -- ?��?��?�� ?�� ?���? 초급
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 7, 5, SYSDATE); -- ?���??�� ?�� ?��?��?��?��
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 8, 7, SYSDATE); -- ?��?��?�� ?�� ?��?��?���? / 릴렉?��


--출석?��?���?
--출석?��?��?��(?��???��)
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
  member_id NUMBER(6, 0) NOT NULL, --?��?��?��?��?��
  check_in_time DATE DEFAULT SYSDATE NOT NULL, --?��?��?���?
  check_out_time DATE, --?��?��?���?
  CONSTRAINT attendance_member_fk FOREIGN KEY (member_id) REFERENCES member(member_id) --?��?��?��
);