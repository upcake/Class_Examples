5. 조인(JOIN)
하나의 테이블로부터 데이터를 조회할 수 없는 경우
여러개의 테이블로부터 데이터를 조회하는 방법을 JOIN이라고 한다.

부서정보를 가지고  있는 테이블: departments
SELECT * 
FROM departments; --27개

사원정보를 가지고 있는 테이블: employees
SELECT * 
FROM employees;  --107개

업무정보를 가지고 있는 테이블 : jobs
SELECT * 
FROM jobs;  --19개
------------------------------------------------------------------
1. CARTESIAN PRODUCT
★ WHERE 절에 JOIN 조건을 기술하지 않아 잘못된 데이터행의 결과를 갖게 되는 현상: 
cartesian product, cross join, SQL에서 쓰이는 경우가 없음

사번, 성, 부서명 조회
SELECT employee_id, last_name, department_name
FROM employees, departments;

employees: 107 *departments : 27 = 2889
107 * 27 = 2889 => cartesian product

업무코드, 업무명, 부서코드, 부서명
SELECT job_id, job_title, department_id, department_name
FROM jobs, departments;

jobs: 19 *  departments : 27 = 513
19 * 27 = 513 => cartesian product

------------------------------------------------------------------
2. EQUI JOIN(ANSI에서는 INNER JOIN)
: WHERE 절에 동등 연산자 (=)를 사용하는 JOIN 형식이다.
★★★★★즉, 테이블들 간에 공통으로 만족되는 값을 가진 경우의 결과를 반환

※ JOIN 조건 ☞ 컬럼의 값이 같은 컬럼에 대해 조인조건식 설정(★테이블명.컬럼명 = 테이블명.컬럼명 을 사용)

Table = Entity
테이블간의 관계도: Entity Relationship Diagram(ERD)

정확성, 정합성, 무결성 문제

사원테이블                  부서테이블
성명        부서번호        부서번호 부서명
홍길동      10              10        영업부
심청        20              20        개발부
전우치      10                    


※ 테이블조인 순서
1. FROM 절에 테이블 목록을 나열하며, 테이블명에 ALIAS 를 지정한다.
    (코드 라인을 줄이고 가독성을 높이기 위해)
2. 조인조건을 WHERE 절에 작성한다.

-----------------------------------------------------------------------------------
※ 쿼리문 작성순서

1. 조회할 데이터를 파악한 후 SELECT절을 작성한다. 
   SELECT 컬럼명1, ...
2. SELECT 절에 나열된 컬럼명들이 어떤 테이블에 있는지 파악한 후 FROM 절을 작성한다.
   FROM 테이블명
 - 여러 개의 테이블로부터 데이터를 조회해야 한다면 FROM 절에 컴마(,)로 나열
   FROM 테이블명1, 테이블명2
3. 특정조건에 맞는 데이터행을 조회해야하는 경우 WHERE 절을 작성한다.
   WHERE 조건식
 - FROM 절에 테이블이 여러 개인 경우 테이블조인조건을 작성한다.
   WHERE 조인조건식 --★테이블명.컬럼명 = 테이블명.컬럼명
 - 일반적인 조건식과 테이블조인 조건식이 모두 필요한 경우 
   WHERE 조인조건식 
   AND 일반 조건식
4. SELECT 절에 그룹함수(COUNT, SUM, AVG, MAX, MIN) 를 사용한 컬럼표현이 있는데 
   그룹함수를 사용하지 않은 컬럼표현도 함께 있다면 GROUP BY 절을 작성한다.
 - 그룹함수를 사용하지 않은 컬럼표현에 대해 모두 GROUP BY 기준으로 명시
   GROUP BY 그룹지을기준표현
 GROUP BY 절을 사용한 경우 GROUP BY 를 통한 여러 결과데이터행에 대해 
 - 특정조건에 맞는 데이터행을 조회해야하는 경우
   HAVING 조건식- 조건식: 기본적인 조건식, 그룹함수표현  
   --★WHERE 조건절에서는 그룹함수표현 사용 못 함! 
6. 조회한 결과데이터행에 대해 정렬해야하는 경우 ORDER BY 절을 작성한다.
   ORDER BY 정렬기준표현 오름/내림차순

내부 해석 순서
SELECT
1.FROM 
2.WHERE
3.GROUP BY
4.HAVING 
6.ORDER BY;

-----------------------------------------------------------------------------------
employees, departments 테이블을 사용하여 
사번, 성, 부서명 정보를 조회
SELECT employee_id, last_name, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id  -- 사원테이블의 부서코드 = 부서테이블의 부서코드;
ORDER BY 3 ;

employees, departments 테이블을 사용하여 
사원들의 사번, 성, 부서코드, 부서명 정보를 조회     
SELECT employee_id, last_name,
       e.department_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id   --사원테이블의 부서코드 = 부서테이블의 부서코드;
ORDER BY 1;

employees, jobs 테이블을 사용하여 
사번, 성, 업무코드, 업무제목 정보를 조회
SELECT employee_id, last_name, e.job_id, job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id --사원테이블의 업무코드 = 업무테이블의 업무코드
ORDER BY 1;

JOIN 하는 대상 테이블이 추가되면 JOIN 조건을 추가
WHERE 절에 JOIN 조건과 일반 조건을 함께 사용

WHERE 조인조건식에서 
일반적인 조건식과 테이블조인조건식이 모두 필요한 경우 
☞ WHERE 조인조건식 AND 일반 조건식

employees, departments, jobs 테이블을 사용하여 
사번, 성, 부서명, 업무제목을 조회    --조인조건은 table갯수 -1 만큼 필요!!
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;

employees, departments, jobs 테이블을 사용하여 
사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회
SELECT employee_id, last_name, e.department_id,
       department_name, e.job_id, job_title
FROM employees e, departments d, jobs j
WHERE e.department_id=d.department_id
AND e.job_id = j.job_id
ORDER BY 1  ;

employees, departments, jobs 테이블을 사용하여 
사번이 101번인 사원의 사번, 이름, 부서명, 업무제목 정보를 조회
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
AND e.employee_id = 101;

employees, departments 테이블을 사용하여 
사번이 100, 120, 130, 140인 사원들의
사번, 성, 부서코드, 부서명
SELECT employee_id, last_name, e.department_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND employee_id IN (100,120,130,140);


매니저가 없는 사원의 사번, 이름, 업무제목을 조회한다.
SELECT e.employee_id, e.first_name, j.job_title
FROM employees e, jobs j
WHERE manager_id IS NULL
AND e.job_id = j.job_id;


-----------------------------------------------------------
실습

성에 대소문자 무관하게 z가 있는 성을 가진 사원들의 
사번, 성, 부서코드, 부서명 조회
SELECT employee_id, last_name, d.department_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND LOWER(last_name) LIKE '%z%'; --성에 대소문자 무관하게 z가 있는 성;
     
커미션을 받는 사원들의 
사번, 성, 급여, 커미션요율, 업무제목 조회
SELECT employee_id, last_name, salary, commission_pct com, job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND commission_pct IS NOT NULL; --커미션을 받는 사원들

커미션을 받는 사원들의 
사번, 성, 급여, 커미션금액, 부서명 조회
SELECT employee_id, last_name, salary, 
       salary*commission_pct com, department_name 
FROM employees e, departments d
WHERE e.department_id =  d.department_id 
AND commission_pct IS NOT NULL;

각 부서에 대한 정보를 파악하고자 한다.
각 부서의 부서코드, 부서명, 위치코드, 도시를 조회
SELECT department_id, department_name, l.location_id, city
FROM departments d, locations l
WHERE d.location_id = l.location_id
ORDER BY 1;

사번, 성, 부서코드, 부서명, 근무지도시명, 주소 조회
SELECT employee_id, last_name, e.department_id, 
       department_name, city, street_address
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id 
AND d.location_id =  l.location_id;

사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회  --조인조건은 table갯수 -1 만큼 필요!!
SELECT employee_id, last_name, 
       e.department_id, department_name, j.job_id, job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id 
AND e.job_id = j.job_id 
ORDER BY 1;

각 부서의 부서코드, 부서명, 위치코드, 도시명, 국가코드, 국가명, 대륙명 조회 
-- 각 부서에 대해라고 했으므로 employees 테이블 필요없음
SELECT department_id, department_name, d.location_id, city, 
       l.country_id, country_name, region_name
FROM departments d, locations l, countries c, regions r 
WHERE d.location_id = l.location_id
AND l.country_id = c.country_id
AND c.region_id = r.region_id
ORDER BY 1;

------------------------------------------------------------------
3. NON-EQUI JOIN
: 비교연산자(<=, >=, <, >), 범위연산자(BETWEEN), IN 연산자 등의 
동등 연산자 (=) 이외의 연산자를 사용하는 JOIN 형식이다.
JOIN 하는 컬럼이 일치하지 않게 사용하는 JOIN 조건으로 거의 사용하지 않는다.

employees, jobs 테이블을 이용하여 --JOBS테이블 확인
급여가 최고최저 급여 범위 내에 있는 10번 부서원의 
사번, 이름, 급여, 업무제목을 조회한다.
SELECT employee_id, last_name, salary, job_title
FROM employees, jobs
WHERE salary BETWEEN min_salary AND max_salary
AND department_id = 10;

SELECT e.employee_id, e.last_name, e.salary, j.job_title
FROM employees e, jobs j
WHERE e.salary BETWEEN j.min_salary AND j.max_salary
AND department_id = 10;

-----------------------------------------------------------------
4. OUTER JOIN : NULL 값이 생략되는 정보도 포함해서 표시하기 위한 조인 
EQUI JOIN은 조인조건에 동등비교연산자로 비교한 형태, 
즉, 테이블들 간에 공통으로 만족되는 값을 가진 경우의 결과를 반환

하지만 OUTER JOIN 쿼리문은 만족되는 값이 없는 경우의 결과까지 반환한다.
만족되는 값이 없는 테이블 컬럼에 (+) 기호를 표시한다.
즉, 데이터행의 누락이 발생하지 않도록 하기 위한 조인기법
:★  (+)기호를 데이터행이 부족한 조인조건쪽에 붙여준다.

사원테이블에는 부서배치 받지 않은 사원 데이터행(NULL)이 있고
부서테이블에서 부서코드가 NULL 인것에 대한 데이터행이 없으므로
(데이터가 없을 수도 있는 쪽 JOIN 컬럼에 (+)를 추가)
부서테이블의 부서코드 쪽에 OUTER 기호를 붙인다.

등호의 오른쪽에 (+)가 붙으면 오른쪽 테이블에 null이 허용되어 LEFT OUTER JOIN
등호의 왼쪽에 (+)가 붙으면 왼쪽 테이블에 null이 허용되어 RIGHT OUTER JOIN


---------------------------------------------------------------------------
사원테이블        부서테이블(departments(+))       위치테이블(locations(+))
사번 부서코드     부서코드   부서명    위치코드    위치코드 부서위치
100  10           10         영업부    1600        1600     Seattle
101  20           20         총무부    1700        1700     Paris
178  NULL         NULL       NULL      NULL     
---------------------------------------------------------------------------

모든 사원의 사번, 성, 부서코드, 부서명 조회
SELECT employee_id, last_name, e.department_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
ORDER BY 1; 

SELECT COUNT(job_id)
FROM jobs; --19

SELECT COUNT(DISTINCT job_id)
FROM employees; --19

모든 사원의 사번, 성, 업무코드, 업무제목 조회
SELECT employee_id, last_name, j.job_id, job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
ORDER BY 1; 

사번, 성, 부서명, 업무제목 조회
SELECT employee_id, last_name, department_name, job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id =j.job_id
ORDER BY 1; 