--상호 연관 서브 쿼리
--1) 단순한 그룹 함수의 결과 값을 SELECT절에 조회하고자 할 때
--각 사원의 급여 수준을 파악하고자 한다.
--모든 사원의 사번, 성, 급여, 회사 평균 급여, 회사 최대 급여 조회
SELECT employee_id, last_name, salary, ROUND(AVG(salary)) avg_sal, MAX(salary) max_sal
FROM employees
GROUP BY employee_id, last_name, salary;

SELECT employee_id, last_name, salary,
       (SELECT ROUND(AVG(salary)) FROM EMPLOYEES) avg_sal,
       (SELECT MAX(salary) FROM employees) max_sal
FROM employees;

--SELECT 절에 그룹 함수를 쓰게 되면 나머지 그룹 함수 이외의 칼럼은
--GROUP BY 절을 사용하거나 그룹 함수만 들어갈 수 있다.

--2) 코드성 데이터를 SELECT 절에 조회하고자 할 때 : 상호 연관 서브 쿼리, OUTER JOIN 사용한 것 처럼
--모든 사원의 사번 성, 부서 코드, 부서명 조회
SELECT employee_id, last_name, department_id,
       (SELECT department_name
        FROM departments d
        WHERE d.department_id = e.department_id) department_name
FROM employees e;

--모든 사원의 사번, 성, 부서 코드, 업무 코드, 업무 제목 조회
SELECT employee_id, last_name, department_id, job_id,
       (SELECT job_title FROM jobs WHERE job_id = e.job_id) job_title
FROM employees e;

--각 부서에 대해 부서 코드, 부서명, 도시를 조히
SELECT department_id, department_name,
       (SELECT city FROM locations WHERE location_id = d.location_id) city
FROM departments d;

--모든 사원들의 사번, 성, 급여, 부서 코드, 부서명, 업무 코드 조회
--오라클 쿼리
SELECT employee_id, last_name, salary, d.department_id, department_name, job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

--상호 연관 서브 쿼리
SELECT employee_id, last_name, salary, department_id,
       (SELECT department_name FROM departments WHERE department_id = e.department_id) department_name,
       job_id
FROM employees e;

--ANSI 쿼리
SELECT employee_id, last_name, salary, d.department_id, d.department_name, job_id
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id;

--문제 03. 각 부서에 대해 부서 코드, 부서명, 위치 코드, 도시명 조회
--오라클 쿼리
SELECT department_id, department_name, l.location_id, city
FROM departments d, locations l
WHERE d.location_id = l.location_id;

--ANSI 쿼리
SELECT department_id, department_name, l.location_id, city
FROM departments d JOIN locations l
ON d.location_id = l.location_id;

--상호 연관 서브 쿼리
SELECT department_id, department_name, location_id,
       (SELECT city FROM locations WHERE location_id = d.location_id) city
FROM departments d;

--문제 04. 각 사원에 대해 사원이 소속된부서의 급여 정보 대비 사원의 급여를 파악하고자 한다.
--사번, 성, 부서 코드, 급여, 속한 부서의 평균 급여 조회
SELECT employee_id, last_name, department_id, salary,
       (SELECT ROUND(AVG(salary)) FROM employees WHERE department_id = e.department_id) dept_avg_sal
FROM employees e;

--문제 05. 각 부서별 부서 코드, 부서 평균 급여 조회
--오라클 쿼리
SELECT department_id, ROUND(AVG(salary)) avg_sal
FROM employees
GROUP BY department_id;

--상호 연관 서브 쿼리
SELECT department_id,
       (SELECT ROUND(AVG(salary)) FROM employees WHERE department_id = e.department_id) dept_avg_sal
FROM employees e
GROUP BY department_id;

---------------------------------------------------------------------------------------------------
--6. FROM 절에 사용하는 인라인뷰 서브 쿼리
--SELECT 절의 결과를 FROM 절에서 하나의 테이블처럼 사용 (테이블 대체 용도)
--FROM 절에 사용하는 인라인 뷰 서브 쿼리에서 그룹함수는 *반드시* ALIAS 지정해야 한다!

--예제 01. 우리 회사 사원들의 급여 정보를 관리한 테이블이 있다고 가정한다.
--직원들의 사번, 성, 회사 최대 급여, 회사 최소 급여, 회사 평균 급여
SELECT employee_id, last_name, salary, max_sal, min_sal, avg_sal
FROM employees, (SELECT MAX(salary) max_sal, MIN(salary) min_sal, ROUND(AVG(salary)) avg_sal FROM employees);

--예제 02. 각 부서별로 가장 많은 급여를 받는 사원들의
--사번, 성, 부서 코드, 급여 조회
--부서별로 가장많은 급여
SELECT department_id, MAX(salary) max_sal
FROM employees
GROUP BY department_id;

--다중 칼럼 서브 쿼리
SELECT employee_id, last_name, department_id, salary
FROM employees
WHERE (department_id, salary)
IN (SELECT department_id, MAX(salary) FROM employees GROUP BY department_id)
ORDER BY 3;

--인라인 뷰 서브 쿼리
SELECT employee_id, last_name, e.department_id, salary
FROM employees e, (SELECT department_id, MAX(salary) max_sal FROM employees GROUP BY department_id) m
WHERE e.department_id = m.department_id
AND salary = max_sal;