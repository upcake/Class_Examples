○ SQL 명령어
- 데이터베이스에서 자료를 검색하고 수정하고 삭제하는 등을 위한 데이터베이스 언어이다.
- 관계형 데이터베이스를 처리하기 위해 고안된 언어이다.
- 독자적인 문법을 갖는 DB표준 언어이다.(ISO에 의해서 지정)
- 대다수 데이터베이스는 SQL을 사용하여 데이터를 조회, 입력, 수정, 삭제한다.

※ SQL 명령문의 종류
DQL : Data Query Language(질의어), SELECT
DML : Data Manipulation Language(데이터 조작어), INSERT, UPDATE, DELETE
DDL : Data Definition Language(데이터 정의어), CREATE, ALTER, DROP, TRUNCATE, RENAME
TCL : Transaction Control Language(트랜젝션 처리어), COMMIT, ROLLBACK, SAVEPOINT
DCL : Data Control Language(데이터 제어어), GRANT, REVOKE

-----------------------------------------------------------------------------------------------
DQL - SELECT문 ☞ 저장된 데이터를 조회

DML - INSERT문 ☞ 새로운 데이터를 삽입
DML - UPDATE문 ☞ 기존의 데이터를 변경
DML - DELETE문 ☞ 기존의 데이터를 삭제

DDL - CREATE문 ☞ 새로운 테이블을 생성
DDL - ALTER문  ☞ 기존의 테이블을 변경(컬럼 추가, 컬럼 크기 변경 등)
DDL - TRUNCATE문 ☞ 객체내의 데이터를 삭제
        DML의 DELETE문과의 차이점 : TCL의 ROLLBACK으로 삭제하기 이전 상태로 되돌릴 수 없다.
DDL - DROP문 ☞ 기존 테이블을 삭제할 때 사용
        테이블의 내용과 구조 자체를 모두 제거한다.
DDL - RENAME문 ☞ 기존의 테이블의 이름을 변경

TCL - COMMIT ☞ 변경된 내용을 영구 저장
TCL - ROLLBACK  ☞ 변경되기 이전 상태로 되돌림
TCL - SAVEPOINT ☞ 특정 위치까지는 영구 저장 혹은 이전 상태로 되돌릴 수 있도록 
    트랜잭션 중에 저장점을 만들 때 사용

DCL - GRANT문 ☞ 사용자에게 특정 권한을 부여할 때 사용
DCL - REVOKE문 ☞ 사용자에게 부여했던 특정 권한을 제거할 때 사용
-----------------------------------------------------------------------------------------------










○ SQL*PLUS 명령어
- 툴에서 출력 형식을 지정하는 등 환경을 설정한다.
- SQL 명령문을 저장하거나 편집 기능을 제공한다.
- 컬럼이나 데이터의 출력형식을 지정하며, 환경을 설정하는 기능을 포함한다.
- SQL 문을 실행시키고 그 결과를 볼 수 있도록 오라클에서 제공하는 툴이다.
-----------------------------------------------------------------------------------------------
  SQL 문                                    |  SQL*PLUS 문(SQL + 툴 자체명령)
-----------------------------------------------------------------------------------------------
- 관계형 DB의 ANSI 표준 언어                |  - SQL 문을 실행시킬 수 있는 오라클의 툴(도구)
- 여러 줄 실행                              |  - 한 줄 실행 
- 종결문자(;)의 사용으로 여러줄을 사용해도  |  - 종결문자(;)가 없기 때문에 여러줄을 사용할려면 
  끝에 종결문자(;)를 넣으면 한줄로 인식     |    연결문자(-)를 사용해 주어야함
- 키워드 단축 불가                          |  - 키워드 단축 가능
- 버퍼에 마지막 명령문 저장                 |  - 버퍼 저장 안함
-----------------------------------------------------------------------------------------------

※ SQL과 PL/SQL, SQL*Plus의 차이점
- SQL      : 관계형 데이터베이스에 저장된 데이터에 Access하기 위하여 사용하는 표준언어 이다.
- PL/SQL   : SQL문을 사용하여 프로그램을 작성할 수 있도록 확장해 놓은 
             오라클의 Procedural Language 이다.
- SQL*Plus : SQL 및 PL/SQL 문장을 실행할 수 있는 환경을 제공하는 오라클의 Tool 이다.
-----------------------------------------------------------------------------------------------

※ SQL*Plus 명령어 중에서 자주 사용하는 명령어
-----------------------------------------------------------------------------------------------
명령어                 | 기능
-----------------------------------------------------------------------------------------------
LIST, RUN, @, /        | 편집 명령 (버퍼 관련)
SAVE, GET, EDIT, SPOOL | 파일 명령 (명령어를 저장 및 수정, 실행) 
HOST, EXIT             | 데이터베이스 접속 및 종료
LINE, PAGE             | 출력 형식
-----------------------------------------------------------------------------------------------

★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
★★   https://mirwebma.tistory.com/12                                                         ★★
★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★

※ command line에서 작성 ☜ HANUL로 접속해서 작업할 것

※ 버퍼관련 : 버퍼에 있는 내용 출력, 수정, 실행까지...
오라클은 현재 실행중인(최근에 사용했던) SQL문을 명령 버퍼(command buffer)에 저장한다. 
그리고 저장된 SQL문을 SQL*Plus명령어로 호출, 편집 및 실행을 할 수 있다.

● LIST - 버퍼에 있는 내용을 확인하기 위한 명령어 (축약형 : L)
SQL> SELECT ENAME, SAL*12
  2  FROM EMP;
SQL> LIST
  1  SELECT ENAME, SAL*12
  2* FROM EMP ☜ 종결문자(;) 불필요

※ 버퍼에 저장된 문구를 실행시키는 명령어 ( RUN 과 / )
● RUN - 버퍼에 저장된 쿼리문을 실행(축약형 : R), 버퍼에 저장된 명령어를 다시 한번 출력
●  /  - 버퍼에 저장된 쿼리문을 실행            , 버퍼에 저장된 명령어 출력하지 않고 바로 실행

● EDIT - 버퍼에 저장된 쿼리문을 편집하는 명령어(축약형 ED)
SQL> LIST   -- LIST로 저장된 문구를 확인
  1  SELECT ENAME, SAL*12
  2* FROM EMP

SQL> EDIT
Wrote file afiedt.buf --라고 출력하며 메모장이 뜬다.

메모장 내용 -----------------------------------------------------------------------------------
SELECT ENAME, SAL*12
FROM EMP
/ -- /는 메모장에서 종결문자(;)을 나타낸다. 
-----------------------------------------------------------------------------------------------
메모장을 다음과 같이 수정 ---------------------------------------------------------------------
SELECT ENAME, SAL*12, COMM --커미션 추가
FROM EMP
/ -- /는 메모장에서 종결문자(;)을 나타낸다. 
-----------------------------------------------------------------------------------------------
저장한 뒤 메모장을 종료하면 아래처럼 수정한 쿼리문이 출력된다.
  1  SELECT ENAME, SAL*12, COMM
  2* FROM EMP
SQL> / --☜ 버퍼에 저장된 쿼리문을 실행, COMM컬럼까지 추가되어 출력
ENAME          SAL*12       COMM
---------- ---------- ----------
SMITH            9600
ALLEN           19200        300

● HOST - Oracle을 종료하지 않고 OS 명령을 수행할 수 있도록 OS 환경으로 잠시 나가는 명령어
SQL> HOST
Microsoft Windows [Version 10.0.18363.657]
(c) 2019 Microsoft Corporation. All rights reserved.
C:\Users\hoho0829>

C:\Users\hoho0829>DIR --afiedt.buf라는 파일이 존재하는것을 확인

C:\Users\hoho0829>EXIT --다시 오라클 환경인 sqlplus로 돌아옴
도스프롬프트를 나가는 명령어 exit를 사용하면 sqlplus로 돌아오게 된다.

● SAVE (저장할파일명) - 버퍼에 저장된 마지막으로 실행한 명령어를 저장하는 명령어
쿼리문을 사용한후 SAVE 파일명 을 사용하면 마지막에 사용한 명령어가 파일명.sql 로 저장. 
SQL> SAVE EMP
Created file EMP.sql

SQL> HOST - 도스로 나가서 DIR 로 확인해봄
C:\Users\hoho0829>DIR
C:\Users\hoho0829>EXIT

● @ 저장된파일명 - 저장된 파일의 명령어를 불러와서 실행시키는 명령어
SQL> @ EMP
SQL> SAVE EMP --save사용시 이미 저장되어있는 파일이름을 넣으면 오류 발생
SP2-0540: File "EMP.sql" already exists.
Use "SAVE filename[.ext] REPLACE".

SQL> SAVE EMP REPLACE -- REPLACE 옵션 : 임 존재하는 파일 덮어쓰가 됨
                      -- APPEND  옵션 : 이미 존재하는 파일 끝에 마지막으로 실행한 명령어가 추가.
Wrote file EMP.sql

● SPOOL - 오라클 화면을 갈무리하여 파일로 저장하는 명령어이다.
SAVE  명령어는 실행된 쿼리문만 저장하는데에 비해 
SPOOL 명령어는 SQL문과 실행된 쿼리 결과를 파일에 기록하는 명령어이다.
확장자는 .LST 이다.
SPOOL 명령어로 시작하고 SPOOL 명령어 옆에는 메모장의 이름을 기술한다.
쿼리문을 2개 이상 실행해보고 반드시 SPOOL OFF 명령문을 써주어 화면 갈무리를 종료해준다.

SQL> SPOOL BBB

SQL> SELECT ENAME, JOB FROM EMP;
SQL> SELECT * FROM DEPT;

SQL> SPOOL OFF

SQL> EDIT BBB.LST

● GET - 저장되어 명령어를 버퍼로 불러오는 명령어 
@ 는 저장된 파일을 읽어 바로 실행을 시키지만 
GET 는 저장된 명령어를 불러와서 버퍼에 저장만 할 뿐 실행은 시키지 않음.
그래서 GET 를 사용하고 난 뒤에 RUN 이나 / 를 사용하여 실행시킴 

SQL> GET EMP
  1  SELECT ENAME, SAL*12, COMM
  2* FROM EMP
SQL>  
  
● SET - 시스템환경을 설정, 출력할 컬럼제목, 출력문의 길이 및 너비 등등을 설정하는 명령어
(SET NULL명령도 SET명령어 변수중 하나인 NULL을 사용한 명령어이다.)
SET 다음에 어떤 시스템변수를 쓰냐에 따라 현재 시스템의 환경이 변화된다.

※ SET 시스템_변수명 값

시스템변수명    기능
-----------------------------------------------------------------------
SET_HEADING     컬럼제목의 출력 여부를 결정 
SET_LINESIZE    1라인당 보여줄 수 있는 글자수를 지정
SET_PAGESIZE    1페이지에 보여줄 수 있는 줄수를 결정
-----------------------------------------------------------------------

SQL> SET HEADING OFF --컬럼제목의 출력 여부를 결정
SQL> SELECT * FROM EMP;
SQL> SET HEADING ON
SQL> SELECT * FROM EMP;

SQL> SET LINESIZE 100; --1라인당 보여줄 수 있는 글자수(100)를 지정
SQL> SELECT * FROM EMP;
SQL> SET LINESIZE 150; --1라인당 보여줄 수 있는 글자수(150)를 지정
SQL> SELECT * FROM EMP;

SQL> SET PAGESIZE 10; --1페이지에 보여줄 수 있는 줄수(10)를 결정
SQL> SELECT * FROM EMP;
SQL> SET PAGESIZE 15; --1페이지에 보여줄 수 있는 줄수(15)를 결정
SQL> SELECT * FROM EMP;

● COLUMN (컬럼명) HEADING (바꿀컬럼명) - 컬럼 제목을 설정하는명령어 
● COLUMN (컬럼명) CLEAR - 설정 해제 명령어

SQL> COLUMN ENAME HEADING '사원이름' -- 컬럼 제목을 설정하는명령어 
SQL> SELECT * FROM EMP;
SQL문에서도 컬럼제목을 수정하는 별칭(ALIAS)라는 방법이 있지만
SQL*Plus문에서는 컬럼제목을 한번 설정하면 해제하기전까지 계속 변경되여 출력이 된다.

SQL> COLUMN ENAME;
COLUMN   ename ON
HEADING  '사원이름' --HEADING이 설정되어 있다고 출력이 됨

SQL> COLUMN ENAME CLEAR; --HEADING 설정 해제 명령어
SQL> COLUMN ENAME; 
SP2-0046: COLUMN 'ENAME' not defined
--헤딩 해제 뒤에 설정값을 확인해보니 정의가 되지 않았다고 메세지가 출력.



테이터의 출력형식 변경
● COLUMN (컬럼명) FORMAT (출력형식) - 컬럼의 출력형식을 변경 

SQL> COLUMN SAL FORMAT 000,000 --3번째 자리앞에 ,를 찍은 6자리수로 출력, 값 없는곳엔 0
SQL> SELECT SAL FROM EMP;
SQL> COLUMN SAL FORMAT 99999

SQL> COLUMN ENAME FORMAT A10 -- 문자열을 10자 출력
SQL> SELECT ENAME, SAL FROM EMP;


