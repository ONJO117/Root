DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE grade CASCADE CONSTRAINTS;

CREATE TABLE grade(
gradeNo NUMBER(2) PRIMARY KEY,
gradeName VARCHAR2(20)
);
CREATE TABLE member(
id VARCHAR2(20) PRIMARY KEY,
pw VARCHAR2(20) NOT NULL,
name VARCHAR2(30) NOT NULL,
gender VARCHAR2(6) NOT NULL CHECK (gender in('남자', '여자')),
birth DATE NOT NULL,
tel VARCHAR2(13),
email VARCHAR2(50) NOT NULL,
regDate DATE DEFAULT SYSDATE,
conDate DATE DEFAULT SYSDATE,
status VARCHAR2(6) DEFAULT '정상' CHECK (status in ('정상','강퇴','탈퇴','휴면')) ,
photo VARCHAR2(100) DEFAULT '.upload/member/noImage.jpg',

gradeNo NUMBER(2) DEFAULT 1 REFERENCES grade(gradeNo)
);

INSERT INTO grade VALUES(1, '일반회원');
INSERT INTO grade VALUES(5, '메인');
INSERT INTO grade VALUES(9, '관리자');
INSERT INTO member(id, pw, name, gender, birth, tel, email, photo, gradeNo)
VALUES('admin', '1111', '백재근', '남자', '1995-01-17', '010-8924-2905', 'axszax@nate.com','/upload/member/admin.jpg', 9);
INSERT INTO member(id, pw, name, gender, birth, tel, email, photo)
VALUES('test', '1111', '홍길동', '남자', '1994-01-01', '010-3333-4444', 'hong@naver.com','/upload/member/test.jpg');
INSERT INTO member(id, pw, name, gender, birth, tel, email, photo)
VALUES('test1', '1111', '슈퍼맨', '여자', '1995-01-11', '010-5555-4444', 'super1@naver.com','/upload/member/noImage.jpg');
INSERT INTO member(id, pw, name, gender, birth, tel, email, photo)
VALUES('test2', '1111', '슈퍼맨2', '남자', '1995-01-11', '010-4444-3333', 'super1@naver.com','/upload/member/noImage.jpg');
INSERT INTO member(id, pw, name, gender, birth, tel, email, photo)
VALUES('test3', '1111', '슈퍼맨3', '남자', '1995-01-11', '010-4444-0000', 'super1@naver.com','/upload/member/noImage.jpg');
COMMIT;
select * from grade;
select * from member;