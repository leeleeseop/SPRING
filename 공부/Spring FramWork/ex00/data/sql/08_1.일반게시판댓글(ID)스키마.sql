-- �ϹݰԽ��� ��� ��Ű��

-- 1. ��ü ����
drop TABLE board_reply CASCADE CONSTRAINTS PURGE;
DROP SEQUENCE board_reply_seq;

-- 2. ��ü ����
CREATE TABLE board_reply(
    rno NUMBER PRIMARY KEY,
    no NUMBER REFERENCES board(no) NOT NULL,
    content VARCHAR2(1500) NOT NULL,
    id VARCHAR2(20) REFERENCES member(id) NOT NULL,
    writeDate date default sysdate
);

CREATE SEQUENCE board_reply_seq;

select max(no) from board;
-- 3. ���õ�����
insert into board_reply(rno, no, content, id)
values(board_reply_seq.nextval, 280, '�ϹݰԽ��� ���1', 'test');
insert into board_reply(rno, no, content, id)
values(board_reply_seq.nextval, 280, '�ϹݰԽ��� ���2', 'admin');
commit;