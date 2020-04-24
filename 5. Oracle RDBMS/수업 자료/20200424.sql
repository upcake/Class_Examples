6) 문자열에서 문자열의 일부를 반환(★ 몇번째부터 몇글자)하는 함수
    : SUBSTR(char, position [, LENGTH])
    : SUBSTR(대상문자, 시작위치, 몇글자)
    두번째 파라미터(position : 시작위치), 음수 지정 가능 ☞ 오른쪽에서부터
    세번째 파라미터(LENGTH : 몇글자) 생략시 ☞ ★ 문자열의 끝까지 반환
               1   5   9   13
SELECT SUBSTR('You are not alone', 5, 3)  s1, /* are */
       SUBSTR('You are not alone', 5)     s2, /* are not alone */
       SUBSTR('You are not alone', -5, 3) s3, /* alo */
       SUBSTR('You are not alone', -5)    s4  /* alone */
FROM dual;

7) 문자열에서 특정문자열이 위치한 ★시작위치를 반환하는 함수
    : INSTR(char, search_string [, position] [ , _th])
    : INSTR(대상문자, 찾는문자열, 문자열찾는시작위치, 몇번째거)
    두번째 파라미터 ☞ 찾는문자열
    세번째 파라미터 ☞ 문자열 찾는 시작 위치, 음수 지정 가능 
        ☞ 오른쪽에서부터 왼쪽방향으로 ★ 쭊쭊쭊쭉 계속 진행
    네번째 파라미터 ☞ 몇번째거, 생략 가능 - default 1

              1     7   11 14 17 19
SELECT INSTR('Every sha-la-la-la-la', 'la', 1, 2)   s1, 
       /* 1번위치부터 찾기 시작해서 2번째로 존재하는 'la' 시작 위치 14 */
       INSTR('Every sha-la-la-la-la', 'la', 12, 2)  s2, /* 17 */
       INSTR('Every sha-la-la-la-la', 'la', 12, 4)  s3, /* 0 */
       INSTR('Every sha-la-la-la-la', 'la', 12)     s4, /* 14 */
       INSTR('Every sha-la-la-la-la', 'la', -3, 2)  s5, /* 14 */
       INSTR('Every sha-la-la-la-la', 'la', -10)    s6 /* 11 */
                     /*-11-8 -5 -2*/            
FROM dual;

-----------------------------------------------------------------------------------------------
email                 @위치  id(1번째부터 @위치 앞까지)   서비스제공자(@위치 뒤부터 끝까지)
-----------------------------------------------------------------------------------------------
honggildong@naver.com  12    honggildong         1,11     naver.com      13,22
admin@google.com        6    admin               1, 5     google.com      7,16  
hoho0829@hanmail.net    9    hoho0829            1, 8     daum.net       10,20
-----------------------------------------------------------------------------------------------

본인의 이메일에서 이메일 아이디를 조회
SELECT 'hoho0829@hanmail.net' email,   
        SUBSTR('hoho0829@hanmail.net', 1, INSTR('hoho0829@hanmail.net', '@')-1) id,
        SUBSTR('hoho0829@hanmail.net', INSTR('hoho0829@hanmail.net', '@')+1) servicer1,
        SUBSTR('hoho0829@hanmail.net', INSTR('hoho0829@hanmail.net', '@')+1,
        	LENGTH('hoho0829@hanmail.net')-INSTR('hoho0829@hanmail.net', '@')) servicer2
FROM dual;

--JOBS 테이블에서 업무코드, 업무제목, 직무, 직책 조회
--직무, 직책은 업무코드에서 '_'기준으로 조회(직무_직책)
SELECT job_id, job_title
FROM jobs;

[실습]
JOB_ID   JOB_TITLE   '_'위치   문자열갯수   _문자 이후 갯수     직무      직책        
-----------------------------------------------------------------------------------
AD_PRES  President        3            7            4            AD       PRES 
:
:

SELECT job_id,
       job_title,
       INSTR(job_id,'_') "_위치",
       LENGTH(job_id) "문자열갯수",
       LENGTH(job_id)-INSTR(job_id,'_') "_문자 이후 갯수", 
       SUBSTR(job_id,1,INSTR(job_id,'_')-1) "직무",   /* _이전까지 추출 */
       SUBSTR(job_id,INSTR(job_id,'_')+1) "직책1",     /* _이후부터 추출 */
       SUBSTR(job_id,INSTR(job_id,'_')+1,LENGTH(job_id)-INSTR(job_id,'_')) "직책2"
FROM jobs;

부서코드가 60,80,100 인 부서에 속한 사원들의 
사번, 성, 전화번호, 지역번호, 개인번호 조회
------------------------------------------------------
                             지역번호     개인번호  
박문수  515.124.4567         515           4567
임꺽정  011.44.1344.467268   011           467268 
홍길동  02.1234.5678         02            5678
전우치  062.9874.5422        062           5422
심청    0652.4523.6221       0652          6221
------------------------------------------------------

SELECT  employee_id, last_name, phone_number,
        SUBSTR(phone_number,1,INSTR(phone_number,'.')-1) 지역번호1,
        SUBSTR(phone_number,INSTR(phone_number,'.',-1)+1) 지역번호2
FROM employees 
WHERE department_id IN (60,80,100);


                            지역번호   개인번호  
박문수  515.124.4567         515       4567
임꺽정  011.44.1344.467268   011       467268 
홍길동  02.1234.5678         02        5678
전우치  062.9874.5422        062       5422
심청    0652.4523.6221       0652      6221

3.3 날짜함수 : 송금, 출결, 회원가입날짜, 결제시간
1) 시스템의 현재 날짜를 반환하는 함수 - SYSDATE
다른 함수와는 달리 파라미터가 없어 ()를 사용하지 않음.
SELECT SYSDATE
FROM dual;

날짜 +/- 숫자   -> 날짜
날짜 - 날짜     -> 숫자

오늘날짜 + 1 -> 내일날짜
오늘날짜 - 1 -> 어제날짜
SELECT SYSDATE+1 tomorrow, SYSDATE-1 yesterday
FROM dual;

오늘날짜 - 그제날짜 -> 일수차이
오늘날짜로 부터 한 달후: 
SELECT SYSDATE+30 after1M
FROM dual;

SELECT SYSTIMESTAMP --밀리초까지
FROM dual;

2) 특정날짜로부터 몇 개월 후/전 의 날짜 반환하는 함수
    : ADD_MONTHS(날짜, 개월수)
오늘로부터 6개월 후의 날짜 조회, 오늘로부터 3개월 전의 날짜 조회
SELECT ADD_MONTHS(SYSDATE, 6) after6M, 
       ADD_MONTHS(SYSDATE, -3) before3M
FROM dual;

오늘날짜 - 이전날짜 -> 개월수의 차이 ☞ MONTH_BETWEEN
3) 두 날짜 사이의 개월수의 차이를 반환하는 함수
    : MONTHS_BETWEEN(날짜1, 날짜2) ☞ 날짜1 > 날짜2

소수 첫째자리까지 표현
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, '20/02/24'),1) diff
FROM dual;

교육 시작일부터 오늘까지의 개월 수와 수료할 날까지의 남은 개월 수를 알아보자.
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, '20/02/24'),1) PASSED, 
       TRUNC(MONTHS_BETWEEN('20/08/21', SYSDATE),1) REMAINED 
FROM dual;

우리회사 사번 100번인 사원 의 
사번, 성, 입사일자, 근무개월수, 근무년수 조회
- 근무개월수, 근무년수는 오늘을 기준으로 계산하여 정수로 표현 
예를 들어 오늘은 2019/08/07 이고, 2019/05/27 일에 입사했다면  2개월 근무한 것
SELECT employee_id, last_name, hire_date, 
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)) work_months,
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)/12) work_years
FROM employees
WHERE employee_id = 100;

4) 해당 날짜가 포함된 달의 마지막 일자를 반환하는 함수
    : LAST_DAY(날짜)
    
SELECT LAST_DAY(SYSDATE) s1, 
       LAST_DAY(ADD_MONTHS(SYSDATE, -3)) s2,
       --오늘로부터 3개월전인 달의 마지막 날짜
       LAST_DAY(ADD_MONTHS(SYSDATE, 3)) s3
       --오늘로부터 3개월 후인 달의 마지막 날짜
FROM dual;

5) 해당날짜 이후의 날짜 중에서 char로 명시된 요일에 해당하는 첫번째 날짜를 반환 
    : NEXT_DAY(날짜, char)
    char : 요일문자 ☞ 일요일, 월요일~~, 일, 월~~, 숫자도 가능(1:일요일, 2:월요일)

SELECT NEXT_DAY(SYSDATE, '월요일') NEXT1,
       NEXT_DAY(SYSDATE, '금요일') NEXT2,
       NEXT_DAY(SYSDATE, '일') NEXT3, 
       NEXT_DAY(SYSDATE, 4) NEXT4 /* 4 : 수 */
FROM dual;   

* 형변환함수

1. 숫자화함수 : TO_NUMBER ☞ 문자 -> 숫자
byte    <   short  <    int    <    long
int i = 10;     /* int   : 4바이트 */
short s = 5;    /* short : 2바이트 */
s = (short)i; 안담김 int   -> short
i = (int)s;          short -> int : 명시적 형변환
i = s; 암묵적 형변환

암묵적 형변환 발생 
SELECT 10 +20   d1,  /* 30 */
       10 +'20' d2   /* 30 */
from dual;

알파벳, 기호, 한글 이런 문자등은 숫자화 불가
'가나다', 'abc', '19/02/05' -> 숫자로 변환 불가
''(홑따옴표)로 묶여 문자로 표현되었지만 안에 담겨진 데이터값 자체는 숫자인 경우만 숫자화 함수를 사용할 수 있다.

명시적 형변환
SELECT TO_NUMBER('1245') s1, /* 1245 */
       1245              s2  /* 1245 */
FROM dual;

   TO_CHAR           TO_DATE
         ->             ->
숫자           문자          날짜
Number         Character     Date 
         <-             <-  
   TO_NUMBER         TO_CHAR 

문자화함수 : TO_CHAR
숫자화함수 : TO_NUMBER
날짜화함수 : TO_DATE

2. 문자화함수 : TO_CHAR(숫자나 날짜를 문자로 변환)
1) 숫자->문자 : TO_CHAR(대상, 포맷형식)
   포맷형식: 
   9: 한자리 숫자, 무효 숫자는 공백으로 채워짐(정수일때), 소수이하일때는 0으로 채워짐, 
      자릿수가 부족할때 자리수만큼 #표시
   0: 한자리 숫자, 무효 숫자는 0으로 채워짐, 자릿수가 부족할때 자리수만큼 #표시
   ,: 천단위표시
   L: 통화기호

SELECT 123456                         n1,  /*123456*/ /*숫자 자체는 그냥 숫자 자리만큼 꽉 차지함*/
       TO_CHAR(123456, '999999')      c1,  /*_123456*/ /*9가 6개*/ /*문자화 했을때 공백 유격이 하나씩 생김*/
       TO_CHAR(123456, '999999999')   c2,  /*____123456*/ /*9가 9개*/
       TO_CHAR(123456, '9999')        c3,  /*#####*/ /*자릿수가 부족할때 자리수+1 만큼 #표시*/
       TO_CHAR(123456, '999,999,999') c4   /*_____123,456*/
FROM DUAL;

SELECT TO_CHAR(123456, '9,999,999')     c1,  /*___123,456*/
       TO_CHAR(123456, '0,999,999')     c2,  /*_0,123,456*/
       TO_CHAR(123456, '$0,999,999')    c3,  /*_$0,123,456*/
       TO_CHAR(1234.56, '$999,999.999') c4,  /*___$1,234.560*/ /*소숫점 9가 소수이하일때는 0으로 채워짐*/
       TO_CHAR(1234.56, '$999,999,999') c5,  /*_______$1,235*/
       TO_CHAR(1234.56, 'L999,999,999') c6,  /*______________￦1,235*/ /*천단위*/ /*9:12개, 공백:14개*/
       TO_CHAR(1234.56, 'L999,999.999') c7   /*__________￦1,234.560*/ /*소숫점*/ /*9:8개, 공백:10개*/
FROM dual;

SELECT 123456                                   n1, /*123456*/
       TO_CHAR(123456)                          n2, /*123456*/
       TO_CHAR(123456, 'L9,999,999,999')        n3, /*______________￦123,456*/ /*9:14개, 공백:14개*/
       TRIM(TO_CHAR(123456, 'L9,999,999,999'))  n4, /*￦123,456*/
       TO_CHAR(123456, 'L00,000,000,000')       n5, /*________￦00,000,123,456*/ /*0:15개, 공백:8개*/
       TRIM(TO_CHAR(123456, 'L00,000,000,000')) n6  /*￦00,000,123,456*/
from dual;

SELECT 12345          n1,           /*12345*/
       1500000        백오십만,     /*1500000*/
       TO_CHAR(123456),             /*123456*/
       TO_CHAR(1500000, 'L9,999,999,999')                    s20,   /*____________￦1,500,000*/ /*9:14개, 공백:12개*/
       '['|| LTRIM(TO_CHAR(1500000, 'L9,999,999,999'), ' ' ) s21,   /*[￦1,500,000*/
       '['|| LTRIM(TO_CHAR(1500000, 'L9,999,999,999'))       s22,   /*[￦1,500,000*/
       '['|| TRIM(LEADING ' ' FROM TO_CHAR(1500000, 'L9,999,999,999')) s23,    /*[￦1,500,000*/
       '['|| TRIM(' ' FROM TO_CHAR(1500000, 'L9,999,999,999') )        s24,    /*[￦1,500,000*/
       '['|| TRIM(TO_CHAR(1500000, 'L9,999,999,999') )                 s25,    /*[￦1,500,000*/
       
       TO_CHAR(1500000,'0,000,000,000') s3  /*_0,001,500,000*/
FROM dual;

SELECT 	employee_id, 
		TO_CHAR(salary,'9999')          SAL1,    /*#####*/
		TO_CHAR(salary,'999999')        SAL2,    /*__24000*/
		TO_CHAR(salary,'999,999')       SAL3,    /*__24,000*/
		TO_CHAR(salary,'999,999,999')   SAL4,    /*______24,000*/
		TO_CHAR(salary,'000,999,999')   SAL5,    /*_000,024,000*/
		TO_CHAR(salary,'099,999,999')   SAL6,    /*_000,024,000*/
		TO_CHAR(salary,'000,000')       "0SAL",  /*_024,000*/
		TO_CHAR(salary,'000,000,000')   "00SAL", /*_000,024,000*/
		TO_CHAR(salary,'$999,999')      "$9SAL", /*__$24,000*/
		TO_CHAR(salary,'$999,999,999')  "$99SAL",/*______$24,000*/
		TO_CHAR(salary,'$000,000')      "$0SAL", /*_$024,000*/
		TO_CHAR(salary,'$000,000,000')  "$00SAL",/*_$000,024,000*/
        
		TO_CHAR(salary,'L999,999')      L9SAL,   /*_________￦24,000*/ /*공백1개+8개*/
		TO_CHAR(salary,'L999,999,999')  L99SAL,  /*_____________￦24,000*/ /*공백1개+12개*/
        
		TO_CHAR(salary,'L000,000')      L0SAL,   /*________￦024,000*/ /*8개*/
		TO_CHAR(salary,'L000,000,000')  L00SAL,  /*________￦000,024,000*/ /*8개*/
        
        TRIM(TO_CHAR(salary,'L999,999'))      TRIML9SAL,   /*￦24,000*/
		TRIM(TO_CHAR(salary,'L999,999,999'))  TRIML99SAL,  /*￦24,000*/
        
		TRIM(TO_CHAR(salary,'L000,000'))      TRIML0SAL,   /*￦024,000*/
		TRIM(TO_CHAR(salary,'L000,000,000'))  TRIML00SAL,  /*￦000,024,000*/
        
		salary SAL
FROM EMPLOYEES e;

2) 날짜->문자: TO_CHAR(대상, 표현형식)
표현형식 : 년-YYYY, YY, RRRR, RR 월-MM, MONTH, MON 일-DD  
           요일-DAY(한글,월요일), DY(한글약자,월,화)
           시-HH, HH24   분-MI   초-SS
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DY HH24:MI:SS') d1
FROM dual;

SELECT TO_CHAR(SYSDATE, 'YYYY-MON-DD') d11,
       TO_CHAR(SYSDATE, 'RRRR-MON-DD') d12,
       TO_CHAR(SYSDATE, 'YY-MM-DD') d13,
       TO_CHAR(SYSDATE, 'RR-MM-DD') d14,
       TO_CHAR(SYSDATE, 'RR/MM/DD HH:MI:SS') d21,
       TO_CHAR(SYSDATE, 'RR/MM/DD HH24:MI:SS') d22,
       TO_CHAR(SYSDATE, 'YY-MM-DD DAY') d31,
       TO_CHAR(SYSDATE, 'YY-MM-DD DY') d32
FROM dual;  

3. 날짜화함수: TO_DATE(대상, 표현형식)  
'19-08-04' -> 변환가능:날짜형식, 
'가나다', 'abc' -> 변환불가

SELECT * 
FROM v$nls_parameters;

SELECT VALUE 
FROM NLS_SESSION_PARAMETERS 
WHERE PARAMETER = 'NLS_DATE_FORMAT';

SELECT '201006' d1, /* 201006 */
       TO_DATE('20-10-06') d2,  /* 20/10/06 */
       TO_DATE('201006') d3, /* 20/10/06 */
       TO_DATE('201006','DDMMRR') d4, /* 06/10/20 */  /* 날짜는 '/'로 구분 */
       TO_DATE('20-10-06', 'DD-MM-RR') d5 /* 06/10/20 */   /* 날짜는 '/'로 구분 */
FROM dual;

SELECT 10 + 20 n1,      /* 30 */
       '10' + '20' n2,  /* 30 */
       10 + '20' n3     /* 30 */
FROM dual;







