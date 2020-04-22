SELECT *
FROM v$nls_parameters;

SELECT VALUE
FROM NLS_SESSION_PARAMETERS
WHERE PARAMETER = 'NLS_DATE_FORMAT';

--오늘 날짜 조회, dual : 가라 데이터, 가짜 데이터
SELECT SYSDATE
FROM dual;

--날짜 포맷을 사용하여 사용자가 원하는 형태의 문자로 바꿔 반환
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD')
FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY/MONTH/DD')
FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS')
FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS')
FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD'),
        TO_CHAR(SYSDATE, 'YYYY/MONTH/DD'),
        TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS'),
        TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS')
FROM dual;

--기본 데이터 포맷 변경
--ALTER SESSION SET NLS_DATE_FORMAT = [변경할 포맷];
--오라클 기본 데이터 포맷 설정 ▶ 현재 세션에만 적용
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
SELECT SYSDATE
FROM dual;

--예제. 입사일이 2004년 1월 1일 이전인 사원의 사원 코드, 성, 입사 일자를 조회 ★시험 문제★
SELECT employee_id, last_name, hire_date
FROM employees
--WHERE hire_date < '2004-01-01';   -- 기본
--WHERE hire_date < '2004/01/01';   -- 날짜 구분 / 상관 없음
--WHERE hire_date < '04-01-01';     -- 연도 앞에 2자리 빼도 상관 없음
WHERE TO_CHAR(hire_date, 'YYYY') < 2004;

--4. 논리 연산자
--예제. 30번 부서 사원 중 급여가 10000 이하인 사원의 사원 코드, 성명, 급여, 부서 코드를 조회
--성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT employee_id, first_name ||' '|| last_name AS name, salary, department_id
FROM employees
WHERE department_id = 30
AND salary <= 10000;

--예제. 30번 부서에서 급여가 10000 이하이면서 2005년 이전(2004년까지)에 입사한 사원의
--사원 번호, 성명, 급여, 부서 코드, 입사 일자를 조회한다.
--성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT employee_id, first_name ||' '|| last_name AS name, salary, department_id, hire_date
FROM employees
WHERE department_id = 30
AND salary <= 10000
--AND hire_date <= '2004-12-31';
AND TO_CHAR(hire_date, 'YYYY') <= 2004;

--예제. 부서 코드가 10 이상 30이하인 사람들의 사번, 성명, 부서 코드 조회
--성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT employee_id, first_name ||' '|| last_name AS name, department_id
FROM employees
WHERE department_id >= 10
AND department_id <= 30;

--문제. 급여가 10000 이상 15000 이하인 사원들의
--사번, 성명, 급여, 업무 코드 조회
--성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT employee_id, first_name ||' '|| last_name AS name, salary, job_id
FROM employees
WHERE salary <= 15000
AND salary >= 10000;

--문제. 부서가 60인 부서에서 급여가 5000 이상인 사원들의
--사번, 성명, 부서 코드, 급여 조회
--성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT employee_id, first_name ||' '|| last_name AS name, department_id, salary
FROM employees
WHERE department_id = 60
AND salary >= 5000;

--문자/날짜 데이터 표현 : ''
--예제. 부서 코드가 60 이하이면서 2003년 6월 17일 이전에 입사한 사원들의
--사번, 성명, 입사 일자 조회
--성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다
SELECT employee_id, first_name ||' '|| last_name AS name, hire_date
FROM employees
WHERE department_id <= 60
AND hire_date <= '2003-06-17';

-- 4.2 OR 연산자는 조건 중 하나만 TRUE면 TURE를 반환한다.
-- 예제 1. 30번 부서나 60번 부서에 속한 사원의 성명, 급여, 부서 코드를 조회한다.
SELECT first_name ||' '|| last_name, salary, department_id
FROM employees
WHERE department_id = 30
OR department_id = 60;

--문제 1. 부서 코드가 10, 20, 30인 부서에 속한 사원들의
--사번, 성명, 부서 코드, 업무 코드 조회
SELECT employee_id, first_name ||' '|| last_name, department_id, job_id
FROM employees
WHERE department_id = 10
OR department_id = 20
OR department_id = 30;

--문제 2. 사번이 150, 170, 190인 사원들의
--사번, 성명, 부서 코드, 업무 코드, 입사 일자 조회
SELECT employee_id, first_name ||' '|| last_name, job_id, hire_date
FROM employees
WHERE employee_id = 150
OR employee_id = 170
OR employee_id = 190;

--4.3 AND 연산자와 OR 연산자를 혼합하여 문장을 작성한다.
--예제 1. 30번 부서의 급여가 10000 미만인 사원과 60번 부서의 급여가 5000 이상인 사원 정보를 조회
SELECT first_name ||' '|| last_name AS name, salary, department_id AS dept
FROM employees
WHERE (department_id = 30 AND salary < 10000)
OR (department_id = 60 AND salary >= 5000);
-- 괄호를 안닫아줘도 결과는 같지만 보기 쉽도록 괄호를 넣어 준다.

--연산자에는 우선 순위가 있다.
--산술 연산의 경우 : *, / → +, -
--논리 연산의 경우 : AND : 논리곱 → OR : 논리합
--7 + (7 / 7) + (7 * 7) - 7 = 7 + 1 + 49 - 7 = 50

--5. 범위 조건 연산자 BETWEEN
--'BETWEEN 시작값 AND 마지막값'은 시작값 이상 마지막값 이하 와 같다.
--★ BETWEEN 이나 관계 연산자로 비교할수 있는 값은 숫자 데이터, 문자 데이터, 날짜 데이터
--A 이상 B 이하 : 칼럼명 BETWEEN A AND B
--A 미만 B 초과 : 칼럼명 NOT BETWEEN A AND B
--               NOT 칼럼명 BETWEEN A AND B
--NOT 연산자는 BETWEEN 연산자 바로 앞이나 칼럼명 앞에 붙여 사용할 수 있으며,
--두 경우 모두 같은 결과가 조회된다.

--예제 1. 사번 110번부터 120번까지의 사원 번호, 성명, 급여, 부서 코드를 조회한다.
SELECT employee_id, first_name ||' '|| last_name, department_id
FROM employees
--WHERE employee_id >= 110 AND employee_id <= 120;
WHERE employee_id BETWEEN 110 AND 120;

--예제 2. 사번이 110번 미만 120번 초과인 사원의 사원 번호, 성명, 급여, 부서 코드를 조회한다.
SELECT employee_id AS emp_id, first_name ||' '|| last_name AS name,
        salary, department_id AS dept_id
FROM employees 
--WHERE employee_id < 110 OR employee_id > 120;
WHERE NOT employee_id BETWEEN 110 AND 120;

--문제 1. 논리 연산자를 사용해 부서 코드가 10 미만 40 초과인 사원들의 사번, 성명, 부서 코드 조회
SELECT employee_id, first_name ||' '|| last_name, department_id
FROM employees
WHERE department_id NOT BETWEEN 10 AND 40;

--문제 2. 사번이 110에서 120인 사원 중에서 급여가 5000에서 10000 사이의
--사원 번호, 성명, 급여, 부서 코드를 조회한다.
SELECT employee_id, first_name ||' '|| last_name, salary, department_id
FROM employees
WHERE (employee_id BETWEEN 110 AND 120)
AND (salary BETWEEN 5000 AND 10000);

--예제 3. 2005년 1월 1일 이후부터 2007년 12월 31일 사이에 입사한 사원 정보를 조회한다.
SELECT employee_id AS emp_id, first_name ||' '|| last_name AS name, salary, hire_date
FROM employees
--WHERE hire_date BETWEEN '2005-01-01' AND '2007-12-31';
WHERE hire_date BETWEEN TO_DATE('2005-01-01') AND TO_DATE('2007-12-31');

--DATE 타입의 HIRE_DATE의 값을 문자 값으로 비교했음에도
--오류없이 결과가 나오는 이유는 오라클 SQL 엔진이 자동으로 묵시적 형변환을 했기 때문이다.
--하지만 가급적 명시적으로 형변환하는 것이 바람직하다.
--명시적 형변환 함수는 TO_DATE() 이다.

--문제 3. 입사 일자가 2003년 8월 1일부터 2005년 7월 31일에 해당하는 사원들의
--사번, 성명, 입사 일자 조회
SELECT employee_id, first_name ||' '|| last_name, hire_date
FROM employees
WHERE hire_date BETWEEN TO_DATE('2003-08-01') AND TO_DATE('2005-07-31');

--6. IN 조건 연산자
--여러 개의 값 중에 일치하는 값이 있는지 비교할 때는 IN (값1, 값2, 값3 ...)의 형태로 비교하는 값의 목록을 나열한다.
--동일한 칼럼 표현에 대해 동등 비교한 형태의 조건식을 OR로 나열한 형태
--      칼럼 표현 IN (동등 비교할 데이터 값 목록) ↔
--      칼럼 표현 NOT IN (동등 비교할 데이터 값 목록)
--      NOT 카럼표현 IN (동등 비교할 데이터 값 목록)
--예제 1. 부서 코드가 20, 30, 40, 60, 100, 110인 부서에 속한 사원들의 사번, 성명, 부서 코드 조회
SELECT employee_id, first_name ||' '|| last_name, department_id
FROM employees
WHERE department_id IN (20, 30, 40, 60, 100, 110);
--WHERE department_id = 20
--OR department_id = 30
--OR department_id = 40
--OR department_id = 60
--OR department_id = 100
--OR department_id = 110;

--예제 2. 30번 부서원 또는 60번 부서원 또는 90번 부서원의 사번, 성명, 급여, 부서 코드를 조회한다.
SELECT employee_id, first_name ||' '|| last_name, salary, department_id
FROM employees
WHERE department_id IN(30, 60, 90);

--문제 1. 30번 부서, 60번 부서, 90번 부서 이외의 부서에 속한 사원의 사번, 성명, 급여, 부서 코드 정보를 조회한다.
SELECT employee_id, first_name ||' '|| last_name, salary, department_id
FROM employees
WHERE department_id NOT IN (30, 60, 90);

--7. 검색에 해당하는 연산자 : 필드명 LIKE 조건 연산자(포함하는)
--                       : 필드명 NOT LIKE 조건 연산자(포함하지 않는)
--칼럼 값들 중에 특정 패턴에 속하는 값을 조회하고자 할 때 LIKE 연산자를 사용한다.
--'%' : 여러 개의 문자열, 어떤 문자가 몇개가 오던지 무관한
--'_' : 하나의 문자, 하나의 문자가 어떤 문자가 오던지 무관한

--칼럼 표현 LIKE 검색 문자 + %
--% : 어떤 문자가 몇개가 오던지 무관한
--성명 LIKE '홍%' ▶ 홍으로 시작하는 성명 : 홍길동, 홍명보, 홍시 등
--성명 LIKE '%홍' ▶ 홍으로 끝나는 성명 : 황선홍, 분홍, 다홍 등
--성명 LIKE '%홍%' ▶ 홍을 포함하는 성명 : 홍길동, 홍명보, 홍시, 황섢오, 분홍, 다홍, 김홍도 등

--예제 1. 이름이 K로 시작하는 사원의 사번, 이름, 성 조회
SELECT employee_id, first_name, last_name
FROM employees
WHERE first_name LIKE 'K%';

--문제 1. 이름이 s로 끝나는 사원의 사번, 이름, 성 조회
SELECT employee_id, first_name, last_name
FROM employees 
WHERE first_name LIKE '%s';

--문제 2. 성에 z가 포함된 사원의 사번, 이름, 성 조회
SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name LIKE '%z%';

--문제 3. 성에 대소문자 무관하게 z가 포함된 성을 가진 사원들의 사번, 이름, 성 조회
SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name LIKE '%z%'
OR last_name LIKE '%Z%';

--문제 4. 성명에 대소문자 무관하게 z가 포함된 성명을 가진 사원들의 사번, 성명 조회
SELECT employee_id, first_name ||' '|| last_name AS name
FROM employees
WHERE (first_name || last_name) LIKE '%z%'
OR (first_name || last_name) LIKE '%Z%';

-- 예제 2. 성에 소문자 z가 2번째에 위치해 있는 성을 가진 사원들의 사번, 성명 조회
SELECT employee_id, first_name ||' '|| last_name
FROM employees
WHERE last_name LIKE '_z%';

-- 문제 5. 성에 소문자 z가 5번째에 위치해 있는 성을 가진 사원들의 사번, 성명 조회
SELECT employee_id, first_name ||' '|| last_name
FROM employees
WHERE last_name LIKE '____z%';

--예제 3. 성에 소문자 z가 뒤에서부터 5번째에 위치해 있는 성을가진 사원들의 사번, 성명 조회
SELECT employee_id, first_name ||' '|| last_name
FROM employees
WHERE last_name LIKE '%z____';

--문제 6. 전화번호가 6으로 시작되지 않는 사원의 사번, 성명, 급여, 휴대전화 정보를 조회
SELECT employee_id, first_name ||' '|| last_name, salary, phone_number
FROM employees
WHERE phone_number NOT LIKE '6%';

--문제 7. 입사 일자가 12월에 입사한 사원들의 사번, 성, 입사 일자 조회
SELECT employee_id, last_name, hire_date
FROM employees
WHERE hire_date LIKE '___12___';            -- 내가 작성한 조건
--WHERE TO_CHAR(hire_date, 'MM') = 12;      -- 답 ①
--WHERE hire_date LIKE '___12___';          -- 답 ②
--WHERE hire_date LIKE '___%12%___';        -- 답 ③
--WHERE hire_date LIKE '__/12/__';          -- 답 ④

--7. LIKE 연산자와 함께 사용된 %, _ 를 문자 자체로 인지되게 하려면
--%, _ 앞에 기호 문자를 붙이고 escape 옵션을 지정한다.
--칼럼 표현 LIKE 특수문자 '\_' escape '\'
--특수 문자 ▶ ~, !, @, #, $, ^, & 등

--예제 1. 사원들의 업무 형태(업무 코드)를 파악하고자 한다.
--업무 코드가 _A 인 사원들의 사번, 성, 업무 코드를 조회
SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE '%\_A%' escape '\';

--8. 데이터 값이 없는 형태의 표현 : NULL - 비교 불가, 산술 연산 불가
--그래서, 칼럼 표현 IS NULL/IS NOT NULL로 판단 ▶ NULL 인지 아닌지 파악

SELECT *
FROM locations
--WHERE state_province LIKE '%';
WHERE state_province IS NOT NULL;

--예제 1. 부서 코드가 NULL인 부서 배치 받지 않은 사원들의 사번, 성, 부서 코드, 업무 코드, 급여 조회
SELECT employee_id, last_name, department_id, job_id, salary
FROM employees
WHERE department_id IS NULL;        -- 부서 배치를 받지 않은
--WHERE department_id IS NOT NULL;  -- 부서 배치를 받은

--문제 1. 커미션을 받는 사원들의 사번, 성, 부서 코드, 커미션 요율 조회
SELECT employee_id, last_name, department_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

--2.4 데이터행 정렬 - ORDER BY 절 : 쿼리문의 가장 마지막에 위치
-- ORDER BY 정렬기준표현 + 오름차순(default) ASC / 내림차순 DESC
-- 정렬기준표현 : 칼럼 표현 그대로, ALIAS, SELECT 목록에서의 위치(칼럼 번호)
-- SELECT 절
-- FROM 절
-- WHERE 절
-- ORDER BY 절;
-- 프로그램 상에서는 정렬 잘 안함(즉, DB에서만 정렬해서 프로그램으로 넘김)

--예제 1. 80번 부서의 사번, 성, 급여, 부서 코드에 대해 성을 오름차순/내림차순으로 정렬한다.
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE department_id = 80
ORDER BY last_name ASC;

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE department_id = 80
ORDER BY last_name DESC;

--ORDER BY 절에 ALIAS를 사용하여 정렬할 수 있다.
--예제 2. 60번 부서의 사번, 성, 연봉에 대해 연봉을 오름차순으로 정렬한다.
--연봉을 annual_salary로 ALIAS한다.
SELECT employee_id, last_name, salary*12 AS annual_salary
FROM employees
WHERE department_id = 60
--ORDER BY salary*12;
ORDER BY annual_salary;

--예제 3. 사원 테이블에서 사번, 성, 급여, 부서 코드를 조회하는데
--부서는 오름차순, 월급여는 내림차순 정렬하여 사원 정보를 조회한다.
--department_id를 dept_id로 ALIAS
SELECT employee_id, last_name, salary, department_id AS dept_id
FROM employees
--WHERE
--ORDER BY dept_id ASC, salary DESC;
ORDER BY 4 ASC, 3 DESC;

--예제 4. 사번, 성, 부서코드, 급여, 입사일자 조회, 성 내림차순으로 정렬한다.
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
--WHERE
ORDER BY last_name DESC;

--문제 1, 사번, 성, 부서 코드, 급여, 입사 일자 조회
--부서코드 순, 급여 내림차순으로 정렬한다.
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY department_id ASC, salary DESC;