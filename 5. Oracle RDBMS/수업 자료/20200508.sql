5.6 ANSI JOIN
ANSI JOIN 은 모든 DBMS에서 공통적으로 사용할 수 있는 국제 표준 JOIN 형식이다.

1. INNER JOIN (오라클의 EQUI JOIN), 교집합

!!! FROM 절 안에 INNER JOIN 을 사용하여 테이블간 조인 지정
JOIN 조건은 ON 절, USING 절 에 명시한다.

※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
FROM 테이블명1 INNER JOIN 테이블명2
ON 조인조건식 WHERE 일반조건
(또는)
USING (조인컬럼명만)  WHERE 일반조건 
        ☜ USING 절에 사용된 컬럼에 대해서는 테이블명 절.대.로 명시해서는 안된다
※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※

조인조건절 : 
ON 절 - 조인조건식(★테이블명.컬럼명 = 테이블명.컬럼명)
        조인하는 컬럼명이 동일하면 반.드.시 테이블명을 명시해야만 한다. 
USING 절 - (조인컬럼명만) ☜ 중요!!! 괄호안에 컬럼명만 
        조인하는 컬럼명이 동일한 경우만 사용 가능 
         - ★ USING 절에 사용된 컬럼에 대해서는 테이블명 절.대.로 명시해서는 안된다.
         ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※중요
테이블간 조인형식과 조인조건절은 한 묶음이다.
일반적인 데이터행의 제한을 위한 조건절 - WHERE 절

-----------------------------------------------------------------------------------------------
오라클 JOIN                        |  ANSI JOIN
-----------------------------------------------------------------------------------------------
5. SELECT  컬럼명1, 컬럼명2        |  SELECT 컬럼명1, 컬럼명2
1. FROM 테이블명1, 테이블명2       |  FROM 테이블명1 INNER JOIN 테이블명2
2. WHERE 조인조건식 AND 일반조건   |  ON 조인조건식
                                   |  (또는)
                                   |  USING (조인컬럼명만)
                                   |  WHERE 일반조건식 --ON, USING 다음에 WHERE 사용
3. GROUP BY                        |
4. HAVING                          |
6. ORDER BY;                       |
-----------------------------------------------------------------------------------------------

부서코드가 60번인 사번, 성, 부서코드, 부서명 조회
오라클 조인
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.department_id = 60
ORDER BY 1;

ANSI 조인 ON 사용(INNER JOIN, 또는 JOIN 만 사용해도 됨) 
ON, USING 절 다음에 WHERE 절을 사용한 일반 조건을 표현한다.

SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e INNER JOIN departments d  --INNER 생략가능
ON e.department_id = d.department_id
WHERE e.department_id = 60
ORDER BY 1;

JOIN 조건에 사용하는 컬럼명이 같은 경우 ON 대신 USING 을 사용할 수 있다.
USING 을 사용할 때는 컬럼명만 기술해야 한다.
즉, USING 절에 사용된 컬럼에 대해서는 테이블명을 절.대.로 명시해서는 안된다.

ANSI 조인 USING 사용
SELECT  e.employee_id, e.last_name, 
        department_id, d.department_name
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE department_id = 60
ORDER BY 1;

사번, 성, 업무코드, 업무제목 조회
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id;

SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e INNER JOIN jobs j 
ON e.job_id = j.job_id;

SELECT e.employee_id, e.last_name, job_id, j.job_title
FROM employees e INNER JOIN jobs j 
USING (job_id);

ON, USING 절 다음에 WHERE 절을 사용한 일반 조건을 표현한다.

업무코드가 clerk 종류 업무형태를 하는 사번, 성, 업무코드, 업무제목 조회
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j 
WHERE e.job_id = j.job_id
AND LOWER(e.job_id) LIKE '%clerk%'
ORDER BY 1;

SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e INNER JOIN jobs j 
ON e.job_id = j.job_id
WHERE LOWER(e.job_id) LIKE '%clerk%'
ORDER BY 1;

SELECT e.employee_id, e.last_name, job_id, j.job_title
FROM employees e INNER JOIN jobs j 
USING (job_id)
WHERE LOWER(job_id) LIKE '%clerk%'
ORDER BY 1;

우리회사 부서정보를 파악하고자 한다.
부서코드, 부서명, 위치코드, 도시 조회
SELECT d.department_id, d.department_name, l.location_id, l.city
FROM departments d, locations l
WHERE d.location_id = l.location_id
ORDER BY 1;

SELECT d.department_id, d.department_name, l.location_id, l.city
FROM departments d INNER JOIN locations l
ON d.location_id = l.location_id
ORDER BY 1;

SELECT d.department_id, d.department_name, location_id, l.city
FROM departments d INNER JOIN locations l
USING (location_id)
ORDER BY 1;

매니저의 부서가 60 이상인 부서에 속한 사원들의
사번, 성, 매니저사번, 매니저성 조회 --SELF JOIN
SELECT e.employee_id, e.last_name, e.manager_id, 
       m.last_name manager_id
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
AND m.department_id >= 60
ORDER BY 1;

SELECT e.employee_id, e.last_name, e.manager_id, 
       m.last_name manager_id
FROM employees e INNER JOIN employees m
ON e.manager_id = m.employee_id
WHERE m.department_id >= 60
ORDER BY 1;

JOIN 에 사용하는 테이블이 3개 이상일 경우 
첫 번째 JOIN 의 결과에 두 번째 JOIN 을 추가하는 형태로 JOIN 형식을 사용한다.

부서코드 10,20,40,60 인 부서에 속한 사원들의
사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name,
        j.job_id, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id 
AND e.job_id = j.job_id
AND e.department_id IN (10,20,40,60);
===============================================================================================
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name,
        j.job_id, j.job_title
FROM  employees e INNER JOIN departments d 
ON e.department_id = d.department_id
INNER JOIN jobs j
ON e.job_id = j.job_id
WHERE e.department_id IN (10,20,40,60);
===============================================================================================
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name,
        j.job_id, j.job_title
FROM  employees e INNER JOIN jobs j
ON e.job_id = j.job_id
INNER JOIN departments d 
ON e.department_id = d.department_id
WHERE e.department_id IN (10,20,40,60);

SELECT  e.employee_id, e.last_name, 
        department_id, d.department_name,
        job_id, j.job_title
FROM employees e INNER JOIN departments d 
USING (department_id)
INNER JOIN jobs j
USING (job_id)
WHERE department_id IN (10,20,40,60);

SELECT  e.employee_id, e.last_name, 
        department_id, d.department_name,
        job_id, j.job_title
FROM employees e INNER JOIN jobs j 
USING (job_id)
INNER JOIN departments d
USING (department_id)
WHERE department_id IN (10,20,40,60);