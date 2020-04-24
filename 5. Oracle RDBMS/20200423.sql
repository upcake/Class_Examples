--NULL은 오름차순에서는 마지막 순위를 가짐, 내림차순에 대해 우선 순위를 가짐
--오름차순에 대해 먼저 위치하게 하려면 NULLS FIRST 옵션을 지정
--내림차순에 대해 마지막에 위치하게 하려면 DESC NULLS LAST 옵션을 지정

--예제 1
SELECT *
FROM locations
--ORDER BY state_province;
--ORDER BY state_province DESC;
--ORDER BY state_province NULLS FIRST;
ORDER BY state_province DESC NULLS LAST;

--[연습 문제 1]
--1. 부서코드 30, 40, 60인 부서에 속한 사원들의
--사번, 성명, 부서코드, 급여를 조회하여 성명순으로 정렬한다.
SELECT employee_id, first_name ||' '||last_name AS name, department_id, salary
FROM employees
WHERE department_id IN (30, 40, 60)
ORDER BY name;

--2. 커미션을 받는 사원들의 사번, 성명, 급여, 커미션요율을 조회하여
--커미션요율이 높은 사원부터 낮은 사원순으로 정렬한다.
SELECT employee_id, first_name ||' '|| last_name AS name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY commission_pct DESC;

--3. 성명에 대/소문자 무관하게 z 가 있는 사원들의
--사번, 성명 을 조회하여 성명순으로 정렬한다.
SELECT employee_id, first_name ||' '|| last_name AS name
FROM employees
--WHERE LOWER(first_name || last_name) LIKE '%z%'
--WHERE UPPER(first_name || last_name) LIKE '%Z%'
WHERE first_name || last_name LIKE '%z%'
OR first_name || last_name LIKE '%Z%'
ORDER BY name;
--ORDER BY first_name ||' '|| last_name;
--ORDER BY 2;

--[연습문제 2]
--1. 사번이 200인 사원의 성명과 부서코드를 조회하는 쿼리문을 작성한다.
SELECT employee_id, first_name ||' '|| last_name AS name, department_id
FROM employees
WHERE employee_id = 200;

--2. 급여가 3000에서 15000 사이에 포함되지 않는 사원의 사번, 성명, 급여 정보를 조회하는 쿼리문을 작성한다.
--(단, 이름은 성과 이름을 공백문자를 두어 합쳐서 조회한다. 
--예를 들어 이름이 John 이고 성이 Seo 이면  John Seo 로 조회되도록 한다.)
SELECT employee_id, first_name ||' '|| last_name AS name, salary
FROM employees
WHERE salary NOT BETWEEN 3000 AND 15000;

--3. 부서코드 30과 60 에 소속된 사원의 사번, 성명, 부서코드, 급여를 조회하는데, 
--성명을 알파벳순서로 정렬하여 조회하는 쿼리문을 작성한다.
SELECT employee_id, first_name ||' '|| last_name AS name, department_id, salary
FROM employees
WHERE department_id IN(30, 60)
ORDER BY name ASC;

--4. 급여가 3000에서 15000 사이 이면서, 부서코드 30또는 60에 소속된 사원의 
--사번, 성명, 급여, 부서 코드를 조회하는 쿼리문을 작성한다.
--(단, 조회되는 컬럼명을 이름은 성과 이름을 공백문자를 두어 합쳐 name 으로,
--급여는 Monthly Salary 로 조회되도록 한다.)
SELECT employee_id, first_name ||' '|| last_name AS name, salary AS "Monthly Salary", department_id
FROM employees
WHERE salary BETWEEN 3000 AND 15000
AND department_id IN (30, 60);

--5. 소속된 부서코드가 없는 사원의 사번, 성명, 업무코드를 조회하는 쿼리문을 작성한다.
SELECT employee_id, first_name ||' '|| last_name AS name, job_id
FROM employees
WHERE department_id IS NULL;

--6. 커미션을 받는 사원의 사번, 성명, 급여, 커미션을 조회하는데, 
--커미션이 높은 사원부터 낮은 사원 순서로 정렬하여 조회하는 쿼리문을 작성한다.
SELECT employee_id, first_name ||' '|| last_name AS name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY commission_pct DESC;

--7. 성명에 대소문자 구분없이 문자 z 또는 Z 가 포함된 사원의 사번과 성명(name)을 조회하는 쿼리문을 작성한다.
SELECT employee_id, first_name ||' '|| last_name AS name
FROM employees
WHERE LOWER(first_name || last_name) LIKE '%z%';


--3장. 기본 함수 : 숫자 함수, 문자 함수, 날짜 함수, 형변환 함수, 일반 함수

--함수의 유형 : 단일행 함수, 다중행(복수행) 함수
--함수에 사용하는 파라미터와 반환되는 값의 유형에 따라 함수를 구분
--단일 행 함수 : 하나의 데이터행에 대해 하나의 결과를 반환하는 형태의 함수
--숫자 함수 : ROUND, TRUNC, CEIL, FLOOR
--문자 함수 : UPPER, LOWER, TRIM, LTRIM/RTRIM, LPAD/RPAD,
--           SUBSTR, INSTR, REPLACE, TRANSLATE
--날짜 함수 : SYSDATE, MONTHS_BETWEEN, ADD_MONTHS, LAST_DAY
--형변환 함수 : TO_CHAR, TO_NUMBER, TO_DATE
--일반 함수 : NVL, NVL2, COALESCE, DECODE, CASE~END

--데이터 테스트를 위한 테이블 : dummy table ▶ dual, 실제로 데이터는 들어가 있지 않음.

--3.1 숫자 함수
--ABS(n) : n의 절대값을 반환하는 함수이다.
SELECT ABS(32), ABS(-32)
FROM dual;

--SIGN(n) : n이 양수인지 음수인지의 여부를 반환하는 함수이다.
--n이 양수이면 1을, 음수이면 -1을, 0이면 0을 반환한다.
SELECT SIGN(32), SIGN(-32), SIGN(0)
FROM dual;

--1) 반올림 함수 : ROUND(n, [, i]), ROUND(숫자, 소수 이하/이상 자릿수)
--소수이하/이상 자릿수 : 음수 지정 가능, 생략시 default는 0 → 정수로 표현
--소수 둘째자리까지 표현 : ROUND(1234.56789, 2) → 1234.57
SELECT ROUND(1234.56789, 2) r1,     -- 1234.57
       ROUND(1234.56789, 0) r2,     -- 1235
       ROUND(56789.32154, -2) r3,   -- 56800, -2는 0이 2개 붙었다는 뜻으로 이해하면 편하다.
       ROUND(1234.56789) r4         -- 1235
FROM dual;       

--2) 무조건 버림 함수 : TRUNC(n [, i]), TRUNC(숫자, 소수 이하/이상 자릿수)
--소수 이하/이상 자릿수 : 음수 지정 가능, 생략시 default는 0 → 정수로 표현
SELECT TRUNC(1234.56789, 2) t1,     --1234.56
       TRUNC(1234.56789, 0) t2,     --1234
       TRUNC(56789.32154, -2) t3,   --56700
       TRUNC(1234.56789) t4         --1234
FROM dual;       

--3) 정수로 올림하는 함수 : CEIL(n) - 무조건 올림의 정수
--게시판에서 페이지 나눌 때, 페이지당 10개씩 출력시
--0 ~ 1 사이에는 무수히 많은 실수
--0.9999999999999999 → 1
--0.00000000000000000000001 → 1

--4) 정수로 버림하는 함수 : FLOOR(n) - 무조건 버림의 정수
--0 ~ 1 사이에는 무수히 많은 실수
--0.9999999999999999 → 0
--0.00000000000000000000001 → 0
SELECT CEIL(12.00000001) c1,    --13
       FLOOR(12.999999999) f1  --12
FROM dual;

--숫자 데이터를 표현할 수 있는 함수 : ROUND, TRUNC, CEIL, FLOOR
--소수점 데이터를 표현할 수 있는 함수 : ROUND, TRUNC
--정수 데이터를 표현할 수 있는 함수 : CEIL, FLOOR, ROUND/TRUNC(두번째 파라미터가 0)

--5) 나머지 반환 함수 : MOD(m, n), MOD(피제수, 제수)
SELECT MOD(17, 4) m1,   -- 1
       MOD(17, -4) m2,  -- 1
       MOD(-17, 4) m3,  -- -1
       MOD(-17, -4) m4,  -- 1
       MOD(17, 0) m5    -- 17
FROM dual;       

--[연습문제 3]
--employees 테이블의 우리 회사 사원들 중 부서 코드가 100, 110인 부서에 속한 사원들의
--사번, 성명, 급여, 부서 코드, 15% 인상된 급여 조회 - 인상된 급여는 정수로 표현
SELECT employee_id, first_name ||' '|| last_name AS name, salary, department_id AS dept_id,
       ROUND(salary*1.15, 0) AS "Increased Salary ROUND",
       TRUNC(salary*1.15, 0) AS "Increased Salary TRUNC",
       CEIL(salary*1.15) AS "Increased Salary CEIL",
       FLOOR(salary*1.15) AS "Increased Salary FLOOR"
FROM employees
WHERE department_id IN (100, 110);

--3.2 문자 함수
--1. 대/소문자 변환 함수 : UPPER/LOWER(문자)

--예제 1. 성이 King인 사원들의 사번, 성, 명, 조회
SELECT employee_id, last_name, first_name
FROM employees
--WHERE UPPER(last_name) = 'KING'
WHERE LOWER(last_name) = 'king';

--예제 2. 성에 대소문자 무관하게 z가있는 사원들의 사번, 성, 명 조회
SELECT employee_id, last_name, first_name
FROM employees
WHERE UPPER(last_name) LIKE '%Z%';
--WHERE LOWER(last_name) LIKE '%z%'

--2. 단어 단위로 첫 문자는 대문자, 나머지는 소문자화 하는 함수: INITCAP(대상) : 이니셜만 대문자로 변환
SELECT INITCAP('we are studying oracle') title1,
       INITCAP('WE ARE STUDYING ORACLE') title2,
       INITCAP('wE aRE sTUDYING oRACLE') title3
FROM dual;

--예제 2
SELECT email, INITCAP(email),
       first_name, UPPER(first_name), LOWER(first_name)
FROM employees;

--3. 문자 데이터(char1)에 특정 문자(char2)를 채워서 반환하는 함수
--LPAD/RPAD(char1, n [, char2])
--LPAD/RPAD(대상, 전체크기, 충전문자)
--세 번째 파라미터인 충전문자 생략 가능 : default 공백문자
SELECT LPAD('abc', 7, '?') p1,  --????abc
       RPAD('abc', 5, '#') p2,  --abc##
       '['||LPAD('abc', 5) p3,  --__abc
       RPAD('abc', 5)||']' p4  --abc__
FROM dual;

--예제 2
SELECT employee_id, LPAD(last_name, 20) last_name
--LPAD(last_name, 20, ' ')
FROM employees;

--4. 문자 데이터에서 특정 문자를 제거하고 반환하는 함수
--제거할 문자는 *한 개만 지정 가능* ▶ TRIM
--입력 상자에서 사용자 실수로 공백을 입력시
--request.getParameter('UserId').TRIM();

--TRIM([LEADING, TRAILING, BOTH] [, TRIM_char] [FROM] char)
--TRIM(제거할위치, 제거문자한개, FROM 대상문자)
--TRIM(LEADING/TRALING/BOTH 제거문자(한글자) FROM 대상문자)
--제거할 위치 - 왼쪽 : LEADING, 오른쪽 : TRAILING, 양쪽 : BOTH
--제거할 위치 생략 가능 - default : BOTH
--제거문자 생략 가능 - default : 공백 문자
SELECT TRIM(LEADING 'a' FROM 'aaaabcdcba') t1,
       TRIM(TRAILING 'a' FROM 'abcdcbaaaa') t2,
       TRIM(BOTH 'a' FROM 'aaabcdcbaaa') t3,
       TRIM('a' FROM 'aaabcdcbaaa') t4,
       '    abcdcba    ' t5,
       TRIM('    abcdcba    ') t6
FROM dual;

--5. 문자 데이터에 특정 문자를 제거하고 반환하는 함수
--제거할 문자를 ★여러 개 지정 가능★ ▶ TRIM 함수와의 차이점
--LTRIN/RTRIM(char 1 [, char2])
--LTRIM/RTRIM(대상문자, 제거할문자의나열)
--두 번째 파라미터 생략 가능 - default 공백 문자
SELECT LTRIM('abcdcba', 'a') t1,    --bcdcb
       LTRIM('abcdcba', 'ba') t2,   --cdcba
       RTRIM('abcdcba', 'acb') t3,  --abcd
       RTRIM('  abcdcba   ') t4     --___abcdcba
FROM dual;