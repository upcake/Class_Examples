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

--조회
SELECT * FROM customer;

--커밋
COMMIT;