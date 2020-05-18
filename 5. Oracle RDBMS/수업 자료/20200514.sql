4. 상호연관 서브 쿼리 : 메인쿼리의 컬럼이 서브 쿼리의 조건절에 사용되는 형태
- 메인쿼리의 값을 서브 쿼리에 주고, 서브 쿼리의 결과 값을 받아서 메인쿼리로 반환해서 
  수행하는 쿼리
- 메인쿼리의 컬럼이 서브 쿼리의 조건절에 사용되어 메인쿼리에 독립적이지 않은 형식
- 메인 테이블과 서브 쿼리 테이블 간의 JOIN 조건이 사용됨.
- 메인 쿼리와 서브 쿼리가 계속 정보를 주고 받는다는 의미

★ 메인쿼리의 컬럼이 서브 쿼리의 조건절에 사용되는 
  상호연관 서브 쿼리의 형태로 사용된다.(WHERE 절에서 사용)
- 스칼라 서브 쿼리에서 다룰 예정
                          
5. 스칼라 서브 쿼리 : SELECT 문에 사용 , 단일(결과)행, 단일컬럼만 조회가능, 
   Scalar : (크기)하나, Vector : 크기와 방향
- 단순한 그룹함수의 결과를  SELECT 절에서 조회하고자 할때
- SELECT 문에 서브 쿼리를 사용하여 하나의 컬럼처럼 사용하기 위한 목적(표현 용도)
- 조인(Join)의 대체 표현식으로도 자주 사용  
- 코드성 데이터를 조회하고자 할때   


1) 단순한 그룹함수의 결과값을 SELECT 절에 조회하고자 할때

01. 각 사원의 급여 수준을 파악하고자 한다.
모든 사원의 사번, 성, 급여, 회사평균급여, 회사최대급여 조회

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
SELECT employee_id, last_name, salary, 
       ROUND(AVG(salary)) avg_sal,
       MAX(salary) max_sal
FROM employees
GROUP BY employee_id, last_name, salary; --xxxx, 결과에서 SALARY, AVG_SAL, MAX_SAL 비교해보기
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

SELECT ROUND(AVG(salary)) avg_sal --6462
FROM employees; 

○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○
SELECT employee_id, last_name, salary, 
       ( SELECT ROUND(AVG(salary)) FROM employees ) avg_sal,
       ( SELECT MAX(salary) FROM employees ) max_sal
FROM employees;
○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

SELECT 절에 그룹함수를 쓰게 되면 나머지 그룹함수 이외의 컬럼은 
GROUP BY 절을 사용하거나 그룹함수만 들어갈 수 있다.

2) 코드성 데이터를 SELECT 절에 조회하고자 할 때 : 상호연관 서브 쿼리, Outer Join 사용한것 처럼

01. 모든 사원의 사번, 성, 부서코드, 부서명 조회1

일반 쿼리
SELECT employee_id, last_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
ORDER BY 1;

상호연관 서브 쿼리 : 메인쿼리의 컬럼이 서브 쿼리의 조건절에 사용되는 형태
모든 사원의 사번, 성, 부서코드, 부서명 조회2 ( 스칼라 서브 쿼리로 "부서명" 구하기 )
SELECT employee_id, last_name, department_id, 
       ( SELECT department_name 
         FROM departments d
         WHERE department_id = e.department_id ) department_name --e.department_id 사용
FROM employees e;

02. 모든 사원의 사번, 성, 부서코드, 업무코드, 업무제목 조회 ( 스칼라 서브 쿼리로 "업무제목" 구하기 )

일반 쿼리
SELECT employee_id, last_name, department_id, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id;

상호연관 서브 쿼리
SELECT employee_id, last_name, department_id, job_id,
       ( SELECT job_title 
         FROM jobs 
         WHERE job_id = e.job_id ) job_title
FROM employees e;       

03. 각 부서에 대해 부서코드, 부서명, 도시를 조회 ( 스칼라 서브 쿼리로 "도시" 구하기 )

일반 쿼리
SELECT department_id, department_name,  l.city
FROM departments d, locations l
WHERE d.location_id = l.location_id(+);

상호연관 서브 쿼리
SELECT department_id, department_name, 
       ( SELECT city 
         FROM locations 
         WHERE location_id = d.location_id ) city
FROM departments d;

04. 모든 사원들의 사번, 성, 급여, 부서코드, 부서명, 업무코드 조회

일반 쿼리
SELECT employee_id, last_name, salary, e.department_id, 
       department_name, job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

상호연관 서브 쿼리 ( 스칼라 서브 쿼리로 "부서명" 구하기 )
SELECT employee_id, last_name, salary, department_id,
       ( SELECT department_name 
         FROM departments 
         WHERE department_id = e.department_id ) department_name,
         job_id
FROM employees e;

ANSI 쿼리
SELECT employee_id, last_name, salary, department_id, 
       department_name, job_id
FROM employees e LEFT OUTER JOIN departments d
USING (department_id);
 
05. 각 부서에 대해 부서코드, 부서명, 위치코드, 도시명 조회

일반 쿼리
SELECT department_id, department_name, d.location_id, city
FROM departments d, locations l
WHERE d.location_id = l.location_id(+);

ANSI 쿼리
SELECT department_id, department_name, location_id, city
FROM departments d LEFT OUTER JOIN locations l
USING (location_id);

상호연관서브 쿼리( 스칼라 서브 쿼리로 "도시" 구하기 )
SELECT department_id, department_name, location_id, 
       ( SELECT city 
         FROM locations 
         WHERE location_id = d.location_id ) city
FROM departments d;

06. 각 부서별 부서코드, 부서평균급여 조회
일반 쿼리
SELECT department_id, ROUND(AVG(salary)) avg_sal
FROM employees
GROUP BY department_id;

상호연관서브 쿼리( 스칼라 서브 쿼리로 "평균급여" 구하기 )
SELECT department_id, 
       ( SELECT ROUND(AVG(salary)) 
         FROM employees
         WHERE department_id = e.department_id ) avg_sal
FROM employees e
GROUP BY department_id;

07. 각 사원에 대해 사원이 소속된 부서의 급여정보 대비 사원의 급여를 파악하고자 한다.
사번, 성, 부서코드, 급여, 각 사원이 속한 부서의 평균급여 조회
                          ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                         
SELECT employee_id, last_name, department_id, salary, ROUND(AVG(salary)) avg_sal --xxxx
FROM employees
GROUP BY employee_id, last_name, department_id, salary;
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

SELECT employee_id, last_name, department_id, salary, 
       ( SELECT ROUND(AVG(m.salary)) 
         FROM employees m
         WHERE m.department_id = e.department_id ) dept_avg_sal
FROM employees e;



6. FROM절에 사용하는 인라인뷰 서브 쿼리
SELECT 절의 결과를 FROM 절에서 하나의 테이블처럼 사용(테이블 대체 용도)
--FROM 절에 사용하는 인라인 뷰 서브 쿼리에서 그룹함수는 반.드.시 alias 지정해야 함!!!!

01. 우리회사 사원들의 급여정보를 관리한 테이블이 있다.
우리 회사 최대급여, 최소급여, 평균급여
SELECT  MAX(salary) max_sal, 
        MIN(salary) min_sal, 
        ROUND(AVG(salary)) avg_sal
FROM employees;

MAX_SAL    MIN_SAL    AVG_SAL
---------- ---------- ----------
24000      2100       6462
     
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

02. 우리회사 사원들의 급여정보를 관리한 테이블이 있다.
사번, 성, 급여, 최대급여, 최소급여를 조회
SELECT employee_id, last_name, salary, 
       MAX(salary) max_sal, 
       MIN(salary) min_sal, 
       ROUND(AVG(salary)) avg_sal --xxxx
FROM employees
GROUP BY employee_id, last_name, salary
ORDER BY 1;

EMPLOYEE_ID LAST_NAME  SALARY   MAX(SALARY) MIN(SALARY) ROUND(AVG(SALARY))
--------------------------------------------------------------------------
100         King       24000    24000       24000       24000  --개인의 salary가 max, min, avg xxx
101         Kochhar    17000    17000       17000       17000
102         De Haan    17000    17000       17000       17000
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

스칼라 서브 쿼리
SELECT employee_id, last_name, salary, 
       ( SELECT MAX(salary) FROM employees ) max_sal,
       ( SELECT MIN(salary) FROM employees ) min_sal,
       ( SELECT ROUND(AVG(salary)) FROM employees ) avg_sal       
FROM employees;

인라인뷰 서브 쿼리
SELECT employee_id, last_name, salary, max_sal, min_sal, avg_sal
FROM employees, ( SELECT MAX(salary) max_sal, --회사의 최대급여, 최소급여, 평균급여를 테이블처럼 사용
                  MIN(salary) min_sal, 
                  ROUND(AVG(salary)) avg_sal
                  FROM employees );
--FROM 절에 사용하는 인라인 뷰 서브 쿼리에서 그룹함수는 반.드.시 alias 지정해야 함!!!!
 
EMPLOYEE_ID  LAST_NAME  SALARY    MAX_SAL    MIN_SAL  AVG_SAL
-------------------------------------------------------------
100          King       24000     24000      2100     6462
:            :          :         :          :        :
 
03. 사원이 받는 급여가 회사평균급여 이상 최대급여 이하에 해당하는 사원들의
사번, 성, 급여, 우리회사최대급여, 우리회사최소급여, 우리회사평균급여

스칼라 서브 쿼리
SELECT employee_id, last_name, salary, 
       ( SELECT MAX(salary) FROM employees ) max_sal,
       ( SELECT MIN(salary) FROM employees ) min_sal,
       ( SELECT ROUND(AVG(salary)) FROM employees ) avg_sal
FROM employees
WHERE salary BETWEEN ( SELECT ROUND(AVG(salary)) FROM employees ) 
             AND     ( SELECT MAX(salary) FROM employees );       

인라인 뷰 서브 쿼리
SELECT employee_id, last_name, salary, max_sal, min_sal, avg_sal
FROM employees, ( SELECT MAX(salary) max_sal, 
                         MIN(salary) min_sal,
                         ROUND(AVG(salary)) avg_sal 
                  FROM employees )
                --FROM 절에 사용하는 인라인 뷰 서브 쿼리에서 그룹함수는 반.드.시 alias 지정해야 함!!!!
                --부서별 최대급여, 최소급여, 평균급여를 테이블처럼 사용
WHERE salary BETWEEN avg_sal AND max_sal;
                -- 그 후 평균급여와 최대급여 사이를 쿼리함. 

04. 각 부서별로 가장 많은 급여를 받는 사원들의
사번, 성, 부서코드, 급여 조회

각 부서별로 가장 많은 급여
SELECT department_id, MAX(salary) max_sal
FROM employees 
GROUP BY department_id;

다중컬럼 서브 쿼리
SELECT employee_id, last_name, department_id, salary
FROM employees
WHERE (NVL(department_id, 0), salary) IN ( SELECT NVL(department_id, 0), MAX(salary) 
                                           FROM employees 
                                           GROUP BY department_id )
ORDER BY 3;

인라인 뷰 서브 쿼리
SELECT employee_id, last_name, e.department_id, salary
FROM employees e, ( SELECT department_id, MAX(salary) max_sal 
                    FROM employees 
                    GROUP BY department_id ) m
WHERE NVL(e.department_id, 0) = NVL(m.department_id, 0)
AND e.salary = m.max_sal
ORDER BY 3;

05. 우리회사 사원들의 급여정보를 관리한 테이블이 있다.
사번, 성, 부서코드, 급여, 부서원수, 부서최대급여, 부서최소급여, 부서평균급여 조회

인라인 뷰 서브 쿼리
SELECT employee_id, last_name, e.department_id, salary,
       cnt, max_sal, min_sal, avg_sal
FROM employees e, ( SELECT  COUNT(*) cnt, 
                            MAX(salary) max_sal, 
                            MIN(salary) min_sal, 
                            ROUND(AVG(salary)) avg_sal,
                            department_id
                    FROM employees
                    GROUP BY department_id ) d
WHERE NVL(e.department_id, 0) = NVL(d.department_id, 0);

