--테이블 생성
CREATE TABLE Member(
	irum varchar2(20),
	id varchar2(20),
	pw varchar2(20),
	age number,
	addr varchar2(50),
	tel varchar2(20)
);

--전체 레코드 검색
SELECT * FROM member;