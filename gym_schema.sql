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

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'sys', 'sys', '관리자', SYSDATE, '010-1234-5678', SYSDATE);



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
  category VARCHAR2(30), -- 수업 카테고리
  class_name VARCHAR2(50) NOT NULL, --수업명(not null)
  registration_start DATE NOT NULL, -- 수업 등록 시작일(수업시작날짜 1~2달전)
  registration_end DATE NOT NULL, -- 수업 등록 마감일(수업시작날짜 하루전)
  start_date DATE NOT NULL, --수업시작날짜(not null)
  end_date DATE NOT NULL, --수업종료날짜(not null)
  class_description CLOB, --수업설명
  class_capacity NUMBER(6, 0) NOT NULL, --수강정원(not null)
  class_date DATE DEFAULT SYSDATE NOT NULL -- 수업생성날짜
);


SET DEFINE OFF;

-- ========================== 유산소 & 댄스 (10개) ==========================
INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '유산소 & 댄스', '스피닝',
        TO_DATE('2025-09-03','YYYY-MM-DD'), TO_DATE('2025-10-02','YYYY-MM-DD'),
        TO_DATE('2025-10-03','YYYY-MM-DD'), TO_DATE('2026-01-31','YYYY-MM-DD'),
        '유산소와 하체 강화 스피닝', 25);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '유산소 & 댄스', '아쿠아로빅',
        TO_DATE('2025-09-08','YYYY-MM-DD'), TO_DATE('2025-10-07','YYYY-MM-DD'),
        TO_DATE('2025-10-08','YYYY-MM-DD'), TO_DATE('2026-02-15','YYYY-MM-DD'),
        '수중 유산소 운동', 18);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '유산소 & 댄스', '복싱 기초',
        TO_DATE('2025-09-12','YYYY-MM-DD'), TO_DATE('2025-10-11','YYYY-MM-DD'),
        TO_DATE('2025-10-12','YYYY-MM-DD'), TO_DATE('2026-03-01','YYYY-MM-DD'),
        '복싱 기본 스킬', 20);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '유산소 & 댄스', '댄스 초급',
        TO_DATE('2025-09-15','YYYY-MM-DD'), TO_DATE('2025-10-14','YYYY-MM-DD'),
        TO_DATE('2025-10-15','YYYY-MM-DD'), TO_DATE('2026-01-20','YYYY-MM-DD'),
        '기초 댄스 프로그램', 20);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '유산소 & 댄스', '댄스 중급',
        TO_DATE('2025-09-20','YYYY-MM-DD'), TO_DATE('2025-10-19','YYYY-MM-DD'),
        TO_DATE('2025-10-20','YYYY-MM-DD'), TO_DATE('2026-01-25','YYYY-MM-DD'),
        '중급 댄스 프로그램', 18);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '유산소 & 댄스', '줌바',
        TO_DATE('2025-09-25','YYYY-MM-DD'), TO_DATE('2025-10-24','YYYY-MM-DD'),
        TO_DATE('2025-10-25','YYYY-MM-DD'), TO_DATE('2026-02-28','YYYY-MM-DD'),
        '유산소와 춤이 결합된 줌바 수업', 22);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '유산소 & 댄스', '에어로빅',
        TO_DATE('2025-10-01','YYYY-MM-DD'), TO_DATE('2025-10-31','YYYY-MM-DD'),
        TO_DATE('2025-11-01','YYYY-MM-DD'), TO_DATE('2026-02-15','YYYY-MM-DD'),
        '심폐지구력 강화 에어로빅', 25);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '유산소 & 댄스', '스트릿댄스',
        TO_DATE('2025-10-05','YYYY-MM-DD'), TO_DATE('2025-11-04','YYYY-MM-DD'),
        TO_DATE('2025-11-05','YYYY-MM-DD'), TO_DATE('2026-03-01','YYYY-MM-DD'),
        '기초 스트릿댄스 수업', 20);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '유산소 & 댄스', '케이팝 댄스',
        TO_DATE('2025-10-10','YYYY-MM-DD'), TO_DATE('2025-11-09','YYYY-MM-DD'),
        TO_DATE('2025-11-10','YYYY-MM-DD'), TO_DATE('2026-03-05','YYYY-MM-DD'),
        '케이팝 안무를 배우는 댄스 수업', 18);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '유산소 & 댄스', '복싱 중급',
        TO_DATE('2025-10-15','YYYY-MM-DD'), TO_DATE('2025-11-14','YYYY-MM-DD'),
        TO_DATE('2025-11-15','YYYY-MM-DD'), TO_DATE('2026-03-10','YYYY-MM-DD'),
        '복싱 스킬 향상 프로그램', 20);

-- ========================== 요가 & 필라테스 (10개) ==========================
INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '요가 & 필라테스', '요가 초급',
        TO_DATE('2025-09-02','YYYY-MM-DD'), TO_DATE('2025-10-01','YYYY-MM-DD'),
        TO_DATE('2025-10-02','YYYY-MM-DD'), TO_DATE('2025-12-30','YYYY-MM-DD'),
        '기초 요가 자세와 호흡법', 20);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '요가 & 필라테스', '요가 중급',
        TO_DATE('2025-09-07','YYYY-MM-DD'), TO_DATE('2025-10-06','YYYY-MM-DD'),
        TO_DATE('2025-10-07','YYYY-MM-DD'), TO_DATE('2026-01-10','YYYY-MM-DD'),
        '중급 요가 자세와 스트레칭', 15);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '요가 & 필라테스', '필라테스 기초',
        TO_DATE('2025-09-12','YYYY-MM-DD'), TO_DATE('2025-10-11','YYYY-MM-DD'),
        TO_DATE('2025-10-12','YYYY-MM-DD'), TO_DATE('2026-01-15','YYYY-MM-DD'),
        '근력과 코어 강화 필라테스', 20);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '요가 & 필라테스', '필라테스 중급',
        TO_DATE('2025-09-18','YYYY-MM-DD'), TO_DATE('2025-10-17','YYYY-MM-DD'),
        TO_DATE('2025-10-18','YYYY-MM-DD'), TO_DATE('2026-01-20','YYYY-MM-DD'),
        '중급 필라테스', 18);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '요가 & 필라테스', '요가 다이어트',
        TO_DATE('2025-09-25','YYYY-MM-DD'), TO_DATE('2025-10-24','YYYY-MM-DD'),
        TO_DATE('2025-10-25','YYYY-MM-DD'), TO_DATE('2026-02-01','YYYY-MM-DD'),
        '다이어트용 요가', 20);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '요가 & 필라테스', '필라테스 다이어트',
        TO_DATE('2025-10-01','YYYY-MM-DD'), TO_DATE('2025-10-31','YYYY-MM-DD'),
        TO_DATE('2025-11-01','YYYY-MM-DD'), TO_DATE('2026-02-05','YYYY-MM-DD'),
        '코어 강화 다이어트 필라테스', 18);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '요가 & 필라테스', '스트레칭',
        TO_DATE('2025-10-05','YYYY-MM-DD'), TO_DATE('2025-11-04','YYYY-MM-DD'),
        TO_DATE('2025-11-05','YYYY-MM-DD'), TO_DATE('2026-02-10','YYYY-MM-DD'),
        '전신 스트레칭', 25);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '요가 & 필라테스', '요가 집중 프로그램',
        TO_DATE('2025-10-10','YYYY-MM-DD'), TO_DATE('2025-11-09','YYYY-MM-DD'),
        TO_DATE('2025-11-10','YYYY-MM-DD'), TO_DATE('2026-02-15','YYYY-MM-DD'),
        '집중 요가 수업', 15);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '요가 & 필라테스', '필라테스 집중 프로그램',
        TO_DATE('2025-10-15','YYYY-MM-DD'), TO_DATE('2025-11-14','YYYY-MM-DD'),
        TO_DATE('2025-11-15','YYYY-MM-DD'), TO_DATE('2026-02-20','YYYY-MM-DD'),
        '집중 필라테스', 15);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '요가 & 필라테스', '요가 & 힐링',
        TO_DATE('2025-10-20','YYYY-MM-DD'), TO_DATE('2025-11-19','YYYY-MM-DD'),
        TO_DATE('2025-11-20','YYYY-MM-DD'), TO_DATE('2026-03-01','YYYY-MM-DD'),
        '힐링 요가', 20);

-- ========================== 피트니스 & PT (10개) ==========================
INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '피트니스 & PT', '헬스 초급',
        TO_DATE('2025-09-01','YYYY-MM-DD'), TO_DATE('2025-09-30','YYYY-MM-DD'),
        TO_DATE('2025-10-01','YYYY-MM-DD'), TO_DATE('2025-12-31','YYYY-MM-DD'),
        '기초 헬스 트레이닝 수업', 30);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '피트니스 & PT', '헬스 중급',
        TO_DATE('2025-09-05','YYYY-MM-DD'), TO_DATE('2025-10-04','YYYY-MM-DD'),
        TO_DATE('2025-10-05','YYYY-MM-DD'), TO_DATE('2025-12-31','YYYY-MM-DD'),
        '중급 헬스 운동 프로그램', 25);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '피트니스 & PT', 'PT 맞춤 프로그램',
        TO_DATE('2025-09-10','YYYY-MM-DD'), TO_DATE('2025-10-09','YYYY-MM-DD'),
        TO_DATE('2025-10-10','YYYY-MM-DD'), TO_DATE('2025-12-31','YYYY-MM-DD'),
        '개인 맞춤 운동 프로그램', 10);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '피트니스 & PT', '크로스핏 입문',
        TO_DATE('2025-09-12','YYYY-MM-DD'), TO_DATE('2025-10-11','YYYY-MM-DD'),
        TO_DATE('2025-10-12','YYYY-MM-DD'), TO_DATE('2026-01-15','YYYY-MM-DD'),
        '크로스핏 기초 근력훈련', 12);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '피트니스 & PT', '크로스핏 중급',
        TO_DATE('2025-09-20','YYYY-MM-DD'), TO_DATE('2025-10-19','YYYY-MM-DD'),
        TO_DATE('2025-10-20','YYYY-MM-DD'), TO_DATE('2026-01-20','YYYY-MM-DD'),
        '중급 크로스핏 운동', 12);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '피트니스 & PT', '파워리프팅 기초',
        TO_DATE('2025-10-01','YYYY-MM-DD'), TO_DATE('2025-10-31','YYYY-MM-DD'),
        TO_DATE('2025-11-01','YYYY-MM-DD'), TO_DATE('2026-02-01','YYYY-MM-DD'),
        '기초 근력 운동', 10);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '피트니스 & PT', '파워리프팅 중급',
        TO_DATE('2025-10-05','YYYY-MM-DD'), TO_DATE('2025-11-04','YYYY-MM-DD'),
        TO_DATE('2025-11-05','YYYY-MM-DD'), TO_DATE('2026-02-05','YYYY-MM-DD'),
        '중급 근력 운동', 10);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '피트니스 & PT', '기초 근력운동',
        TO_DATE('2025-10-10','YYYY-MM-DD'), TO_DATE('2025-11-09','YYYY-MM-DD'),
        TO_DATE('2025-11-10','YYYY-MM-DD'), TO_DATE('2026-02-10','YYYY-MM-DD'),
        '초보자를 위한 근력운동', 20);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '피트니스 & PT', '근력 향상 프로그램',
        TO_DATE('2025-10-15','YYYY-MM-DD'), TO_DATE('2025-11-14','YYYY-MM-DD'),
        TO_DATE('2025-11-15','YYYY-MM-DD'), TO_DATE('2026-02-15','YYYY-MM-DD'),
        '근력 향상 집중 훈련', 15);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '피트니스 & PT', '체력 향상 프로그램',
        TO_DATE('2025-10-20','YYYY-MM-DD'), TO_DATE('2025-11-19','YYYY-MM-DD'),
        TO_DATE('2025-11-20','YYYY-MM-DD'), TO_DATE('2026-03-01','YYYY-MM-DD'),
        '체력 및 근력 강화', 25);

INSERT INTO class (
  class_id,
  category,
  class_name,
  registration_start,
  registration_end,
  start_date,
  end_date,
  class_description,
  class_capacity
)
SELECT 
  class_id_seq.NEXTVAL,  -- 시퀀스로 PK 새로 부여
  category,
  class_name,
  registration_start,
  registration_end,
  start_date,
  end_date,
  class_description,
  class_capacity
FROM class;

INSERT INTO class (
  class_id,
  category,
  class_name,
  registration_start,
  registration_end,
  start_date,
  end_date,
  class_description,
  class_capacity
)
SELECT 
  class_id_seq.NEXTVAL,  -- 시퀀스로 PK 새로 부여
  category,
  class_name,
  registration_start,
  registration_end,
  start_date,
  end_date,
  class_description,
  class_capacity
FROM class;

INSERT INTO class (
  class_id,
  category,
  class_name,
  registration_start,
  registration_end,
  start_date,
  end_date,
  class_description,
  class_capacity
)
SELECT 
  class_id_seq.NEXTVAL,  -- 시퀀스로 PK 새로 부여
  category,
  class_name,
  registration_start,
  registration_end,
  start_date,
  end_date,
  class_description,
  class_capacity
FROM class;





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

-- 수강신청 샘플데이터 10개
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

-- 새로운 수강신청 샘플데이터 10개
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 1, 2, SYSDATE); -- 홍길동 → PT 맞춤 프로그램
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 1, 5, SYSDATE); -- 홍길동 → 필라테스
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 2, 1, SYSDATE); -- 김철수 → 헬스 초급
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 2, 3, SYSDATE); -- 김철수 → 요가 초급
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 3, 6, SYSDATE); -- 이영희 → 스피닝
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 4, 2, SYSDATE); -- 박민수 → PT 맞춤 프로그램
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 5, 4, SYSDATE); -- 최지은 → 요가 중급
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 6, 3, SYSDATE); -- 정우성 → 요가 초급
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 7, 5, SYSDATE); -- 한가인 → 필라테스
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 8, 7, SYSDATE); -- 오세훈 → 스트레칭 / 릴렉스


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