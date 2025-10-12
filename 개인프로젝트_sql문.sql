SELECT *
FROM class
ORDER BY class_id;

SELECT *
FROM enrollment;

-- 수업 목록 출력
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
ORDER BY c.class_id; -- 최신 등록 순
--ORDER BY c.end_date; -- 마감 빠른 순
--ORDER BY c.start_date; -- 시작일 순

SELECT *
FROM member;

DELETE FROM member
WHERE member_id = 11;

SELECT DISTINCT category
FROM class;