--1. 우리회사 사원들의 업무형태(업무코드)별 사원 수를 파악하고자 한다.
--업무형태(업무코드), 사원수 조회
SELECT job_id, COUNT(*) cnt
FROM employees
GROUP BY job_id;

--2. 부서별 급여 정보를 파악하고자 한다.
--부서코드, 급여평균 조회- 급여평균이 높은 부서부터 정렬하고
--급여평균는 반올림하여 소수 둘째자리까지 표현.
SELECT department_id, ROUND(AVG(salary), 2) avg_sal
FROM employees
GROUP BY department_id
ORDER BY avg_sal DESC;

--3. 부서별, 업무별 급여합계를 파악하고자 한다.
--부서코드, 업무코드, 급여합계 조회
SELECT department_id, job_id, SUM(salary) sum_sal
FROM employees
GROUP BY department_id, job_id
ORDER BY 1, 2;

--4. 부서코드 60번 부서에 속한 사원들의 사원 수를 파악하고자 한다.
--60 번 부서에 속한 사원들의 사원 수를 조회(HAVING 절 사용)
SELECT department_id, COUNT(*) cnt
FROM employees
GROUP BY department_id
HAVING department_id = 60;

--5. 부서의 급여평균이 10000 이상인 부서를 파악하고자 한다.
--부서의 급여평균이 10000이상인 부서코드, 급여평균를 조회
--급여평균는 반올림하여 소수 둘째자리까지 표현.
SELECT department_id, ROUND(AVG(salary), 2) AS avg_sal
FROM employees
GROUP BY department_id
HAVING AVG(salary) >= 10000;

--6. 각 부서별 부서코드, 부서원수, 부서급여평균 조회
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal
FROM employees
GROUP BY department_id
ORDER BY 1;

--7. 100번 부서에 대한 정보를 파악하고자 한다.
--100번 부서의 부서코드, 부서원수, 부서급여평균 조회
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal
FROM employees
GROUP BY department_id
HAVING department_id = 100;

--8. 각 부서별 정보를 파악하고자 한다.
--각 부서별 부서원수가 15명 이상인 부서에 대해 부서코드, 부서원수, 부서급여평균 조회
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal
FROM employees
GROUP BY department_id
HAVING COUNT(*) >= 15;

--9. 각 부서의 부서급여평균이 8000 이상인 부서에 대해
--부서코드, 부서원수, 부서급여평균 조회
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal
FROM employees
GROUP BY department_id
HAVING AVG(salary) >= 8000;

--10. 각 부서별 최대급여를 파악하고자 한다. 
-- 각 부서의 최대급여가 10000 이상인 부서코드, 최대급여를 조회. 
SELECT department_id, MAX(salary) max_sal
FROM employees
GROUP BY department_id
HAVING MAX(salary) >= 10000;

--11. 두 명 이상 있는 성이 어떤 것들이 있나 파악하고자 한다. 
--두 명 이상 있는 성과, 수를 조회
SELECT first_name, COUNT(*) cnt
FROM employees
GROUP BY first_name
HAVING COUNT(*) >= 2;

--12. 년도별(오름차순)로 입사한 사원 수를 파악하고자 한다. 
--년도, 사원 수 조회 - 년도는 2020의 형태로 표현
SELECT TO_CHAR(hire_date, 'YYYY') hire_year, COUNT(*) cnt
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY 1;

--13. 각 부서별로 정보를 파악하고자 한다.
--각 부서별 부서코드, 부서원수, 부서급여평균, 부서최고급여, 부서최저급여 조회
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal
FROM employees
GROUP BY department_id
ORDER BY 1;

--14. 각 업무별로 정보를 파악하고자 한다.
--각 업무별 업무코드, 업무하는사원수, 업무급여평균, 업무최고급여, 업무최저급여 조회
SELECT job_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal
FROM employees
GROUP BY job_id;

--15. 각 부서별 부서내 업무별로 부서코드, 업무코드, 사원수, 급여평균 조회
SELECT department_id, job_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal
FROM employees
GROUP BY department_id, job_id
ORDER BY 1;

--ROLLUP : GROUP BY 절에 ROLLUP 함수를 사용하여 GROUP BY 구문에 의한 결과와 함께 단계별 소계, 총계 정보를 구함
--부서별 사원 수와 급여 합계, 총계를 조회한다.
SELECT department_id, COUNT(*) cnt, SUM(salary) sum_sal
FROM employees
WHERE department_id IS NOT NULL
GROUP BY ROLLUP(department_id)
ORDER BY department_id;

--부서 내 업무려 사원 수와 급여 합계, 부서별 소계, 총계를 조회한다.
SELECT department_id, job_id, COUNT(*), SUM(salary)
FROM employees
WHERE department_id IS NOT NULL
GROUP BY ROLLUP(department_id, job_id)
ORDER BY department_id, job_id;

--CUBE : GROUP BY 절에 CUBE 함수를 사용하여 GROUP BY 구문에 의한 결과와 모든 경우의 조합에 대한 소계, 총계 정보를 구할 수 있다.
SELECT department_id, job_id, COUNT(*), SUM(salary)
FROM employees
WHERE department_id IS NOT NULL
GROUP BY CUBE(department_id, job_id)
ORDER BY department_id, job_id;

--PK : 테이블의 레코드를 구분할 수 있는 최소의 칼럼(UNIQUE, NOT NULL)
--FK : 다른 테이블의 PK를 참조하는 칼럼
--PK - FK : 부모와 자식 관계로 볼 수 있다.
--PK는 주로 학번, 주민번호, 사원 번호 등 유일한 값을 가지는 칼럼이 주로 PK의 대상이 된다.
--예) 학번, 학과, 이름, 전화번호로 구성된 테이블의 경우 학번이 학생 개개인을 구분할 수 있는 칼럼으로 적절하기에 PK가 된다.