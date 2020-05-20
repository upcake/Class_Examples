※ 무결성 제약조건(INTEGRITY CONSTRAINT) - 정확성, 정합성, 무결성을 보장하기 위해 둠.
테이블에 잘못된 데이터의 입력을 막기위해 일정한 규칙을 지정하는 것

NOT NULL, CHECK, UNIQUE, PRIMARY KEY, FOREIGN KEY 5가지 있음
제약조건은 테이블 생성시에 정의할 수 있고, 테이블 생성 후 추가할 수도 있음.

- NOT NULL : NULL값 입력 금지
- UNIQUE : 중복값 입력 금지 (NULL값은 중복입력 가능)
- PRIMARY KEY : NOT NULL + UNIQUE
- FOREIGN KEY : 다른 테이블의 컬럼을 조회해서 무결성 검사
- CHECK : 조건으로 설정된 값만 입력 허용


1. NOT NULL : 데이터 값이 반드시 들어 있어야만 하는 형태
NOT NULL : 컬럼 레벨 정의 방식으로만 정의

- 테이블 생성시 NOT NULL 지정(컬럼 레벨 정의 방식으로만 정의)
DESC emp;

DROP TABLE emp purge;

CREATE TABLE emp (
id NUMBER(4) NOT NULL,
name VARCHAR2(30) NOT NULL,
salary NUMBER(8)
);

DESC emp;

이름     널?       유형           
------ -------- ------------ 
ID     NOT NULL NUMBER(4)    
NAME   NOT NULL VARCHAR2(30) 
SALARY          NUMBER(8)


삽입 저장하자
SELECT * 
FROM emp;

INSERT INTO emp 
VALUES (100, '홍길동', NULL);

COMMIT;

SELECT * 
FROM emp;

INSERT INTO emp 
VALUES (101, '', NULL); --☜ NOT NULL 에 NULL 삽입하므로 에러
------------------
cannot insert NULL

===============================================================================================
-----------------------------------------------------------------------------------------------
제약조건정보 확인 가능 테이블 - USER_CONSTRAINTS, USER_CONS_COLUMNS 테이블
-----------------------------------------------------------------------------------------------
제약조건이 있는 컬럼명(COLUMN_NAME) 확인테이블 : USER_CONS_COLUMNS 테이블
-----------------------------------------------------------------------------------------------
제약조건명 : CONSTRAINT_NAME, 컬럼명 : COLUMN_NAME
-----------------------------------------------------------------------------------------------

***제약조건 조회 : USER_CONSTRAINTS 테이블에서 조회
-----------------------------------------------------------------------------------------------
DESC USER_CONSTRAINTS;

이름                널?       유형            
----------------- -------- ------------- 
OWNER                      VARCHAR2(120) 
CONSTRAINT_NAME   NOT NULL VARCHAR2(30)  
CONSTRAINT_TYPE            VARCHAR2(1)   
TABLE_NAME        NOT NULL VARCHAR2(30)  
SEARCH_CONDITION           LONG          
R_OWNER                    VARCHAR2(120) 
R_CONSTRAINT_NAME          VARCHAR2(30)  
DELETE_RULE                VARCHAR2(9)   
STATUS                     VARCHAR2(8)   
DEFERRABLE                 VARCHAR2(14)  
DEFERRED                   VARCHAR2(9)   
VALIDATED                  VARCHAR2(13)  
GENERATED                  VARCHAR2(14)  
BAD                        VARCHAR2(3)   
RELY                       VARCHAR2(4)   
LAST_CHANGE                DATE          
INDEX_OWNER                VARCHAR2(30)  
INDEX_NAME                 VARCHAR2(30)  
INVALID                    VARCHAR2(7)   
VIEW_RELATED               VARCHAR2(14) 
-----------------------------------------------------------------------------------------------
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP'; --테이블명이 대문자만 가능

OWNER   CONSTRAINT_NAME CONSTRAINT_TYPE TABLE_NAME  SEARCH_CONDITION   R_OWNER R_CONSTRAINT_NAME DELETE_RULE STATUS  DEFERRABLE     DEFERRED  VALIDATED GENERATED      BAD    RELY   LAST_CHANGE INDEX_OWNER  INDEX_NAME INVALID VIEW_RELATED  
------------------------------ ------------------------------ - ------------------------------ -------------------------------------------------------------------------------- ------------------------------ ------------------------------ --------- -------- -------------- --------- ------------- -------------- --- ---- -------- ------------------------------ ------------------------------ ------- --------------
HR	    SYS_C007560	    C	            EMP	        "ID" IS NOT NULL   (null)  (null) ENABLED	 (null)      (null)  NOT DEFERRABLE	IMMEDIATE VALIDATED	GENERATED NAME (null) (null) 20/05/19	 (null)       (null)     (null)  (null) 			
HR	    SYS_C007561	    C	            EMP	        "NAME" IS NOT NULL (null)  (null) ENABLED	 (null)      (null)  NOT DEFERRABLE	IMMEDIATE VALIDATED	GENERATED NAME (null) (null) 20/05/19	 (null)		  (null)	 (null)  (null)

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE LOWER(TABLE_NAME) = 'emp'; 

CONSTRAINT_NAME          CONSTRAINT_TYPE    SEARCH_CONDITION
-------------------------------------------------------------
SYS_C007117              C                  "ID" IS NOT NULL
SYS_C007118              C                  "NAME" IS NOT NULL

DESC USER_CONS_COLUMNS;

이름              널?       유형             
--------------- -------- -------------- 
OWNER           NOT NULL VARCHAR2(30)   
CONSTRAINT_NAME NOT NULL VARCHAR2(30)   
TABLE_NAME      NOT NULL VARCHAR2(30)   
COLUMN_NAME              VARCHAR2(4000) 
POSITION                 NUMBER 

SELECT *
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME = 'EMP'; 

OWNER    CONSTRAINT_NAME    TABLE_NAME   COLUMN_NAME  POSITION
--------------------------------------------------------------
HR	     SYS_C007560	    EMP	         ID	           (nulll)
HR	     SYS_C007561	    EMP	         NAME	       (nulll)


오라클 CONSTRAINT_TYPE
    C  :  검사키   CHECK - 특정 조건에 맞는 값만 저장하는 제약 조건 - NULL 허용
    P  :  기본키
    R  :  외래키
    U  :  유일키

SELECT CONSTRAINT_NAME, COLUMN_NAME
FROM USER_CONS_COLUMNS
WHERE LOWER(TABLE_NAME)='emp';

CONSTRAINT_NAME  COLUMN_NAME
-----------------------------
SYS_C007117	     ID
SYS_C007118	     NAME

USER_CONS_COLUMNS 테이블에서 EMP 테이블의
제약조건명, 컬럼명, 제약조건유형(CONSTRAINT_TYPE) 조회
SELECT CONSTRAINT_NAME, COLUMN_NAME, ( SELECT CONSTRAINT_TYPE 
                                       FROM USER_CONSTRAINTS
                                       WHERE CONSTRAINT_NAME = c.CONSTRAINT_NAME ) CONSTRAINT_TYPE
FROM USER_CONS_COLUMNS c
WHERE LOWER(TABLE_NAME) = 'emp'; --이따가 할것

DESC emp;

이름   널?         유형           
------ -------- ------------ 
ID     NOT NULL     NUMBER(4)    
NAME   NOT NULL     VARCHAR2(30) 
SALARY              NUMBER(8)    
===============================================================================================


- 테이블 생성 후 NOT NULL 지정
***ALTER TABLE 명령문을 사용한다.
컬럼에 NULL 데이터가 없는 경우 NOT NULL 을 추가할 수 있다.
즉, 데이터가 있어야 NOT NULL 추가

NULL 값이 있는 컬럼에 UPDATE 문으로 NULL 값 없애주고 
ALTER TABLE 로 변경

salary 의 NULL -> NOT NULL 로 변경
name 에 지정된 NOT NULL -> NULL 로 변경

SELECT * 
FROM emp;

ID  NAME     SALARY
---- --------- ----------
100 홍길동	 (null)	              

UPDATE emp 
SET salary = 1000
WHERE ID = 100;

SELECT * 
FROM emp;

DESC emp;

-------------------------------------------------
ALTER TABLE emp
MODIFY (salary NOT NULL, name NULL);
-------------------------------------------------

DESC emp;

이름          널?      유형           
------ -------- ------------ 
ID          NOT NULL    NUMBER(4)    
NAME                    VARCHAR2(30) 
SALARY      NOT NULL    NUMBER(8)    

-----------------------------------------------------------------------------------------------
*제약조건에 이름 지정하기
이름을 지정하지 않으면 자동으로 생성되는데 
나중에 제약조건을 비활성화하거나 삭제하는 등의 관리를 위해서는 
제약조건에 이름을 지정해주는 것이 좋다. 
-----------------------------------------------------------------------------------------------

제약조건선언 - COLUMN 레벨, TABLE 레벨

1. 컬럼레벨의 제약조건 기술 방법
-----------------------------------------------------------------------------------------------
컬럼명 타입 CONSTRAINT 제약조건경(테이블명_컬럼_약어) 제약조건

CREATE TABLE 테이블명
컬럼명 타입 CONSTRAINT 제약조건명(테이블명_컬럼_약어) 제약조건,
....
....
);
-----------------------------------------------------------------------------------------------
DROP TABLE emp09

CREATE TABLE emp09(
empno  NUMBER(4)    CONSTRAINT EMP09_EMPNO_PK   PRIMARY KEY,
ename  VARCHAR2(15) CONSTRAINT EMP09_ENAME_NN   NOT NULL,
job    VARCHAR2(15) CONSTRAINT EMP09_JOB_UN     UNIQUE,
deptno NUMBER(2)    CONSTRAINT EMP09_DEPTNO_FK  REFERENCES dept(deptno),
gender VARCHAR2(1)  CONSTRAINT EMP09_GENDER_CK  CHECK( gender IN('M','F') )
);
-----------------------------------------------------------------------------------------------
2. 테이블 레벨의 제약조건 기술방법
-----------------------------------------------------------------------------------------------
복합키 지정을 할 때는 반드시 테이블 레벨로 제약조건을 지정해야 한다.
***제약조건을 추가할 때도 테이블 레벨로 제약조건을 지정해야 한다.
-----------------------------------------------------------------------------------------------
CONSTRAINT 제약조건경(테이블명_컬럼_약어) 제약조건

CREATE TABLE 테이블명
컬럼명 타입,
....
CONSTRAINT 제약조건명(테이블명_컬럼_약어) 제약조건,
....
);
-----------------------------------------------------------------------------------------------
DROP TABLE emp09;
 
CREATE TABLE emp09(
empno  NUMBER(4),
ename  VARCHAR2(15) CONSTRAINT EMP09_ENAME_NN  NOT NULL,
job    VARCHAR2(15),
deptno NUMBER(2),
gender VARCHAR2(1),
CONSTRAINT EMP09_EMPNO_PK  PRIMARY KEY(empno),
CONSTRAINT EMP09_JOB_UN    UNIQUE(job),
CONSTRAINT EMP09_DEPTNO_FK FOREIGN KEY(deptno) REFERENCES dept(deptno),
CONSTRAINT EMP09_GENDER_CK CHECK( gender IN('M','F') )
); 
-----------------------------------------------------------------------------------------------

2. CHECK - 특정 조건에 맞는 값만 저장하는 제약 조건 - NULL 허용

- 테이블 생성 시 CHECK 지정
DROP TABLE emp purge;

CREATE TABLE emp (
id NUMBER(4) NOT NULL,
name VARCHAR2(30) NOT NULL,
salary NUMBER(8),
gender VARCHAR2(3),
CONSTRAINT emp_gender_ck CHECK( gender IN ('남','여') )
);

DESC emp;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP'; 

SELECT * 
FROM emp;

INSERT INTO emp 
VALUES(100, '홍길동', 5000, '남');

INSERT INTO emp 
VALUES(101, '홍길명', 5000, '녀'); -- 저장불가
--check constraint (HR.EMP_GENDER_CK) violated ☞ 위반하다, 어기다

SELECT * 
FROM emp;

***제약조건명(CONSTRAINT_NAME)을 gender와 salary 비교 참조
-----------------------------------------------------------------------------------------------
DROP TABLE test;

CREATE TABLE test (
  name VARCHAR2(10) NOT NULL,
  gender VARCHAR2(10) NOT NULL CHECK ( gender IN ('남성','여성') ),
  salary number(8),
  dept_id number(4),
  CONSTRAINT test_salary_ck CHECK ( salary > 2000 )   
);

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TEST'; 
-----------------------------------------------------------------------------------------------

★ 테이블 생성 후 CHECK 지정 ☜ 추가시 테이블 레벨로 정의
-----------------------------------------------------------------------------------------------
급여에 대해 3000 이상 5000 이하만 저장할 수 있도록 CHECK 제약조건을 지정한다.
ALTER TABLE emp
ADD CONSTRAINT emp_salary_ck CHECK( salary BETWEEN 3000 AND 5000 );
-----------------------------------------------------------------------------------------------

USER_CONS_COLUMNS 테이블에서 EMP 테이블의
제약조건명, 컬럼명, 제약조건유형(CONSTRAINT_TYPE) 조회
SELECT CONSTRAINT_NAME, COLUMN_NAME, ( SELECT CONSTRAINT_TYPE 
                                       FROM USER_CONSTRAINTS
                                       WHERE CONSTRAINT_NAME = c.CONSTRAINT_NAME ) CONSTRAINT_TYPE
FROM USER_CONS_COLUMNS c
WHERE LOWER(TABLE_NAME) = 'emp';

SELECT * 
FROM emp;

UPDATE emp
SET salary = 5500   -- 업데이트 불가 (salary BETWEEN 3000 AND 5000이므로)
WHERE name = '홍길동'; 

CHECK CONSTRAINT (HR.EMP_GENDER_CK) violated

-----------------------------------------------------------------------------------------------
★ 제약조건 삭제 --제약조건은 변경 불가함. 추가하거나 삭제만 가능!!
ALTER TABLE 테이블명
DROP CONSTRAINT 제약조건명;

ALTER TABLE emp
DROP CONSTRAINT emp_salary_ck;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP'; 

ALTER TABLE emp
ADD CONSTRAINT emp_salary_ck CHECK( salary BETWEEN 3000 AND 6000 );
-----------------------------------------------------------------------------------------------
★ 제약조건 이름 변경
ALTER TABLE 테이블명
RENAME CONSTRAINT 기존제약조건명 TO 바꿀제약조건명;

ALTER TABLE emp
RENAME CONSTRAINT EMP_GENDER_CK TO EMP_GENDER_CK2;
-----------------------------------------------------------------------------------------------

3. UNIQUE - 데이터가 중복되지 않도록 유일성을 보장하는 조건 - NULL 허용
컬럼 레벨, 테이블 레벨에서 정의하고 복합키 생성할 수 있다.
여러개의 컬럼에 대해 하나의 제약조건을 지정할 수 있다 : 복합키

- 테이블 생성 시 UNIQUE 지정

DROP TABLE emp purge;

CREATE TABLE emp (
id NUMBER(4) NOT NULL,
name VARCHAR2(30) NOT NULL,
salary NUMBER(8),
gender VARCHAR2(3),
email VARCHAR2(50) /* CONSTRAINT emp_email_uk UNIQUE 
                      employees 테이블의 email 컬럼에
                      emp_email_uk 이미 지정해서 중복 불가*/ , 
CONSTRAINT emp_salary_ck CHECK( salary BETWEEN 3000 AND 5000 ),
CONSTRAINT emp_gender_ck CHECK( gender IN ('남','여') ),
CONSTRAINT emp_email2_uk UNIQUE( email ),
CONSTRAINT emp_email3_uk UNIQUE( name, email ) --복합키
);

SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE LOWER(CONSTRAINT_NAME) = 'emp_email_uk'; --employees 테이블에 존재함

DESC USER_CONSTRAINTS;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP'; 

여러개의 컬럼에 대해 하나의 제약조건을 지정할 수 있다 : 복합키
책 참조 : 83페이지

4. PRIMARY KEY : 데이터 행을 대표하도록 유일하게 식별하기 위한 제약 조건
- NOT NULL + UNIQUE 의 형태
- PK , 주키, 기본키, 식별자 - 테이블당 한 개만 지정 가능
- 주민번호, 사번, 학번,...
- 컬럼 레벨, 테이블 레벨에서 정의하고 복합키를 생성할 수 있다.
-----------------------------------------------------------------------------------------------
- 컬럼 레벨 정의
컬럼명 데이터타입 PRIMARY KEY
컬럼명 데이터타입 CONSTRAINT 제약조건명 PRIMARY KEY

- 테이블 레벨 정의
CONSTRAINT 제약조건명 PRIMARY KEY ( 컬럼명 )
-----------------------------------------------------------------------------------------------
DESC emp;

DROP TABLE emp;

- 테이블 생성 시 PRIMARY KEY 지정
CREATE TABLE emp (
id NUMBER(4) /* CONSTRAINT emp_id_pk PRIMARY KEY */,
name VARCHAR2(30) NOT NULL UNIQUE,
salary NUMBER(8),
gender VARCHAR2(3),
email VARCHAR2(50) /* CONSTRAINT emp_email2_uk UNIQUE */ 
                      /* CONSTRAINT emp_email_uk UNIQUE 
                      employees 테이블의 email 컬럼에
                      emp_email_uk 이미 지정해서 중복 불가*/, 
CONSTRAINT emp_id_pk     PRIMARY KEY( id ),
CONSTRAINT emp_salary_ck CHECK( salary BETWEEN 3000 AND 5000 ),
CONSTRAINT emp_gender_ck CHECK( gender IN ('남','여') ),
CONSTRAINT emp_email2_uk UNIQUE( email ),
CONSTRAINT emp_email3_uk UNIQUE( name, email ) --복합키
);

DESC emp;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP'; 

5. FOREIGN KEY : 부모테이블의 컬럼을 참조하는 자식테이블의 컬럼, NULL 허용
- FK, 외래키, 참조키
컬럼 레벨, 테이블 레벨에서 정의하고 복합키를 생성할 수 있다.
-----------------------------------------------------------------------------------------------
- 컬럼 레벨 정의
컬럼명 데이터타입 REFERENCES 부모테이블 ( 참조되는컬럼명 )
컬럼명 데이터타입 CONSTRAINT 제약조건명 REFERENCES 부모테이블 ( 참조되는컬럼명 )

- 테이블 레벨 정의
CONSTRAINT 제약조건명 FOREIGN KEY( 참조하는 컬럼명 ) 
                      REFERENCES 부모테이블 ( 참조되는 컬럼명 )

-----------------------------------------------------------------------------------------------
- 테이블 생성 시 FOREIGN KEY 지정

DROP TABLE emp;

CREATE TABLE emp (
id NUMBER(4) /* CONSTRAINT emp_id_pk PRIMARY KEY */,
name VARCHAR2(30) NOT NULL UNIQUE,
salary NUMBER(8),
gender VARCHAR2(3) ,
email VARCHAR2(50) /* CONSTRAINT emp_email_uk UNIQUE */ , 
dept_id NUMBER(4) /* CONSTRAINT emp_dept_id_fk 
                     REFERENCES departments(department_id) */ ,
CONSTRAINT emp_id_pk      PRIMARY KEY( id ),
CONSTRAINT emp_salary_ck  CHECK( salary BETWEEN 3000 AND 5000 ),
CONSTRAINT emp_gender_ck  CHECK( gender IN ('남','여') ),
CONSTRAINT emp_email2_uk  UNIQUE( email ),
CONSTRAINT emp_email3_uk  UNIQUE( name, email ), --복합키
CONSTRAINT emp_dept_id_fk FOREIGN KEY( dept_id )
                          REFERENCES departments( department_id )
);
FK 에 의해  테이블간 부모 - 자식 관계가 형성된다
FK 를 지정하는 테이블이 자식 테이블이고
FK 에 의해 참조되는 테이블이 부모 테이블
employees(자식) - departments(부모)
참조 되어질 부모테이블의 컬럼은 반드시 PK 만 참조될 수 있다.

DESC emp;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP'; 

* USER_CONS_COLUMNS 테이블에서 EMPLOYEES 테이블과 DEPARTMENTS 테이블의
테이블명, 제약조건명, 컬럼명, 제약조건유형(CONSTRAINT_TYPE) 조회
-----------------------------------------------------------------------------------------------
SELECT TABLE_NAME, CONSTRAINT_NAME, COLUMN_NAME, ( SELECT CONSTRAINT_TYPE 
                                                   FROM USER_CONSTRAINTS
                                                   WHERE CONSTRAINT_NAME = c.CONSTRAINT_NAME ) CONSTRAINT_TYPE
FROM USER_CONS_COLUMNS c
WHERE LOWER(TABLE_NAME) IN ('employees', 'departments');

SELECT *
FROM USER_CONSTRAINTS
WHERE LOWER(TABLE_NAME) IN ('employees', 'departments');
-----------------------------------------------------------------------------------------------
★ 테이블 생성 후 FOREIGN KEY 지정
ALTER TABLE emp
ADD ( dept_id NUMBER(4) 
      CONSTRAINT emp_dept_id_fk REFERENCES departments(department_id) );
-----------------------------------------------------------------------------------------------

SELECT * 
FROM emp;

INSERT INTO emp
VALUES (100, '홍길동', 3000,  '남', '', '');

UPDATE emp 
SET dept_id = 15 
WHERE id = 100; 
--integrity constraint (HR.EMP_DEPT_ID_PK) violated - parent key not found

SELECT * 
FROM emp;

-----------------------------------------------------------------------------------------------
DDL
1. 생성 CREATE
CREATE TABLE 테이블명(
컬럼명1 데이터타입 NOT NULL,
컬럼명2 데이터타입 CONSTRAINT 제약조건명 CHECK (컬럼명2 조건식),
컬럼명3 데이터타입 CONSTRAINT 제약조건명 UNIQUE,
컬럼명4 데이터타입 CONSTRAINT 제약조건명 PRIMARY KEY,
컬럼명5 데이터타입 CONSTRAINT 제약조건명 REFERENCES 부모테이블(PK인컬럼),
CONSTRAINT 제약조건명 CHECK (컬럼명2 조건식),
CONSTRAINT 제약조건명 UNIQUE (컬럼명3),
CONSTRAINT 제약조건명 PRIMARY KEY (컬럼명4),
CONSTRAINT 제약조건명 FOREIGN KEY (컬럼명5) REFERENCES 부모테이블(PK인컬럼)
);

2. 구조변경 ALTER
제약조건
1. NOT NULL - 값이 없는 데이터를 관리하지 않도록
ALTER TABLE 테이블명 
MODIFY ( 컬럼명 NOT NULL );

2. CHECK 추가 - 특정 조건에 맞지 않는 데이터를 관리하지 않도록, NULL 허용
ALTER TABLE 테이블명
ADD CONSTRAINT 제약조건명 CHECK ( 컬럼명 조건식 );

3. UNIQUE 추가 - 유일성을 보장받지 못한 데이터는 관리하지 않도록, NULL 허용
ALTER TABLE 테이블명
ADD CONSTRAINT 제약조건명 UNIQUE ( 컬럼명 );

4. PRIMARY KEY 추가 - 식별자, 기본키, 주키, PK : NOT NULL + UNIQUE
ALTER TABLE 테이블명 
ADD CONSTRAINT 제약조건명 PRIMARY KEY ( 컬럼명 );

5. FOREIGN KEY 추가 - 외래키, 참조키, FK : NULL 허용, 부모테이블의 PK 인 컬럼을 참조
ALTER TABLE 테이블명
ADD CONSTRAINT 제약조건명 FOREIGN KEY ( 컬럼명 ) 
    REFERENCES 부모테이블 ( PK인컬럼 );

DESC emp;
SELECT * FROM emp;

데이터 삽입저장
INSERT INTO emp(id, name, salary, gender, email, dept_id)
VALUES (101, '전우치', 3000, '남', NULL, DEFAULT);
SELECT * FROM emp;

INSERT INTO emp(id, name, salary)
VALUES (102, '심청', 5000);
SELECT * FROM emp;

성별을 데이터를 저장하지 않으면 기본값으로 '남' 이 저장되게 하고자 한다.
컬럼에 대한 DEFAULT 지정
ALTER TABLE emp
MODIFY (gender DEFAULT '남');

INSERT INTO emp(id, name, salary)
VALUES (103, '박문수', 4000);

SELECT * FROM emp;

입사일자 추가
ALTER TABLE emp 
--ADD ( hire_date date DEFAULT SYSDATE NOT NULL );
ADD ( hire_date date DEFAULT SYSDATE );

INSERT INTO emp(id, name, salary)
VALUES (104, '이몽룡', 5000);
SELECT * FROM emp;

-----------------------------------------------------------------------------------------------


※ VIEW (뷰)
- 실제로 데이터가 존재하는 객체는 아니다
- 테이블의 데이터를 뷰를 통해 접근한다.
  1. 보안 - 접근 권한
  2. 복잡한 쿼리문을 단순한 쿼리문으로 사용할 수 있다.
  
뷰를 사용하면 테이블처럼 사용가능하며 SELECT 절에서만 쿼리 가능.
INSERT, DELETE, UPDATE 가 불가능 하다.


★ 뷰생성
CREATE VIEW 뷰명 AS ☜ CVAS
쿼리문;

60번 부서원 정보 조회

SELECT * FROM vu_60; --아직 존재하지 않아 오류 발생

CREATE OR REPLACE VIEW vu_60 AS
  SELECT employee_id, first_name || ' '|| last_name name,
         department_id, job_id, hire_date, email 
  FROM employees 
  WHERE department_id = 60;

SELECT * FROM vu_60; --뷰 생성 되어 쿼리 가능

----------------------------------------------------------------
★ 뷰삭제
DROP VIEW 뷰명;
DROP VIEW vu_60;
----------------------------------------------------------------

SELECT * FROM vu_60; --삭제 되어 오류 발생

※ 시퀀셜한 숫자를 만들어주는 기능을 가진 객체
: SEQUENCE

★ 시퀀스 생성
CREATE SEQUENCE 시퀀스명 
START WITH 시작값
INCREMENT BY 증감치
MAXVALUE 최대값 (10의 26승)
MINVALUE 최소값 
CACHE 갯수
NOCYCLE / CYCLE ;

SELECT * 
FROM emp;

CREATE SEQUENCE emp_seq
START WITH 200
INCREMENT BY 1;

시퀀스값의 접근 : CURRVAL, NEXTVAL
SELECT emp_seq.NEXTVAL FROM dual;
SELECT emp_seq.NEXTVAL FROM dual;
SELECT emp_seq.NEXTVAL FROM dual;
SELECT emp_seq.NEXTVAL FROM dual;

SELECT emp_seq.CURRVAL FROM dual;



emp 테이블의 pk인 id 컬럼에 시퀀스를 적용하여 데이터행을 삽입저장한다.
INSERT INTO emp (id, name)
VALUES ( emp_seq.NEXTVAL, '이순신' );
SELECT * FROM emp;

---------------------------------------------------------------------
★ 시퀀스 삭제
DROP SEQUENCE 시퀀스명 ;
DROP SEQUENCE emp_seq;
---------------------------------------------------------------------




PL/SQL( Procedural L. extension SQL)
: SQL + 프로그래밍 언어의 형태로 결합된 언어

기본구조
선언부 : 변수/상수선언문 
실행부 : 대입문, 조건문, 반복문

테스트용 pl/sql : 익명 블럭
declare 
선언부
begin
예외처리부 : exception
end;
/


5 * 6 의 결과를 출력하는 프로그램

declare
    res  number(5);
begin
    res := 5 / 0 ;
    dbms_output.put_line( '5 / 0 = ' ||  res  );
    exception 
        --when zero_divide then
        when others then
            dbms_output.put_line( sqlerrm ); 
            --dbms_output.put_line('0으로 나눌수 없음'); 
end;
/


class Circle{
    int radius;
    Circle( int radius ) throws Exception {
        if( radius<=0 ) throw new Exception("반지름은 0보다 커야 함");
        this.radius = radius;
    }
    double getAround(){
        return 2 * 3.14 * radius;
    }
}

class CircleMain{
    public static void main(String a[]){
        try{
            Circle c = new Circle(-5);
            System.out.print( c.getAround());        
        }catch(Exception e){
            System.out.print(e.getMessage());
        }
    }
}


declare
    radius  number := -5;
    around  number;
    invalid_radius exception;
begin
    if( radius <=0 ) then
        raise invalid_radius;
    else
        around := 2 * 3.14 * radius;
    end if;
    dbms_output.put_line(
        '반지름 ' || radius || ' 인 원둘레는 ' || around );
    exception when invalid_radius then
        dbms_output.put_line('반지름은 0보다 커야 함');
end;
/

점수에 따른 학점
90점이상 A, 80점이상 B, 70점이상 C, 60점이상 D, 그 외 F
declare
    test number := 73;
    grade varchar2(1);
begin
    if test>=90 then grade := 'A';
    elsif test>=80 then grade := 'B';
    elsif test>=70 then grade := 'C';
    elsif test>=60 then grade := 'D';
    else                grade := 'F';
    end if;
    dbms_output.put_line('성적:' || test  || ' ' || grade || '학점' );
end;
/

컴파일하여 하나의 객체로 저장해두고 필요할때다 호출해서 사용할 
이름을 가진 블럭 : PL/SQL 서브프로그램
procedure / function
주의점: 1. 파라미터변수의 데이터타입 사이즈 지정 불가
       2. 파라미터가 없으면 () 선언 불가

프로시저: 데이터를 조작DML 처리에 주로 사용
CREATE or replace procedure 프로시저명( 파라미터변수 데이터타입, ... ) is
선언부
begin
end;
/

특정 사번의 사원에 대해 지정한 %만큼 인상된 급여로 급여를 변경하는 처리를 할 프로시저
CREATE or replace procedure 
            pro_emp_salary_update(emp_id number, pct number) is
begin
    update employees set salary = round(salary * ( 1 + pct*0.01 ))
    where employee_id = emp_id;
end;
/

프로시저실행: execute/exec 프로시저명
100번 사원의 급여를 10% 인상된 급여로 변경저장한다.
exec pro_emp_salary_update(100, 10);

SELECT employee_id, salary
FROM employees where employee_id = 100;

무조건 100번 사원의 급여를 5000으로 변경저장하는 프로시저
CREATE or replace procedure pro_emp_100_update is
begin
    update employees set salary = 5000
    where employee_id = 100;
end;
/

SELECT employee_id, salary
FROM employees where employee_id = 100;
exec pro_emp_100_update;


부서테이블에 새로운 부서를 등록하는 프로시저
CREATE or replace procedure 
        pro_depart_regist(dept_id number, dept_name varchar2) is
    cnt number;
begin
    SELECT count(*) into cnt FROM departments
    where department_id = dept_id;

    if cnt=0 then    
        INSERT INTO departments(department_id, department_name)
        VALUES (  dept_id, dept_name );
    else
        update departments set department_name = dept_name
        where department_id = dept_id;
    end if;
end;
/

SELECT * FROM departments;

exec pro_depart_regist(300, '영업부');
exec pro_depart_regist(310, 'A/S');
exec pro_depart_regist(320, '개발부');

String add( int n1, int n2 ){
    return "더한 결과는 " + n1 + n2;
}

function : 리턴하는 데이터가 있는 메소드라고 여기면 된다.
CREATE or replace function 함수명(파라미터변수명 데이터타입, ...)
    return 리턴데이터의 데이터타입 is
begin
    return 반환데이터;
end;
/

사원이 소속된 부서의 부서명을 반환하는 함수
CREATE or replace function fn_dept_name(id number) 
return varchar2 is
    dept_name varchar2(50);
begin
    SELECT (SELECT department_name FROM departments
            where department_id = e.department_id) into dept_name
    FROM employees e
    where employee_id=id;
    return dept_name;
end;
/

모든 사원의 사번, 성명, 부서코드, 부서명 조회
SELECT employee_id, last_name||' '||first_name name, department_id
       , fn_dept_name(employee_id) department_name
FROM employees;       


100 번 사원의 부서명 조회
SELECT fn_dept_name(200) FROM dual;

SELECT (SELECT department_name FROM departments
        where department_id = e.department_id) department_name
FROM employees e
where employee_id=100;

SELECT department_name
FROM employees e, departments d
where employee_id=100
and e.department_id = d.department_id(+);









