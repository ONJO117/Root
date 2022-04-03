DROP TABLE board CASCADE CONSTRAINTS;
DROP SEQUENCE board_seq;

CREATE TABLE board(
  no NUMBER PRIMARY KEY,
  title VARCHAR2 (300) NOT NULL,
  content VARCHAR2 (2000) NOT NULL,
  writer VARCHAR2 (30) NOT NULL,
  writeDate DATE DEFAULT SYSDATE,
  hit NUMBER DEFAULT 0
);

CREATE SEQUENCE board_seq;

INSERT INTO board(no, title, content, writer, pw)
VALUES(board_seq.NEXTVAL, '테스트?', '테스트', 'baik', '1111');
INSERT INTO board(no, title, content, writer, pw)
VALUES(board_seq.NEXTVAL, '테스트1?', '테스트', 'baik', '1111');
INSERT INTO board(no, title, content, writer, pw)
VALUES(board_seq.NEXTVAL, '테스트2?', '테스트', 'baik', '1111');
INSERT INTO board(no, title, content, writer, pw)
VALUES(board_seq.NEXTVAL, '테스트3?', '테스트', 'baik', '1111');
INSERT INTO board(no, title, content, writer, pw)
VALUES(board_seq.NEXTVAL, '테스트4?', '테스트', 'baik', '1111');
INSERT INTO board(no, title, content, writer, pw)
VALUES(board_seq.NEXTVAL, '테스트5?', '테스트', 'baik', '1111');


DELETE board 
WHERE no = 44;
COMMIT;

-- 데이터 확인
SELECT * FROM  board;