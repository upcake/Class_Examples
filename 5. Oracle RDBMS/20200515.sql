7. 몇개의 데이터행만 조회해 보자.
데이터행을 조회해오는 순서 : ROWNUM - 테이블에 존재하지 않는 컬럼은 아니지만 
사용할 수 있는 가짜 컬럼(PSEUDO COLUMN), 
SELECT 절과 WHERE 절에서 사용,
★ 쿼리문의 결과로 나온 각 행에 대한 순서값
※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
★ 서브 쿼리에서 먼저 정렬(ORDER BY) 후 메인 쿼리에서 순번 매기기(ROWNUM)
-  ROWNUM과 인라인 뷰의 특성을 이용하여 페이징 처리 등의 작업을 수행

게시판에서 일반적으로 페이지 번호가 3 페이지 이상인 것을 거의 읽지 않음. 
즉, 페이지 번호가 낮은 것을 훨씬 더 많이 조회하고 있고, 
그 비율이 5 페이지 이하의 페이지 조회율이 95% 이상

우리회사 사원들의 
사번, 성, 급여 조회
SELECT ROWNUM, employee_id, last_name, salary
FROM employees;

우리회사 사원들에 대해 급여를 많이 받는 순으로 정렬하여 
사번, 성, 급여 조회
SELECT ROWNUM, employee_id, last_name, salary
FROM employees
ORDER BY salary DESC;

우리회사 사원들 사번순으로 정렬하여 10번까지
사번, 성, 급여 조회
SELECT ROWNUM, employee_id, last_name, salary
FROM employees
WHERE ROWNUM <= 10;

SELECT ROWNUM, employee_id, last_name, salary
FROM employees
WHERE ROWNUM <= 10
ORDER BY salary DESC;

인라인 뷰 사용하여
급여 상위 5명의 대한 사번, 이름, 급여 조회
SELECT ROWNUM, e.* 
FROM ( SELECT employee_id, first_name, salary
       FROM employees
       ORDER BY salary DESC ) e
WHERE ROWNUM <= 5;

인라인 뷰 사용하여
급여 하위 5명의 사번, 이름, 급여 조회
SELECT ROWNUM, e.* 
FROM ( SELECT employee_id, first_name, salary
       FROM employees
       ORDER BY salary ) e
WHERE ROWNUM <= 5;

가장 먼저 입사한 사원 10명에 대한 사번, 성, 입사일자 조회
SELECT ROWNUM, e.* 
FROM ( SELECT employee_id, last_name, hire_date
       FROM employees
       ORDER BY hire_date ) e
WHERE ROWNUM <= 10 ;

8. 순위를 결정하고자 한다면
RANK() OVER(순위결정기준) - 1,2,2,2,2,6
DENSE_RANK() OVER(순위결정기준) - 1,2,2,2,2,3 
    --DENSE : 밀집한, 빽빽한

★ ROWNUM : 쿼리문의 결과로 나온 각 행에 대한 순서값
입사일자를 오름차순 기준으로 10위까지(먼저 입사한 사원 10명)
사번, 성, 입사일자 조회
SELECT ROWNUM, e.*
FROM ( SELECT employee_id, last_name, hire_date
       FROM employees
       ORDER BY hire_date) e
WHERE ROWNUM <= 10 ;

SELECT * 
FROM ( SELECT DENSE_RANK() OVER(ORDER BY hire_date) rank, 
              employee_id, last_name, hire_date
       FROM employees )
WHERE rank <= 10;

데이터 조회 ☞ SELECT 
SELECT 컬럼명, ....
FROM 테이블명, ....
WHERE 조인조건
WHERE 일반조건
WHERE 조인조건 AND 일반조건
GROUP BY 기준
HAVING 일반조건(그룹함수)
ORDER BY 정렬기준;

-----------------------------------------------------------------------------------------------
[연습문제 6-4]
1. 급여가 적은 상위 5명 사원의 
순위, 사번, 이름, 급여를 조회하는 쿼리문을 
DENSE_RANK()를 사용한 인라인뷰 서브 쿼리를 사용하여 작성

급여 하위 5명의 순위, 사번, 이름, 급여 조회
SELECT e.* 
FROM ( SELECT RANK() OVER(ORDER BY salary) rank, 
              employee_id, first_name, salary
       FROM employees ) e
WHERE rank<=5;

2. 부서별로 가장 급여를 많이 받는 사원의 
사번, 이름, 부서코드, 급여, 업무코드를 조회하는 쿼리문 
인라인 뷰 서브 쿼리를 사용하여 작성

SELECT employee_id, first_name, e.department_id, salary, job_id
FROM employees e, ( SELECT department_id, MAX(salary) max_sal 
                    FROM employees 
                    GROUP BY department_id ) m
WHERE NVL(e.department_id,0) = NVL(m.department_id,0)
AND salary=max_sal
ORDER BY department_id;
-----------------------------------------------------------------------------------------------



