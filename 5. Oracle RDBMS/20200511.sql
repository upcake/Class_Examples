--ANSI JOIN 연습 문제, INNER JOIN만
--01. 사번, 성, 부서코드, 부서명, 위치코드, 도시 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.location_id, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+);

SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.location_id, l.city
FROM employees e JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

SELECT e.employee_id, e.last_name, department_id, d.department_name, location_id, l.city
FROM employees e JOIN departments d USING(department_id)
JOIN locations l USING(location_id);

--02. 사번이 110, 130, 150 인 사원들의 사번, 성, 부서명 조회하는 ANSI조인형식
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE employee_id IN(110, 130, 150)
AND e.department_id = d.department_id;

SELECT e.employee_id, e.last_name, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE employee_id IN(110, 130, 150);

SELECT e.employee_id, e.last_name, d.department_name
FROM employees e JOIN departments d
USING(department_id)
WHERE employee_id IN(110, 130, 150);

--03. 사번, 성명, 관리자사번, 관리자 성명, 관리자업무코드 조회하는 ANSI 형식
SELECT e.employee_id, e.first_name ||' '|| e.last_name name, e.manager_id,
       m.first_name ||' '|| m.last_name manager_name, m.job_id manager_job_id
FROM employees e, employees m
WHERE e.manager_id = m.employee_id;

SELECT e.employee_id, e.first_name ||' '|| e.last_name name, e.manager_id,
       m.first_name ||' '|| m.last_name manager_name, m.job_id manager_job_id
FROM employees e JOIN employees m
ON e.manager_id = m.employee_id;

--04. 성이 king 인 사원의 사번, 성명, 부서코드, 부서명 ANSI 형식
SELECT e.employee_id, e.first_name ||' '|| e.last_name name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND LOWER(e.last_name) = 'king';

SELECT e.employee_id, e.first_name ||' '|| e.last_name name, d.department_id, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE LOWER(e.last_name) = 'king';

SELECT e.employee_id, e.first_name ||' '|| e.last_name name, department_id, d.department_name
FROM employees e JOIN departments d
USING(department_id)
WHERE LOWER(e.last_name) = 'king';

--05. 관리자 사번이 149 번인 사원의 사번, 성, 부서코드, 부서명 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.manager_id = 149;

SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE e.manager_id = 149;

SELECT e.employee_id, e.last_name, department_id, d.department_name
FROM employees e JOIN departments d
USING(department_id)
WHERE e.manager_id = 149;

--06. 위치코드 1400인 도시명, 부서명 조회
SELECT l.city, d.department_name
FROM departments d, locations l
WHERE d.location_id = l.location_id
AND l.location_id = 1400;

SELECT l.city, d.department_name
FROM departments d JOIN locations l
ON d.location_id = l.location_id
WHERE l.location_id = 1400;

SELECT l.city, d.department_name
FROM departments d JOIN locations l
USING(location_id)
WHERE location_id = 1400;

--07. 위치코드 1800에 근무하는 사원들의 사번, 성, 업무코드, 부서명, 위치코드 조회
SELECT e.employee_id, e.last_name, e.job_id, d.department_name, l.location_id
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND l.location_id = 1800;

SELECT e.employee_id, e.last_name, e.job_id, d.department_name, l.location_id
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
WHERE l.location_id = 1800;

SELECT e.employee_id, e.last_name, e.job_id, d.department_name, location_id
FROM employees e JOIN departments d
USING(department_id)
JOIN locations l
USING(location_id)
WHERE location_id = 1800;

--08. 성에 대소문자 무관하게 z가 있는 사원들의 사번, 성, 부서명 조회
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND LOWER(e.last_name) LIKE '%z%';

SELECT e.employee_id, e.last_name, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE LOWER(e.last_name) LIKE '%z%';

SELECT e.employee_id, e.last_name, d.department_name
FROM employees e JOIN departments d
USING(department_id)
WHERE LOWER(e.last_name) LIKE '%z%';

--09. 관리자보다 먼저 입사한 사원의 사번, 성, 입사일자, 관리자사번, 관리자성, 관리자입사일자 조회
SELECT e.employee_id, e.last_name, e.hire_date, e.manager_id,
       m.last_name manager_last_name, m.hire_date manager_hire_date
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
AND e.hire_date < m.hire_date;

SELECT e.employee_id, e.last_name, e.hire_date, e.manager_id,
       m.last_name manager_last_name, m.hire_date manager_hire_date
FROM employees e JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date;

--10. 업무코드가 clerk종류의 업무형태인 사원들의 사번, 성, 부서명, 업무제목 조회
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
AND LOWER(j.job_id) LIKE '%clerk%';

SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN jobs j
ON e.job_id = j.job_id
WHERE LOWER(j.job_id) LIKE '%clerk%';

SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e JOIN departments d
USING(department_id)
JOIN jobs j
USING(job_id)
WHERE LOWER(job_id) LIKE '%clerk%';

--11. toronto 에 근무하는 사번, 성, 부서코드, 부서명, 도시명 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND LOWER(l.city) = 'toronto';

SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.city
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
WHERE LOWER(l.city) = 'toronto';
----------------------------------------------------------------------------------------------
--2. OUTER JOIN : 오라클에서 기호 (+)를 사용하는 OUTER JOIN, 합집합
--FROM 절에 LEFT OUTER JOIN / RIGHT OUTER JOIN을 사용하고
--JOIN 조건은 ON절에 명시한다.
--기준이 되는 테이블 방향으로 조인한다.

--예제 01. 모든 사원들의 사번, 성, 부서 코드, 부서명 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e LEFT JOIN departments d
--FROM departments d RIGHT JOIN employees e
ON e.department_id = d.department_id;

--문제 01. 모든 사원들의 사번, 성, 부서 코드, 부서명, 도시 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+);

SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.city
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id;

SELECT e.employee_id, e.last_name, department_id, d.department_name, l.city
FROM employees e LEFT JOIN departments d
USING(department_id)
LEFT JOIN locations l
USING(location_id);

--문제 02. 모든 사원들의 사번, 성, 매니저 사번, 매니저 성 조회
SELECT e.employee_id, e.last_name, e.manager_id, m.last_name manager_last_name
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+);

SELECT e.employee_id, e.last_name, e.manager_id, m.last_name manager_last_name
FROM employees e LEFT JOIN employees m
ON e.manager_id = m.employee_id;

--OUTER JOIN 연습 문제
--01. 모든 사원의 사번, 성, 부서명, 조회
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT JOIN departments d
--FROM departments d RIGHT JOIN employees e
ON e.department_id = d.department_id;

--02. 모든 사원의 사번, 성, 부서명, 업무명 조회
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e LEFT JOIN departments d 
ON e.department_id = d.department_id
LEFT JOIN jobs j
ON e.job_id = j.job_id;

--03. 모든 사원의 사번, 성, 부서명, 도시명 조회
SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id;

--04. 관리자 사번이 149번인 모든 사원의 사번, 성, 부서명 조회
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE e.manager_id = 149;

--05. 커미션을 받는 모든 사원들의 사번, 성, 부서명, 도시명 조회
SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id
WHERE e.commission_pct IS NOT NULL;

--06. 모든 부서에 대해 부서 코드, 부서명, 도시명, 국가명, 대륙명 조회
SELECT d.department_id, d.department_name, l.city, c.country_name, r.region_name
FROM departments d LEFT JOIN locations l
ON d.location_id = l.location_id
LEFT JOIN countries c
ON l.country_id = c.country_id
LEFT JOIN regions r
ON c.region_id = r.region_id;

--07. 사원들이 근무하는 부서와 그 부서에 사원이 몇 명이나 있나 파악하고자 한다.
--부서 코드, 부서명, 사원 수 조회
SELECT d.department_id, d.department_name, COUNT(*) cnt
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
ORDER BY 1;