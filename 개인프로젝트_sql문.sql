SELECT *
FROM class
ORDER BY class_id;

SELECT *
FROM enrollment;

-- ?ˆ˜?—… ëª©ë¡ ì¶œë ¥
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
ORDER BY c.class_id DESC; -- ìµœì‹  ?“±ë¡? ?ˆœ
--ORDER BY c.registration_end ASC; -- ë§ˆê° ë¹ ë¥¸ ?ˆœ
--ORDER BY c.start_date ASC; -- ?‹œ?ž‘?¼ ë¹ ë¥¸ ?ˆœ

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
    
-- ?ˆ˜?—… ?‹ ì²? ëª©ë¡
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