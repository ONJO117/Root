drop TABLE board_rep CASCADE CONSTRAINTS;
drop SEQUENCE board_rep_seq;

-- 객체 생성
create table board_rep(
    rno number PRIMARY KEY,
    no number REFERENCES board(no),
    content VARCHAR2(500) not null,
    writer VARCHAR2(30) not null,
    writeDate date DEFAULT sysdate
);
create SEQUENCE  board_rep_seq;
insert into board_rep(rno, no, content, writer)
values (board_rep_seq.nextval,1,'1번글에 1번댓글','baik');
insert into board_rep(rno, no, content, writer)
values (board_rep_seq.nextval,2,'2번글에 1번댓글','baik');
insert into board_rep(rno, no, content, writer)
values (board_rep_seq.nextval,1,'1번글에 2번댓글','baik');

commit;

select * from board where no = 1;
select * from board_rep where no = 1 order by rno;