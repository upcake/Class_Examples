--[연습 문제 3 - 3]
--1. 사원 테이블에서 30번 부서의 사번, 성명, 급여, 근무 개월수, 근무 년수를 조회
--단, 근무 개월수는 오늘 날짜를 기준으로 날짜 함수를 사용
SELECT employee_id,
       first_name ||' ' || last_name AS name,
       salary,
       hire_date,
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)) AS work_months,
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)/12) AS work_years 
FROM employees
WHERE department_id = 30;

--2. 급여가 12000 이상인 사원들의 사번, 성명, 급여를 조회하여 급여순으로 정렬
--급여는 공백 없이 천단위 기호를 사용하여 표현한다.
SELECT employee_id,
       first_name ||' '|| last_name AS name,
       TO_CHAR(salary, '999,999,999') AS salary
FROM employees
WHERE salary >= 12000
ORDER BY salary;

--3. 2005년 전(2004년까지)에 입사한 사원들의 사번, 성명, 입사일자, 입사일의 요일을 조회하여
--최근에 입사한 사원 순으로 정렬한다.
SELECT employee_id,
       first_name ||' '|| last_name AS name,
       hire_date,
       TO_CHAR(hire_date, 'DAY') AS hire_day
FROM employees
--WHERE hire_date < '2005-01-01'        --TO_DATE는 형식지정을 위한 함수, 캐스팅을 위해선 TO_CHAR를 사용하자
WHERE TO_CHAR(hire_date, 'YYYY') < 2005 --이런 형태를 많이 사용한다.
ORDER BY hire_date DESC;


--* 일반 함수 : NULL이 계산되었을 경우 값이 NULL로 변경이 되어 버림

--commission_pct 확인
SELECT employee_id, last_name, salary, commission_pct
FROM employees;

--커미션 금액이 1000 미만인 사원의 사번, 이름, 급여, 커미션 요율, 커미션 금액을 조회
--커미션 요율이 NULL인 경우, 즉, 커미션 금액이 0인 경우에는 조회가 되지 않는 문제가 있다.
SELECT employee_id, first_name, salary, commission_pct, salary * commission_pct AS comm
FROM employees
--WHERE salary * commission_pct < 1000;
WHERE salary * NVL(commission_pct, 0) < 1000;

--조회된 NULL 값을 치환하는 함수 : NVL(Null Value)함수, DECODE 함수
--NVL(칼럼, 0) : 값이 NULL이면 0으로 치환, 아니면 칼럼의 값
--DECODE(칼럼, A, 1, B, 2, 3) : 칼럼 값이 A이면 1, B이면 2, 그것도 아니면 3

--1. NVL() : 데이터 값이 NUJLL인 경우 다른 값으로 대체하여 반환하는 함수
--NVL(대상, NULL일때 반환 표현) ▶ NULL VALUE, 오라클에서만 사용
--NULL일 때 반환 표현의 데이터 타입은 대상의 데이터 타입과 같아야 한다.

--커미션 금액이 1000 미만인 사원의
--사번, 성, 급여, 커미션 요율, 커미션 금액 조회
--커미션 금액 = 급여 * 커미션 요율
SELECT employee_id,
       last_name,
       salary,
       commission_pct,
       salary * commission_pct AS comm
FROM employees
WHERE salary * commssion_pct < 1000;

--NVL 사용
SELECT employee_id,
       first_name,
       salary,
       commission_pct,
       salary * NVL(commission_pct, 0) AS comm
FROM employees
WHERE salary * NVL(commission_pct, 0) < 1000;

--문제 1. 사번, 성, 급여, 커미션 요율, 총급여 조회
--총급여 = 급여 + 커미션 금액
SELECT employee_id, last_name, salary, commission_pct,
--       salary + (salary * NVL(commission_pct, 0)) AS total_salary
       salary * (1 + NVL(commission_pct, 0)) AS total_salary -- 분배법칙
FROM employees
ORDER BY total_salary DESC;

--2. NVL2() : 데이터 값이 NULL인 경우의 반환 표현과 NULL이 아닌 경우의 반환 표현을 각각 지정할 수 있는 형태의 함수
--NVL2(대상, NULL이 아닌 경우의 반환 값, NULL인 경우 반환 값)
--NVL2(대상, 대상이 값이 있을 경우 반환 값, 값이 없을 경우 반환 값)
--NULL인 경우의 반환 표현은 NULL 아닌 경우의 반환 표현과 데이터 타입이 같아야 한다.
--NULL인 경우의 반환 타입 = NULL 아닌 경우의 반환 타입

--예제 1. 사번, 성, 급여, 커미션 요율, 총급여 형태 조회
SELECT employee_id, last_name, salary, commission_pct,
       NVL2(commission_pct, '급여 + 커미션 금액', '급여') AS type1,
       NVL2(commission_pct, 'salary + commission', 'salary') AS type2,
       NVL2(commission_pct, salary * (1 + commission_pct), salary) AS type3
FROM employees
ORDER BY type3 DESC;

--문제 1. 급여, 커미션 요율, NVL 사용 총급여, NVL2 사용 총급여 조회
SELECT salary, commission_pct,
       salary * (1 + NVL(commission_pct, 0)) AS total_1,
       NVL2(commission_pct, salary * (1 + commission_pct), salary) AS total_2
FROM employees
ORDER BY total_2 DESC;


--3. COALESCE() : 데이터 값이 NULL인 경우 반환 표현을 여러 개 지정할 수 있는 형태의 함수
--COALESCE(대상 표현, 대체 표현1, 대체 표현2, 대체 표현3, ...)
--* COALESCE : 합치다, 유착하다, 합체하다, 합동하다
--NULL은 NULL또는 ''로 표현

--[연습문제 3 - 4]
--사번, 성, 부서 코드, 업무 코드, 입사 일자, 매니저 코드, 매니저 존재 여부(NVL, NVL2 각각 사용) 조회
--매니저 존재 여부는 각 사원에 대해
--NVL은 매니저가 없으면 '없음'으로 조회되게 하고,
--NVL2는 사원의 관리자(매니저)가 있으면 '있음'으로, 없으면 '없음'으로 조회되게 한다.
SELECT employee_id, last_name, department_id, job_id, hire_date, manager_id,
--     NVL(manager_id, '없음') -- 데이터 타입이 안맞아서 에러
       NVL(TO_CHAR(manager_id), '없음') AS manager_1,
       NVL2(manager_id, '있음', '없음') AS manager_2
FROM employees;


--3.6 DECODE와 CASE
--1. 조건문에 해당하는 함수
--IF (조건식1) {
--실행문1
--} ELSE IF (조건식2) {
--실행문2
--} ELSE {
--실행문3
--}

--DECODE() : 조건문에 해당하는 함수, 오라클에서만 사용
--대상 표현과 비교 데이터 표현의 데이터 유형은 일치해야 함.
--DECODE(대상 표현, 비교 데이터 표현1, 반환 데이터1,
--                 비교 데이터 표현2, 반환 데이터2,
--                 비교 데이터 표현3, 반환 데이터3, default 반환 데이터)
SELECT employee_id, last_name, department_id, salary,
       DECODE(department_id, 10, salary * 0.1,
                             20, salary * 0.2,
                             30, salary * 0.3, salary * 0.05) AS bonus
FROM employees
ORDER BY department_id;

SELECT employee_id, last_name, department_id, salary,
       CASE department_id WHEN 10 THEN salary * 0.1
                          WHEN 20 THEN salary * 0.2
                          WHEN 30 THEN salary * 0.3
                          ELSE salary * 0.05
       END AS bonus
FROM employees
ORDER BY department_id;

SELECT employee_id, last_name, department_id, salary,
       CASE WHEN department_id = 10 THEN salary * 0.1
            WHEN department_id = 20 THEN salary * 0.2
            WHEN department_id = 30 THEN salary * 0.3
            ELSE salary * 0.05
       END AS bonus
FROM employees
ORDER BY department_id;

--문제 1. 사원들의 사번, 성, 업무 코드, 업무 등급 조회
--업무 등급은 업무 코드에 따라 분류한다.
--AD_PRES   A
--ST_MAN    B
--IT_PROG   C
--그 외      X
SELECT employee_id, last_name, job_id,
       DECODE(job_id, 'AD_PRES', 'A',
                      'ST_MAN', 'B',
                      'IT_PROG', 'C', 'X') AS job_grade
FROM employees;

SELECT employee_id, last_name, job_id,
       CASE job_id WHEN 'AD_PRES' THEN 'A'
                   WHEN 'ST_MAN' THEN 'B'
                   WHEN 'IT_PROG' THEN 'C'
                   ELSE 'X'
       END AS job_grade
FROM employees;

SELECT employee_id, last_name, job_id,
       CASE WHEN job_id = 'AD_PRES' THEN 'A'
            WHEN job_id = 'ST_MAN' THEN 'B'
            WHEN job_id = 'IT_PROG' THEN 'C'
            ELSE 'X'
       END AS job_grade
FROM employees;

--조건문에 해당하는 구문 : CASE ~ END
--DECODE는 동등 비교만 가능하지만, CASE는 다양한 비교가 가능하다.
--사번, 성, 부서 코드, 급여, 보너스 조회
SELECT employee_id, last_name, department_id, salary,
       CASE WHEN department_id BETWEEN 10 AND 30 THEN salary * 0.1
            WHEN department_id BETWEEN 40 AND 60 THEN salary * 0.2
            WHEN department_id BETWEEN 70 AND 100 THEN salary * 0.3
            ELSE salary * 0.05
       END bonus1,
       CASE WHEN department_id <= 30 THEN salary * 0.1
            WHEN department_id <= 60 THEN salary * 0.2
            WHEN department_id <= 100 THEN salary * 0.3
            ELSE salary * 0.05
       END bnous2
FROM employees;

--문제 1. 부서 코드가 20 이하이면 급여의 30%,
--급여가 10000 이상이면 급여의 20%,
--업무 코드가 clerk 종류의 업무이면 급여의 10%
--그외는 급여의 5%
--사번, 성, 부서 코드, 급여, 업무 코드, 보너스 조회
SELECT employee_id, last_name, department_id, salary, job_id,
       CASE WHEN department_id <= 20 THEN salary * 0.3
            WHEN salary >= 10000 THEN salary * 0.2
            WHEN LOWER(job_id) LIKE '%clerk%' THEN salary * 0.1
            ELSE salary * 0.05
       END AS bonus
FROM employees;

--[연습 문제 3 - 5]
--문제 1. 사원의 사번, 이름, 입사일, 근무 년수, 근속 상태를 조회하는 쿼리문을 작성한다.
--단, 근무 년수는 오늘 날짜를 기준으로 정수 형태로 표기한다. 예) 3.56은 3년으로 표기한다.
--근속 상태는 근무 년수가 13년 미만이면 '13년 미만 근속', 13년 이상 15년 미만이면 '15년 미만 근속', 15년 이상이면 '15년 이상 근속'으로 표현한다.
SELECT employee_id, first_name, hire_date,
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)/12) AS work_years,
       CASE WHEN MONTHS_BETWEEN(SYSDATE, hire_date)/12 < 13 THEN '13년 미만 근속'
            WHEN MONTHS_BETWEEN(SYSDATE, hire_date)/12 BETWEEN 13 AND 15 THEN '13년 미만 근속'
--            WHEN MONTHS_BETWEEN(SYSDATE, hire_date)/12 >= 13
--                AND MONTHS_BETWEEN(SYSDATE, hire_date)/12 < 15 THEN '15년 미만 근속'
            WHEN MONTHS_BETWEEN(SYSDATE, hire_date)/12 >= 15 THEN '15년 이상 근속'
       END AS continuous_service_1,
       CASE WHEN MONTHS_BETWEEN(SYSDATE, hire_date)/12 < 13 THEN '13년 미만 근속'
            WHEN MONTHS_BETWEEN(SYSDATE, hire_date)/12 < 15 THEN '15년 미만 근속'
            ELSE '15년 이상 근속'
       END AS continuous_service_2
FROM employees;