SELECT table_name FROM user_tables;

DESC employees;

SELECT * FROM employees;

--사원 테이블에서 사번, 이름, 성 조회
SELECT employee_id, first_name, last_name
FROM employees;

--사원들에 대한 사번, 이름, 성, 부서 코드, 입사 일자, 업무 코드, 급여 조회
SELECT employee_id,
        first_name,
        last_name,
        department_id,
        hire_date,
        job_id,
        salary
FROM employees;

--80번 부서의 사원의 사번, 성, 급여, 한 해동안 받은 급여(연봉) 조회
SELECT employee_id, last_name, salary, salary*12
FROM employees
WHERE department_id = 80;

--연봉이 150000 이상인 사원들의 사번, 이름, 성, 업무 코드, 급여, 연봉 조회
SELECT employee_id, first_name, last_name, job_id, salary*12,
        salary*12 as annual_salary, --alias(가명) 주는 법 : as 명령어 사용
        salary*12 annual_salary,    --쉼표 없이 한칸 띄 고 그냥 적기
        salary*12 "annual_salary"   --한 칸 띄고 쌍따옴표로 묶기 (alias 이름에 공백이 있으면 쌍따옴표로 묶어줘야 함)
FROM employees
WHERE salary*12 >= 150000;
--WHERE annual_salary >= 150000; -- alias는 조건절에 사용할 수 없다.

--한 해 동안 받은 급여가 120000인 사원의 사번, 성, 연봉 조회
SELECT employee_id, last_name, salary*12 annual_salary
FROM employees
WHERE salary*12 = 120000;

--사번이 101번인 사원의 사번, 성, 이름을 조회
--이름과 성을 합해서 성명으로 사용한다. (연결 연산자 || 사용)
SELECT employee_id, first_name ||' '|| last_name
FROM employees
WHERE employee_id = 101;

--성명이 StevenKing인 사원의 사번, 성명, 업무 코드, 급여, 부서 코드 조회
--성명은 이름과 성을 합해서 사용한다.
SELECT employee_id, first_name ||' '|| last_name, job_id, salary, department_id
FROM employees
--WHERE first_name || last_name = 'StevenKing';
WHERE LOWER(first_name || last_name) = 'stevenking';

--성명이 StevenKing인 사원의 사번, 성명, 업무 코드, 급여, 부서 코드(dept_id로 ALIAS) 조회
--성명은 이름과 성을 합해서 사용(name으로 ALIAS)한다.
SELECT employee_id, first_name ||' '|| last_name AS name, job_id, salary, department_id AS dept_id
FROM employees
WHERE LOWER(first_name || last_name) = 'stevenking';

--사번이 101번인 사원의 성명과 한 해 동안 받은 급여를 조회한다.
--성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
--연봉은 'annual salary'로 별명한다.
SELECT first_name ||' '|| last_name AS name, salary * 12 AS "annual salary"
FROM employees
WHERE employee_id = 101;

--3. 비교 연산자 : =, !=, <>, ^=, >, <, >=, <=
--예제. 급여가 3000 이하인 사원의 사번, 성, 급여, 부서 번호, 업무 코드를 조회한다.
SELECT employee_id, last_name, salary, department_id, job_id
FROM employees
WHERE salary <= 3000;

--부서 코드가 80 초과인 사원의 사번, 성, 급여, 부서 번호를 조회한다.
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE department_id > 80;

--부서 코드가 90인 부서에 속한 사원들의 사번, 이름, 성, 부서 코드, 업무 코드 조회
SELECT employee_id, first_name, last_name, department_id, job_id
FROM employees
--WHERE department_id = 90;
WHERE department_id IN(90);

--급여가 17000인 사원들의 사번, 이름, 성, 부서 코드, 급여 조회
SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE salary = 17000;

--급여가 3000 이하인 사원들의 사번, 이름, 성, 업무 코드, 급여, 입사 일자 조회
SELECT employee_id, first_name, last_name, job_id, salary, hire_date
FROM employees
WHERE salary <= 3000;

--급여가 15000 이상인 사원들의 사번, 이름, 성, 업무 코드, 급여 조회
SELECT employee_id, first_name, last_name, job_id, salary
FROM employees
WHERE salary >= 15000;

--성이 King인 사람들의 사번, 이름, 성, 부서 코드 조히
SELECT employee_id, first_name, last_name, department_id
FROM employees
WHERE LOWER(last_name) = 'king';