--테이블 생성
CREATE TABLE boardMember(
    Member_id VARCHAR2(15) PRIMARY KEY NOT NULL,
    Member_pw VARCHAR2(15),
    Member_name VARCHAR2(15),
    Member_age NUMBER,
    Member_gender VARCHAR2(5),
    Member_email VARCHAR2(30)
);

--테이블 조회
SELECT * FROM boardMember;