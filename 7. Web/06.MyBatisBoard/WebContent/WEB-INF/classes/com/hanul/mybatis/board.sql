--Eclipse와 DB 연동 오류 발생 시 해결 방법
--1. Eclipse 종료
--2. workspace\.metadata\.plugins\org.eclipse.datatools.sqltools.result
--3. 해당 폴더의 파일을 삭제 시킨 후 Eclipse 실행

--테이블 생성
CREATE TABLE tblBoard(
    b_num NUMBER PRIMARY KEY NOT NULL,
    b_subject VARCHAR2(50),
    b_pwd VARCHAR2(20),
    b_content VARCHAR2(2000),
    b_writer VARCHAR2(20),
    b_date VARCHAR2(20),
    b_readcount NUMBER
);

--전체 레코드 검색
SELECT * FROM tblBoard ORDER BY b_num DESC;

--자동 증가값 설정 : b_num → b_num_seq 변수
CREATE SEQUENCE b_num_seq START WITH 1;
--시퀀스는 기본적으로 20개 단위로 주어진다.
--1, 2, 3을 삭제해도 4, 5부터 시작하는 문제가 있다.
--테이블을 삭제해도 시퀀스는 살아있고, 새 테이블을 만들면 다음 20번을 줘서 21번부터 시작한다.


--임의의 레코드 삽입
INSERT INTO tblBoard VALUES(b_num_seq.nextval, 'subject', 'pwd', 'content', 'writer', sysdate, 0);
INSERT INTO tblBoard VALUES(b_num_seq.nextval, '가나다라마바사', 'pwd', 'content', '가나다라마바사', sysdate, 0);

--전체 레코드 삭제
DELETE FROM tblBoard;

--테이블 삭제
DROP TABLE tblBoard;

--자동 증가 값 삭제
DROP SEQUENCE b_num_seq;

--커밋
COMMIT;