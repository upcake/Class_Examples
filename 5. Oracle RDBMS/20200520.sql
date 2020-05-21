--4. PRIMARY KEY : 데이터 행을 대표하도록 유일하게 식별하기 위한 제약 조건
--NOT NULL + UNIQUE의 형태
--PK, 주키, 기본키, 식별자 - 테이블당 한 개만 지정 가능

DROP TABLE emp;

--테이블 생성 시 PRIMARY KEY 지정
CREATE TABLE emp (
id NUMBER(4),
name VARCHAR2(30) NOT NULL UNIQUE,
salary NUMBER(8),
gender VARCHAR2(3),
email VARCHAR2(50),
CONSTRAINT emp_gender_ck CHECK(gender IN('남', '여')),
CONSTRAINT emp_salary_ck CHECK(salary BETWEEN 3000 AND 5000),
CONSTRAINT emp_email2_uk UNIQUE(email),
CONSTRAINT emp_email3_uk UNIQUE(name, email), --복합키
CONSTRAINT emp_id_pk PRIMARY KEY(id)
);

--5. FOREIGN KEY : 부모 테이블의 칼럼을 참조하는 자식 테이블의 칼럼, NULL 허용
--FK, 외래키, 참조키
--칼럼 레벨, 테이블 레벨에서 정의하고 복합키를 생성할 수 있다.
--참조되는 칼럼은 그 테이블의 PK이어야 한다.

-- * 칼럼 레벨 정의
--  - 칼럼명 데이터타입 REFERENCES 부모테이블 (참조되는칼럼명)
--  - 칼럼명 데이터타입 CONSTRAINT 제약조건명 REFERENCES 부모테이블 (참조되는칼럼명)

DROP TABLE emp;

--테이블 생성 시 FOREIGN KEY 지정
CREATE TABLE emp (
id NUMBER(4),
name VARCHAR2(30) NOT NULL UNIQUE,
salary NUMBER(8),
gender VARCHAR2(3),
email VARCHAR2(50),
dept_id NUMBER(4),
CONSTRAINT emp_gender_ck CHECK(gender IN('남', '여')),
CONSTRAINT emp_salary_ck CHECK(salary BETWEEN 3000 AND 5000),
CONSTRAINT emp_email2_uk UNIQUE(email),
CONSTRAINT emp_email3_uk UNIQUE(name, email), --복합키
CONSTRAINT emp_id_pk PRIMARY KEY(id),
CONSTRAINT emp_dept_id_fk FOREIGN KEY(dept_id) REFERENCES departments(department_id) -- departments 테이블의 PK
);

----------------------------------------------------------------------------------------------
--※ VIEW (뷰)
--  - 실제로 데이터가 존재하는 객체는 아니다.
--  - 테이블의 데이터를 뷰를 통해 접근한다.
--      1. 보안 - 접근 권한
--      2. 복잡한 쿼리문을 단순한 쿼리문으로 사용할 수 있다.

--★ 뷰 생성
--CREATE VIEW 뷰명 AS 쿼리문;

--60번 부서원 정보 조회
CREATE VIEW view_60 AS
    SELECT employee_id, last_name ||' '|| first_name name, department_id, job_id, hire_date, email
    FROM employees
    WHERE department_id = 60;

SELECT * FROM view_60; -- 뷰 생성되어 쿼리 가능

--★ 뷰 삭제
--DROP VIEW 뷰명;
DROP VIEW view_60;

SELECT * FROM view_60; -- view_60이 삭제되어 오류 발생
----------------------------------------------------------------------------------------------
--★ SEQUENCE : 순차적인 숫자를 만들어주는 객체 
CREATE SEQUENCE emp_seq
START WITH 200
INCREMENT BY 1;

--시퀀스 값의 접근 : CURRVAL, NEXTVAL
SELECT emp_seq.NEXTVAL FROM dual; -- 조회할때마다 1씩 증가
SELECT emp_seq.CURRVAL FROM dual; -- 현재 값을 조회

--emp 테이블의 pk인 id 칼럼에 시퀀스를 적용하여 데이터행을 삽입 저장한다.
INSERT INTO emp (id, name)
VALUES (emp_seq.NEXTVAL, '홍길동');

SELECT * FROM emp;