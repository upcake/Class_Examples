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