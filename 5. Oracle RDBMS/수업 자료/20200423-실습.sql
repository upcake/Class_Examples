--1. 부서코드 30, 40, 60인 부서에 속한 사원들의
--사번, 성명, 부서코드, 급여를 조회하여 성명순으로 정렬한다.

SELECT employee_id, first_name || ' ' || last_name, department_id dept_id, salary
FROM employees
--WHERE department_id = 30
--OR department_id = 40
--OR department_id = 60;
WHERE department_id IN (30,40,60);


--2. 커미션을 받는 사원들의 사번, 성명, 급여, 커미션요율을 조회하여
--커미션요율이 높은 사원부터 낮은 사원순으로 정렬한다.

SELECT employee_id, first_name || ' ' || last_name name, salary, commission_pct
FROM EMPLOYEES
WHERE commission_pct IS NOT NULL
--ORDER BY commission_pct DESC;
ORDER BY 4 DESC;


--3. 성명에 대/소문자 무관하게 z 가 있는 사원들의
--사번, 성명 을 조회하여 성명순으로 정렬한다.

SELECT employee_id, first_name || ' ' || last_name name
FROM employees
--WHERE first_name || ' ' || last_name LIKE '%z%'
--OR first_name || ' ' || last_name LIKE '%Z%'

--WHERE lower(first_name || ' ' || last_name) LIKE '%z%'
WHERE upper(first_name || ' ' || last_name) LIKE '%Z%'
--ORDER BY first_name || ' ' || last_name;
--ORDER BY name;
ORDER BY 2;


--[연습문제 2-1]
--1. 사번이 200인 사원의 성명과 부서코드를 조회하는 쿼리문을 작성한다.
SELECT first_name || ' ' || last_name name, department_id dept_id
FROM EMPLOYEES
WHERE employee_id = 200;

--2. 급여가 3000에서 15000 사이에 포함되지 않는 사원의 사번, 성명, 급여 정보를 조회하는 쿼리문을 작성한다.
--(단, 이름은 성과 이름을 공백문자를 두어 합쳐서 조회한다. 
--예를 들어 이름이 John 이고 성이 Seo 이면  John Seo 로 조회되도록 한다.)
SELECT employee_id, first_name || ' ' || last_name name, salary
FROM employees
--WHERE salary NOT BETWEEN 3000 AND 15000;
WHERE salary < 3000 OR salary > 15000;

--3. 부서코드 30과 60 에 소속된 사원의 사번, 성명, 부서코드, 급여를 조회하는데, 
--성명을 알파벳순서로 정렬하여 조회하는 쿼리문을 작성한다.
SELECT employee_id, first_name || ' ' || last_name name, department_id, salary
FROM employees
--WHERE department_id IN (30, 60)
WHERE department_id = 30 
OR department_id = 60;
ORDER BY name;

--4. 급여가 3000에서 15000 사이 이면서, 부서코드 30또는 60에 소속된 사원의 
--사번, 성명, 급여를 조회하는 쿼리문을 작성한다.
--(단, 조회되는 컬럼명을 이름은 성과 이름을 공백문자를 두어 합쳐 name 으로,
--급여는 Monthly Salary 로 조회되도록 한다.)

SELECT employee_id, first_name || ' ' || last_name name, salary AS "Monthly Salary"
FROM EMPLOYEES
WHERE salary BETWEEN 3000 AND 15000
AND department_id IN (30,60);

--5. 소속된 부서코드가 없는 사원의 사번, 성명, 업무코드를 조회하는 쿼리문을 작성한다.
SELECT employee_id, first_name || ' ' || last_name name, job_id
FROM employees
WHERE department_id IS NULL;


--6. 커미션을 받는 사원의 사번, 성명, 급여, 커미션을 조회하는데, 
--커미션이 높은 사원부터 낮은 사원 순서로 정렬하여 조회하는 쿼리문을 작성한다.

SELECT employee_id, first_name || ' ' || last_name name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY commission_pct DESC;

--7. 성명에 대소문자 구분없이 문자 z 또는 Z 가 포함된 사원의 사번과 성명(name)을 조회하는 쿼리문을 작성한다.
SELECT employee_id, first_name || ' ' || last_name name
FROM EMPLOYEES
WHERE lower(first_name || ' ' || last_name) LIKE '%z%';





