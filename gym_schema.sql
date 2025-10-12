--ȸ������(�ｺ��)

--ȸ�����̺�
--ȸ�����̵�(������)
DROP SEQUENCE member_id_seq;
CREATE SEQUENCE member_id_seq
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 100000
  MINVALUE 1
  CYCLE;

DROP TABLE member CASCADE CONSTRAINTS purge;
CREATE TABLE member (
  member_id NUMBER(6, 0) CONSTRAINT member_merber_id_pk PRIMARY KEY, --ȸ�����̵�(pk, seq)
  login_id VARCHAR2(15) NOT NULL, --���̵�(not null)
  login_pw VARCHAR2(15) NOT NULL, --��й�ȣ(not null)
  member_name VARCHAR2(20) NOT NULL, --�̸�(not null)
  birth DATE NOT NULL, --�������(not null)
  tel VARCHAR2(20) NOT NULL, --�޴�����ȣ(not null)
  join_date DATE DEFAULT SYSDATE
);

-- ���õ�����
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

INSERT INTO member (member_id, login_id, login_pw, member_name, birth, tel, join_date)
VALUES (member_id_seq.NEXTVAL, 'sys', 'sys', '������', SYSDATE, '010-1234-5678', SYSDATE);



--�������̺�
--�������̵�(������)
DROP SEQUENCE class_id_seq;
CREATE SEQUENCE class_id_seq
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 100000
  MINVALUE 1
  CYCLE;

DROP TABLE class CASCADE CONSTRAINTS purge;
CREATE TABLE class (
  class_id NUMBER(6, 0) CONSTRAINT class_class_id_pk PRIMARY KEY, --�������̵�(pk, seq)
  category VARCHAR2(30), -- ���� ī�װ�
  class_name VARCHAR2(50) NOT NULL, --������(not null)
  registration_start DATE NOT NULL, -- ���� ��� ������(�������۳�¥ 1~2����)
  registration_end DATE NOT NULL, -- ���� ��� ������(�������۳�¥ �Ϸ���)
  start_date DATE NOT NULL, --�������۳�¥(not null)
  end_date DATE NOT NULL, --�������ᳯ¥(not null)
  class_description CLOB, --��������
  class_capacity NUMBER(6, 0) NOT NULL, --��������(not null)
  class_date DATE DEFAULT SYSDATE NOT NULL -- ����������¥
);


SET DEFINE OFF;

-- ========================== ����� & �� (10��) ==========================
INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '����� & ��', '���Ǵ�',
        TO_DATE('2025-09-03','YYYY-MM-DD'), TO_DATE('2025-10-02','YYYY-MM-DD'),
        TO_DATE('2025-10-03','YYYY-MM-DD'), TO_DATE('2026-01-31','YYYY-MM-DD'),
        '����ҿ� ��ü ��ȭ ���Ǵ�', 25);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '����� & ��', '����Ʒκ�',
        TO_DATE('2025-09-08','YYYY-MM-DD'), TO_DATE('2025-10-07','YYYY-MM-DD'),
        TO_DATE('2025-10-08','YYYY-MM-DD'), TO_DATE('2026-02-15','YYYY-MM-DD'),
        '���� ����� �', 18);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '����� & ��', '���� ����',
        TO_DATE('2025-09-12','YYYY-MM-DD'), TO_DATE('2025-10-11','YYYY-MM-DD'),
        TO_DATE('2025-10-12','YYYY-MM-DD'), TO_DATE('2026-03-01','YYYY-MM-DD'),
        '���� �⺻ ��ų', 20);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '����� & ��', '�� �ʱ�',
        TO_DATE('2025-09-15','YYYY-MM-DD'), TO_DATE('2025-10-14','YYYY-MM-DD'),
        TO_DATE('2025-10-15','YYYY-MM-DD'), TO_DATE('2026-01-20','YYYY-MM-DD'),
        '���� �� ���α׷�', 20);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '����� & ��', '�� �߱�',
        TO_DATE('2025-09-20','YYYY-MM-DD'), TO_DATE('2025-10-19','YYYY-MM-DD'),
        TO_DATE('2025-10-20','YYYY-MM-DD'), TO_DATE('2026-01-25','YYYY-MM-DD'),
        '�߱� �� ���α׷�', 18);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '����� & ��', '�ܹ�',
        TO_DATE('2025-09-25','YYYY-MM-DD'), TO_DATE('2025-10-24','YYYY-MM-DD'),
        TO_DATE('2025-10-25','YYYY-MM-DD'), TO_DATE('2026-02-28','YYYY-MM-DD'),
        '����ҿ� ���� ���յ� �ܹ� ����', 22);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '����� & ��', '����κ�',
        TO_DATE('2025-10-01','YYYY-MM-DD'), TO_DATE('2025-10-31','YYYY-MM-DD'),
        TO_DATE('2025-11-01','YYYY-MM-DD'), TO_DATE('2026-02-15','YYYY-MM-DD'),
        '���������� ��ȭ ����κ�', 25);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '����� & ��', '��Ʈ����',
        TO_DATE('2025-10-05','YYYY-MM-DD'), TO_DATE('2025-11-04','YYYY-MM-DD'),
        TO_DATE('2025-11-05','YYYY-MM-DD'), TO_DATE('2026-03-01','YYYY-MM-DD'),
        '���� ��Ʈ���� ����', 20);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '����� & ��', '������ ��',
        TO_DATE('2025-10-10','YYYY-MM-DD'), TO_DATE('2025-11-09','YYYY-MM-DD'),
        TO_DATE('2025-11-10','YYYY-MM-DD'), TO_DATE('2026-03-05','YYYY-MM-DD'),
        '������ �ȹ��� ���� �� ����', 18);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '����� & ��', '���� �߱�',
        TO_DATE('2025-10-15','YYYY-MM-DD'), TO_DATE('2025-11-14','YYYY-MM-DD'),
        TO_DATE('2025-11-15','YYYY-MM-DD'), TO_DATE('2026-03-10','YYYY-MM-DD'),
        '���� ��ų ��� ���α׷�', 20);

-- ========================== �䰡 & �ʶ��׽� (10��) ==========================
INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '�䰡 & �ʶ��׽�', '�䰡 �ʱ�',
        TO_DATE('2025-09-02','YYYY-MM-DD'), TO_DATE('2025-10-01','YYYY-MM-DD'),
        TO_DATE('2025-10-02','YYYY-MM-DD'), TO_DATE('2025-12-30','YYYY-MM-DD'),
        '���� �䰡 �ڼ��� ȣ���', 20);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '�䰡 & �ʶ��׽�', '�䰡 �߱�',
        TO_DATE('2025-09-07','YYYY-MM-DD'), TO_DATE('2025-10-06','YYYY-MM-DD'),
        TO_DATE('2025-10-07','YYYY-MM-DD'), TO_DATE('2026-01-10','YYYY-MM-DD'),
        '�߱� �䰡 �ڼ��� ��Ʈ��Ī', 15);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '�䰡 & �ʶ��׽�', '�ʶ��׽� ����',
        TO_DATE('2025-09-12','YYYY-MM-DD'), TO_DATE('2025-10-11','YYYY-MM-DD'),
        TO_DATE('2025-10-12','YYYY-MM-DD'), TO_DATE('2026-01-15','YYYY-MM-DD'),
        '�ٷ°� �ھ� ��ȭ �ʶ��׽�', 20);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '�䰡 & �ʶ��׽�', '�ʶ��׽� �߱�',
        TO_DATE('2025-09-18','YYYY-MM-DD'), TO_DATE('2025-10-17','YYYY-MM-DD'),
        TO_DATE('2025-10-18','YYYY-MM-DD'), TO_DATE('2026-01-20','YYYY-MM-DD'),
        '�߱� �ʶ��׽�', 18);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '�䰡 & �ʶ��׽�', '�䰡 ���̾�Ʈ',
        TO_DATE('2025-09-25','YYYY-MM-DD'), TO_DATE('2025-10-24','YYYY-MM-DD'),
        TO_DATE('2025-10-25','YYYY-MM-DD'), TO_DATE('2026-02-01','YYYY-MM-DD'),
        '���̾�Ʈ�� �䰡', 20);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '�䰡 & �ʶ��׽�', '�ʶ��׽� ���̾�Ʈ',
        TO_DATE('2025-10-01','YYYY-MM-DD'), TO_DATE('2025-10-31','YYYY-MM-DD'),
        TO_DATE('2025-11-01','YYYY-MM-DD'), TO_DATE('2026-02-05','YYYY-MM-DD'),
        '�ھ� ��ȭ ���̾�Ʈ �ʶ��׽�', 18);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '�䰡 & �ʶ��׽�', '��Ʈ��Ī',
        TO_DATE('2025-10-05','YYYY-MM-DD'), TO_DATE('2025-11-04','YYYY-MM-DD'),
        TO_DATE('2025-11-05','YYYY-MM-DD'), TO_DATE('2026-02-10','YYYY-MM-DD'),
        '���� ��Ʈ��Ī', 25);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '�䰡 & �ʶ��׽�', '�䰡 ���� ���α׷�',
        TO_DATE('2025-10-10','YYYY-MM-DD'), TO_DATE('2025-11-09','YYYY-MM-DD'),
        TO_DATE('2025-11-10','YYYY-MM-DD'), TO_DATE('2026-02-15','YYYY-MM-DD'),
        '���� �䰡 ����', 15);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '�䰡 & �ʶ��׽�', '�ʶ��׽� ���� ���α׷�',
        TO_DATE('2025-10-15','YYYY-MM-DD'), TO_DATE('2025-11-14','YYYY-MM-DD'),
        TO_DATE('2025-11-15','YYYY-MM-DD'), TO_DATE('2026-02-20','YYYY-MM-DD'),
        '���� �ʶ��׽�', 15);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '�䰡 & �ʶ��׽�', '�䰡 & ����',
        TO_DATE('2025-10-20','YYYY-MM-DD'), TO_DATE('2025-11-19','YYYY-MM-DD'),
        TO_DATE('2025-11-20','YYYY-MM-DD'), TO_DATE('2026-03-01','YYYY-MM-DD'),
        '���� �䰡', 20);

-- ========================== ��Ʈ�Ͻ� & PT (10��) ==========================
INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '��Ʈ�Ͻ� & PT', '�ｺ �ʱ�',
        TO_DATE('2025-09-01','YYYY-MM-DD'), TO_DATE('2025-09-30','YYYY-MM-DD'),
        TO_DATE('2025-10-01','YYYY-MM-DD'), TO_DATE('2025-12-31','YYYY-MM-DD'),
        '���� �ｺ Ʈ���̴� ����', 30);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '��Ʈ�Ͻ� & PT', '�ｺ �߱�',
        TO_DATE('2025-09-05','YYYY-MM-DD'), TO_DATE('2025-10-04','YYYY-MM-DD'),
        TO_DATE('2025-10-05','YYYY-MM-DD'), TO_DATE('2025-12-31','YYYY-MM-DD'),
        '�߱� �ｺ � ���α׷�', 25);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '��Ʈ�Ͻ� & PT', 'PT ���� ���α׷�',
        TO_DATE('2025-09-10','YYYY-MM-DD'), TO_DATE('2025-10-09','YYYY-MM-DD'),
        TO_DATE('2025-10-10','YYYY-MM-DD'), TO_DATE('2025-12-31','YYYY-MM-DD'),
        '���� ���� � ���α׷�', 10);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '��Ʈ�Ͻ� & PT', 'ũ�ν��� �Թ�',
        TO_DATE('2025-09-12','YYYY-MM-DD'), TO_DATE('2025-10-11','YYYY-MM-DD'),
        TO_DATE('2025-10-12','YYYY-MM-DD'), TO_DATE('2026-01-15','YYYY-MM-DD'),
        'ũ�ν��� ���� �ٷ��Ʒ�', 12);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '��Ʈ�Ͻ� & PT', 'ũ�ν��� �߱�',
        TO_DATE('2025-09-20','YYYY-MM-DD'), TO_DATE('2025-10-19','YYYY-MM-DD'),
        TO_DATE('2025-10-20','YYYY-MM-DD'), TO_DATE('2026-01-20','YYYY-MM-DD'),
        '�߱� ũ�ν��� �', 12);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '��Ʈ�Ͻ� & PT', '�Ŀ������� ����',
        TO_DATE('2025-10-01','YYYY-MM-DD'), TO_DATE('2025-10-31','YYYY-MM-DD'),
        TO_DATE('2025-11-01','YYYY-MM-DD'), TO_DATE('2026-02-01','YYYY-MM-DD'),
        '���� �ٷ� �', 10);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '��Ʈ�Ͻ� & PT', '�Ŀ������� �߱�',
        TO_DATE('2025-10-05','YYYY-MM-DD'), TO_DATE('2025-11-04','YYYY-MM-DD'),
        TO_DATE('2025-11-05','YYYY-MM-DD'), TO_DATE('2026-02-05','YYYY-MM-DD'),
        '�߱� �ٷ� �', 10);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '��Ʈ�Ͻ� & PT', '���� �ٷ¿',
        TO_DATE('2025-10-10','YYYY-MM-DD'), TO_DATE('2025-11-09','YYYY-MM-DD'),
        TO_DATE('2025-11-10','YYYY-MM-DD'), TO_DATE('2026-02-10','YYYY-MM-DD'),
        '�ʺ��ڸ� ���� �ٷ¿', 20);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '��Ʈ�Ͻ� & PT', '�ٷ� ��� ���α׷�',
        TO_DATE('2025-10-15','YYYY-MM-DD'), TO_DATE('2025-11-14','YYYY-MM-DD'),
        TO_DATE('2025-11-15','YYYY-MM-DD'), TO_DATE('2026-02-15','YYYY-MM-DD'),
        '�ٷ� ��� ���� �Ʒ�', 15);

INSERT INTO class (class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
VALUES (class_id_seq.NEXTVAL, '��Ʈ�Ͻ� & PT', 'ü�� ��� ���α׷�',
        TO_DATE('2025-10-20','YYYY-MM-DD'), TO_DATE('2025-11-19','YYYY-MM-DD'),
        TO_DATE('2025-11-20','YYYY-MM-DD'), TO_DATE('2026-03-01','YYYY-MM-DD'),
        'ü�� �� �ٷ� ��ȭ', 25);

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
  class_id_seq.NEXTVAL,  -- �������� PK ���� �ο�
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
  class_id_seq.NEXTVAL,  -- �������� PK ���� �ο�
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
  class_id_seq.NEXTVAL,  -- �������� PK ���� �ο�
  category,
  class_name,
  registration_start,
  registration_end,
  start_date,
  end_date,
  class_description,
  class_capacity
FROM class;





--���� ��û ���̺�(ȸ�� - ���� ����)
--������û���̵�(������)
DROP SEQUENCE enrollment_id_seq;
CREATE SEQUENCE enrollment_id_seq
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 100000
  MINVALUE 1
  CYCLE;

DROP TABLE enrollment CASCADE CONSTRAINTS purge;
CREATE TABLE enrollment (
  enrollment_id NUMBER(6, 0) CONSTRAINT enrollment_enrollment_id_pk PRIMARY KEY, --��û���̵�(pk, seq)
  member_id NUMBER(6, 0) NOT NULL, --ȸ�����̵�(not null)
  class_id NUMBER(6, 0) NOT NULL, --�������̵�(not null)
  enrollment_date DATE DEFAULT SYSDATE NOT NULL, --������û��¥(default sysdate)
  CONSTRAINT enrollment_member_fk FOREIGN KEY (member_id) REFERENCES member(member_id), --�ܷ�Ű
  CONSTRAINT enrollment_class_fk FOREIGN KEY (class_id) REFERENCES class(class_id), --�ܷ�Ű
  CONSTRAINT member_class_uq UNIQUE (member_id, class_id) --���� ���� �ߺ� ����
);

-- ������û ���õ����� 10��
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

-- ���ο� ������û ���õ����� 10��
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 1, 2, SYSDATE); -- ȫ�浿 �� PT ���� ���α׷�
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 1, 5, SYSDATE); -- ȫ�浿 �� �ʶ��׽�
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 2, 1, SYSDATE); -- ��ö�� �� �ｺ �ʱ�
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 2, 3, SYSDATE); -- ��ö�� �� �䰡 �ʱ�
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 3, 6, SYSDATE); -- �̿��� �� ���Ǵ�
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 4, 2, SYSDATE); -- �ڹμ� �� PT ���� ���α׷�
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 5, 4, SYSDATE); -- ������ �� �䰡 �߱�
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 6, 3, SYSDATE); -- ���켺 �� �䰡 �ʱ�
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 7, 5, SYSDATE); -- �Ѱ��� �� �ʶ��׽�
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES
(enrollment_id_seq.NEXTVAL, 8, 7, SYSDATE); -- ������ �� ��Ʈ��Ī / ������


--�⼮���̺�
--�⼮���̵�(������)
DROP SEQUENCE attendance_id_seq;
CREATE SEQUENCE attendance_id_seq
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 100000
  MINVALUE 1
  CYCLE;
  
DROP TABLE attendance CASCADE CONSTRAINTS purge;
CREATE TABLE attendance(
  attendance_id NUMBER(6, 0) CONSTRAINT attendance_attendance_id_pk PRIMARY KEY, --�⼮��ȣ(pk, seq)
  member_id NUMBER(6, 0) NOT NULL, --ȸ�����̵�
  check_in_time DATE DEFAULT SYSDATE NOT NULL, --�Խǽð�
  check_out_time DATE, --��ǽð�
  CONSTRAINT attendance_member_fk FOREIGN KEY (member_id) REFERENCES member(member_id) --�ܷ�Ű
);