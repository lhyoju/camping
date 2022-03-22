create table cam_member(
    userid varchar2(20) primary key, --아이디
    userpwd varchar2(200) not null, --비밀번호
    name varchar2(20) not null, --이름
    uphone1 varchar2(3) not null, --핸드폰 첫번째 자리
    uphone2 varchar2(4) not null, --핸드폰 두번째 자리
    uphone3 varchar2(4) not null, --핸드폰 세번째 자리
    phone1 varchar2(3), --전화번호 첫번째 자리
    phone2 varchar2(4), --전화번호 두번째 자리
    phone3 varchar2(4), --전화번호 세번째 자리
    email varchar2(20) not null, --이메일 주소
    email2 varchar2(20) not null, --이메일 도메인
    zipcode varchar2(10) not null, --우편번호
    address varchar2(300) not null, --집주소 
    address2 varchar2(100) not null, --집주소 상세 주소
    auth number(2) default 1, --권한 1.일반회원 2.관리자
    joindate date, --가입날짜
    ustate number(38), --가입회원1, 탈퇴회원 2
    delcont varchar2(4000), --탈퇴사유
    deldate date --탈퇴날짜
);

drop table cam_member;

alter table cam_member modify(userpwd varchar2(200));