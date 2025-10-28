show databases;
use dev;

show tables;

SELECT email FROM customers WHERE id = 1 AND phone = "010-1111-1111";

UPDATE customers
SET email = "tnals686@daum.net"
WHERE id = 1;

INSERT INTO customers (name, email, phone)
value (name='test2', email='test2@email.com', phone='010-1122-3344');

ALTER TABLE customers
ADD COLUMN password_hash VARCHAR(255) NOT NULL DEFAULT '1';
ALTER TABLE customers
ADD COLUMN password_salt VARCHAR(255) NOT NULL DEFAULT '1';

SELECT *
FROM customers
ORDER BY id ASC;

DELETE FROM customers
WHERE id = 24;

SELECT * FROM customers WHERE email = "tnals686@daum.net" AND password_hash = 1;

CREATE TABLE `product_image` (
  `id` INT NOT NULL AUTO_INCREMENT, -- 키.
  `product_id` VARCHAR(100) NOT NULL, -- 상품아이디.
  `type` VARCHAR(10) NOT NULL, -- 메인이미지, 슬라이드이미지, 설명이미지
  `file_name` VARCHAR(100) NOT NULL, -- 이미지파일명.
  `create_date` timestamp default now(), -- 등록시간.
  PRIMARY KEY (`id`));
  
  SELECT id, name, email, phone, address 
  FROM customers;
  
  -- 글번호, 제목, 내용, 작성자, 작성일시
  CREATE TABLE tbl_board (
  `id` INT NOT NULL AUTO_INCREMENT, -- 키.
  `title` VARCHAR(50) NOT NULL,
  `content` VARCHAR(500) NOT NULL,
  `writer` VARCHAR(50) NOT NULL,
  `write_date` timestamp default now(), -- 등록시간.
  PRIMARY KEY (`id`)
  );

SELECT *
FROM tbl_board;

INSERT INTO tbl_board (title, content, writer)
VALUES('날씨가 추워요', '오늘은 날씨가 많이 추워요', 'user01');

INSERT INTO tbl_board SET title='날씨가 좋아요', content='해가 밝게 떴네요', writer='user02';

INSERT INTO tbl_board SET title='날씨 어때요?', content='오늘은 너무 추워요', writer='user03';

DELETE FROM tbl_board
WHERE id >=33;

UPDATE tbl_board
SET title='내일은 날씨가?', content='좋아질까요?'
WHERE id = 2;
-- CRUD => 추가수정삭제조회.
-- DB+Express => localhost:3000/boards (GET) 목록.
--               localhost:3000/board (POST) 등록.
--                             /board/:id (GET) 조회
--                             /board (PUT) 수정.
--                             /board/:id (DELETE) 삭제.

  -- 댓글번호, 댓글내용, 댓글작성자, 생성일자, 원본글번호
  CREATE TABLE tbl_reply (
  `reply_id` INT NOT NULL AUTO_INCREMENT, -- 키.
  `reply_content` VARCHAR(500) NOT NULL,
  `reply_writer` VARCHAR(50) NOT NULL,
  `reply_write_date` timestamp default now(), -- 등록시간.
  `id` INT NOT NULL,
  PRIMARY KEY (`reply_id`)
  );
  
  INSERT INTO tbl_reply SET reply_content='테스트', reply_writer='user02', id=10;
  INSERT INTO tbl_reply SET reply_content='테스트2', reply_writer='user04', id=10;
  INSERT INTO tbl_reply SET reply_content='테스트3', reply_writer='user03', id=10;
  
  INSERT INTO tbl_reply SET reply_content='좋아요', reply_writer='user03', id=31;
  
  INSERT INTO tbl_reply SET reply_content='추워요', reply_writer='user04', id=32;
  
  SELECT *
  FROM tbl_reply;
  
  DELETE FROM tbl_reply
  WHERE reply_id >=9;
  
  SELECT r.* 
  FROM tbl_reply r
  JOIN tbl_board b
  ON r.id = b.id
  WHERE r.id = 31;
		