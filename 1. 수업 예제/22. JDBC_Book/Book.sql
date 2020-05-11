--tblBook 테이블 생성
CREATE TABLE tblBook(
    num NUMBER PRIMARY KEY NOT NULL,
    title VARCHAR2(30),
    company VARCHAR2(20),
    name VARCHAR2(10),
    cost NUMBER
);

--임의의 레코드 삽입
INSERT INTO tblBook VALUES(1, 'JAVA', '한빛', '김윤명', 27000);
INSERT INTO tblBook VALUES(2, 'JSP', '혜지원', '오정원', 30000);

--전체 레코드 검색
SELECT * from tblBook;

--커밋
COMMIT;