--tblMember 테이블 생성
drop table tblMember;

--tblMember 테이블 생성
CREATE TABLE tblMember (
    num NUMBER PRIMARY KEY NOT NULL,
    name VARCHAR2(10),
    age NUMBER,
    addr VARCHAR2(50),
    tel VARCHAR2(20)
);

--임의의 레코드 삽입
INSERT INTO tblMember (num, name, age, addr, tel)
	VALUES (1, '홍길동', 30, '광주시 서구 농성동', '010-1111-1111');
	
INSERT INTO tblMember (num, name, age, addr, tel)
	VALUES (2, '박문수', 33, '광주시 서구 쌍촌동', '010-2222-2222');
	
--전체 레코드 검색
search * from tblMember;	

--커밋 명령
commit;