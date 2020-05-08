--1. 성에 대소문자 무관하게 z가 있는 성을 가진 사원들의 
--사번, 성, 부서코드, 부서명 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND LOWER(e.last_name) LIKE '%z%';

--2. 커미션을 받는 사원들의 
--사번, 성, 급여, 커미션요율, 업무제목 조회
SELECT e.employee_id, e.last_name, e.salary, e.commission_pct, j.job_title
FROM EMPLOYEES e, jobs j
WHERE e.job_id = j.job_id
AND e.commission_pct IS NOT NULL;

--3. 커미션을 받는 사원들의 
--사번, 성, 급여, 커미션금액, 부서명 조회
SELECT  e.employee_id, e.last_name, e.salary, 
        e.salary*e.commission_pct comm, d.department_name
FROM EMPLOYEES e, departments d
WHERE e.department_id = d.department_id
AND e.commission_pct IS NOT NULL;

--4. 각 부서에 대한 정보를 파악하고자 한다.
--각 부서의 부서코드, 부서명, 위치코드, 도시를 조회
SELECT d.department_id, d.department_name, l.location_id, l.city
FROM departments d, LOCATIONS l
WHERE d.location_id = l.location_id;


--5. 사번, 성, 부서코드, 부서명, 근무지도시명, 주소 조회

SELECT  e.employee_id, e.last_name, d.department_id, d.department_name
        l.city, l.street_address
FROM EMPLOYEES e, LOCATIONS l, DEPARTMENTS d
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id;

--6. 사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회  --조인조건은 table갯수 -1 만큼 필요!!

SELECT  e.employee_id, e.last_name, d.department_id, d.department_name,
        j.job_id, j.job_title   
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
ORDER BY 1;


--7. 각 부서의 부서코드, 부서명, 위치코드, 도시명, 국가코드, 국가명, 대륙명 조회 

SELECT  d.department_id, d.department_name,
        l.location_id, l.city,
        c.country_id, c.country_name, 
        r.region_name
FROM departments d, locations l, countries c, regions r
WHERE c.country_id = l.country_id
AND d.location_id = l.location_id
AND c.region_id = r.region_id;


