04. 근무지의 국가코드가 UK(즉, country_id가 UK)인 곳에 있는 부서의 
부서코드, 위치코드, 부서명 조회

근무지의 국가코드가 UK 인 곳에 있는 부서
SELECT location_id --결과가 여러개 2400, 2500, 2600
FROM locations 
WHERE LOWER(country_id) = 'uk';  

일반조인
SELECT d.department_id, d.location_id, d.department_name
FROM departments d, locations l
WHERE d.location_id =  l.location_id
AND LOWER(l.country_id)='uk';   

다중(결과)행 서브쿼리
SELECT department_id, location_id, department_name
FROM departments
WHERE location_id IN ( SELECT location_id
                       FROM locations 
                       WHERE LOWER(country_id) = 'uk' );
--WHERE location_id  = (근무지의 국가코드가 UK 인 곳에 있는 부서);
   
05. 성에 대소문자 무관하게 z 가 포함된 성을 가진 사원들과 같은 부서에 속한 
사원들의 사번, 성명, 부서코드, 업무코드 조회

-----------------------------------------------------------------------------------------------
★★★★비교. 성에 대소문자 무관하게 z가 포함된 성을 가진 사원들의 
사번, 성명, 부서코드, 업무코드 조회
SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, job_id
FROM employees
WHERE LOWER(last_name) LIKE '%z%'; --성에 대소문자 무관하게 z가 있는 성;
-----------------------------------------------------------------------------------------------

성에 대소문자 무관하게 z 가 포함된 사원과 같은 부서
SELECT department_id, last_name --부서가 60, 80, 110
FROM employees
WHERE LOWER(last_name) LIKE '%z%';

SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, job_id
FROM employees
WHERE department_id IN ( SELECT department_id 
                         FROM employees
                         WHERE LOWER(last_name) LIKE '%z%' );
--WHERE department_id = --성에 대소문자 무관하게 z 가 포함된 사원과 같은 부서에 속한


06. 60번 부서원들과 같은 급여를 받는 사원들의 
사원들의 사번, 성, 급여, 부서코드 조회

60번 부서원 급여
SELECT salary --결과가 여러개 : 9000, 6000, 4800, 4200
FROM employees 
WHERE department_id = 60;

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary IN ( SELECT salary 
                  FROM employees 
                  WHERE department_id = 60 );

07. 60번 부서에 속하지 않으면서
60번 부서원들과 같은 급여를 받는 사원들의 
사번, 성, 급여, 부서코드 조회
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary IN ( SELECT salary 
                  FROM employees 
                  WHERE department_id = 60 )
AND department_id != 60;
--AND department_id <> 60;
--AND department_id NOT IN(60);

08. 우리회사 사원들 중 부서명이 Marketing이거나 IT에 속한 사원들의
사번, 성, 부서코드 조회

부서명이 Marketing이거나 IT인 사원의 부서코드
SELECT department_id --20, 60
FROM departments 
WHERE department_name IN ('Marketing', 'IT');
                         
SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id IN ( SELECT department_id 
                         FROM departments 
                         WHERE department_name IN ('Marketing', 'IT') );
-----------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------
3. 다중컬럼 서브쿼리 - 서브쿼리의 결과컬럼이 여러 컬럼인 경우
- 다중컬럼을 pair 의 형태로 비교한다.
https://data-make.tistory.com/25

-----------------------------------------------------------------------------------------------
부서별로 가장 많은 급여를 받는 사원의 
부서코드, 최대급여를 조회.
SELECT department_id, MAX(salary) max_sal
FROM employees
GROUP BY department_id
ORDER BY 1;
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
부서별로 가장 많은 급여를 받는 사원의 
사번, 성명, 부서코드, 최대급여, 업무코드 조회  

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, MAX(salary), job_id
FROM employees
--WHERE
GROUP BY employee_id, first_name, last_name, department_id, job_id --xxxx
--HAVING
ORDER BY 3;
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
부서별로 가장 많은 급여를 받는 사원의 
--서브쿼리의 결과값이 부서, 최대급여이므로 다중컬럼서브쿼리, 
--그래서, IN 연산자 사용
사번, 성명, 부서코드, 급여, 업무코드 조회  


다중컬럼 서브쿼리 xxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
SELECT employee_id, first_name || ' ' || last_name name, --결과가 약간 이상
       department_id, salary, job_id
FROM employees
WHERE department_id IN ( SELECT department_id
                         FROM employees
                         GROUP BY department_id )
AND salary IN ( SELECT MAX(salary)
                FROM employees
                GROUP BY department_id )
ORDER BY department_id;
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

다중컬럼 서브쿼리 ○○○○○○
○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○
SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, salary, job_id
FROM employees
WHERE ( department_id, salary ) IN ( SELECT department_id, MAX(salary) --다중컬럼 서브쿼리
                                     FROM employees 
                                     GROUP BY department_id )
ORDER BY 3;


SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, salary, job_id
FROM employees
WHERE ( NVL(department_id,0), salary ) IN ( SELECT NVL(department_id,0), MAX(salary) --다중컬럼 서브쿼리
                                            FROM employees 
                                            GROUP BY department_id )
ORDER BY 3;
○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○
-----------------------------------------------------------------------------------------------
※ 부서별로 가장 많은 급여를 받는 사원의 
사번, 성명, 부서코드, 급여, 업무코드 조회 

인라인 뷰 서브쿼리 ☞ 그룹함수 반드시 alias  --부서별 최대급여를 테이블처럼 사용
SELECT employee_id, first_name || ' ' || last_name name, 
       e.department_id, e.salary, e.job_id
FROM employees e, ( SELECT department_id, MAX(salary) max_sal 
                    FROM employees 
                    GROUP BY department_id ) m
WHERE e.department_id = m.department_id
AND e.salary = m.max_sal --☜ max_sal : alias한것
ORDER BY 3;

-----------------------------------------------------------------------------------------------
EMPLOYEE_ID NAME                DEPARTMENT_ID   SALARY      JOB_ID    
-----------------------------------------------------------------------------------------------
200	        Jennifer Whalen     10	             4400	    AD_ASST
201	        Michael Hartstein	20	            13000	    MK_MAN
114	        Den Raphaely	    30	            11000	    PU_MAN
203	        Susan Mavris	    40	             6500	    HR_REP
121	        Adam Fripp	        50	             8200	    ST_MAN
103	        Alexander Hunold	60	             9000	    IT_PROG
204	        Hermann Baer	    70	            10000	    PR_REP
145	        John Russell	    80	            14000	    SA_MAN
100	        Steven King	        90	            24000	    AD_PRES
108	        Nancy Greenberg	   100	            12008	    FI_MGR
205	        Shelley Higgins	   110	            12008	    AC_MGR
178	        Kimberely Grant	   (null)            7000	    SA_REP    

12개 행이 선택되었습니다. 
-----------------------------------------------------------------------------------------------

각 부서별 최근에 입사한 사원들의 --서브쿼리의 결과값이 부서별, 최근 입사
사번, 성, 부서코드, 입사일자 조회

부서별 최근입사일자
SELECT department_id, MAX(hire_date)
FROM employees
GROUP BY department_id;

SELECT employee_id, last_name, department_id, hire_date
FROM employees
WHERE (department_id, hire_date) IN ( SELECT department_id, MAX(hire_date) 
                                      FROM employees 
                                      GROUP BY department_id )
ORDER BY 4;

매니저가 없는 부서의
부서코드, 부서명을 조회

일반쿼리
SELECT e.department_id, d.department_name 
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.manager_id IS NULL;

다중(결과)행 서브쿼리
SELECT department_id, department_name 
FROM departments
WHERE department_id IN ( SELECT department_id
                         FROM employees
                         WHERE manager_id IS NULL );
다중컬럼 서브쿼리
SELECT department_id, department_name 
FROM departments
WHERE ( department_id, manager_id ) --★  
IN ( SELECT department_id, employee_id --★ 서브쿼리의 결과값이 부서코드, 사번
     FROM employees
     WHERE manager_id IS NULL );

DEPARTMENT_ID   DEPARTMENT_NAME               
------------- ------------------------------
90              Executive        

SELECT department_id, employee_id
FROM employees
WHERE manager_id IS NULL; 

DEPARTMENT_ID   EMPLOYEE_ID
------------- -----------
90               100

매니저가 없는 사원(즉, 사장, employee_id가 100)이 매니저로 있는
부서코드, 부서명을 조회
SELECT DISTINCT(e.department_id), d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.manager_id IN ( SELECT employee_id
                      FROm employees
                      WHERE manager_id IS NULL )
ORDER BY 1;
                      
DEPARTMENT_ID DEPARTMENT_NAME               
------------- ------------------------------
           20 Marketing                     
           30 Purchasing                    
           50 Shipping                      
           80 Sales                         
           90 Executive 
