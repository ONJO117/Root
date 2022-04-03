-- 객체 지우기
drop table image CASCADE CONSTRAINTS;
drop SEQUENCE image_seq;

-- 객체 생성
create table image (
no Number PRIMARY KEY,
title VARCHAR2(300) not null,
content VARCHAR2(2000) not null,
id VARCHAR2(20) not null references member(id),
writeDate date default sysdate,
fileName VARCHAR2(50) not null
);

create SEQUENCE image_seq;

insert into image(no, title, content, id, fileName)
values(image_seq.nextval, '사진','사진','test','/upload/image/001.jpg');
insert into image(no, title, content, id, fileName)
values(image_seq.nextval, '사진2','사진2','admin','/upload/image/002.jpg');
insert into image(no, title, content, id, fileName)
values(image_seq.nextval, '사진3','사진3','test','/upload/image/003.jpg');
insert into image(no, title, content, id, fileName)
values(image_seq.nextval, '사진4','사진4','test','/upload/image/004.jpg');
insert into image(no, title, content, id, fileName)
values(image_seq.nextval, '사진5','사진5','test','/upload/image/005.jpg');
insert into image(no, title, content, id, fileName)
values(image_seq.nextval, '사진6','사진6','test','/upload/image/006.jpg');
insert into image(no, title, content, id, fileName)
values(image_seq.nextval, '사진7','사진7','test','/upload/image/007.jpg');
insert into image(no, title, content, id, fileName)
values(image_seq.nextval, '사진8','사진8','test','/upload/image/008.jpg');
commit;


select * from image;