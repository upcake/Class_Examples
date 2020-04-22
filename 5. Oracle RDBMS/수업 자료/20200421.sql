※ 오라클 11g SQL*PLUS로 로그인 하기
도스창에서 Sql*Plus를 실행하기 위해서 HANUL 계정으로 접속하기
시작 > 실행 > CMD

C:\Users\계정>SQLPLUS HANUL/0000
--접속된 유저 확인하기
SQL> SHOW USER

--HANUL 계정으로 접속한 상태에서 HR 계정으로 접속하는 방법
--connect HR/[오라클 설치 시 입력했던 암호]
SQL>CONNECT HR/0000

--HR 계정으로 접속이 되었는지 확인하기
SQL> SHOW USER

오라클 서버 나가기
SQL>EXIT

Oracle을 종료하지 않고 OS 명령을 수행할 수 있도록 OS 환경으로 잠시 나가는 명령어
SQL>HOST

C:\Users\hoho0829>EXIT --다시 오라클 환경인 sqlplus로 돌아옴
도스프롬프트를 나가는 명령어 exit를 사용하면 sqlplus로 돌아오게 된다.

--HR 유저에 관리된 table 확인
SELECT table_name FROM user_tables;
SELECT * FROM user_tables;
SELECT * FROM TAB; 
-- TAB은 TABLE의 약자로 HR사용자가 소유하고 있는 
-- 테이블의 정보를 알려주는 데이터딕셔러니(Data Dictionary)이다.
-- 데이터딕셔러니(Data Dictionary) : 데이터베이스와 관련된 모든 정보를 제공한다.

TABLE_NAME 
------------------------------
REGIONS     : 대륙정보
LOCATIONS   : 위치정보
DEPARTMENTS : 부서정보
JOBS        : 업무정보
EMPLOYEES   : 사원정보
JOB_HISTORY : 업무이력정보
COUNTRIES   : 국가정보

2.1. 데이터 조회 

● DESC ☞ SQL*PLUS 명령어, 
테이블의 컬럼 이름, 데이터형, 길이, NULL 허용 유무 등 특정 테이블의 정보를 제공
DESCRIBE 테이블명 ==  DESC 테이블명
DESC employees; /*employees 테이블 구조 파악*/

이름                   널?            유형           
--------------         --------      ------------ 
EMPLOYEE_ID(사번)      NOT NULL      NUMBER(6)    
FIRST_NAME(이름)                     VARCHAR2(20) 
LAST_NAME(성)          NOT NULL      VARCHAR2(25) 
EMAIL(이메일)          NOT NULL      VARCHAR2(25) 
PHONE_NUMBER(휴대전화)               VARCHAR2(20) 
HIRE_DATE(입사일)      NOT NULL      DATE         
JOB_ID(업무코드)       NOT NULL      VARCHAR2(10) 
SALARY(급여)                         NUMBER(8,2)  
COMMISSION_PCT(상여율)               NUMBER(2,2)  
MANAGER_ID(매니저아이디)             NUMBER(6)    
DEPARTMENT_ID(부서코드)              NUMBER(4) 

● SELECT ☞ 테이블에 저장된 데이터를 조회하기 위한 명령어, SQL문 중에 가장 많이 사용. 
           SELECT 문에는 FROM 키워드가 반드시 따라와야 함.
● WHERE  ☞ SELECT 문에서 마지막에 쓸 수 있는데 원하는 레코드만 검색하고자 할 때 사용.
           조건절의 구성은 컬럼, 연산자, 비교대상값이 올 수 있다.
           
사원테이블에서 모든 컬럼 조회
모든 컬럼 : * (즉, 찾고자 하는 테이블의 모든 내용을 검색)
특정 컬럼 : 컬럼명

SELECT * FROM 테이블명;

SELECT 컬럼명1, 컬럼명2, ...
FROM 테이블명;

SELECT * FROM employees;

--사원테이블에서 사번, 이름, 성 조회
SELECT employee_id, first_name, last_name
FROM employees;

--사원들에 대한 사번, 이름, 성, 부서코드, 입사일자, 업무코드, 급여 조회
SELECT employee_id, first_name, last_name, department_id,
       hire_date, job_id, salary
FROM employees;  

2.2. WHERE 조건절 : 특정 조건에 맞는 데이터행을 조회하고자 할때, 
                    ☜ WHERE 절에서 aliasing 사용 불가!
SELECT 절
FROM 절
WHERE 절;

WHERE 조건절을 구성하는 항목의 분류(WHERE 절안에 사용 가능한 연산자)
- 컬럼, 숫자, 문자, 날짜(문자, 날짜는 '(홑따옴표)로 구분)
- 산술연산자(+, -, *, /), 비교연산자(=, !=, <>, ^=(같지 않다), >=, <=, <, >), 
- ★ 연결연산자(||)
- AND, OR, NOT
- LIKE, IN, BETWEEN, EXISTS, NOT
- IS NULL, IS NOT NULL
- ANY, SOME, ALL
- 함수

○ 조건절에 사용하는 연산자
1. 산술연산자 : +, -, *, /  : SELECT절과 조건절안에 사용할 수 있음
2. 문자연결연산자: || : SELECT절과 조건절에 사용가능
3. 비교연산자 : =, !=, <>, ^= (같지않다), >, <, >=, <= 
               DB에서 같다는 ‘==’가 아니고, ‘=’ 하나만 사용함
               문자, 날짜는 반드시 홑따옴표('') 안에 표시해야 함.
4. 논리조건연산자 : AND, OR, NOT
5. 범위조건연산자 : BETWEEN ~ AND
6. IN조건연산자 : OR 연산자와 동일한 기능을 수행
7. LIKE조건연산자 : 컬럼값들 중에 특정 패턴에 속하는 값을 조회
8. NULL조건처리 : 데이터값이 없는 형태의 표현 ☞ NULL - 비교불가, 산술연산불가

2.3. 연산자
1. 산술연산자 : +, -, *, /  : SELECT 절과 조건절안에 사용할 수 있음
80번 부서의 사원의 사번, 성, 급여, 한 해 동안 받은 급여(연봉) 조회
SELECT employee_id, last_name, salary, salary*12
FROM  employees
WHERE department_id = 80;

SELECT 절안에 다음과 같을때 ALIAS(별칭, 별명, 애칭)를 습관적으로 지정하기
1. 컬럼표현에 연산자/함수가 사용된 경우
2. 컬럼표현이 지나치게 긴 경우

○ 컬럼표현에 대한 다른 이름 : 컬럼에 별칭을 붙여 사용할 수 있다. ALIAS 컬럼 별칭(column ALIAS)
ALIAS 사용 방법
- 공백을 두고 사용한다.  ☞ 컬럼표현 ALIAS명
- 키워드 AS를 사용한다.  ☞ 컬럼표현 AS ALIAS명
- ALIAS명에 공백이 있으면 쌍따옴표(")를 사용하고 공백 없으면 쌍따옴표(") 생략가능함.

연봉이 150000 이상인 사원들의
사번, 이름, 성, 업무코드, 급여, 연봉 조회
SELECT employee_id, first_name, last_name, job_id, salary, 
       salary*12 annual_salary --ALIAS : 별명
FROM employees
WHERE salary*12 >= 150000;  --연봉이 150000 이상; ★ WHERE절에서 ALIAS 불가능 

한 해 동안 받은 급여가 120000 인 사원의 사번, 성, 연봉 조회
SELECT employee_id, last_name, salary*12
FROM employees
WHERE salary*12 = 120000 --★ WHERE절에서 ALIAS불가능

2. 문자 연결 연산자: || : SELECT 절과 조건절에 사용가능(SELECT 절에서 많이 사용)
SELECT * 
FROM employees;

사번이 101번인 사원의 사번, 성, 명을 조회
성명은 이름과 성을 합해서 사용한다.
SELECT employee_id, first_name || last_name 
FROM employees
WHERE employee_id = 101;

성명이 StevenKing 인 사원의 
사번, 성명, 업무코드, 급여, 부서코드 조회
성명은 이름과 성을 합해서 사용한다.
SELECT employee_id, first_name, last_name, job_id, salary, department_id
FROM employees
WHERE first_name || last_name = 'StevenKing'; --성명이 StevenKing;
--WHERE first_name || ' ' ||  last_name = 'Steven King'; --성명이 Steven King;

성명이 StevenKing 인 사원의 
사번, 성명, 업무코드, 급여, 부서코드(dept_id로 ALIAS) 조회
성명은 이름과 성을 합해서 사용(name으로 ALIAS)한다.
SELECT employee_id, first_name||' '||last_name as name, job_id, 
       salary, department_id dept_id
FROM employees
WHERE first_name || last_name = 'StevenKing'; --성명이 StevenKing;

공백문자: ' '(홑따옴표 안에 공백 한칸 삽입)
홍 길동

사번이 101번인 사원의 사번, 성명을 조회한다.
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다
SELECT employee_id, first_name||' '||last_name name
FROM employees
WHERE employee_id = 101;

사번이 101번인 사원의 성명과 한 해 동안 받은 급여를 조회한다.
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다
연봉은 'annual salary'로 별명한다.
SELECT employee_id, first_name||' '||last_name AS name, salary*12 "annual salary"
FROM employees
WHERE employee_id = 101;

3. 비교연산자 : =, !=, <>, ^=, >, <, >=, <=
급여가 3000 이하인 사원의 사번, 성, 급여, 부서코드, 업무코드를 조회한다.
SELECT employee_id, last_name, salary, department_id, job_id
FROM employees
WHERE salary <= 3000 ;

부서코드가 80 초과인 사원의 사번, 성, 급여, 부서코드를 조회한다.
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE department_id > 80;

부서코드가 90인 부서에 속한 사원들의
사번, 이름, 성, 부서코드, 업무코드 조회
SELECT employee_id, first_name, last_name, department_id, job_id
FROM employees
WHERE department_id = 90;  /*부서코드가 90인 부서에 속한;*/
--WHERE department_id IN (90);  /*부서코드가 90인 부서에 속한;*/

급여가 17000 인 사원들의
사번, 이름, 성, 부서코드, 급여 조회
SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE salary = 17000; --급여가 17000;

급여가 3000 이하인 사원들의 
사번, 이름, 성, 업무코드, 급여, 입사일자 조회
SELECT employee_id, first_name, last_name job_id, salary, hire_date
FROM employees
WHERE salary <= 3000;        

급여가 15000 이상인 사원들의
사번, 이름, 성, 업무코드, 급여 조회
SELECT employee_id, first_name, last_name, job_id, salary
FROM employees
WHERE salary >= 15000; --급여가 15000 이상;
