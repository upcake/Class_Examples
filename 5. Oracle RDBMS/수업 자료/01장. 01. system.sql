시작메뉴 -> cmd -> 
> sqlplus --SQL 문을 실행시키고 그 결과를 볼 수 있도록 오라클에서 제공하는 툴
> user-name: system
> password: 0000

HR 유저 사용하기 위해 HR 유저 계정 풀기 --데이터베이스 사용자는 오라클 계정과 같은 의미로 사용
ALTER : 고치다, 바꾸다
ALTER USER hr 
ACCOUNT unlock;

--비밀번호 지정
ALTER USER hr
IDENTIFIED BY 0000;

데이터관리 : Table
행열로 이루어진 2차원 구조의 Table로 데이터를 관리

--dba_users 구조보기
DESC dba_users;

--사용자 정보 확인
SELECT username
FROM dba_users;

SELECT *
FROM dba_users;

--전체 테이블 조회
SELECT * FROM ALL_TABLES; --(관리자일 경우)
SELECT * FROM USER_TABLES; --(관리자 아닐 경우)
SELECT * FROM TAB; --(관리자 아닐 경우)

TAB은 TABLE의 약자로 HR사용자가 소유하고 있는 
테이블의 정보를 알려주는 데이터딕셔너리(Data Dictionary)이다.
데이터딕셔러니(Data Dictionary) : 데이터베이스와 관련된 모든 정보를 제공한다.

--user_tables 에서 table_name 보기
SELECT table_name 
FROM user_tables
ORDER BY table_name;

--user_tables 구조 보기, TABLE_NAME 확인
DESC user_tables;

--SELECT * PRIVILEGE FROM DBA_SYS_PRIVS WHERE GRANTEE IN('CONNECT', 'RESOURCE');
resource role, connect role에 부여된 권한 조회
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE IN('CONNECT', 'RESOURCE');

--SELECT * FROM DUAL;

pl/sql developer 사용자 환경 설정.
SQL developer 도구 글꼴 변경 
- 도구 > 환경설정... > 코드 편집기 > 글꼴 > 글꼴 크기
SQL developer 창 초기화 : 창 > 팩토리 설정으로 창 재설정

SQL에디터에서 줄번호 보이게 설정
 - 도구 > 환경설정 > 코드 편집기 > 행 여백 > 행 번호 표시에 체크.
 
4. 모델러
3. 튜너
2. DBA
1. DB엔지니어 ☞ 3~5년

오라클  : MySQL 합병, 유료화
MariaDB : 새로 창업, 구글과 연동(리눅스에서 기본 사용)

오라클 사용 가능 OS : 윈도우, 리눅스(리눅스에서 Maria DB를 기본으로 사용), UNIX

오라클에서는 user자체가 DB : cf) MySQL에서는 데이터베이스로 표현
오라클에서는 dba_users 테이블에 있는 username 이 하나의 데이터 베이스

※ 데이터베이스 설계
1. 요구사항 분석 	        ☞ 요구사항명세서
2. 개념적 설계			    ☞ ER 다이어그램
3. 논리적 설계			    ☞ 릴레이션 스키마, attribute, tuple
4. 물리적 설계와 구현	    ☞ 물리적 스키마, column, row

-----------------------------------------------------------------------------------------------
※ 오라클 버전
 8i : 이때부터 8080포트 사용
 9i : 
10g : g ☞ 그리드 컴퓨팅, 
      휴지통 개념 생김. 그래서, purge생김, drop table 테이블명 purge;
      10g ☞ 한글 2바이트
11g : 11g부터 한글 3바이트
12c : c ☞ 클라우드 서비스
 :
 :
19c
-----------------------------------------------------------------------------------------------
1521 : 기본 DB포트
8080 : 톰캣이 기본으로 사용
tomcat : WAS(Web Application Server)의 종류

Oracle XE버전 사용(Standard하고는 틀림)
Orccle DB : 램 1기가 사용
설치는 쉽지만 제거는 어려움
오라클 사이트에서 reinstall 다운로드 받아 제거

※ 오라클 종류
- Database Standard Edition 2(SE2) : 가장 기본적인 DB 제품. CPU 소켓 2개까지만 사용이 가능하고 그 이상일 경우 EE로 구입해야함. 
        SE2에서는 Real Application Cluster(RAC : 관리 컨트롤) 옵션만 지원. 
- Database Enterprise Edition(EE) : 고사양 서버에서 사용가능한 기업용 DB. 
        SE2에서 지원되지 않는 모든 옵션이 지원 가능.
- Database Express Edition(XE) : 개발용, 교육용 등으로 무료사용이 가능한 DB.
        상업용도로 판매하는 것은 불가능.
- Database Personal Edition(PE) : 개인용 PC에서 사용할 수 있는 DB. 네트워크 연결이 되어 있지 않은 환경에서 사용 가능. 
        총판 통해 판매되고 있음.
- WebLogic Server
- Business Analyst
- Big Data(Big Data Appliance랑 다름)


SQL  : Structured Query Language
조회 : Query Language : SELECT
조작 DML(Data Manipulation Language): INSERT, UPDATE, DELETE
       DML : SELECT, INSERT, UPDATE, DELETE
정의 DDL(Data Definition Language): CREATE, DROP, ALTER, TRUNCATE, RENAME
권한제어 DCL(Data Control Language): GRANT, REVOKE
트랜잭션제어 TCL (Transaction Control Language): COMMIT, ROLLBACK

※ SQL문의 작성 방법
SQL문은 대소문자를 구분하지 않고(안의 데이터만 구분) 
일반적으로 절 단위로 줄바꿈을 하여 쓴다.
문장의 끝에 세미콜론(;) 을 기술하여 명령의 끝을 표시한다.

DML만 commit 실행, 나머지는 auto commit 됨.
commit : 트랜잭션(묶음, 덩어리) 완료, 확정

SYSTEM 계정에서 hanul사용자 계정 만든 후 테이블 만들어 데이터 삽입 후 
sqldeveloper와 cmd창에서 비교해가며 commit 확인

--hanul 사용자계정 생성 후 비밀번호 지정
CREATE USER hanul 
IDENTIFIED BY 0000;

--hanul사용자 계정 생성 후 권한 부여
--Role (하나이상의 권한으로 이루어진 집합체 : resource, connect, dba...) 권한 부여
--https://fliedcat.tistory.com/98


GRANT CONNECT, 
      RESOURCE,
      CREATE VIEW
TO hanul;



