실습
1. 우리회사 사원들의 업무형태(업무코드)별 사원 수를 파악하고자 한다.
업무형태(업무코드), 사원수 조회
SELECT job_id, COUNT(*) emp_cnt
FROM employees
GROUP BY job_id;


2. 부서별 급여 정보를 파악하고자 한다.
부서코드, 급여평균 조회- 급여평균이 높은 부서부터 정렬하고
급여평균는 반올림하여 소수 둘째자리까지 표현.

SELECT department_id, ROUND(AVG(salary), 2) avg_sal
FROM employees
GROUP BY department_id
ORDER BY 2 desc;


3. 부서별, 업무별 급여합계를 파악하고자 한다.
부서코드, 업무코드, 급여합계 조회

SELECT department_id, job_id, SUM(salary) sum_sal
FROM employees
GROUP BY department_id, job_id
ORDER BY 1, 2;


4. 부서코드 60번 부서에 속한 사원들의 사원 수를 파악하고자 한다.
60 번 부서에 속한 사원들의 사원 수를 조회(HAVING 절 사용)
SELECT department_id, COUNT(*) cnt
FROM employees
GROUP BY department_id
HAVING department_id = 60;
 
5. 부서의 급여평균이 10000 이상인 부서를 파악하고자 한다.
부서의 급여평균이 10000이상인 부서코드, 급여평균를 조회
급여평균는 반올림하여 소수 둘째자리까지 표현.

SELECT department_id, ROUND(AVG(salary),2) avg_sal
FROM employees
GROUP BY department_id
HAVING AVG(salary) >= 10000;

6. 각 부서별 부서코드, 부서원수, 부서급여평균 조회
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal
FROM employees
GROUP BY department_id
ORDER BY 1;

7. 100번 부서에 대한 정보를 파악하고자 한다.
100번 부서의 부서코드, 부서원수, 부서급여평균 조회
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal
FROM employees
WHERE department_id=100
GROUP BY department_id;

8. 각 부서별 정보를 파악하고자 한다.
각 부서별 부서원수가 15명 이상인 부서에 대해 부서코드, 부서원수, 부서급여평균 조회
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal
FROM employees
GROUP BY department_id
HAVING COUNT(*)  >= 15;

9. 각 부서의 부서급여평균이 8000 이상인 부서에 대해
부서코드, 부서원수, 부서급여평균 조회
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal
FROM employees
GROUP BY department_id
HAVING AVG(salary)>=8000;

10. 각 부서별 최대급여를 파악하고자 한다. 
 각 부서의 최대급여가 10000 이상인 부서코드, 최대급여를 조회. 
 SELECT department_id, MAX(salary) max_sal
 FROM employees
 GROUP BY department_id
 HAVING MAX(salary)>= 10000; -- 최대급여가 10000 이상
 
11. 두 명 이상 있는 성이 어떤 것들이 있나 파악하고자 한다. 
두 명 이상 있는 성과, 수를 조회
SELECT last_name, COUNT(*) cnt
FROM employees
GROUP BY last_name
HAVING COUNT(*)>=2;


12. 년도별(오름차순)로 입사한 사원 수를 파악하고자 한다. 
년도, 사원 수 조회 - 년도는 2020의 형태로 표현
SELECT TO_CHAR(hire_date, 'yyyy') hire_date, COUNT(*) cnt
FROM employees
GROUP BY TO_CHAR(hire_date, 'yyyy')
ORDER BY 1;

2001	  1
2002	  7
2003	  6
2004	 10
2005	 29
2006	 24
2007	 19
2008	 11

13. 각 부서별로 정보를 파악하고자 한다.
각 부서별 부서코드, 부서원수, 부서급여평균, 부서최고급여, 부서최저급여 조회
SELECT  department_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal,
        MAX(salary) max_sal, MIN(salary) min_sal
FROM employees       
GROUP BY department_id
ORDER BY 1;

14. 각 업무별로 정보를 파악하고자 한다.
각 업무별 업무코드, 업무하는사원수, 업무급여평균, 업무최고급여, 업무최저급여 조회
SELECT job_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal,
       MAX(salary) max_sal, MIN(salary) min_sal
FROM employees
GROUP BY job_id
ORDER BY 1;

15. 각 부서별 부서내 업무별로 부서코드, 업무코드, 사원수, 급여평균 조회
SELECT department_id, job_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal
FROM employees
GROUP BY department_id, job_id
ORDER BY 1;


ROLLUP 
GROUP BY 절에 ROLLUP 함수를 사용하여 GROUP BY 구문에 의한 결과와 함께 
단계별 소계, 총계 정보를 구함

부서별 사원수와 급여합계, 총계(???)를 조회한다.
SELECT department_id, COUNT(*), SUM(salary)
FROM employees
WHERE department_id IS NOT NULL 
GROUP BY department_id
ORDER BY department_id;

DEPARTMENT_ID   COUNT(*) SUM(SALARY)
-----------------------------------------
10                 1          4400
20                 2         19000
30                 6         24900
40                 1          6500
50                45        156400
60                 5         28800
70                 1         10000
80                34        304500
90                 3         58000
100                6         51608
110                2         20308

11개 행이 선택되었습니다. 

부서별 사원수와 급여합계, 총계를 조회한다.
SELECT department_id, COUNT(*), SUM(salary)
FROM employees
WHERE department_id IS NOT NULL 
GROUP BY ROLLUP(department_id)
ORDER BY department_id;

DEPARTMENT_ID   COUNT(*) SUM(SALARY)
-----------------------------------------
10                 1          4400
20                 2         19000
30                 6         24900
40                 1          6500
50                45        156400
60                 5         28800
70                 1         10000
80                34        304500
90                 3         58000
100                6         51608
110                2         20308
                 106        684416

12개 행이 선택되었습니다. 

부서 내 업무별 사원수와 급여합계, 부서별 소계, 총계를 조회한다.
SELECT department_id, job_id, COUNT(*), SUM(salary)
FROM employees
WHERE department_id IS NOT NULL 
GROUP BY department_id, job_id  
ORDER BY department_id, job_id;

DEPARTMENT_ID JOB_ID   COUNT(*)     SUM(SALARY)
------------- ---------- ---------- -----------
10	          AD_ASST	      1	        4400
20	          MK_MAN	      1	       13000
20	          MK_REP	      1	        6000
30	          PU_CLERK	      5	       13900
30	          PU_MAN	      1	       11000
40	          HR_REP	      1	        6500
50	          SH_CLERK       20	       64300
50	          ST_CLERK       20	       55700
50	          ST_MAN	      5	       36400
60	          IT_PROG         5	       28800
70	          PR_REP	      1	       10000
80	          SA_MAN	      5	       61000
80	          SA_REP	     29	      243500
90	          AD_PRES         1	       24000
90	          AD_VP	          2	       34000
100	          FI_ACCOUNT      5	       39600
100	          FI_MGR	      1	       12008
110	          AC_ACCOUNT      1	        8300
110	          AC_MGR	      1	       12008

19개 행이 선택되었습니다. 

부서 내 업무별 사원수와 급여합계, 부서별 소계, 총계를 조회한다.
SELECT department_id, job_id, COUNT(*), SUM(salary)
FROM employees
WHERE department_id IS NOT NULL 
GROUP BY ROLLUP(department_id, job_id)   
ORDER BY department_id, job_id;

DEPARTMENT_ID   JOB_ID              COUNT(*)        SUM(SALARY)
------------------------------------------------------------------
10	            AD_ASST	            1	            4400
10		                            1	            4400
20	            MK_MAN	            1	           13000
20	            MK_REP	            1	            6000
20	    	                        2	           19000
30	            PU_CLERK	        5	           13900
30	            PU_MAN	            1	           11000
30		                            6	           24900
40	            HR_REP	            1	            6500
40		                            1	            6500
50	            SH_CLERK	       20	           64300
50	            ST_CLERK	       20	           55700
50	            ST_MAN	            5	           36400
50		                           45	          156400
60	            IT_PROG	            5	           28800
60		                            5	           28800
70	            PR_REP	            1	           10000
70		                            1	           10000
80	            SA_MAN	            5	           61000
80	            SA_REP	           29	          243500
80		                           34	          304500
90	            AD_PRES	            1	           24000
90	            AD_VP	            2	           34000
90		                            3	           58000
100	            FI_ACCOUNT	        5	           39600
100	            FI_MGR	            1	           12008
100		                            6	           51608
110	            AC_ACCOUNT	        1	            8300
110	            AC_MGR	            1	           12008
110		                            2	           20308
                                  106	          684416

CUBE
GROUP BY 절에 CUBE 함수를 사용하여 
GROUP BY 구문에 의한 결과와 모든 경우의 조합에 대한 소계, 총계 정보를 구할 수 있다.

SELECT department_id, job_id, COUNT(*), SUM(salary)
FROM employees
WHERE department_id IS NOT NULL 
GROUP BY CUBE(department_id, job_id)   
ORDER BY department_id, job_id;

DEPARTMENT_ID   JOB_ID              COUNT(*)        SUM(SALARY)
------------------------------------------------------------------
10	            AD_ASST	            1	            4400
10		                            1	            4400
20	            MK_MAN	            1	           13000
20	            MK_REP	            1	            6000
20	    	                        2	           19000
30	            PU_CLERK	        5	           13900
30	            PU_MAN	            1	           11000
30		                            6	           24900
40	            HR_REP	            1	            6500
40		                            1	            6500
50	            SH_CLERK	       20	           64300
50	            ST_CLERK	       20	           55700
50	            ST_MAN	            5	           36400
50		                           45	          156400
60	            IT_PROG	            5	           28800
60		                            5	           28800
70	            PR_REP	            1	           10000
70		                            1	           10000
80	            SA_MAN	            5	           61000
80	            SA_REP	           29	          243500
80		                           34	          304500
90	            AD_PRES	            1	           24000
90	            AD_VP	            2	           34000
90		                            3	           58000
100	            FI_ACCOUNT	        5	           39600
100	            FI_MGR	            1	           12008
100		                            6	           51608
110	            AC_ACCOUNT	        1	            8300
110	            AC_MGR	            1	           12008
110		                            2	           20308
                AC_ACCOUNT	        1	            8300
                AC_MGR	            1	           12008
                AD_ASST	            1	            4400
                AD_PRES	            1	           24000
                AD_VP	            2	           34000
                FI_ACCOUNT	        5	           39600
                FI_MGR	            1	           12008
                HR_REP	            1	            6500
                IT_PROG	            5	           28800
                MK_MAN	            1	           13000
                MK_REP	            1	            6000
                PR_REP	            1	           10000
                PU_CLERK	        5	           13900
                PU_MAN	            1              11000
                SA_MAN	            5              61000
                SA_REP	           29             243500
                SH_CLERK	       20              64300
                ST_CLERK	       20	           55700
                ST_MAN	            5	           36400
                                  106             684416
                                  
                                  
                                  
