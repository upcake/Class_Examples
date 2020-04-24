3장. 기본 함수
: 숫자함수, 문자함수, 날짜함수, 형변환함수, 일반함수

함수의 유형 : 단일행 함수, 다중행(복수행) 함수
함수에 사용하는 파라미터와 반환되는 값의 유형에 따라 함수를 구분
단일 행 함수 : 하나의 데이터행에 대해 하나의 결과를 반환하는 형태의 함수
숫자함수: ROUND, TRUNC, CEIL, FLOOR
문자함수: UPPER, LOWER, TRIM, LTRIM/RTRIM, LPAD/RPAD, 
          SUBSTR, INSTR, REPLACE, TRANSLATE
날짜함수: SYSDATE, MONTHS_BETWEEN, ADD_MONTHS, LAST_DAY
형변환함수: TO_CHAR, TO_NUMBER, TO_DATE
일반함수: NVL, NVL2, COALESCE, DECODE, CASE~END

데이터 테스트를 위한 테이블 : dummy table ☞ dual, 실제로 데이터는 들어가 있지 않음.

3.1 숫자함수
ABS(n) : n의 절대값을 반환하는 함수이다.
SELECT ABS(32), ABS(-32)
FROM dual;

SIGN(n) : n이 양수인지 음수인지의 여부를 반환하는 함수이다. 
n이 양수이면 1을, n이 음수이면 -1을, 0이면 0을 반환한다. 
SELECT SIGN(32), SIGN(-32), SIGN(0) 
FROM dual;

1) 반올림 함수 : ROUND(n [, i]), ROUND(숫자, 소수이하/이상 자릿수)
소수이하/이상 자릿수 : 음수지정 가능, 생략시 default는 0 -> 정수로 표현
소수 둘째자리까지 표현 : ROUND(1234.56789, 2) -> 1234.57
SELECT ROUND(1234.56789, 2) r1, /* 1234.57 */
       ROUND(1234.56789, 0) r2, /* 1235 */
       ROUND(56789.32154, -2) r3,  /* 56800 */
       ROUND(1234.56789) r4 /* 1235 */
FROM dual;

2) 무조건 버림 함수: TRUNC(n [, i]), TRUNC(숫자, 소수이하/이상 자릿수)
소수이하/이상 자릿수 : 음수지정 가능, 생략시 default는 0 -> 정수로 표현
SELECT TRUNC(1234.56789, 2)  t1, /* 1234.56 */
       TRUNC(1234.56789, 0) t2, /* 1234 */
       TRUNC(56789.32154, -2) t3, /* 56700 */
       TRUNC(1234.56789) t4 /* 1234 */
FROM dual;

3) 숫자보다 큰 정수를 반환하는 함수 : CEIL(n) - 무조건 올림의 정수
게시판에서 페이지 나눌 때, 페이지당 10개씩 출력시
0 ~ 1 사이에는 무수히 많은 실수
0.9999999999999999999999 -> 1
0.000000000000000000000000000000001 -> 1

SELECT CEIL(0.9999999999999999999999) c1, /* 1 */
       CEIL(0.000000000000000000000000000000001) c2, /* 1 */
       CEIL(0) c3, /* 0 */
       CEIL(12.1) c4 /* 13 */
FROM dual;

4) 숫자보다 작은 정수를 반환하는 함수: FLOOR(n) - 무조건 버림의 정수
0 ~ 1 사이에는 무수히 많은 실수
0.9999999999999999999999 -> 0
0.000000000000000000000000000000001 -> 0

SELECT FLOOR(0.9999999999999999999999) f1, /* 1 */
       FLOOR(0.000000000000000000000000000000001) f2, /* 1 */
       FLOOR(0) f3, /* 0 */
       FLOOR(12.1) f4 /* 12 */
FROM dual;

SELECT  CEIL(12.0000000001) c1,  /* 13 */
        FLOOR(12.99999999999999999) f1 /* 12 */
FROM dual;

숫자 데이터를 표현할 수 있는 함수 : ROUND, TRUNC, CEIL, FLOOR
소수점 데이터를 표현할 수 있는 함수 : ROUND, TRUNC
정수 데이터를 표현할 수 있는 함수 : CEIL, FLOOR, ROUND/TRUNC(두번째 파라미터가 0)

5) 나머지를 반환하는 함수 : MOD(m, n), MOD(숫자, 나눌숫자)
SELECT MOD(17, 4) m1,    /* 1 */
       MOD(17, -4) m2,   /* 1 */
       MOD(-17, 4) m3,   /* -1 */
       MOD(-17, -4) m4,  /* -1 */
       MOD(17, 0) m5     /* 17 */
FROM dual;

17  /  4  :  17   =  4 *  4 + 1 /** 1 **/
17  / -4  :  17   = -4 * -4 + 1 /** 1 **/
-17 /  4  : -17   =  4 * -4 + (-1) /** -1 **/
-17 / -4  : -17   = -4 *  4 + (-1) /** -1 **/
17  /  0  :  17   =  0 * 754446878 + 17 /** 17 **/

-----------------------------------------------------------------------------------------------
[연습문제 3-1]
사원 테이블에서 부서코드가 100, 110 인 부서에 속한 사원들의
사번, 성명, 급여, 부서코드, 15%인상된 급여 조회 - 인상된 급여는 정수로 표현
SELECT employee_id, first_name||' '||last_name name, salary, department_id,
       --ROUND( salary * 1.15 ) "Increased Salary"
       --CEIL( salary * 1.15 ) "Increased Salary"
       --TRUNC( salary * 1.15 ) "Increased Salary"
       FLOOR( salary * 1.15 ) "Increased Salary"
FROM employees
WHERE department_id IN (100, 110) ; --부서코드가 100, 110 인 부서에 속한
-----------------------------------------------------------------------------------------------

3.2 문자함수
1. 대/소문자 변환 함수 : UPPER/LOWER(문자)

SELECT *
FROM employees;

문자/날짜 데이터 표현 : ''
성이 King 인 사원들의 사번, 성, 명 조회
SELECT employee_id, last_name, first_name
FROM employees
WHERE last_name = 'King';
--WHERE UPPER(last_name) = 'KING';
--WHERE LOWER(last_Name) = 'king';

성에 대소문자 무관하게 z 가 있는 사원들의 사번, 성, 명 조회
SELECT employee_id, last_name, first_name
FROM employees
WHERE UPPER(last_name) LIKE '%Z%';
--WHERE LOWER(last_name) LIKE '%z%';
--WHERE last_name LIKE '%z%' OR last_name LIKE '%Z%' ; 
--성에 대소문자 무관하게 z 가 있는

2. 단어 단위로 첫문자는 대문자, 나머지는 소문자화 하는 함수: INITCAP(대상)
    : 이니셜만 대문자로 변환
--SELECT INITCAP('we are studing oracle') title     /* We Are Studying Oracle */
SELECT INITCAP('WE ARE STDUYING ORACLE') title      /* We Are Studying Oracle */   
--SELECT INITCAP('wE aRE sTDUYing oRACLE') title    /* We Are Studying Oracle */
FROM dual;

SELECT email, INITCAP(email) INITCAP,
       first_name, UPPER(first_name) UPPER, LOWER(first_name) LOWER
FROM employees;

3. 문자 데이터(char1)에 특정 문자(char2)를 채워서 반환하는 함수 
    : LPAD/RPAD(char1, n [, char2])
    : LPAD/RPAD(대상, 전체크기, 충전문자), pad : 채워 넣는것
    : 세번째 파라미터인 충전문자 생략 가능 : default 공백문자

SELECT LPAD('abc', 5,'?')   p1,  /*??abc*/
       RPAD('abc', 5, '#')  p2,  /*abc##*/
       '['||LPAD('abc', 5)  p3,  /*__abc*/
       RPAD('abc', 5)||']'  p4   /*abc__*/
FROM dual;

SELECT LPAD('abc', 10, '@') p1
FROM dual;

SELECT employee_id, LPAD(last_name , 20, ' ') last_name
--SELECT employee_id, LPAD(last_name , 20) last_name ☜ 생략시 공백문자
FROM employees;

4. 문자데이터에서 특정문자를 제거하고 반환하는 함수
   : 제거할 문자는 ★한 개만 지정 가능★  ☞ TRIM
   : 입력상자에서 사용자 실수로 공백을 입력시
   : request.getParameter('UserId').TRIM();

TRIM([LEADING, TRAILING, BOTH] [, TRIM_char] [FROM] char)
★ TRIM(제거할위치 제거문자한개 FROM 대상문자) ★
TRIM(LEADING/TRAILING/BOTH 제거문자(★한글자만 지정) FROM 대상문자)
  제거할 위치 - 왼쪽:LEADING, 오른쪽:TRAILING, 양쪽:BOTH
  제거할 위치 생략 가능 - default:BOTH
  제거문자 생략 가능 - default 공백문자
  
SELECT TRIM('a' FROM 'abcdcbaaaaa')          t1, /*bcdcb*/
       TRIM(LEADING 'a' FROM 'abcdcba')      t2, /*bcdcba*/
       TRIM(TRAILING 'a' FROM 'abcdcbaaaaa') t3, /*abcdcb*/
       TRIM(BOTH 'a' FROM 'abcdcbaaaaa')     t4, /*bcdcb*/
       '  abcdcba '                          t5, /*__abcdcba_*/
       TRIM('  abcdcba ')                    t6  /*abcdcba*/
FROM dual;

5. 문자데이터에 특정문자를 제거하고 반환하는 함수
    : 제거할 문자를 ★여러 개 지정 가능 ☜ TRIM함수와 차이점
    : LTRIM/RTRIM(char1 [,char2])
    : LTRIM/RTRIM(대상문자, 제거할문자의나열)
    : 두 번째 파라미터 생략 가능 - default 공백문자
    
SELECT LTRIM( 'abcdcba' , 'a' )  t1, /* bcdcba */
       LTRIM( 'abcdcba' , 'ba' ) t2, /* cdcba */
       RTRIM( 'abcdcba' , 'acb') t3, /* abcd */
       RTRIM( '   abcdcba   ')   t4  /* ___abcdcba */
FROM dual;

