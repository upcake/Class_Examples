* DDL(Data Definition Language) - ★ AUTO COMMIT;
  - CREATE, ALTER, DROP, TRUNCATE, RENAME
  
*데이터타입 : 문자, 숫자, 날짜
- 문자 : CHAR, VARCHAR2
    CHAR(n)  - 고정문자 : 지정된 사이즈만큼 메모리를 확보한다.
    CHAR(10) - 저장시 abcd 문자를 저장 -> abcd______ 
             ☞ 메모리를 10바이트 확보한 후 저장한다.
    VARCHAR2(n)  - 가변문자 ☞ 데이터를 저장할때 메모리를 확보한다. 
                         최대 4000 바이트
    VARCHAR2(30) - 저장시 abcd 문자를 저장 -> abcd

데이터 사이즈가 고정적인 : 주민번호와 같은 경우 CHAR
    CLOB : 사이즈가 큰 문자 데이터 저장시의 타입
    BLOB : 이미지와 같은 바이너리 데이터 저장시의 타입
    
- 숫자 : NUMBER
    NUMBER(n)   - 정수데이터
    NUMBER(8)   - 99999999까지
    NUMBER(n,p) - 부동소수점데이터
    NUMBER(8,2) - 999999.99
      
- 날짜 : DATE

1. 테이블생성
CREATE TABLE 테이블명 (
컬럼명1 데이터타입,
컬럼명2 데이터타입,
...
);

CREATE TABLE temp (
id NUMBER(4),
name VARCHAR2(30)
);

DESC temp;

temp 테이블에 데이터 삽입 저장 
id가 100, name이 홍길동
INSERT INTO temp
VALUES (100, '홍길동');

SELECT * 
FROM temp;

id가 101, name이 이순신
INSERT INTO temp
VALUES (101, '이순신');

COMMIT;

SELECT * 
FROM temp;

temp 테이블에서 코드가 101 번인 이름을 '홍명보'로 변경한다.
UPDATE temp 
SET name = '홍명보'
WHERE id = 101;

COMMIT;

SELECT * 
FROM temp;

  ID NAME                          
---------- -------
 100 홍길동                        
 101 홍명보 


★ 다른 테이블의 구조를 복사해서 테이블 생성 ☞ CTAS
CTAS( Create Table As Select ) : ****NOT NULL 이외의 제약조건(Primary 키 등)은 복사되지 않는다.

CREATE TABLE 테이블명 AS 조회쿼리문(SELECT 문);
employees 테이블의 60번 부서의 사번, 성, 이름, 급여, 입사일자를 복사해서 
emp60 테이블 생성하기

CREATE TABLE emp60 AS
SELECT employee_id, last_name, first_name, salary, hire_date
FROM employees
WHERE department_id = 60;

DESC emp60;

SELECT * FROM emp60;

★ 구조만 복사하고 데이터행을 복사해오지 않은 상태로 테이블 생성하기(구조만 복사)
CREATE TABLE emp40 AS
SELECT employee_id emp_id, last_name, first_name, salary, hire_date
FROM employees
--WHERE 'a' = 'b';  --절대 일치할 수 없는 형태
WHERE 1 = 2;

DESC emp40;

SELECT * 
FROM emp40; --구조만 복사하여 데이터는 존재하지 않음

2. 테이블 구조 변경 - ALTER
1) 컬럼 추가
ALTER TABLE 테이블명 
ADD ( 컬럼명1 데이터타입, 컬럼명2 데이터타입, ... );
***

temp 테이블에 숫자 8자리를 담을 salary 컬럼을 추가하자
DESC temp;

ALTER TABLE temp
ADD ( salary NUMBER(8) ); --Default값 null
***

DESC temp;

SELECT * 
FROM temp;

101번 코드의 급여를 3000 으로 변경한다.
UPDATE temp 
SET salary = 3000 
WHERE id = 101;

SELECT * 
FROM temp;

2) 데이터타입 크기 변경
ALTER TABLE 테이블명 
MODIFY ( 컬럼명 데이터타입(변경할크기) );

temp 테이블의 salary 컬럼의 사이즈를 숫자 10 으로 변경한다.
DESC temp;

ALTER TABLE temp
MODIFY ( salary NUMBER(10) );

DESC temp;

3) 컬럼 삭제
ALTER TABLE 테이블명
DROP COLUMN 컬럼명 ;

temp 테이블의 salary 컬럼 삭제한다.

DESC temp;

ALTER TABLE temp
DROP COLUMN salary;

DESC temp;

4) 컬럼명 변경
ALTER TABLE 테이블명 
RENAME COLUMN 원래컬럼명 TO 새컬럼명;

temp 테이블의 id 컬럼명을 temp_id 로 변경한다.

DESC temp;

ALTER TABLE temp
RENAME COLUMN id TO temp_id;

DESC temp;

3. 데이터행 삭제 - TRUNCATE - 조건절 사용 불가

TRUNCATE TABLE 테이블명; --즉, 구조만 남기고 데이터행 모두 삭제

SELECT * 
FROM temp;

DELETE FROM temp;

SELECT * 
FROM temp;
--------------
선택된 행 없음

ROLLBACK; --DML은 ROLLBACK 가능

SELECT * 
FROM temp;

   TEMP_ID NAME                          
---------- ------------------------------
       100 홍길동                        
       101 홍명보
       
TRUNCATE TABLE temp; --구조만 남기고 데이터행 모두 삭제

SELECT * 
FROM temp;
선택된 행 없음

ROLLBACK; --DDL은 AUTO COMMIT이 실행되므로 ROLLBACK 불가능 

SELECT * 
FROM temp;
선택된 행 없음

4. 테이블 삭제 - DROP
DROP TABLE 테이블명;

DROP TABLE temp;

CREATE TABLE temp (
id NUMBER(4),
name VARCHAR2(30)
);
-----------------------------------------------------------------------------------------------
※ DELETE, TRUNCATE, DROP 명령어의 차이점

- DELETE 명령어는 데이터는 지워지지만 테이블 용량은 줄어 들지 않는다. 
  원하는 데이터만 지울 수 있다. 삭제 후 잘못 삭제한 것을 되돌릴 수 있다.
- TRUNCATE 명령어는 용량이 줄어 들고, 인덱스 등도 모두 삭제 된다. 
  테이블은 삭제하지는 않고, 데이터만 삭제한다. 
  한꺼번에 다 지워야 한다. 삭제 후 절대 되돌릴 수 없다.
- DROP 명령어는 테이블 전체를 삭제, 공간, 객체를 삭제한다. 
  삭제 후 절대 되돌릴 수 없다.
  
[고객 테이블] [원본]       [DELETE 후]             [TRUNCATE 후]         [DROP 후]
이름      주소  연락처     이름   주소  연락처     이름   주소  연락처   삭제됨
홍길동    서울  1111       |   |  |   | |    |
홍길순    천안  2222       |   |  |   | |    |
이순신    부산  3333       |   |  |   | |    |
                           데이터만 지워지고,      용량은 줄어들고,      테이블 전체 삭제
                           용량은 그대로           데이블은 삭제 안되고,
                                                   인덱스 등 모두 삭제
                                                   
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
★ 삭제된 테이블 휴지통에서 확인
SELECT * FROM RECYCLEBIN;

★ 삭제된 테이블 복구
FLASHBACK TABLE 테이블명 TO BEFORE DROP;

FLASHBACK TABLE temp TO BEFORE DROP;

★ 휴지통 비우기
PURGE RECYCLEBIN;
-----------------------------------------------------------------------------------------------

5. 테이블명변경 - RENAME
RENAME 원래테이블명 TO 새테이블명;

temp 테이블명을 test 로 변경한다.

RENAME temp TO test;

DESC test;

