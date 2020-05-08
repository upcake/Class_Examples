--5.6 ANSI JOIN
--ANSI JOIN은 모든 DBMS에서 공통적으로 사용할 수 있는 국제 표준 JOIN 형식이다.

--1. INNER JOIN (오라클의 EQUI JOIN), 교집합
--★FROM 절 안에 INNER JOIN을 사용하여 테이블 간 조인 지정
--JOIN 조건은 ON 절, USING 절에 명시한다.
--FROM 테이블명1 INNER JOIN 테이블명2
--ON 조인 조건식 WHERE 일반 조건
--(또는) USING (조인 칼럼명) ▶ USING 절에 사용된 칼럼에 대해서는 테이블명 절대로 명시해서는 안된다.

--조인 조건절 :
--ON 절 - 조인 조건식(테이블명.칼럼명 = 테이블명.칼럼명)
--        조인하는 칼럼 명이 동일하면 반드시 테이블명을 명시해야만 한다.
--USING 절 - (조인 칼럼명) 괄호안에 칼럼명만 적는다.

--부서 코드가 60번인 사번, 성, 부서 코드, 부서명 조회
--오라클 조인
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE d.department_id = 60
AND e.department_id = d.department_id;

--ANSI 조인
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id = 60;

SELECT e.employee_id, e.last_name, department_id, d.department_name
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE department_id = 60;

--사번, 성, 업무 코드, 업무 제목 조회
--오라클 조인
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id;

--ANSI 조인
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e INNER JOIN jobs j
ON e.job_id = j.job_id;

SELECT e.employee_id, e.last_name, job_id, j.job_title
FROM employees e INNER JOIN jobs j
USING (job_id);

--ON, USING 절 다음에 WHERE 절을 사용한 일반 조건을 표현한다.
--업무 코드가 clerk 종류 업무 형태를 하는 사번, 성, 업무 코드, 업무 제목 조회
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND LOWER(j.job_id) LIKE '%clerk%'
ORDER BY 1;

SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e JOIN jobs j
ON e.job_id = j.job_id
WHERE LOWER(j.job_id) LIKE '%clerk%'
ORDER BY 1;

SELECT e.employee_id, e.last_name, job_id, j.job_title
FROM employees e JOIN jobs j
USING (job_id)
WHERE LOWER(job_id) LIKE '%clerk%'
ORDER BY 1;

--우리 회사 부서 정보를 파악하고자 한다.
--부서 코드, 부서명, 위치 코드, 도시 조회
SELECT d.department_id, d.department_name, l.location_id, l.city
FROM departments d, locations l
WHERE d.location_id = l.location_id
ORDER BY 1;

SELECT d.department_id, d.department_name, l.location_id, l.city
FROM departments d JOIN locations l
ON d.location_id = l.location_id
ORDER BY 1;

SELECT d.department_id, d.department_name, location_id, l.city
FROM departments d JOIN locations l
USING(location_id)
ORDER BY 1;

--매니저의 부서가 60 이상인 부서에 속한 사원들의
--사번, 성, 매니저 사번, 매니저 성 조회 --SELF JOIN
SELECT e.employee_id, e.last_name, m.employee_id manager_employee_id, m.last_name manager_last_name
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
AND m.department_id >= 60
ORDER BY 1;

SELECT e.employee_id, e.last_name, m.employee_id manager_employee_id, m.last_name manager_last_name
FROM employees e JOIN employees m
ON e.manager_id = m.employee_id
WHERE m.department_id > = 60
ORDER BY 1;

--JOIN에 사용하는 테이블이 3개 이상일 경우,
--첫 번째 JOIN의 결과에 두 번째 JOIN을 추가하는 형태로 JOIN형식을 사용한다.
--부서코드 10, 20, 40, 60인 부서에 속한 사원들의
--사번, 성, 부서 코드, 부서명, 업무 코드, 업무 제목 조회
SELECT e.employee_id, d.department_id, d.department_name, j.job_id, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id(+)
AND d.department_id IN (10, 20, 40, 60);

SELECT e.employee_id, d.department_id, d.department_name, j.job_id, j.job_title
FROM employees e JOIN departments d 
ON e.department_id = d.department_id(+)
JOIN jobs j ON e.job_id = j.job_id
WHERE d.department_id IN (10, 20, 40, 60);

SELECT e.employee_id, department_id, d.department_name, job_id, j.job_title
FROM employees e JOIN departments d
USING (department_id)
JOIN jobs j USING (job_id)
WHERE department_id IN (10, 20, 40, 60);