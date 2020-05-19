--DDL(Data Definition Language)  - ★ AUTO COMMIT;
--CREATE, ALERT, DROP, TRUNCATE, RENAME

--* 데이터 타입 : 문자, 숫자, 날짜
--문자 : CHAR, VARCHAR2
--  CHAR(n) - 고정 문자 : 지정된 사이즈만큼 메모리를 확보
--  CHAR(10) - 메모리를 10바이트 확보한 후 저장
--           - abcd______                
--  VARCHAR2(n) - 가변 문자 ▶ 데이터를 저장할 때 메모리를 확보한다. 최대 4000바이트
--  VARCHAR2(30) - abcd

--숫자 : NUMBER
--  NUMBER(n) - 정수 데이터
--  NUMBER(n, p) - 부동 소수점 데이터

--날짜 : DATE

--1. 테이블 생성
--CREATE TABLE 테이블 생성
CREATE TABLE temp (
id NUMBER(4),
name VARCHAR2(30)
);

--temp 테이블에 데이터 삽입 저장
--id가 100, name이 홍길동
INSERT INTO temp VALUES (100, '홍길동');

--id가 101, name이 이순신
INSERT INTO temp VALUES (101, '이순신');

--temp 테이블에서 101번의 이름을 홍명보로 바꾼다.
UPDATE temp SET name = '홍명보' WHERE id = 101;

SELECT * FROM temp;

COMMIT;

--★ 다른 테이블의 구조를 복사해서 생성 ▶ CTAS
--CTAS(Create Table As Select) : NOT NULL 이외의 제약 조건(Primary 키 등)은 복사되지 않는다.

--CREATE TABLE 테이블명 AS 조회 쿼리문(SELECT 문);
--employees 테이블의 60번 부서의 사번, 성, 이름, 급여, 입사 일자를 복사해서 emp60 테이블 생성하기
CREATE TABLE emp60 AS
SELECT employee_id, last_name, first_name, salary, hire_date
FROM employees
WHERE department_id = 60;

SELECT * FROM emp60;

--★ 구조만 복사하고 데이터행을 복사해오지 않은 상태로 테이블 생성하기
CREATE TABLE emp40 AS
SELECT employee_id emp_id, last_name, first_name, salary, hire_date
FROM employees
WHERE 1 = 2;

SELECT * FROM emp40;

----------------------------------------------------------------------------------------------------------------
--2. 테이블 구조 변경 - ALTER
--1) 칼럼 추가
--ALTER TABLE 테이블명
--ADD (칼럼명1 데이터 타입, 칼럼명2 데이터 타입, ...);

--temp 테이블에 숫자 8자리를 담을 salary 칼럼을 추가하자
ALTER TABLE temp ADD (salary NUMBER(8));    -- Default값 null

DESC temp;

--101번 코드의 급여를 3000으로 변경한다.
UPDATE temp
SET salary = 3000
WHERE id = 101;

SELECT * FROM temp;

--2) 데이터 타입 사이즈 변경
--ALTER TABLE 테이블명
--MODIFY (칼럼명 데이터 타입(새 사이즈));

--temp 테이블의 salary 칼럼의 사이즈를 숫자 10으로 변경한다.
ALTER TABLE temp
MODIFY (salary NUMBER(10));

DESC temp;

--3) 칼럼 삭제
--ALTER TABLE 테이블명
--DROP COLUMN 칼럼명;

--temp 테이블의 salary 칼럼 삭제한다.

ALTER TABLE temp
DROP COLUMN salary;

DESC temp;

--4) 칼럼명 변경
--ALTER TABLE 테이블명
--RENAME COLUMN 원래 칼럼명 TO 새 칼럼명;

--temp 테이블의 id 칼럼명을 temp_id로 변경한다.
ALTER TABLE temp
RENAME COLUMN id TO temp_id;

DESC temp;

--3. 데이터 행 삭제 : TRUNCATE - 조건절 사용 불가
--TRUNCATE TABLE 테이블 명 -- 구조만 남기고 데이터행 모두 삭제
DELETE FROM temp;

ROLLBACK; -- DML은 ROLLBACK 가능

TRUNCATE TABLE temp;
SELECT * FROM temp;

--DELETE, TRUNCATE, DROP 차이점
--DELETE : 데이터 삭제, 용량 안줄어듬, 원하는 데이터만 삭제 가능, 롤백 가능
--TRUNCATE : 용량 줄어듬, 인덱스 등 모두 삭제, 테이블은 내버려두고 데이터만 삭제, 복구 불가능
--DROP : 테이블 전체를 삭제, 공간, 객체를 삭제한다, 복구 불가능

--5. 테이블명 변경 : RENAME
--RENAME 원래테이블명 TO 새테이블명;
--temp 테이블명을 test로 변경한다.
RENAME temp TO test;
DESC test;

----------------------------------------------------------------------------------------------------------------
--※무결성 제약 조건(INTEGRITY CONSTRAINT) - 정확성, 무결성을 보장하기 위해 둠
--NOT NULL, CHECK, UNIQUE, PRIMARY KEY, FOREIGN KEY 5가지가 있음
--제약 조건은 테이블 생성 시에 정의할수 있고 테이블 생성 시 추가할 수도 있음.

--1. NOT NULL : 데이터 값이 반드시 들어 있어야만 하는 형태
--NOT NULL은 테이블 레벨 정의 방식으로 지정 안하고 테이블 생성 후 추가로 지정함
-- - 테이블 생성 시 NOT NULL 지정
DROP TABLE emp PURGE;

CREATE TABLE emp (
id NUMBER(4) NOT NULL,
name VARCHAR2(30) NOT NULL,
salary NUMBER(8)
);

DESC emp;

--삽입 저장
INSERT INTO emp VALUES (100, '홍길동', NULL); -- 정상적으로 삽입 됨

COMMIT;

SELECT * FROM emp;

INSERT INTO emp VALUES (101, '', NULL); -- 에러 발생

------------------------------------------------------------------------------------------------------------------------------
--제약 조건 정보 확인 가능 테이블
--제약 조건이 있는 테이블 조회 : USER_CONS_COLUMNS
--      제약 조건 명 : constraint_name / 칼럼명 : column_name
--제약 조건 조회 : USER_CONSTRAINTS
DESC USER_CONSTRAINTS;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP'; -- 테이블 명이 대문자여야 작동이 된다.

------------------------------------------------------------------------------------------------------------------------------
--테이블 생성 후 NOT NULL 지정
--ALTER TABLE 명령문을 사용한다.
--칼럼에 NULL 데이터가 없는 경우에만 NOT NULL 추가가 가능하다.
--즉, 데이터가 있어야 NOT NULL 추가 가능
UPDATE emp
SET salary = 1000
WHERE id = 100;

SELECT * FROM emp;

ALTER TABLE emp
MODIFY (salary NOT NULL, name NULL);

DESC emp;

--제약 조건선언 - COLUMN 레벨, TABLE 레벨
--2. CHECK : 특정 조건에 맞는 값만 저장하는 제약 조건 - NULL 허용
--테이블 생성 시 CHECK 지정
DROP TABLE emp purge;

CREATE TABLE emp (
id NUMBER(4) NOT NULL,
name VARCHAR2(30) NOT NULL,
salary NUMBER(8),
gender VARCHAR2(3),
CONSTRAINT emp_gender_ck CHECK (gender IN('남', '여'))    -- 제약 조건 이름을 설정하는 것이 보기 좋다.
);

DESC emp;

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP';

--INSERT INTO emp VALUES(100, '홍길동', 5000, '녀'); -- 에러 발생 '녀'는 제약 조건에 걸림
INSERT INTO emp VALUES(100, '홍길동', 5000, '남');

SELECT * FROM emp;

--* 테이블 생성 후 CHECK 지정
--급여에 대해 3000 이상 5000 이하만 저장할 수 있도록 CHECK 제약조건을 지정한다.
ALTER TABLE emp
ADD CONSTRAINT emp_salary_ck CHECK(salary BETWEEN 3000 AND 5000);

UPDATE emp
SET salary = 5500   -- 업데이트 불가
WHERE name = '홍길동';

--------------------------------------------------------------------
--★ 제약 조건 삭제 : 제약 조건은 변경 불가능하고 삭제만 가능하다
--ALTER TABLE 테이블명
--DROP CONSTRAINT 제약 조건명;

ALTER TABLE emp
DROP CONSTRAINT emp_salary_ck;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP';

--------------------------------------------------------------------
--★ 제약 조건 이름 변경
--ALTER TABLE 테이블명
--RENAME CONSTRAINT 제약 조건명1 TO 제약 조건명2;

ALTER TABLE emp
RENAME CONSTRAINT EMP_GENDER_CK TO EMP_GENDER_CK2;
--------------------------------------------------------------------------------------------------------------------------------
--3. UNIQUE - 데이터가 중복되지 않도록 유일성을 보장하는 조건, NULL 허용
-- - 테이블 생성 시 UNIQUE 지정
DROP TABLE emp purge;

CREATE TABLE emp (
id NUMBER(4) NOT NULL,
name VARCHAR2(30) NOT NULL,
salary NUMBER(8),
gender VARCHAR2(3),
email VARCHAR2(50),
CONSTRAINT emp_gender_ck CHECK(gender IN('남', '여')),
CONSTRAINT emp_salary_ck CHECK(salary BETWEEN 3000 AND 5000),
CONSTRAINT emp_email2_uk UNIQUE(email),
CONSTRAINT emp_email3_uk UNIQUE (name, email) -- 복합키 (여러 개의 칼럼에 대해 하나의 제약 조건을 지정)
);

SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE LOWER(CONSTRAINT_NAME) LIKE '%emp%';