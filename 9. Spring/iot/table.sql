--테이블 생성
CREATE TABLE customer (
	id		NUMBER CONSTRAINT customer_id_pk PRIMARY KEY,
	name	VARCHAR2(50) NOT NULL,
	gender	VARCHAR2(3) NOT NULL,
	email	VARCHAR2(50),
	phone	VARCHAR2(13)
);

--시퀀스 생성
CREATE SEQUENCE seq_customer START WITH 1 INCREMENT BY 1;

--레코드 삽입
INSERT INTO customer(id, name, gender)
VALUES (seq_customer.NEXTVAL, '홍길동', '남');

INSERT INTO customer(name, gender)
VALUES ('심청', '여');

--트리거(trigger) 설정
CREATE OR REPLACE TRIGGER trg_customer
    BEFORE INSERT ON customer   --커스터머 테이블에 인서트가 되기전에
    FOR EACH ROW    --모든 행에 대하여
BEGIN   --시작한다
    SELECT seq_customer.NEXTVAL INTO :new.id FROM dual;  --시퀀스의 데이터를 담고있는 테이블은 없으므로 더미 테이블(dual)에서 조회한다.
END;    
/       --끝 슬래쉬까지 써줘야한다


drop trigger trg_customer;
CREATE OR REPLACE TRIGGER trg_customer
    BEFORE INSERT ON customer 
    FOR EACH ROW 
BEGIN 
    SELECT seq_customer.NEXTVAL INTO :new.id FROM dual; 
END;    
/

--조회
SELECT * FROM customer;

--커밋
COMMIT;



--20/07/02==================================================================
--회원 관리 테이블
CREATE TABLE member(
    irum    VARCHAR2(20)    NOT NULL,
    id      VARCHAR2(20)    CONSTRAINT member_id_pk PRIMARY KEY,
    pw      VARCHAR2(20)    NOT NULL,
    age     NUMBER,
    gender  VARCHAR2(3)     NOT NULL,
    birth   DATE,
    post    VARCHAR2(7),
    addr    VARCHAR2(50),
    email   VARCHAR2(50)    NOT NULL,   --유니크가 들어간다 생각하고 NOT NULL만 지정
    tel     VARCHAR2(20),
    admin   VARCHAR2(1)     DEFAULT 'N'
);

--기존에 있던 member 테이블 수정
ALTER TABLE member
ADD(
    gender  VARCHAR2(3) DEFAULT '남' NOT NULL,
    birth   DATE,
    post    VARCHAR2(7),
    email   VARCHAR2(50),
    admin   VARCHAR2(1) default 'N'
);

UPDATE MEMBER SET email = id || '@naver.com';

ALTER TABLE member
MODIFY (irum NOT NULL, pw NOT NULL, email NOT NULL);

ALTER TABLE member RENAME COLUMN irum TO name;

ALTER TABLE member ADD CONSTRAINT member_id_pk PRIMARY KEY(id);

--관리자 회원 정보 저장
INSERT INTO member(name, id, pw, age, gender, email, admin)
VALUES ('관리자', 'admin', '1234', 25, '남', 'admin@admin.com', 'Y');

SELECT * FROM member;

--20/07/10======================================================================
CREATE TABLE notice(
    id          NUMBER CONSTRAINT notice_id_pk PRIMARY KEY,
    title       VARCHAR2(300) NOT NULL,
    content     VARCHAR2(4000) NOT NULL,
    writer      VARCHAR2(20) NOT NULL,
    writedate   DATE DEFAULT SYSDATE,
    readcnt     NUMBER DEFAULT 0,
    filename    VARCHAR2(300),
    filepath    VARCHAR2(300)
);

CREATE SEQUENCE seq_notice
START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_notice
    BEFORE INSERT ON notice
    FOR EACH ROW
BEGIN
    SELECT seq_notice.NEXTVAL INTO:NEW.id FROM dual;
END;
/

SELECT * FROM notice;

INSERT INTO notice(title, content, writer)
VALUES ('공지 글 테스트', '테스트 공지 글 입니다.', 'admin');

COMMIT;

--20/07/15================================================
--테이블에 공지글 항목 추가
INSERT INTO notice(title, content ,writer, writedate, filepath, filename)
SELECT title, content, writer, writedate, filepath, filename FROM notice;

COMMIT;

--20/07/16================================================
--notice 테이블에 칼럼 추가
CREATE TABLE notice(
    id          NUMBER CONSTRAINT notice_id_pk PRIMARY KEY,
    title       VARCHAR2(300) NOT NULL,
    content     VARCHAR2(4000) NOT NULL,
    writer      VARCHAR2(20) NOT NULL,
    writedate   DATE DEFAULT SYSDATE,
    readcnt     NUMBER DEFAULT 0,
    filename    VARCHAR2(300),
    filepath    VARCHAR2(300)
    root        NUMBER,
    step        NUMBER default 0,
    indent      NUMBER default 0 
);

ALTER TABLE notice
ADD(root NUMBER, step NUMBER DEFAULT 0, indent NUMBER DEFAULT 0);

UPDATE notice SET root = id;

--root : 원글의 root
--step : 원글 step + 1 / 원글의 step보다 더 큰 step을 가진 글이 있다면 그 글들의 step을 먼저 +1 한다.
--indent : 원글 indent + 1

ALTER TRIGGER trg_notice DISABLE;

SELECT * FROM notice;

COMMIT;

--20/07/20======================================================================================================================
INSERT INTO member(id, pw, gender, email, name, admin)
VALUES ('admin2', '1234', '남', 'admin2@admin@.com', '운영자', 'Y');

UPDATE notice SET writer='admin2'
WHERE mod(id, 3) = 0;

COMMIT;

--qna 테이블 생성
CREATE TABLE qna(
    id          NUMBER CONSTRAINT qna_id_pk PRIMARY KEY,
    title       VARCHAR2(300) NOT NULL,
    content     VARCHAR2(4000) NOT NULL,
    writer      VARCHAR2(20) NOT NULL,
    writedate   DATE DEFAULT SYSDATE,
    readcnt     NUMBER DEFAULT 0,
    filename    VARCHAR2(300),
    filepath    VARCHAR2(300),
    root        NUMBER,
    step        NUMBER default 0,
    indent      NUMBER default 0 
);

CREATE SEQUENCE seq_qna
START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_qna
    BEFORE INSERT ON qna
    FOR EACH ROW
BEGIN
    SELECT seq_qna.NEXTVAL INTO:NEW.id FROM dual;
END;
/

INSERT INTO qna (id, title, content, writer)
VALUES (1, '첫 글 테스트', 'ㅁㄴㅇㄻㄴㅇㄹ', '관리자');

--20/07/21======================================================================================================================
INSERT INTO qna(title, content, writer, writedate, filepath, filename)
SELECT title, content, writer, writedate, filepath, filename FROM qna;

UPDATE qna SET root = id;

ALTER TRIGGER trg_qna DISABLE

UPDATE qna SET writer='admin2'
WHERE mod(id, 3) = 0;

COMMIT;

--방명록 관리
CREATE TABLE board(
	id			NUMBER			CONSTRAINT board_id_pk PRIMARY KEY,
	title		VARCHAR2(300)	NOT NULL,
	content		VARCHAR2(4000)	NOT NULL,
	writer		VARCHAR2(100)	NOT NULL,
	writedate	DATE DEFAULT SYSDATE,
	readcnt		NUMBER DEFAULT 0,
	filename	VARCHAR2(300),
	filepath	VARCHAR2(300)
);

CREATE SEQUENCE seq_board START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_board
	BEFORE INSERT ON board
	FOR EACH ROW
BEGIN
	SELECT seq_board.NEXTVAL INTO :new.id FROM dual;
END;
/

COMMIT;

--20/07/22========================================================
INSERT INTO board (title, content, writer, filename, filepath)
SELECT title, content, writer, filename, filepath
FROM board;

--20/07/24========================================================
CREATE TABLE board_comment (
	id NUMBER constraint board_comment_id_pk PRIMARY KEY,
	pid NUMBER NOT NULL, /* 원글의 아이디 */
	writer VARCHAR2(20) NOT NULL, /* 댓글 작성자 아이디 */
	content VARCHAR2(4000) NOT NULL,
    writedate DATE DEFAULT SYSDATE,
    CONSTRAINT board_comment_pid_fk FOREIGN KEY(pid) REFERENCES board(id) ON DELETE CASCADE,
    CONSTRAINT board_comment_writer_fk FOREIGN KEY(writer) REFERENCES member(id) ON DELETE CASCADE
);

CREATE SEQUENCE seq_board_comment
START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_board_comment
    BEFORE INSERT ON board_comment
    FOR EACH ROW
BEGIN
    SELECT seq_board_comment.NEXTVAL INTO :NEW.id FROM dual;
END;
/

COMMIT;