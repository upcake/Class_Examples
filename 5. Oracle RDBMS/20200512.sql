--서브 쿼리(Sub Query)
--SQL 문장 안에 존재하는 또 다른 SQL 문장을 서브 쿼리라 한다.
--서브 쿼리는 괄호로 묶어 사용하고 서브 쿼리가 포함된 쿼리문을 메인 쿼리라 한다.

--※ 서브 쿼리의 위치에 따른 명칭
--SELECT 문에 있는 서브 쿼리 : 스칼라 서브 쿼리, SQL에서 단일 값을 스칼라 값이라 함,
--Scalar : 하나(크기), Vector : 크기와 방향
--SELECT 문에 서브 쿼리를 사용하여 하나의 칼럼처럼 사용하기 위한 목적(표현 용도)
--조인(Join)의 대체 표현식으로도 자주 사용

--FROM 절에 있는 서브 쿼리 : 인라인 뷰
--SELECT 절의 결과를 FROM절에서 하나의 테이블처럼 사용 (테이블 대체 용도)
--인라인 뷰 서브 쿼리에 ORDER BY 절은 올 수 없음.
--(▶ 출력 용도가 아닌 테이블처럼, 사용 용도이므로 굳이 정렬할 필요가 없음.)
--★인라인 뷰 서브 쿼리에서 그룹함수는 반드시 alias 지정해야 함★

--WHERE 절에 있는 서브 쿼리 : 일반 서브 쿼리
--★ SELECT 절의 결과를 하나의 변수(상수)처럼 사용
--(조건절은 서브 쿼리의 결과에 따라 달라짐)

--급여가 평균 급여보다 더 적은 급여를 받는 사원의
--사번, 이름, 성 정보를 조회한다.
SELECT employee_id, first_name, last_name
FROM employees
--WHERE salary < AVG(salary); -- 그룹 함수를 WHERE절에서 사용할 수 없으므로 에러 발생
--WHERE salary < 6461.83;
WHERE salary < (SELECT AVG(salary) FROM employees); -- 서브 쿼리

SELECT AVG(salary) FROM employees; -- 평균 급여 6461.83

--가장 많은 급여를 받는 사원의
--사번, 성, 명, 급여 조회
SELECT employee_id, last_name, first_name, salary
FROM employees
--WHERE salary = MAX(salary); -- 그룹 함수를 WHERE절에서 사용할 수 없으므로 에러 발생
WHERE salary = (SELECT MAX(salary) FROM employees);

--서브 쿼리 : 메인 쿼리문 안에 있는 또 다른 쿼리문
--단일 결과행 서브 쿼리 : 조건 절에 사용하는 서브 쿼리의 결과 행이 단일 행인 경우
--다중 결과행 서브 쿼리 : 조건 절에 사용하는 서브 쿼리의 결과 행이 여러 행인 경우
--다중 칼럼 서브 쿼리 : 조건 절에 사용하는 서브 쿼리의 결과 칼럼이 여러 칼럼인 경우

--4. Scalar 서브 쿼리 : SELECT 절에 사용하는 서브 쿼리
--5. 상호 연관 서브 쿼리 : 메인 쿼리의 칼럼이 서브 쿼리의 조건 절에 사용되는 경우
--6. 인라인 뷰 서브 쿼리 - FROM 절에 사용하는 서브 쿼리

--01. 우리 회사 사원들의 급여 수준을 파악하고자 한다.
--급여가 우리 회사 급여의 평균보다 더 적게 받는 사원들의
--사번, 성, 업무 코드, 급여 조회
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < (SELECT AVG(salary) FROM employees);

--02. 사번 150번 사원보다 더 많은 급여를 받는 사원들의
--사번, 성, 부서 코드, 업무 코드, 급여 조회
SELECT employee_id, last_name, department_id, job_id, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE employee_id = 150);
                
--03. 월급여가 가장 많은 사원의
--사번, 이름, 성, 업무 제목 정보를 조회
SELECT e.employee_id, e.first_name, e.last_name, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND e.salary = (SELECT MAX(salary)
                FROM employees);
                
--04. 사원들의 급여가 우리 회사 평균 급여 이상 최대 급여 이하에 해당하는
--사원들의 사번, 성, 급여 조회
SELECT employee_id, last_name, salary
FROM employees
WHERE salary BETWEEN (SELECT AVG(salarY)
                      FROM employees)
AND (SELECT MAX(salary)
     FROM employees);
     
--05. 우리회사에서 가장 적은 급여를 받는 사원의 
--사번, 성, 업무코드, 부서코드, 부서명, 급여 조회
SELECT e.employee_id, e.last_name, e.job_id, d.department_id, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.salary = (SELECT MIN(salary) FROM employees);

--06. 부서명이 Marketing 인 부서에 속한 사원들의 
--사번, 성명, 부서코드, 업무코드 조회
SELECT e.employee_id, e.first_name ||' '|| e.last_name name, d.department_id, e.job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id
--AND d.department_name = 'Marketing';
AND d.department_name = (SELECT department_name
                         FROM departments
                         WHERE department_name ='Marketing');

--07. 우리회사 사장님보다 먼저 입사한 사원들의 
--사번, 성명, 입사일자 조회
--사장은 그를 관리하는 매니저가 없는 사원을 말한다
SELECT e.employee_id, e.first_name ||' '|| e.last_name name, e.hire_date
FROM employees e
WHERE e.hire_date < (SELECT hire_date
                   FROM employees
                   WHERE manager_id IS NULL);
------------------------------------------------------------------------------------------
--2. 다중 결과행 서브 쿼리 - 조건 절에 사용한 서브 쿼리의 결과 행이 여러 행인 경우
--연산자 : IN, NOT IN(즉, '='을 IN으로 대체)
--비교의 대상이 두 개 이상은 대소비교 불가, 그래서 IN 연산자 사용
--서브 쿼리의 결과가 여러 행일 경우 '=', '<', '>'와 같은 대소비교가 불가
--WHERE 절에는 그룹함수 MIN, MAX 사용 불가
--WHERE 절이 아닌 서브 쿼리에 그룹 함수 MIN, MAX 사용해도 문제 없음

--칼럼표현 IN / NOT 칼럼표현 IN / 칼럼표현 NOT IN

--예제 01. 부서의 위치 코드가 1700인/1700이 아닌 부서에 속한 사원들의
--사번, 성명, 부서 코드, 업무 코드, 위치 코드 조회 (일반 조인)
SELECT e.employee_id, e.first_name ||' '|| e.last_name name, d.department_id, e.job_id, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
--AND d.location_id = 1700;
AND d.location_id IN (1700);

SELECT employee_id, first_name || ' ' || last_name name, department_id, job_id
FROM employees 
WHERE department_id IN ( SELECT department_id 
                  --NOT IN (SELECT department_id 
                         FROM departments                
                         WHERE location_id = 1700 );
--WHERE e.department_id = (위치코드가 1700 인 부서);

--예제 02. 우리 회사에서 mgr 업무에종사하는 사원들과 같은 부서에 속한 사원들의
--사번, 성, 업무 코드 조회
SELECT employee_id, last_name, job_id
FROM employees
WHERE LOWER(job_id) LIKE '%mgr%';

SELECT employee_id, last_name, job_id
FROM employees
WHERE department_id IN(SELECT department_id FROM employees WHERE LOWER(job_id) LIKE '%mgr%');

--예제 03. 각 부서의 최소 급여가 40번 부서의 최소 급여보다 더 높은 부서 코드, 최소 급여 조회
SELECT department_id, MIN(salary) min_sal
FROM employees
GROUP BY department_id
HAVING MIN(salary) >= (SELECT MIN(salary) FROM employees WHERE department_id = 40);

--예제 04. 근무지의 국가 코드가 UK인 곳에 있는 부서의
--부서 코드, 위치 코드, 부서명 조회
SELECT  d.department_id,
        l.location_id, d.department_name
FROM    departments d, locations l
WHERE d.location_id = l.location_id
AND LOWER(l.country_id) = 'uk';

SELECT department_id, location_id, department_name
FROM departments
WHERE location_id IN(SELECT location_id FROM locations WHERE LOWER(country_id) = 'uk');

--문제 01. 성에 대소문자 무관하게 z가 포함된 성을 가진 사원들과 같은 부서에 속한
--사원들의 사번, 성명, 부서 코드, 업무 코드 조회
SELECT employee_id, first_name ||' '|| last_name name, department_id, job_id
FROM employees
WHERE department_id IN (SELECT department_id FROM employees WHERE LOWER(last_name) LIKE '%z%');