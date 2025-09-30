-- 1page: 1 ~ 10, 2page: 11 ~ 20,
SELECT b.*
FROM (SELECT /*+ INDEX_DESC(a SYS_C008737) */ rownum rn, a.*
      FROM board_t a) b
WHERE b.rn > (:page - 1) * 10     
AND   b.rn <= (:page * 10);

SELECT /*+ INDEX_DESC(b SYS_C008737) */ b.*
FROM board_t b;

CREATE INDEX board_write_date_idx
ON board_t(write_date);

DELETE FROM board_t WHERE board_no = 6;