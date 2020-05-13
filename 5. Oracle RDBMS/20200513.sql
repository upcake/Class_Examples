--문제 02. 60번 부서원들과 같은 급여를 받는 사원들의
--사번, 성, 급여, 부서 코드 조회
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary IN (SELECT salary FROM employees WHERE department_id = 60);

--문제 03. 60번 부서에 속하지 않으면서
--60번 부서원들과 같은 급여를 받는 사원들의
--사번, 성, 급여, 부서 코드 조회
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary IN (SELECT salary FROM employees WHERE department_id = 60)
AND department_id != 60;
--AND department_id <> 60;
--AND department_id NOT IN 60;

--예제 05. 우리회사 사원들 중 부서명이 Marketing이거나 IT에 속한 사원들의
--사번, 성, 부서 코드 조회
SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE department_name IN ('Marketing', 'IT'));
---------------------------------------------------------------------------------------------------------------
--다중 칼럼 서브 쿼리
--서브 쿼리의 결과 칼럼이 여러 칼럼인 경우
--다중 칼럼을 pair의 형태로 비교한다.

--예제 01. 부서 별로 가장 많은 급여를 받는 사원의
--사번, 성명, 부서코드, 급여, 업무 코드 조회
SELECT employee_id, first_name ||' '|| last_name name, department_id, salary, job_id
FROM employees
WHERE (NVL(department_id, 0), salary)
IN (SELECT NVL(department_id, 0), MAX(salary) FROM employees GROUP BY department_id)
ORDER BY 3;
--부서가 없는 사람도 출력하기 위해 NVL을 사용한다.

--문제 01. 각 부서별 최근에 입사한 사원들의
--사번, 성, 부서 코드, 입사일자 조회
SELECT employee_id, last_name, department_id, hire_date
FROM employees
WHERE (NVL(department_id, 0), hire_date) IN (SELECT NVL(department_id, 0), MAX(hire_date) FROM employees GROUP BY department_id)
ORDER BY 3;

--문제 02. 매니저가 없는 사원이 매니저로 있는 부서의
--부서 코드, 부서 명을 조회
SELECT department_id, department_name
FROM departments 
WHERE department_id IN (SELECT department_id FROM employees WHERE manager_id IS NULL);

--예제 02. 매니저가 없는 사원이 매니저로 있는 사원이 있는
--부서 코드, 부서 명을 조회
SELECT DISTINCT(d.department_id), d.department_name
FROM employees e, departments d
WHERE e.manager_id IN (SELECT employee_id FROM employees WHERE manager_id IS NULL)
AND e.department_id = d.department_id(+)
ORDER BY 1;