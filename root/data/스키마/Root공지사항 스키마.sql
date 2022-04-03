drop table notice CASCADE CONSTRAINTS;
drop SEQUENCE notice_seq;

create table notice(
no number PRIMARY key,
title varchar2(300) not null,
content varchar2(2000) not null,
startDate date default sysdate,
endDate date default '9999-12-30',
writeDate date default sysdate,
updateDate date default sysdate);

create sequence notice_seq;


insert into notice(no, title, content, startDate, endDate)
values (notice_seq.nextval, '지난','지난 공지','2021-11-02','2021-12-31');

insert into notice(no, title, content, startDate, endDate)
values (notice_seq.nextval, '현재','현재 공지','2022-01-01','2022-04-01   ');

insert into notice(no, title, content, startDate, endDate)
values (notice_seq.nextval, '예약','예약 공지','2022-04-01','2022-05-09');

commit;

select * from notice;
