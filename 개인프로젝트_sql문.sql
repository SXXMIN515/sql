SELECT *
FROM class
ORDER BY class_id;

SELECT *
FROM enrollment;

-- ?��?�� 목록 출력
SELECT c.class_id
      ,c.category
      ,c.class_name
      ,TO_CHAR(c.registration_start, 'YYYY/MM/DD') AS "REGISTRATION_START"
      ,TO_CHAR(c.registration_end, 'YYYY/MM/DD') AS "REGISTRATION_END"
      ,TO_CHAR(c.start_date, 'YYYY/MM/DD') AS "START_DATE"
      ,TO_CHAR(c.end_date, 'YYYY/MM/DD') AS "END_DATE"
      ,COUNT(e.enrollment_id) AS "ENROLLMENT_COUNT"
      ,c.class_capacity
FROM class c
LEFT JOIN enrollment e
ON c.class_id = e.class_id
GROUP BY c.class_id
        ,c.category
        ,c.class_name
        ,c.registration_start
        ,c.registration_end
        ,c.start_date
        ,c.end_date
        ,c.class_capacity
ORDER BY c.class_id DESC; -- 최신 ?���? ?��
--ORDER BY c.registration_end ASC; -- 마감 빠른 ?��
--ORDER BY c.start_date ASC; -- ?��?��?�� 빠른 ?��

SELECT *
FROM member;

DELETE FROM member
WHERE member_id = 11;

SELECT *
FROM class;

SELECT *
      FROM (
        SELECT c.class_id
              ,c.category
              ,c.class_name
              ,TO_CHAR(c.registration_start, 'YYYY/MM/DD') AS registration_start
              ,TO_CHAR(c.registration_end, 'YYYY/MM/DD') AS registration_end
              ,TO_CHAR(c.start_date, 'YYYY/MM/DD') AS start_date
              ,TO_CHAR(c.end_date, 'YYYY/MM/DD') AS end_date
              ,COUNT(e.enrollment_id) OVER(PARTITION BY c.class_id) AS enrollment_count
              ,c.class_capacity
              ,ROW_NUMBER() OVER(ORDER BY ${orderBy}) AS rn
        FROM class c
        LEFT JOIN enrollment e
        ON c.class_id = e.class_id
        ${whereClause}
      )
      WHERE rn > :offset AND rn <= :offset + :perPage;
    
-- ?��?�� ?���? 목록
SELECT *
FROM enrollment
WHERE member_id = 12;

SELECT c.class_id
     , c.category
     , c.class_name
     , c.registration_start
     , c.registration_end
     , c.start_date
     , c.end_date
     , c.class_description
     , c.class_capacity
     , COUNT(e.enrollment_id) OVER(PARTITION BY c.class_id) AS enrollment_count
FROM class c
LEFT JOIN enrollment e
ON c.class_id = e.class_id
WHERE c.class_id = 600
GROUP BY c.class_id, c.category, c.class_name, c.registration_start, c.registration_end, 
         c.start_date, c.end_date, c.class_description, c.class_capacity, e.enrollment_id;
         
SELECT c.class_id
                        ,c.category
                        ,c.class_name
                        ,TO_CHAR(c.registration_start, 'YYYY/MM/DD') AS "REGISTRATION_START"
                        ,TO_CHAR(c.registration_end, 'YYYY/MM/DD') AS "REGISTRATION_END"
                        ,TO_CHAR(c.start_date, 'YYYY/MM/DD') AS "START_DATE"
                        ,TO_CHAR(c.end_date, 'YYYY/MM/DD') AS "END_DATE"
                        ,COUNT(e.enrollment_id) AS "ENROLLMENT_COUNT"
                        ,c.class_capacity
                  FROM class c
                  LEFT JOIN enrollment e
                  ON c.class_id = e.class_id
                  GROUP BY c.class_id
                          ,c.category
                          ,c.class_name
                          ,c.registration_start
                          ,c.registration_end
                          ,c.start_date
                          ,c.end_date
                          ,c.class_capacity
                  ORDER BY c.class_id DESC;
                  
-- gpt가 수정해준 코드
SELECT c.class_id,
       c.category,
       c.class_name,
       TO_CHAR(c.registration_start, 'YYYY/MM/DD') AS "REGISTRATION_START",
       TO_CHAR(c.registration_end, 'YYYY/MM/DD') AS "REGISTRATION_END",
       TO_CHAR(c.start_date, 'YYYY/MM/DD') AS "START_DATE",
       TO_CHAR(c.end_date, 'YYYY/MM/DD') AS "END_DATE",
       COUNT(e.enrollment_id) AS "ENROLLMENT_COUNT",
       c.class_capacity
FROM class c
LEFT JOIN enrollment e ON c.class_id = e.class_id
GROUP BY c.class_id,
         c.category,
         c.class_name,
         c.registration_start,
         c.registration_end,
         c.start_date,
         c.end_date,
         c.class_capacity
ORDER BY c.class_id DESC
                  
                  INSERT INTO class(class_id, category, class_name, registration_start, registration_end, start_date, end_date, class_description, class_capacity)
    VALUES(class_id_seq.NEXTVAL, '피트니스 PT',
           'PT 클래스 ',
           TO_DATE('2025-09-01','YYYY-MM-DD'), TO_DATE('2025-09-20','YYYY-MM-DD'),
           TO_DATE('2026-10-01','YYYY-MM-DD'), TO_DATE('2026-01-31','YYYY-MM-DD'),
           '전신 운동과 체력 강화에 초점을 맞춘 PT 클래스 ', 30);
           
           DELETE FROM class
           WHERE category = '피트니스 PT';
           
UPDATE member
SET login_pw = '12'
   ,member_name = '12'
   ,birth = TO_DATE('1987-09-25','YYYY-MM-DD')
   ,tel = '010-1234-5678'
WHERE member_id = 11;

SELECT member_id
                         ,login_id
                         ,login_pw
                         ,member_name
                         ,TO_DATE(birth, 'YYYY/MM/DD')
                         ,tel
                   FROM member;

SELECT *
FROM member
WHERE member_id = 11;

SELECT member_id,
             login_id,
             login_pw,
             member_name,
             TO_CHAR(birth, 'YYYY-MM-DD') AS birth,
             tel AS tel
      FROM member
      WHERE login_id = 11
        AND login_pw = 1234;
        
        select *
        from member;
        
        -- class_id = 591 (8명)
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 1, 591, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 2, 591, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 3, 591, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 4, 591, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 5, 591, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 6, 591, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 7, 591, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 8, 591, SYSDATE);

-- class_id = 592 (5명)
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 2, 592, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 4, 592, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 6, 592, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 8, 592, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 10, 592, SYSDATE);

-- class_id = 593 (9명)
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 1, 593, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 3, 593, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 5, 593, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 7, 593, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 9, 593, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 11, 593, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 12, 593, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 2, 593, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 4, 593, SYSDATE);

-- class_id = 594 (3명)
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 5, 594, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 6, 594, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 7, 594, SYSDATE);

-- class_id = 595 (10명)
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 1, 595, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 2, 595, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 3, 595, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 4, 595, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 5, 595, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 6, 595, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 7, 595, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 8, 595, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 9, 595, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 10, 595, SYSDATE);

-- class_id = 596 (6명)
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 3, 596, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 4, 596, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 5, 596, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 6, 596, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 7, 596, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 8, 596, SYSDATE);

-- class_id = 597 (4명)
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 9, 597, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 10, 597, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 11, 597, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 12, 597, SYSDATE);

-- class_id = 598 (7명)
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 1, 598, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 2, 598, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 3, 598, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 5, 598, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 7, 598, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 9, 598, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 11, 598, SYSDATE);

-- class_id = 599 (2명)
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 6, 599, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 12, 599, SYSDATE);

-- class_id = 600 (8명)
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 2, 600, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 3, 600, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 4, 600, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 7, 600, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 8, 600, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 9, 600, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 10, 600, SYSDATE);
INSERT INTO enrollment (enrollment_id, member_id, class_id, enrollment_date) VALUES (enrollment_id_seq.NEXTVAL, 11, 600, SYSDATE);

COMMIT;
