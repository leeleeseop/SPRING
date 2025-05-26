-- 공지 사항 스키마
-- 1. 제거
DROP TABLE notice CASCADE CONSTRAINTS PURGE;
DROP SEQUENCE notice_seq;

-- 2. 생성
CREATE TABLE notice(
    no number primary key,
    title VARCHAR2(300) not null,
    content VARCHAR2(2000),
    image VARCHAR2(200),
    startDate date default sysdate,
    endDate date default '9999-12-30',
    writeDate date default sysdate,
    updateDate date default sysdate
);

CREATE SEQUENCE notice_seq;

-- 3. 샘플데이터
-- 3-1) 현재 공지
insert into notice(no, title, content, image, startDate, endDate)
values(notice_seq.nextval, '키오스크과정 진행', '키오스크과정 진행', '/upload/notice/notice01.jpg', '2024-04-11', '2024-09-27');
-- 3-2) 지난 공지
insert into notice(no, title, content, image, startDate, endDate)
values(notice_seq.nextval, '키오스크과정 개강', '키오스크과정 개강', null, '2024-04-11', '2024-04-17');
-- 3-3) 예약 공지
insert into notice(no, title, content, image, startDate, endDate)
values(notice_seq.nextval, '키오스크과정 수료', null, '/upload/notice/notice02.jpg', '2024-09-21', '2024-09-27');
commit;

select * from notice;