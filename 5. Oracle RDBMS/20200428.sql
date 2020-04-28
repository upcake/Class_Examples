--다중 행(복수 행) 함수(그룹 함수) : 여러 행으로부터 하나의 결과 값을 반환한다.
--GROUP 함수 : 전체 데이터를 그룹 별로 구분하여 통계적인 결과를 구하기 위해서 사용하는 함수

--GROUP 함수 종류
--1. COUNT  : 입력되는 데이터의 총 건수를 출력
--2. SUM    : 입력되는 데이터의 합계값 구해서 출력
--3. AVG    : 입력되느 데이터의 평균값 구해서 출력
--4. MAX    : 입력되는 데이터 중 가장 큰 값을 출력
--5. MIN    : 입력되는 데이터 중 가장 작은 값을 출력
--6. STDDEV : 입력되느 ㄴ데이터 값들의 표준편차 값 출력



--17. 누계집계함수


--* 쿼리문 작성 순서
--1. 조회해야할 데이터를 파악한 후 SELECT절에 칼럼 목록을 작성한다.
--2. SELECT 절에 나열된 칼럼을 파악한 후
--3. 특정 조건에 맞는 데이터행을 조회해야 한다면

--5.


--DISTINCT는 SELECT * 바로 다음에 쓰여 중복을 제거한 결과를 보여준다.
--뒤에 나오는 칼럼의 중복을 제거하고 조회하고자 하는 대표값만 표현하는 형태

--데이터는 중복된 데이터 행이 조회된다.
--중복을 제거하고 대표값만 조회하기 위한 키워드 : DISTINCT ▶ NULL까지 포함한다.
--데이터 행에 대해 DISTINCT(중복 제거)한다.

--우리 회사 사원들이 소속된 부서를 파악하고자 한다.
--52 ~ 61라인


--NULL은 내림차순에 대해 우선순위를 갖는다. (NULL 먼저 정렬)
--오름차순일 때 마지막 순위를 갖는다.
--오름차순일 때 NULL을 첫번째 데이터행으로 조회하려면 NULLS FIRST
--내림차순일 때 NULL을 마지막 데이터행으로 조회하려면 DESC NULLS LAST

--우리회사 사원들이 소속된 부서들을 파악하고자 한다.
--사원들이 소속된 부서 코드를 주회
SELECT DISTINCT department_id
FROM employees
ORDER BY 1 DESC NULLS PAST;

SELECT DISTINCT department_id
FROM employees
ORDER BY 1 NULLS FIRST;

--우리 회사 부서 코드 10, 20, 30, 40, 60번 부서에 속한 사원들이
--어떤 업무를 하는지 파악하고자 한다.
--해당 부서에 속한 사원들이 하는 업무 코드를 조회
SELECT DISTINCT(job_id)
FROM employees
WHERE department_id IN (10, 20, 30, 40, 60);

--DISTINCT는 SELECT 목록의 모든 칼럼에 대해 적용된다.
SELECT DISTINCT employee_id, departMent_id
FROM employees
ORDER BY 1 DESC;

[연습 문제 4 - 1]
--우리 회사에 매니저로있는 사원들이 누구인지 파악하고자 한다.
--매니저 ID가 있는 사원들의 사번을조회

SELECT DISTINCT manager_id
FROM employees
WHERE manager_id IS NOT NULL;

--그룹 함수
--여러 행으로부터 하나의 결과를 반환하는 형태의 함수 : 그룹 함수 ▶ NULL을 제외한다.
--1. 데이터 행의 갯수를 세어 반환하는 함수 : COUNT(대상 표현), COUNT(*)

--우리 회사 사원 수, 부서 배치 받은 사원 수, 부서 수, 커미션 받는 사원 수 조회
SELECT COUNT(*) everyone,
       COUNT(department_id) dept,
       COUNT(DISTINCT department_id) dept_distinct, -- DISTINCT ▶ NULL까지 포함, 그룹 함수 : NULL을 제외
       COUNT(commission_pct) commission
FROM employees;

--우리 회사 부서 배치 받은 사원 수 조회
SELECT COUNT(*) cnt
FROM employees
WHERE department_id IS NOT NULL;

--우리 회사 사원들 중 부서 코드 60번 부서에 속한 사원들의 수를 파악하고자 한다.
SELECT COUNT(*) cnt
FROM employees
WHERE department_id = 60;

--우리 회사 사원들 중 clerk 종류의 업무를 하는 사원들의 수를 파악하고자 한다.
SELECT COUNT(*) cnt
FROM employees
WHERE LOWER(job_id) LIKE'%clerk%';

--2. 데이터 값을 합하여 반환하는 함수 : SUM(대상 표현) - 숫자에만 사용 가능
--우리 회사 모든 사원들의 급여를 합한 결과를 조회
SELECT SUM(salary) sum_sal
FROM employees;

--우리 회사 부서 코드 60번 부서에 속한 사원들의 급여를 조회
SELECT SUM(salary) sum_sal
FROM employees
WHERE department_id = 60;

--우리 회사 account 업무를 하는 사원들의 급여를 합한 결과를 조회
SELECT TO_CHAR(SUM(salary), '999,999,999') AS sum_sal
FROM employees
WHERE LOWER(job_id) LIKE '%account%';

--3. 데이터값 중 가장 큰/작은 값을 반환하는 함수 : MAX/MIN(대상 표현)
--숫자, 문자, 날짜에 사용 가능
SELECT MAX(salary) max_sal, MIN(salary) min_sal
FROM employees;

--우리 회사 사원들 중 가장 먼저/나중에 오는 성을 조회
SELECT MIN(last_name) min_name, MAX(last_name) max_name
FROM employees;

--우리 회사 사원들 중 가장 먼저/나중에 입사한 사원의 입사 일자 조회
SELECT MIN(hire_date) min_hire_date, MAX(hire_date) max_hgire_date
FROM employees;

--우리 회사 부서 코드 60번인 부서에 속한 사원들 중 가장 많은 급여, 적은 급여 조회
SELECT MAX(salary) max_sal, MIN(salary) min_sal
FROM employees
WHERE department_id = 60;

--우리 회사 clerk 종류의 업무를 하는 사원들의 입사 정보를 파악하고자 한다.
--clerk 종류의 업무를 하는 사원들 중
--가장 먼저 입사한 입사 일자, 가장 최근 입사한 입사 일자 조회
SELECT MIN(hire_date) AS min_hire_date, MAX(hire_date) AS max_hire_date
FROM employees
WHERE LOWER(job_id) LIKE '%clerk%';

--4. AVG(대상 표현) : 데이터 값의 평균을 반환 - 숫자만 가능
--우리 회사 사원들의 급여 평균 조회
SELECT ROUND(AVG(salary), 2) AS avg_sal
FROM employees;

--우리 회사 부서 코드 60인 부서에 속한 사원들의 급여 평균 조회
--급여 평균은 소수 둘째자리까지 반올림해서 표현
SELECT ROUND(AVG(salary), 2) AS avg_sal
FROM employees
WHERE department_id = 60;

--우리 회사 사원들 중 clerk 종류의 업무를 하는 사원들의 급여 평균 조회
--급여 평균은 소수 둘째자리까지 반올림해서 표현
SELECT ROUND(AVG(salary) ,2) AS avg_sal
FROM employees
WHERE LOWER(job_id) LIKE '%clerk%';

--[연습 문제 4 - 2]
--1. 성에 대소문자 무관하게 z가 포함된 성을 가진 사원들이 모두 몇명인지 파악하고자 한다.
--성에 대소문자 무관하게 z가 포함된 성을 가진 사원들의 수를 조회하시오.
SELECT COUNT(*) AS cnt
FROM employees
WHERE LOWER(first_name) LIKE '%z%';

--2. 우리회사 사원들 최고급여와 최저급여 간 급여차를 파악하고자 한다.
--우리회사 최고급여와 최저급여의 급여차를 조회하시오.
SELECT MAX(salary) - MIN(salary) AS "max-min_sal"
FROM employees;

--3. 우리회사에 매니저로 있는 사원들의 수를 파악하고자 한다.
--우리회사 매니저인 사원들의 수를 조회하시오.
SELECT COUNT(DISTINCT manager_id) cnt1,
       COUNT(DISTINCT(manager_id)) cnt2
FROM employees;

--4. 우리회사 account 업무를 하는 사원들의 급여 평균을 조회하시오.
SELECT ROUND(AVG(salary), 2) AS avg_sal
FROM employees
WHERE LOWER(job_id) LIKE '%account%';

--5. 우리회사 사원들 중 커미션을 받는 사원들이 모두 몇명인지 파악하고자 한다.
--커미션을 받는 사원의 수를 조회
SELECT COUNT(*)
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT COUNT(commission_pct)
FROM employees;

--6. 우리회사 사원들 중 가장 먼저/나중에 입사한 사원의 입사일자 조회
SELECT MIN(hire_date) AS min_hire_date, MAX(hire_date) AS max_hire_date
FROM employees;

--7. 우리회사 부서코드 90번인 부서에 속한 사원들의 급여평균 조회
--단, 급여평균액은 소수 둘째자리까지 반올림 표기
SELECT ROUND(AVG(salary), 2) AS avg_sal
FROM employees
WHERE department_id = 90;

--전체 데이터 행을 하나의 그룹으로 보고 그룹 함수로 데이터를 조회
--특정 기준을 두어 기준으로 그룹을 짓고 그룹별로 하나의 결과를 조회하고자 할때 GROUP BY 절을 사용한다.

--부서 코드 50번 부서에 속한 사원들의
--부서 코드, 업무 코드, 급여 평균 조회
SELECT department_id, job_id, ROUND(AVG(salary)) avg_sal
FROM employees
WHERE department_id = 50
GROUP BY department_id, job_id;

--우리 회사 각 부서별 부서 코드, 급여 합계, 급여 평균, 부서원수를 조회하시오.
SELECT department_id,
       SUM(salary) AS sum_sal,
       ROUND(AVG(salary), 2) AS avg_sal,
       COUNT(DISTINCT employee_id) AS cnt_employee,
       COUNT(*) AS cnt -- 부서별이므로 전체를 count 하더라도 부서별 인원이 조회된다.
FROM employees
GROUP BY department_id
ORDER BY department_id;

--각 부서 별, 업무 별로 부서 코드, 업무 코드, 급여 평균 조회
SELECT department_id, job_id, ROUND(AVG(salary), 2) AS avg_sal
FROM employees
GROUP BY department_id , job_id
ORDER BY 1, 2;

--각 부서 별, 업무 별로 급여 합계, 급여 평균, 사원 수를 조회
SELECT department_id,
       job_id,
       SUM(salary) AS sum_sal,
       ROUND(AVG(salary), 2) AS avg_sal,
       COUNT(*) cnt
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

--우리 회사 부서 코드 10, 20, 30, 40, 60번 부서에 속한 사원들의 정보를 파악하고자 한다.
--해당 부서 별로 부서 코드, 부서원수, 부서 급여 평균 조회
SELECT department_id, COUNT(*) AS cnt, ROUND(AVG(salary), 2)
FROM employees
WHERE department_id IN (10, 20, 30, 40, 60)
GROUP BY department_id
ORDER BY department_id;

--우리 회사 clerk 종류의 업무를 하는 사원들의 정보를 파악하고자 한다.
--clerk 종류의 업무 별로 업무 코드, 사원수, 사원들 급여 평균 조회
SELECT department_id, COUNT(*) AS cnt, ROUND(AVG(salary), 2) AS avg_sal
FROM employees
WHERE LOWER(job_id) LIKE '%clerk%'
GROUP BY department_id
ORDER BY 1;

--HAVING절 : GROUP BY의 결과 행에 대해 특정 조건에 맞는 데이터 행을 조회하기 위한 조건절
--WHERE절에서 사용하는 조건을 HAVING절에 사용할 수도 있으나,
--그룹 함수가 포함된 조건은 HAVING절에서만 사용할수 있다.
--WHERE : 일반 조건만 가능, 그룹 함수 포함된 조건은 안됨
--HAVING : 일반 조건, 그룹 함수 포함 조건 모두 가능

--80번 부서의 부서와 급여 평균을 조회
SELECT department_id, ROUND(AVG(salary), 2) AS avg_sal
FROM employees
WHERE department_id = 80
GROUP BY department_id;

SELECT department_id, ROUND(AVG(salary), 2) AS avg_sal
FROM employees
GROUP BY department_id
HAVING department_id = 80;

--각 부서별로 소속된 사원의 수가 5명 이하인 부서와 그 수를 조회
SELECT department_id,
       COUNT(*)
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING COUNT(*) <= 5
ORDER BY 1;

--각 부서별 사원에 대한 정보를 파악하고자 한다.
--사원 수가 10명 이상인 부서의
--부서 코드, 사원 수, 급여 평균, 최대 급여, 최저 급여 조회
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal
FROM employees
GROUP BY department_id
HAVING COUNT(*) >= 10
ORDER BY department_id;

--[연습문제 4 - 3]
--1. 사원 테이블에서 똑같은 이름(first_name)이 둘 이상 있는 이름과 그 이름이 모두 몇 명인지를 조회하는 쿼리문을 작성한다.
SELECT first_name, COUNT(*)
FROM employees
GROUP BY first_name
HAVING COUNT(*) >= 2
ORDER BY first_name;

--2. 부서 번호, 각 부서 별 급여 총액과 급여 평균을 조회하는 쿼리문을 작성한다.
--단, 부서 급여 평균이 8000 이상인 부서만 조회되도록 한다.
SELECT department_id, SUM(salary) sum_sal, ROUND(AVG(salary), 2) avg_sal
FROM employees
GROUP BY department_id
HAVING ROUND(AVG(salary), 2) >= 8000
ORDER BY department_id;

--3. 년도, 년도별로 입사한 사원 수를 조회하는 쿼리문을 작성한다.
--단, 년도는 2014의 형태로 표기되도록 한다.
SELECT TO_CHAR(hire_date, 'YYYY') AS hire_year, COUNT(*) cnt
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY hire_year;