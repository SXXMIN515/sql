--?öå?õêÍ¥?Î¶?(?ó¨?ä§?û•)

--?öå?õê?Öå?ù¥Î∏?
--?öå?õê?ïÑ?ù¥?îî(?ãú???ä§)
DROP SEQUENCE member_id_seq;
CREATE SEQUENCE member_id_seq
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 100000
  MINVALUE 1
  CYCLE;

DROP TABLE member CASCADE CONSTRAINTS purge;
CREATE TABLE member (
  member_id NUMBER(6, 0) CONSTRAINT member_merber_id_pk PRIMARY KEY, --?öå?õê?ïÑ?ù¥?îî(pk, seq)
  login_id VARCHAR2(15) NOT NULL, --?ïÑ?ù¥?îî(not null)
  login_pw VARCHAR2(15) NOT NULL, --ÎπÑÎ?Î≤àÌò∏(not null)
  member_name VARCHAR2(20) NOT NULL, --?ù¥Î¶?(not null)
  birth DATE NOT NULL, --?Éù?ÖÑ?õî?ùº(not null)
  tel VARCHAR2(20) NOT NULL, --?ú¥???è∞Î≤àÌò∏(not null)
  join_date DATE DEFAULT SYSDATE
);

-- ?Éò?îå?ç∞?ù¥?Ñ∞
INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user01', 'pw01', '»´±Êµø', TO_DATE('1990-01-15','YYYY-MM-DD'), '010-1111-1111', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user02', 'pw02', '±Ë√∂ºˆ', TO_DATE('1988-05-20','YYYY-MM-DD'), '010-2222-2222', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user03', 'pw03', '¿Ãøµ»Ò', TO_DATE('1992-11-03','YYYY-MM-DD'), '010-3333-3333', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user04', 'pw04', 'π⁄πŒºˆ', TO_DATE('1995-07-08','YYYY-MM-DD'), '010-4444-4444', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user05', 'pw05', '√÷¡ˆ¿∫', TO_DATE('1993-03-12','YYYY-MM-DD'), '010-5555-5555', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user06', 'pw06', '¡§øÏº∫', TO_DATE('1987-09-25','YYYY-MM-DD'), '010-6666-6666', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user07', 'pw07', '«—∞°¿Œ', TO_DATE('1991-12-30','YYYY-MM-DD'), '010-7777-7777', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user08', 'pw08', 'ø¿ºº»∆', TO_DATE('1989-02-17','YYYY-MM-DD'), '010-8888-8888', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user09', 'pw09', 'º≠¡ˆºˆ', TO_DATE('1994-06-22','YYYY-MM-DD'), '010-9999-9999', SYSDATE);

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'user10', 'pw10', '¿Âµø∞«', TO_DATE('1986-04-10','YYYY-MM-DD'), '010-1010-1010', SYSDATE);


--?àò?óÖ?Öå?ù¥Î∏?
--?àò?óÖ?ïÑ?ù¥?îî(?ãú???ä§)
DROP SEQUENCE class_id_seq;
CREATE SEQUENCE class_id_seq
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 100000
  MINVALUE 1
  CYCLE;

DROP TABLE class CASCADE CONSTRAINTS purge;
CREATE TABLE class (
  class_id NUMBER(6, 0) CONSTRAINT class_class_id_pk PRIMARY KEY, --?àò?óÖ?ïÑ?ù¥?îî(pk, seq)
  category VARCHAR2(30), -- ?àò?óÖ Ïπ¥ÌÖåÍ≥†Î¶¨
  class_name VARCHAR2(50) NOT NULL, --?àò?óÖÎ™?(not null)
  registration_start DATE NOT NULL, -- ?àò?óÖ ?ì±Î°? ?ãú?ûë?ùº(?àò?óÖ?ãú?ûë?Ç†Ïß? 1~2?ã¨?†Ñ)
  registration_end DATE NOT NULL, -- ?àò?óÖ ?ì±Î°? ÎßàÍ∞ê?ùº(?àò?óÖ?ãú?ûë?Ç†Ïß? ?ïòÎ£®Ï†Ñ)
  start_date DATE NOT NULL, --?àò?óÖ?ãú?ûë?Ç†Ïß?(not null)
  end_date DATE NOT NULL, --?àò?óÖÏ¢ÖÎ£å?Ç†Ïß?(not null)
  class_description VARCHAR2(1000), --?àò?óÖ?Ñ§Î™?
  class_capacity NUMBER(6, 0) NOT NULL, --?àòÍ∞ïÏ†ï?õê(not null)
  class_date DATE DEFAULT SYSDATE NOT NULL -- ?àò?óÖ?Éù?Ñ±?Ç†Ïß?
);


SET DEFINE OFF;
BEGIN
  FOR i IN 1..200 LOOP
    INSERT INTO class(class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
    VALUES(class_id_seq.NEXTVAL, '««∆Æ¥œΩ∫ & PT',
           'PT ≈¨∑°Ω∫ ' || i,
           TO_DATE('2025-09-01','YYYY-MM-DD'), TO_DATE('2025-09-30','YYYY-MM-DD'),
           TO_DATE('2025-10-01','YYYY-MM-DD'), TO_DATE('2026-01-31','YYYY-MM-DD'),
           '¿¸Ω≈ øÓµø∞˙ √º∑¬ ∞≠»≠ø° √ ¡°¿ª ∏¬√· PT ≈¨∑°Ω∫ ' || i,
           15 + MOD(i, 10));
  END LOOP;

  FOR i IN 1..200 LOOP
    INSERT INTO class(class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
    VALUES(class_id_seq.NEXTVAL, 'ø‰∞° & ««∆Æ¥œΩ∫',
           'ø‰∞° ≈¨∑°Ω∫ ' || i,
           TO_DATE('2025-09-01','YYYY-MM-DD'), TO_DATE('2025-09-30','YYYY-MM-DD'),
           TO_DATE('2025-10-01','YYYY-MM-DD'), TO_DATE('2026-01-31','YYYY-MM-DD'),
           '∏∂¿Ω∞˙ ∏ˆ¿« ±’«¸¿ª ¿ß«— ø‰∞° ≈¨∑°Ω∫ ' || i,
           10 + MOD(i, 10));
  END LOOP;

  FOR i IN 1..200 LOOP
    INSERT INTO class(class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
    VALUES(class_id_seq.NEXTVAL, '¿ØªÍº“ & ¥ÌΩ∫',
           '¥ÌΩ∫ ≈¨∑°Ω∫ ' || i,
           TO_DATE('2025-09-01','YYYY-MM-DD'), TO_DATE('2025-09-30','YYYY-MM-DD'),
           TO_DATE('2025-10-01','YYYY-MM-DD'), TO_DATE('2026-01-31','YYYY-MM-DD'),
           'Ω…∆Û ¡ˆ±∏∑¬ «‚ªÛ∞˙ ¿ÁπÃ∏¶ ¿ß«— ¥ÌΩ∫ ≈¨∑°Ω∫ ' || i,
           20 + MOD(i, 10));
  END LOOP;
END;
/






--?àòÍ∞? ?ã†Ï≤? ?Öå?ù¥Î∏?(?öå?õê - ?àò?óÖ ?ó∞Í≤?)
--?àòÍ∞ïÏã†Ï≤??ïÑ?ù¥?îî(?ãú???ä§)
DROP SEQUENCE enrollment_id_seq;
CREATE SEQUENCE enrollment_id_seq
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 100000
  MINVALUE 1
  CYCLE;

DROP TABLE enrollment CASCADE CONSTRAINTS purge;
CREATE TABLE enrollment (
  enrollment_id NUMBER(6, 0) CONSTRAINT enrollment_enrollment_id_pk PRIMARY KEY, --?ã†Ï≤??ïÑ?ù¥?îî(pk, seq)
  member_id NUMBER(6, 0) NOT NULL, --?öå?õê?ïÑ?ù¥?îî(not null)
  class_id NUMBER(6, 0) NOT NULL, --?àò?óÖ?ïÑ?ù¥?îî(not null)
  enrollment_date DATE DEFAULT SYSDATE NOT NULL, --?àò?óÖ?ã†Ï≤??Ç†Ïß?(default sysdate)
  CONSTRAINT enrollment_member_fk FOREIGN KEY (member_id) REFERENCES member(member_id), --?ô∏?ûò?Ç§
  CONSTRAINT enrollment_class_fk FOREIGN KEY (class_id) REFERENCES class(class_id), --?ô∏?ûò?Ç§
  CONSTRAINT member_class_uq UNIQUE (member_id, class_id) --Í∞ôÏ? ?àò?óÖ Ï§ëÎ≥µ Î∞©Ï?
);

-- ?àòÍ∞ïÏã†Ï≤? ?Éò?îå?ç∞?ù¥?Ñ∞ 10Í∞?
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

-- ?ÉàÎ°úÏö¥ ?àòÍ∞ïÏã†Ï≤? ?Éò?îå?ç∞?ù¥?Ñ∞ 10Í∞?
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 1, 2, SYSDATE); -- ?ôçÍ∏∏Îèô ?Üí PT ÎßûÏ∂§ ?îÑÎ°úÍ∑∏?û®
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 1, 5, SYSDATE); -- ?ôçÍ∏∏Îèô ?Üí ?ïÑ?ùº?Öå?ä§
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 2, 1, SYSDATE); -- Íπ?Ï≤†Ïàò ?Üí ?ó¨?ä§ Ï¥àÍ∏â
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 2, 3, SYSDATE); -- Íπ?Ï≤†Ïàò ?Üí ?öîÍ∞? Ï¥àÍ∏â
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 3, 6, SYSDATE); -- ?ù¥?òÅ?ù¨ ?Üí ?ä§?îº?ãù
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 4, 2, SYSDATE); -- Î∞ïÎ?ºÏàò ?Üí PT ÎßûÏ∂§ ?îÑÎ°úÍ∑∏?û®
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 5, 4, SYSDATE); -- ÏµúÏ??? ?Üí ?öîÍ∞? Ï§ëÍ∏â
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 6, 3, SYSDATE); -- ?†ï?ö∞?Ñ± ?Üí ?öîÍ∞? Ï¥àÍ∏â
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 7, 5, SYSDATE); -- ?ïúÍ∞??ù∏ ?Üí ?ïÑ?ùº?Öå?ä§
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 8, 7, SYSDATE); -- ?ò§?Ñ∏?õà ?Üí ?ä§?ä∏?†àÏπ? / Î¶¥Î†â?ä§


--Ï∂úÏÑù?Öå?ù¥Î∏?
--Ï∂úÏÑù?ïÑ?ù¥?îî(?ãú???ä§)
DROP SEQUENCE attendance_id_seq;
CREATE SEQUENCE attendance_id_seq
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 100000
  MINVALUE 1
  CYCLE;
  
DROP TABLE attendance CASCADE CONSTRAINTS purge;
CREATE TABLE attendance(
  attendance_id NUMBER(6, 0) CONSTRAINT attendance_attendance_id_pk PRIMARY KEY, --Ï∂úÏÑùÎ≤àÌò∏(pk, seq)
  member_id NUMBER(6, 0) NOT NULL, --?öå?õê?ïÑ?ù¥?îî
  check_in_time DATE DEFAULT SYSDATE NOT NULL, --?ûÖ?ã§?ãúÍ∞?
  check_out_time DATE, --?á¥?ã§?ãúÍ∞?
  CONSTRAINT attendance_member_fk FOREIGN KEY (member_id) REFERENCES member(member_id) --?ô∏?ûò?Ç§
);