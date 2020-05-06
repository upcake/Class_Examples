--5. 조인(JOIN) : 연결하다, 잇다, 합쳐지다, 가입하다
--하나의 테이블로부터 데이터를 조회할 수 없는 경우
--여러 개의 테이블로부터 데이터를 조회하는 방법을 JOIN이라고 한다.

SELECT * FROM departments;  --부서 정보, 27개
SELECT * FROM employees;    --사원 정보, 107개
SELECT * FROM jobs;         --업무 정보, 19개

--1. CARTESIAN PRODUCT
--★ WHERE 절에 JOIN 조건을 기술하지 않아 잘못된 데이터 행의 결과를 갖게 되는 현상
--cartesian product, cross join, SQL에서 쓰이는 경우가 없음
--사번, 성, 부서명 조회
SELECT employee_id, last_name, department_name
FROM employees, departments;
--2889행이 출력 (107 * 27 = 2889 ▶ cartesian product)

--2. EQUI JOIN(ANSI에서는 INNER JOIN)
--WHERE 절에 동등 연산자 (=)를 사용하는 JOIN 형식이다.
--★ 즉, 테이블 간에 공통으로 만족되는 값을 가진 경우의 결과를 반환
--※ JOIN 조건 ▶ 칼럼의 값이 같은 칼럼에 대해 조인 조건시 설정 (★ 테이블명.칼럼명 = 테이블명.칼럼명)

--Table = Entity
--테이블 간의 관계도 : Entity Relationship Diagram(ERD)

--※ 테이블 조인 순서
--1. FROM 절에 테이블 목록을 나열하며, 테이블 명에 ALIAS를 지정한다. (코드 라인을 줄이고 가독성을 높이기 위해)
--2. 조인 조건을 WHERE 절에 작성한다.

--------------------------------------------------------------------------------------------------------------------
--※ 쿼리문 작성 순서
--1. 조회할 데이터를 파악한 후 SELECT 절을 작성한다.
--SELECT 칼럼명1, ...
--2. SELECT 절에 나열된 칼럼명들이 어떤 테이블에 있는지 파악한 후 FROM 절을 작성한다.
--FROM 테이블 명
-- - 여러 개의 테이블로부터 데이터를 조회해야 한다면 FROM 절에 컴마(,)로 나열
--3. 특정 조건에 맞는 데이터행을 조회해야 하는 경우 WHERE 절을 작성한다.
--WHERE 조건식
-- - FROM 절에 테입르이 여러 개인 경우 테이블 조인 조건을 작성한다.
-- - WHERE 조인 조건식 ▶ 테이블명.칼럼명 = 테이블명.칼럼명
--WHERE 조인조건식
--AND 일반조건식
--4. SELECT 절에 그룹함수(COUNT, SUM, AVG, MIN, MAX)를 사용한 칼럼 표현이 있는데
--그룹 함수를 사용하지 않은 칼럼 표현도 함께 있다면 GROUP BY 절을 작성한다.
-- - 그룹 함수를 사용하지 않은 칼럼 표현에 대해 모두 GROUP BY 기준으로 명시
--  GROUP BY 그룹 지을 기준 표현
--GROUP BY 절을 사용한 경우 GROUP BY를 통한 여러 결과 데이터행에 대해
-- - 특정 조건에 맞는 데이터행을 조회해야하는 경우 ORDER BY를 사용한다.
-- ORDER BY 정렬 기준표현 오름/내림차순
--SELECT
--FROM
--WHERE
--GROUP BY
--HAVING
--ORDER BY
------------------------------------------------------------------
--예제 1. employees, departments 테이블을 사용하여
--사번, 성, 부서명 정보를 조회
--SELECT e.employee_id, e.last_name, d.department_name -- 정확하게 작성하면 이렇게 되나, 하나 뿐인 칼럼의 경우 이름만 써줘도 된다.
SELECT employee_id, last_name, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

--예제 2. employees, departments 테이블을 사용하여
--사원들의 사번, 성, 부서 코드, 부서명 정보를 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

--예제 3. employees, jobs 테이블을 사용하여
--사번, 성, 업무 코드, 업무 제목 정보를 조회
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id;

--JOIN 하는 대상 테이블이 추가 되면 JOIN 조건을 추가
--WHERE 절에 JOIN 조건과 일반 조건을 함께 사용

--WHERE 조인 조건식에서
--일반적인 조건식과 테이블 조인 조건식이 모두 필요한 경우
-- - WHERE 조인 조건식 AND 일반 조건식

--employees, departments, jobs 테이블을 사용하여
--사번, 성, 부서명, 업무 제목을 조회 --조인 조건은 table 갯수 -1 만큼 필요!
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.job_id = j.job_id
AND e.department_id = d.department_id;

--employees, departments, jobs 테이블을 사용하여
--사번이 101번인 사원의 사번, 이름, 부서명, 업무 제목 정보를 조회
SELECT e.employee_id, e.first_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
AND e.employee_id = 101;

--employees, departments 테이블을 사용하여
--사번이 100, 120, 130, 140인 사원들의
--사번, 성, 부서 코드, 부서명
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.employee_id IN (100, 120, 130, 140)
ORDER BY 1;

--매니저가 없는 사원의 사번, 이름, 업무 제목을 조회한다.
SELECT e.employee_id, e.first_name, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND e.manager_id IS NULL;

--[연습 문제]
--1. 성에 대소문자 무관하게 z가 있는 성을 가진 사원들의
--사번, 성, 부서 코드, 부서명 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND LOWER(e.last_name) LIKE '%z%';

--2. 커미션을 받는 사원들의
--사번, 성, 급여, 커미션 요율, 업무 제목 조회
SELECT e.employee_id, e.last_name, e.salary, e.commission_pct, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.commission_pct IS NOT NULL
ORDER BY 1;

--3. 커미션을 받는 사원들의
--사번, 성, 급여, 커미션 금액, 부서명 조회
SELECT e.employee_id, e.last_name, e.salary, ROUND(e.salary * e.commission_pct, 2) AS comm, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.commission_pct IS NOT NULL
ORDER BY 1;

--4. 각 부서에 대한 정보를 파악하고자 한다.
--각 부서의 부서 코드, 부서명, 위치 코드, 도시를 조회
SELECT d.department_id, d.department_name, l.location_id, l.city
FROM countries c, departments d, locations l
WHERE d.location_id = l.location_id
AND l.country_id = c.country_id
ORDER BY 1;

--5. 사번, 성, 부서 코드, 부서명, 근무지 도시명, 주소 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.city, l.street_address
FROM employees e, departments d, locations l, countries c
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND l.country_id = c.country_id
ORDER BY 1;

--6. 사번, 성, 부서 코드, 부서명, 업무 코드, 업무 제목 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, j.job_id, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
ORDER BY 1;

--7. 각 부서의 부서 코드, 부서명, 위치 코드, 도시명, 국가 코드, 국가명, 대륙명 조회
SELECT d.department_id, d.department_name, l.location_id, l.city, c.country_id, c.country_name, r.region_name
FROM departments d, locations l, countries c, regions r
WHERE d.location_id = l.location_id
AND l.country_id = c.country_id
AND c.region_id = r.region_id
ORDER BY 1;
---------------------------------------------------------------------------
--3. NON-EQUI JOIN
--비교 연산자(<=, >=, <, >), 범위 연산자(BETWEEN), IN 연산자 등의
--동등 연산자(=) 이외의 연산자를 사용하는 JOIN 형식이다.
--JOIN 하는 칼럼이 일치하지 않게 사용하는 JOIN 조건으로 거의 사용하지 않는다.

--employees, jobs 테이블을 이용하여
--급여가 최고 최저 급여 범위 내에 있는 10번 부서원의
--사번, 이름, 급여, 업무 제목을 조회한다.
SELECT e.employee_id, e.first_name, e.salary, j.job_title
FROM employees e, jobs j
WHERE e.salary BETWEEN j.min_salary AND j.max_salary
AND e.department_id = 10;

------------------------------------------------------------------------------------------
--4. OUTER JOIN : NULL 값이 생략되는 정보도 퐇마해서 표시하기 위한 조인
--EQUI JOIN은 조인 조건에 동등비교연산자로 비교한 형태,
--즉, 테이블들 간에 공통으로 만족되는 값을 가진 경우의 결과를 반환

--하지만 OUTER JOIN 쿼리문은 만족되는 값이 없는 경우의 결과까지 반환한다.
--만족되는 값이 없는 테이블 칼럼에 (+)기호를 표시한다.
--즉, 데이터행의 누락이 발생하지 않도록 하기 위한 조인 기법
--★ (+)기호를 데이터행이 부족한 조인 조건쪽에 붙여준다.

--사원 테이블에는 부서배치 받지 않은 사원 데이터행(NULL)이 있고
--부서 테이블에서 부서 코드가 NULL인 것에 대한 데이터행이 없으므로
--부서 테이블의 부서 코드 쪽에 OUTER 기호를 붙인다.
--(데이터가 없을 수도 있는 쪽 JOIN 칼럼에 (+)를 추가)

--등호의 오른쪽에 (+)가 붙으면 오른쪽 테이블에 null이 허용되어 LEFT OUTER JOIN
--등호의 왼쪽에 (+)가 붙으면 왼쪽 테이블에 null이 허용되어 RIGHT OUTER JOIN

--모든 사원의, 사번, 성, 부서 코드, 부서명 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
--WHERE e.department_id = d.department_id; -- 107명중 부서 코드가 없는 1명이 제외되어 106명만 표시된다.
WHERE e.department_id = d.department_id(+);

SELECT COUNT(job_id) FROM jobs; -- 19, 그룹 함수 NULL 금지
SELECT COUNT(DISTINCT job_id) FROM employees; -- 19, DISTINCT NULL 허용
--모든 사원의 사번, 성, 업무 코드, 업무 제목 조회
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
ORDER BY 1;

--사번, 성, 부서명, 업무 제목 조회
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id;