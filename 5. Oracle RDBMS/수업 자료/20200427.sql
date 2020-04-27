--[연습문제 3-3]
--1. 사원테이블에서 30번 부서의 사번, 성명, 급여, 근무개월수, 근무년수를 조회
--단, 근무개월수는 오늘 날짜를 기준으로 날짜함수를 사용

SELECT  employee_id, first_name||' '||last_name name, salary, 
        FLOOR(MONTHS_BETWEEN(SYSDATE,hire_date)) work_months,
        FLOOR(MONTHS_BETWEEN(SYSDATE,hire_date)/12) work_years
FROM employees
WHERE department_id = 30;

--2. 급여가 12000 이상인 사원들의 사번, 성명, 급여를 조회하여
--급여순으로 정렬한다.
--급여는 공백없이 천단위 기호를 사용하여 표현한다.

SELECT  employee_id, first_name||' '||last_name name, 
        TO_CHAR(salary, '9,999,999') salary
FROM EMPLOYEES
WHERE salary >= 12000
ORDER BY salary ASC;

--3. 2005년 전(2004년까지)에 입사한 사원들의 
--사번, 성명, 입사일자, 입사일의 요일을 조회하여 
--최근에 입사한 사원순으로 정렬한다.

SELECT  employee_id, first_name||' '||last_name name, 
        hire_date, to_char(hire_date,'DAY') hire_day
FROM EMPLOYEES
--WHERE hire_date <='2004-12-31'
--WHERE hire_date <= TO_DATE('2004-12-31')
--WHERE TO_CHAR(hire_date,'RRRR') < 2005
WHERE TO_CHAR(hire_date,'YYYY') < 2005
ORDER BY hire_date DESC;

-----------------------------------------------------------------------------------------------

* 일반함수 : NULL 이 계산되었을 경우 값이 NULL 로 변경이 되어 버림

commission_pct 확인
SELECT employee_id, first_name, salary, commission_pct
FROM employees;

커미션금액이 1000 미만인 사원의 사번, 이름, 급여, 커미션요율, 커미션금액을 조회
SELECT employee_id, first_name, salary, commission_pct, salary*commission_pct comm
FROM employees
WHERE salary*commission_pct < 1000;

조회된 NULL 값을 치환하는 함수 : NVL(Null VaLue)함수, DECODE 함수
NVL(컬럼,0) : 값이 NULL 이면 0으로 치환, 아니면 컬럼의 값
DECODE(컬럼, A, 1, B, 2, 3) : 컬럼값이 A이면 1, B이면 2, 그것도 아니면 3

1. 데이터값이 NULL 인 경우 다른 값으로 대체하여 반환하는 함수
: NVL(대상, NULL 일때 반환 표현) ☞ NULL VALUE, 오라클에서만 사용
  NULL 일때 반환 표현의 데이터 타입은 대상의 데이터 타입과 같아야 한다.

desc employees;

커미션 금액이 1000 미만인
사번, 성, 급여, 커미션요율, 커미션금액 조회
커미션금액 = 급여 * 커미션요율
SELECT employee_id, last_name, salary, commission_pct, salary*commission_pct comm
FROM employees
WHERE salary*commission_pct < 1000;

NVL 사용
SELECT employee_id, last_name, salary, commission_pct, salary*NVL(commission_pct,0) comm
FROM employees
WHERE salary*NVL(commission_pct,0) < 1000;
     
사번, 성, 급여, 커미션요율, 총급여 조회
총급여 = 급여 + 커미션금액 

--SELECT employee_id, last_name, commission_pct, salary + salary * NVL(commission_pct,0)
SELECT  employee_id, last_name, commission_pct, 
        salary * (1 + NVL(commission_pct,0))
FROM employees;

2. 데이터 값이 NULL 인 경우 반환 표현과 
NULL 이 아닌 경우 반환 표현을 각각 지정할 수 있는 형태의 함수
: NVL2(대상, NULL이 아닌 경우 반환값, NULL 인 경우 반환값)
: NVL2(대상, 대상이 값이 있을 경우 반환값, 값이 없을 경우 반환값) ★★★★
  NULL 인 경우 반환표현은 NULL 아닌 경우 반환표현과 데이터 타입이 같아야 한다.
  NULL 인 경우 반환 타입 = NULL 아닌 경우 반환 타입

커미션을 받는 사원은 총급여 = 급여 + 커미션금액
         받지 않는 사원은 총급여 = 급여만

사번, 성, 급여, 커미션요율, 총급여 형태 조회
SELECT employee_id, last_name, salary, commission_pct,
       NVL2(commission_pct, '급여+커미션금액', '급여') type1,
       NVL2(commission_pct, 'salary+commission', 'salary') type2,
       NVL2(commission_pct, salary*(1+commission_pct), salary) type3
FROM employees;

--급여, 커미션요율, NVL 사용 총급여, NVL2 사용 총급여 조회.
SELECT  salary, commission_pct,
        salary*(1+NVL(commission_pct,0)),
        NVL2(commission_pct,salary*(1+commission_pct),salary),
        NVL2(commission_pct,salary + salary * commission_pct, salary)
FROM employees;






SELECT salary, commission_pct, 
       salary + salary*NVL(commission_pct,0), --NVL사용
       NVL2(commission_pct, salary + salary * commission_pct, salary) --NVL2사용
FROM employees;


3. 데이터값이 NULL 인 경우 대체해서 반환 표현을 여러 개 지정할 수 있는 형태 함수
  : NULL 이 아닌 첫번째 데이터를 반환하는 함수
 COALESCE(대상표현, 대체표현1, 대체표현2, 대체표현3, ...) 
    ★ COALESCE : 합치다, 유착하다, 합체하다, 합동하다
 NULL 은 NULL 또는 ''로 표현
 
SELECT COALESCE('a', '', NULL, 'd') n1,
       COALESCE(NULL, 'b', NULL, 'd') n2, 
       COALESCE(NULL, '', 'c', 'd') n3,
       COALESCE(NULL, '', NULL, 'd') n4,
       COALESCE(NULL, '', NULL, '') n5
FROM dual;
----------------------------------------------------------
name    휴대폰            집                사무실
홍길동  010-1234-5678
심청                      062-1234-5678
전우치                                      062-1234-5679

SELECT name, COALESCE(휴대폰, 집, 사무실)  연락처
FROM dual;

결과
NAME       연락처
홍길동     010-1234-4567
심청       062-1234-5678
전우치     062-1234-5679
----------------------------------------------------------

[연습문제 3-4]
사번, 성, 부서코드, 업무코드, 입사일자, 매니저코드, 매니저존재여부(NVL, NVL2 각각 사용) 조회
매니저존재여부는 각 사원에 대해 

NVL은 관리자가 있으면 manager_id와 없으면 없음으로 표시,
NVL2는
사원의 관리자(매니저)가 있으면 '있음' 으로
       관리자(매니저)가 없으면 '없음' 으로 조회되게 한다.


SELECT  employee_id, last_name, department_id, job_id, hire_date, manager_id,
        NVL(manager_id,0) manager_id2,
        --NVL(manager_id,'없음') manager_id2, --에러, 데이터 타입이 NUMBER(6,0)
        NVL2(manager_id, '있음', '없음')  manager_exist1,
        NVL2(manager_id, 'Manager', 'No Manager')  manager_exist2
FROM employees;

SELECT employee_id, 
       NVL(manager_id, 0) manager_id,
       NVL2(manager_id, 'O', 'X') exist
FROM employees;

desc employees;

3.6 DECODE 와 CASE

1. 조건문에 해당하는 함수
IF ( 조건식1 ) {
 ....
} ELSE IF( 조건식2 ) {
 .....
} ELSE IF( 조건식3 ) {
 .....
} ELSE {
 ....
}

부서별로 보너스를 지급하기로 했다.

부서코드가 10 이면 급여의 10%,
           20 이면 급여의 20%,
           30 이면 급여의 30%,
           나머지 부서원은 급여의 5%
         
IF( 부서코드 == 10 ) {
  보너스 = 급여*0.1;
} ELSE IF( 부서코드 == 20 ) {
  보너스 = 급여*0.2;
} ELSE IF( 부서코드 == 30 ) {
  보너스 = 급여*0.3;
} ELSE {
  보너스 = 급여*0.05;
}

조건문에 해당하는 함수 : DECODE : 오라클에서만 사용
대상표현과 비교데이터표현의 데이터유형은 일치해야함.
: DECODE(대상표현,  비교데이터표현1, 반환데이터1, 
                    비교데이터표현2, 반환데이터2,
                    비교데이터표현3, 반환데이터3, default반환데이터)

사번, 성, 부서코드, 급여, 보너스 조회
보너스는 
부서코드가 10 이면 급여의 10%,
           20 이면 급여의 20%,
           30 이면 급여의 30%,
           나머지 부서원은 급여의 5%
SELECT employee_id, last_name, department_id, salary, 
       DECODE(department_id, 10, salary*0.1, 
                             20, salary*0.2, 
                             30, salary*0.3, salary*0.05 ) bonus
FROM employees;       

SELECT employee_id, last_name, department_id, salary, 
       CASE department_id WHEN 10 THEN salary * 0.1
                          WHEN 20 THEN salary * 0.2
                          WHEN 30 THEN salary * 0.3
                          ELSE salary * 0.05                
       END bonus
FROM employees;

SELECT employee_id, last_name, department_id, salary, 
       CASE WHEN department_id = 10 THEN salary * 0.1
            WHEN department_id = 20 THEN salary * 0.2
            WHEN department_id = 30 THEN salary * 0.3
            ELSE salary * 0.05                
       END bonus
FROM employees;

사원들의 사번, 성, 업무코드, 업무등급 조회
업무등급은 업무코드에 따라 분류한다.

업무코드     업무등급
AD_PRES      A
ST_MAN       B
IT_PROG      C
그 외        X

SELECT employee_id, last_name, job_id, 
       DECODE( job_id, 'AD_PRES', 'A', 
                       'ST_MAN', 'B', 
                       'IT_PROG', 'C',
                       'X' ) job_grade                     
FROM employees;

SELECT employee_id, last_name, job_id, 
       CASE job_id  WHEN 'AD_PRES' THEN 'A' 
                    WHEN 'ST_MAN' THEN 'B'
                    WHEN 'IT_PROG' THEN 'C' 
                    ELSE 'X' 
       END job_grade
FROM employees;

SELECT employee_id, last_name, job_id, 
       CASE WHEN job_id = 'AD_PRES' THEN 'A' 
            WHEN job_id = 'ST_MAN' THEN 'B'
            WHEN job_id = 'IT_PROG' THEN 'C' 
            ELSE 'X' 
       END job_grade
FROM employees;

조건문에 해당하는 구문: CASE ~ END
CASE는 DECODE 함수보다 더 큰 개념을 가진 표현식이다.
DECODE 에서는 ★ 동등비교만 할 수 있으나 
CASE는 더 다양한 ★ 비교연산을 할 수 있다.

동등비교시 표현
CASE 대상표현 WHEN 비교데이터값1 THEN 반환데이터1
              WHEN 비교데이터값2 THEN 반환데이터2
              WHEN 비교데이터값3 THEN 반환데이터3
              ....
              ELSE default반환데이터
END

사번, 성, 부서코드, 급여, 보너스
SELECT employee_id, last_name, department_id, salary,
       CASE department_id WHEN 10 THEN salary*0.1 
                          WHEN 20 THEN salary*0.2
                          WHEN 30 THEN salary*0.3 
                          ELSE salary*0.05 
       END bonus
FROM employees;

SELECT employee_id, last_name, department_id, salary,
       CASE WHEN department_id = 10 THEN salary*0.1 
            WHEN department_id = 20 THEN salary*0.2
            WHEN department_id = 30 THEN salary*0.3 
            ELSE salary*0.05 
       END bonus
FROM employees;

동등비교시 표현: 
범위 조건에 따라 데이터를 반환하는 경우의 CASE 구문

-----------------------------------------------------------------------------------------------
CASE WHEN 조건식1 THEN 반환데이터1
     WHEN 조건식2 THEN 반환데이터2
     WHEN 조건식3 THEN 반환데이터3
     ELSE default반환데이터
END      
-----------------------------------------------------------------------------------------------

부서코드가 10~30 이면 급여의 10%
           40~60 이면 급여의 20%
           70~100 이면 급여의 30%
           그외 부서원은 급여의 5%

사번, 성, 부서코드, 급여, 보너스 조회
SELECT employee_id, last_name, department_id, salary,
        -- 범위 조건일 때 
       CASE WHEN department_id BETWEEN 10 AND 30 THEN salary*0.1
            WHEN department_id BETWEEN 40 AND 60 THEN salary*0.2
            WHEN department_id BETWEEN 70 AND 100 THEN salary*0.3
            ELSE salary*0.05 
        END bonus1,
        CASE WHEN department_id <=30 THEN salary*0.1
             WHEN department_id <=60 THEN salary*0.2
             WHEN department_id <=100 THEN salary*0.3 
             ELSE salary*0.05 
        END bonus2    
FROM employees;

-----------------------------------------------------------------------------------------------
보너스는 
부서코드가 20이하 이면  급여의 30%
급여가 10000 이상이면 급여의 20%
업무코드가 clerk 종류의 업무이면 급여의 10% 
그외는 급여의 5%
사번, 성, 부서코드, 급여, 업무코드, 보너스 조회
SELECT employee_id, last_name, department_id, salary, job_id,
      CASE 
           WHEN department_id <= 20 THEN salary*0.3
           WHEN salary>=10000 THEN salary*0.2
           WHEN LOWER(job_id) LIKE '%clerk%' THEN salary*0.1 
           ELSE salary*0.05
      END bonus
FROM employees;
-----------------------------------------------------------------------------------------------
[연습문제 3-5]
1. 사원들의 사번, 이름, 업무코드, 업무등급 조회
업무등급은 업무코드에 따라 분류한다.
DECODE 와 CASE~END 사용하여 조회

업무코드    업무등급
AD_PRES      A
ST_MAN       B
IT_PROG      C
SA_REP       D
ST_CLERK     E
그 외        X

SELECT employee_id, last_name, job_id,
       DECODE(job_id, 'AD_PRES','A',
                      'ST_MAN','B',
                      'IT_PROG','C',
                      'SA_REP','D',
                      'ST_CLERK','E',
                      'X') job_grade
FROM employees;
 
SELECT employee_id, last_name, job_id, 
        CASE 
            WHEN job_id = 'AD_PRES' THEN 'A' 
            WHEN job_id = 'ST_MAN' THEN 'B'
            WHEN job_id = 'IT_PROG' THEN 'C' 
            WHEN job_id = 'SA_REP' THEN 'D' 
            WHEN job_id = 'ST_CLERK' THEN 'E' 
            ELSE 'X' 
        END job_grade
FROM employees;


SELECT employee_id, last_name, job_id, 
        CASE job_id WHEN 'AD_PRES' THEN 'A' 
                    WHEN 'ST_MAN' THEN 'B'
                    WHEN 'IT_PROG' THEN 'C' 
                    WHEN 'SA_REP' THEN 'D' 
                    WHEN 'ST_CLERK' THEN 'E' 
                    ELSE 'X' 
        END job_grade
FROM employees;

-----------------------------------------------------------------------------------------------

2. 모든 사원의 각 사원들의 근무년수, 근속상태를 파악하고자 한다.
사원들의 사번, 성, 입사일자, 근무년수, 근속상태 조회
근무년수는 오늘을 기준으로 근무한 년수를 정수로 표현한다.
근속상태는 근무년수에 따라 표현한다.
근무년수가 13년 미만 이면              '13년 미만 근속'으로 표현
           13년 이상 15년 미만 이면    '15년 미만 근속'으로 표현
           15년 이상 이면              '15년 이상 근속'으로 표현    
               
SELECT  employee_id, last_name, hire_date,
        TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) work_years,
        
        CASE
            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) < 13 THEN '13년 미만 근속'
--            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) >= 13 
--                 AND TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) < 15 THEN '15년 미만 근속' 
            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) BETWEEN 13 AND 15 THEN '15년 미만 근속' 
            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) >=15 THEN '15년 이상 근속' 
        END work_status1,
       
        CASE 
            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) < 13 THEN '13년 미만 근속'
            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) < 15 THEN '15년 미만 근속' 
            ELSE  '15년 이상 근속' 
        END work_status2       
FROM employees;

-----------------------------------------------------------------------------------------------









