--tblMember 테이블 생성
CREATE TABLE tblMember(
    num NUMBER,
    name VARCHAR2(10),
    age NUMBER,
    addr VARCHAR2(50),
    tel VARCHAR2(20)
);

--tblMember 테이블 구조 보기
DESCRIBE tblMember;

--레코드 삽입
INSERT INTO tblmember(num, name, age, addr, tel)
    VALUES(1, '홍길동', 30, '광주시 서구 농성동 ', '010-1111-1111');
    
INSERT INTO tblmember 
    VALUES(2, '김길동', 27, '광주시 서구 쌍촌동', '010-2222-2222');

--전체 레코드 검색
SELECT num, name, age, addr, tel FROM tblmember;

SELECT * FROM tblmember;

--메모리에 입력된 내용을 최종적으로 저장(DB에 반영)
COMMIT;