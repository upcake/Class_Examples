모든 사원의 사번, 성, 업무코드, 업무제목 조회
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
ORDER BY 1; 

사번, 성, 부서명, 업무제목 조회
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id
ORDER BY 1; 

모든 사원의 사번, 성, 부서코드, 부서명, 위치코드, 도시 조회
SELECT  e.employee_id, e.last_name, 
        d.department_id, department_name, 
        l.location_id, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
ORDER BY 1;


모든 사원의 사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name, 
        e.job_id, e.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id
ORDER BY 1;

실습
1. 관리자 사번이 149인 사원들의 
사번, 성, 부서코드, 부서명을 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.manager_id = 149;

2. 성에 대소문자 무관하게 a 가 있는 성을 가진 사원들의 
사번, 성, 부서명 조회
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND LOWER(last_name) LIKE '%a%';

3. 커미션을 받는 사원들의 사번, 성, 부서명, 도시명 조회
SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
AND commission_pct IS NOT NULL;

-----------------------------------------------------------------------------
SELECT 절에 사용한 ALIAS 명이나 SELECT 절에서의 위치는 
ORDER BY 절에서만 사용 할 수 있다.
: WHERE 절, GROUP BY 절, HAVING 절에서는 
  SELECT 목록의 컬럼 ALIAS 나 컬럼의 위치를 사용할 수 없다.
-----------------------------------------------------------------------------

부서별 사원들의 정보를 파악하고자 한다.
부서코드가 60 번 이하인 부서에 대해 부서의 평균급여가 5000 이상인 부서만 
부서코드, 사원 수, 급여합계, 급여평균, 최대급여, 최저급여, 
최근입사일자, 최초입사일자 조회
SELECT department_id, COUNT(*) cnt, SUM(salary) sum_sal, 
       ROUND(AVG(salary)) avg_sal,
       MAX(salary) max_sal, MIN(salary) min_sal, 
       MAX(hire_date) max_hire, MIN(hire_date) min_hire
FROM employees
WHERE department_id <= 60
GROUP BY department_id
HAVING AVG(salary) >= 5000        --HAVING department_id <= 60 AND AVG(salary) >= 5000
ORDER BY 1;

업무형태별로 사원들의 정보를 파악하고자 한다.
업무형태별로 사원 수가 10명이상인 업무형태에 대해
업무코드, 업무별사원수, 업무별평균급여, 업무별최대급여, 업무별최소급여, 
업무별최근입사일자, 업무별최초입사일자 조회

SELECT job_id, COUNT(*) cnt, AVG(salary) avg_sal, 
       MAX(salary) max_sal, MIN(salary) min_sal, 
       MAX(hire_date) max_hire, MIN(hire_date) min_hire 
FROM employees
GROUP BY job_id
HAVING COUNT(*) >=10;
--------------------------------------------------------------------------------

5. SELF JOIN
: 하나의 테이블을 두 번 명시하여 동일한 테이블 두 개로부터 JOIN 을 통해 
  데이터를 조회하여 결과를 반환

employees 테이블에는 사원정보, 관리자정보도 있다.
동일한 테이블을 여러 개 준비하여 테이블 조인을 하는 SELF JOIN

모든 사원의 사번, 이름, 매니저사번, 매니저이름 정보를 조회

SELECT  e.employee_id, e.first_name, e.manager_id manager_id, 
        m.first_name manager_name
        --e.manager_id와 m.employee_id는 같음              
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
ORDER BY e.employee_id;

SELECT e.employee_id, e.first_name, 
--     NVL(TO_CHAR(e.manager_id),'없음') manager_id, NVL(m.first_name,'없음') manager_name
       NVL2(TO_CHAR(e.manager_id),TO_CHAR(e.manager_id),'없음') manager_id, NVL(m.first_name,'없음') manager_name
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
ORDER BY e.employee_id;

SELECT e.employee_id, e.first_name, 
       e.manager_id manager_id, m.first_name manager_name
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
ORDER BY 1;

----------------------------------------------------------------
[ 연습문제 5-1 ]                                                                             
1. 이름에 소문자 v가 포함된 모든 사원의 사번, 이름, 부서명을 조회하는 쿼리문을 작성한다.
SELECT e.employee_id, e.first_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND LOWER(first_name) LIKE '%v%'
ORDER BY 1;

2. 커미션을 받는 사원의 사번, 이름, 급여, 커미션 금액, 부서명을 조회하는 쿼리문을 작성한다.
    단, 커미션 금액은 월급여에 대한 커미션 금액을 나타낸다.
SELECT e.employee_id, e.first_name, e.salary, 
       salary*NVL(e.commission_pct,0) comm, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND commission_pct IS NOT NULL
ORDER BY 1;

3. 각 부서의 부서코드, 부서명, 위치코드, 도시명, 국가코드, 국가명을 조회하는 쿼리문을 작성한다.
SELECT d.department_id, d.department_name, l.location_id, l.city, 
       c.country_id, c.country_name
FROM departments d, locations l, countries c
WHERE d.location_id = l.location_id
AND l.country_id = c.country_id;

4. 사원의 사번, 이름, 업무코드, 매니저의 사번, 매니저의 이름, 매니저의 업무코드를 조회하여 
사원의 사번 순서로 정렬하는 쿼리문을 작성한다.
SELECT e.employee_id, e.first_name, e.job_id, e.manager_id, 
       m.first_name manager_name, m.job_id job_id
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
ORDER BY 1;

5. 모든 사원의 사번, 이름, 부서명, 도시, 주소 정보를 조회하여 사번 순으로 정렬하는 쿼리문을 작성한다.
SELECT  e.employee_id, e.first_name, d.department_id, 
        l.city, l.street_address 
FROM employees e, departments d, locations l 
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
ORDER BY 1;

-----------------------------------------------------------------------------------------------
실습
1. 모든 사원의 사번, 성명, 업무코드, 매니저사번, 매니저성명, 매니저의 업무코드 조회하여
사번 순으로 정렬 --SELF JOIN
SELECT e.employee_id, e.first_name||' '||e.last_name name, 
       e.job_id, e.manager_id, 
       m.first_name||' '||m.last_name manager_name, m.job_id
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
ORDER BY 1;

2. 성이 King인 사원들의 사번, 성명, 부서코드, 부서명 조회
SELECT e.employee_id, e.first_name||' '||e.last_name name, 
       d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id= d.department_id(+)
AND LOWER(last_name) LIKE 'king';

3. 위치코드가 1400 인 도시에는 어느 부서가 있나 파악하고자 한다.
위치코드가 1400 인 도시명, 부서명 조회
SELECT l.city, d.department_name
FROM locations l, departments d
WHERE d.location_id = l.location_id     ---순서는 관계없음!
AND d.location_id = 1400;

4. 위치코드 1800 인 곳에 근무하는 사원들의
사번, 성명, 업무코드, 급여, 부서명, 위치코드 조회
SELECT e.employee_id, e.first_name||' '||e.last_name name, e.job_id, e.salary, 
       d.department_name, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND d.location_id = 1800;

5. 자신의 매니저보다 먼저 입사한 사원들의 
사번, 성명, 입사일자, 매니저성명, 매니저 입사일자 조회 --SELF JOIN
SELECT e.employee_id, e.first_name||' '||e.last_name name, e.hire_date, 
       m.first_name||' '||m.last_name manager_name, m.hire_date
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
AND e.hire_date < m.hire_date; --자신의 매니저보다 먼저 입사한 = 자신의 입사일자 < 매니저의 입사일자 ;

6. toronto 에 근무하는 사원들의
사번, 성, 업무코드, 부서코드, 부서명, 도시 조회
SELECT  e.employee_id, e.last_name, e.job_id, 
        d.department_id, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
AND LOWER(city) LIKE '%toronto%';

7. 커미션을 받는 모든 사원들의 성, 부서명, 위치코드, 도시 조회
SELECT  e.last_name, d.department_name, l.location_id, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
AND commission_pct IS NOT NULL; --커미션을 받는;

-----------------------------------------------------------------------------------------------