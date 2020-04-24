--6) 문자열에서 문자열의 일부를 반환(★ 몇 번째부터 몇 글자)하는 함수
--SUBSTR(char, poisition [, LENGTH])
--SUBSTR(대상 문자, 시작 위치, 몇 글자)
--두 번째 파라미터(position : 시작 위치)음수 지정 가능 ▶ 오른쪽에서부터
--세 번째 파라미터(LENGTH : 몇 글자) 생략시 ▶ ★ 문자열의 끝까지 반환

SELECT SUBSTR('You are not alone', 5, 3) s1,    --are
       SUBSTR('You are not alone', 5) s2,       --are not alone
       SUBSTR('You are not alone', -5, 3) s3,   --alo
       SUBSTR('You are not alone', -5) s4       --alone
FROM dual;

--7) 문자열에서 특정 문자열이 위치한 ★시작 위치를 반환하는 함수
--INSTR(char, search_string [, position] [, _th])
--INSTR(대상 문자, 찾는 문자열, 찾기 시작 위치, 몇 번째거)
--두 번째 파라미터 ▶ 찾는 문자열
--세 번째 파라미터 ▶ 문자열 찾는 시작 위치, 음수 지정가능 ▶ 오른쪽에서 왼쪽 방향으로 ★ 쭉쭉 계속 진행
--네 번째 파라미터 ▶ 생략 가능 - default 1
--                      11 14 17 19
SELECT INSTR('Every sha-la-la-la-la', 'la', 1, 2)   s1,
--1번 위치부터 찾기 시작해서 2번째로 존재하는 'la' 시작 위치 14
       INSTR('Every sha-la-la-la-la', 'la', 12, 2)  s2, --17
       INSTR('Every sha-la-la-la-la', 'la', 12, 4)  s3, --0
       INSTR('Every sha-la-la-la-la', 'la', 12)     s4, --14
       INSTR('Every sha-la-la-la-la', 'la', -3, 2)  s5, --14
       INSTR('Every sha-la-la-la-la', 'la', -10)    s6  --11
--                    -11 -8 -5 -2
FROM dual;

--문제 1. 이메일
SELECT 'admin@naver.com'    email,
       INSTR('admin@naver.com', '@', 1, 1) AS "@_index",
       SUBSTR('admin@naver.com', 1, INSTR('admin@naver.com', '@', 1, 1) - 1)  id,
       SUBSTR('admin@naver.com', INSTR('admin@naver.com', '@', 1, 1) + 1)  servicer1,
       SUBSTR('admin@naver.com', INSTR('admin@naver.com', '@', 1, 1) + 1,
        LENGTH('admin@naver.com') - INSTR('admin@naver.com', '@', 1, 1))  servicer2
FROM dual;

--문제 2. JOBS 테이블에서 업무 코드, 업무 제목, 직무, 직책 조회
--직무, 직책은 업무코드에서 '_'기준으로 조회(직무_직책)
SELECT job_id,
       job_title,
       INSTR(job_id, '_', 1, 1)  AS "'_' 위치",
       LENGTH(job_id) AS "문자열 갯수",
       LENGTH(SUBSTR(job_id, INSTR(job_id, '_', 1, 1) + 1)) AS "_문자 이후 갯수",
       SUBSTR(job_id, 1, INSTR(job_id, '_', 1, 1) - 1) AS 직무,
       SUBSTR(job_id, INSTR(job_id, '_', 1, 1) + 1, LENGTH(SUBSTR(job_id, INSTR(job_id, '_', 1, 1) + 1))) AS 직책
FROM jobs;

--문제 3. 부서 코드가 60, 80, 100인 부서에 속한 사원들의
--사번, 성, 전화번호, 지역번호, 개인번호 조회
SELECT employee_id      AS 사번,
       last_name        AS 성,
       phone_number     AS 전화번호,
       SUBSTR(phone_number, 1, INSTR(phone_number, '.', 1, 1) - 1)         AS 지역번호,
       SUBSTR(phone_number, INSTR(phone_number, '.', -1, 1) + 1)         AS 개인번호
FROM employees
WHERE department_id IN (60, 80, 100);

--8) 문자열에서 특정 문자열을 찾아 다른 문자열로 바꿔 반환하는 함수
--REPLACE(char, search_string [, replace_string])
--REPLACE(대상 문자, 찾는 문자열, 대체될 문자열)
--세 번째 매개 변수(파라미터) 대체될 문자열 생략 가능 : default - null
SELECT REPLACE('You are not alone', 'You', 'We')    rep1,   --We are not alone
       REPLACE('You are not alone', 'not')          rep2,   --You are__alone
       REPLACE('You are not alone', 'not', null)    rep3   --You are__alone
FROM dual;

--9) 문자열에 있는 특정 문자 ★ 전체를 다른 특정 문자로 ★ 하나씩 대응해서 바꿔 반환하는 함수
--TRANSLATE(char, from_string, to_string)
--TRANSLATE(대상 문자, 찾는 문자의 나열, 대체될 문자의 나열)
SELECT TRANSLATE('You are not alone', 'You', 'We')  ts1
--Y → W / o → e / u → null ▶ We are net alene
FROM dual;

--문제 1. REPLACE 사용해서 '너는 나를 모르는데 나는 너를 알겠느냐'를 '나는 나를 모르는데 나는 나를 알겠느냐'로 수정하기
SELECT REPLACE('너는 나를 모르는데 나는 너를 알겠느냐', '너', '나'),
       REPLACE(REPLACE('너는 나를 모르는데 나는 너를 알겠느냐', '너는', '나는'), '너를', '나를')
FROM dual;

--문제 2. TRANSLATE 사용해서 '너는 나를 모르는데 나는 너를 알겠느냐'를 '나는 너를 모르는데 너는 나를 알겠느냐'로 수정하기
SELECT TRANSLATE('너는 나를 모르는데 나는 너를 알겠느냐', '나너', '너나'),
       TRANSLATE('너는 나를 모르는데 나는 너를 알겠는냐', '너나', '나너')
FROM dual;

--[연습 문제]
--문제 1. 사원 테이블에서 이름(first_name)이 A로 시작하는 모든 사원의 이름과 이름의 길이를 조회하는 쿼리문을 작성한다.
SELECT first_name AS name,
       LENGTH(first_name) AS length
FROM employees
WHERE first_name LIKE 'A%';
--WHERE SUBSTR(first_name, 1, 1) = 'A';

--문제 2. 80번 부서원의 이름과 급여를 조회하는 쿼리문을 작성한다.
--단, 급여는 15자 길이로 왼쪽에 ＄ 기호가 채워진 형태로 표시되도록 한다.
SELECT first_name, LPAD(LPAD(salary, LENGTH(salary) + 1, '$'), 15) AS Salary
FROM employees
WHERE department_id = 80;

--문제 3. 60번 부서, 80번 부서, 100번 부서에 소속된 사원의 사번, 이름, 전화번호, 전화번호의 지역번호를 조회하는 쿼리문을 작성한다.
--단, 지역번호의 칼럼은 Local Number라고 표시하고, 지역번호는 515.124.4169에서 515를 지역번호라 한다.
SELECT employee_id,
       first_name,
       phone_number,
       SUBSTR(phone_number, 1, INSTR(phone_number, '.', 1, 1) - 1) AS "Local Number",
       SUBSTR(phone_number, INSTR(phone_number, '.', -1, 1) + 1)  AS "Private Number"
FROM employees
WHERE department_id IN (60, 80, 100);


--3.3 날짜 함수 : 송금, 출결, 회원가입 날짜, 결제 시간
--1) 시스템의 현재 날짜를 반환하는 함수 - SYSDATE
--다른 함수와는 달리
SELECT SYSDATEM FROM dual;

--날짜 +/- 숫자 ▶ 날짜
--날짜 - 날짜   ▶ 숫자 

--오늘 날짜 - 그제 날짜 ▶ 일수 차이
--오늘날짜로부터 한 달 후
SELECT SYSDATE + 30 AS "after 1M" FROM dual;

--SYSTIMESTAMP : 밀리초까지 출력하는 함수
SELECT SYSTIMESTAMP FROM dual;

--2) 특정 날짜로부터 몇 개월 후/전의 날짜 반환하는 함수
--ADD_MONTHS(날짜, 개월수)
--오늘로부터 6개월 후의 날짜 조회, 오늘로부터 3개월 전의 날짜 조회
SELECT ADD_MONTHS(SYSDATE, 6) after6M,
       ADD_MONTHS(SYSDATE, -3) before3M
FROM dual;

--3) 두 날짜 사이의 개월수의 차이를 반환하는 함수
--오늘 날짜 - 이전 날짜 → 개월수의 차이 ▶ MONTH_BETWEEN(날짜1, 날짜2) ▶ 날짜1 > 날짜2
SELECT MONTHS_BETWEEN(SYSDATE, '20/02/20') diff1,
       TRUNC(MONTHS_BETWEEN(SYSDATE, '20/02/20'), 1) diff2
FROM dual;

--교육 시작일부터 오늘까지의 개월 수와 수료할 날까지의 남은 개월 수를 알아보자.
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, '20/02/24'), 1) AS "교육 시작일",
       TRUNC(MONTHS_BETWEEN('20/08/21', SYSDATE), 1) AS "남은 개월 수"
FROM dual;

--우리 회사 사번 100번인 사원의 사번, 성, 입사 일자, 근무 개월수, 근무 년수 조회
--근무 개월수, 근무 년수는 오늘을 기준으로 계산하여 정수로 표현
--예를 들어 오늘은 2019/08/07이고, 2019/05/27에 입사했다면 2개월 근무한 것
SELECT employee_id, last_name, hire_date,
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)) work_months,
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)/12) work_years
FROM employees
WHERE employee_id = 100;

--4) 해당 날짜가 포함된 달의 마지막 일자를 반환하는 함수
--LAST_DAY(날짜)
SELECT LAST_DAY(SYSDATE) s1,
       LAST_DAY(ADD_MONTHS(SYSDATE, -3)) s2, --오늘로부터 3개월 전인 달의 마지막 날짜
       LAST_DAY(ADD_MONTHS(SYSDATE, 3)) s3 -- 오늘로부터 3개월 후인 달의 마지막 날짜
FROM dual;

--5) 해당 날짜 이후의 날짜 중에서 char로 명시된 요일에 해당하는 첫번째 날짜를 반환
--NEXT_DAY(날짜, char)
--char : 요일 문자 ▶ 일요일, 월요일~~, 일, 월~~, 숫자도 가능(1: 일요일, 2: 월요일)
SELECT NEXT_DAY(SYSDATE, '월요일') NEXT1,
       NEXT_DAY(SYSDATE, '금요일') NEXT2,
       NEXT_DAY(SYSDATE, '일') NEXT3,
       NEXT_DAY(SYSDATE, 4) NEXT4   -- 4 : 수
FROM dual;


--★ 형변환 함수
--1. 숫자화 함수 : TO_NUMBER ▶ 문자 → 숫자
--알파벳, 기호, 한글 이런 문자등은 숫자화 불가
--'가나다', 'abc', '19/20/05' ▶ 숫자로 변환 불가
--''(작은 따옴표)로 묶여 문자로 표현되었지만 안에 담겨진 데이터값 자체는 숫자인 경우에만 숫자화 함수를 사용할 수 있다.

--2. 문자화 함수 : TO_CHAR(숫자나 날짜를 문자로 변환)
--1) 숫자 → 문자 : TO_CHAR(대상, 포맷 형식)
--포맷 형식
--9 : 한 자리 숫자, 무효 숫자는 공백으로 채워짐(정수일때), 소수 이하일때는 0으로 채워짐.
--0 : 한 자리 숫자, 무효 숫자는 0으로 채워짐, 자릿수가 부족할때 자리수만큼 #표시
--, : 천 단위 표시
--L : Local, 통화 기호
SELECT 123456                        ,   --123456
       TO_CHAR(123456, '999999')     ,   --_123456       표현 형식에 딱 맞더라도 앞에 공백이 기본적으로 붙는다.
       TO_CHAR(123456, '9999999999') ,   --_____123456   표현 형식보다 자릿수가 적으면 빈칸으로 채워진다.
       TO_CHAR(123456, '9999')       ,   --#####         표현 형식보다 자릿수가 많으면 #####으로 출력된다.
       TO_CHAR(123456, '999,999,999')    --_____123,456  표현 형식보다 자릿수가 적어서 빈칸으로 채워지지만, 콤마(,) 자리까지 빈칸으로 나오지는 않는다.
FROM dual;

--2) 날짜 → 문자 : TO_CHAR
--표현 형식 : 년-YYYY, YY, RRRR, RR, 월-MM, MONTH, MON 일-DD
--           요일 - DAY(한글, 월요일), DY(한글약자, 월, 화)
--           시-HH, HH24 분-MI    초-SS
SELECT TO_CHAR(SYSDATE, 'YYYY-MON-DD'),
       TO_CHAR(SYSDATE, 'RRRR-MON-DD'),
       TO_CHAR(SYSDATE, 'YY-MM-DD'),
       TO_CHAR(SYSDATE, 'RR-MM-DD'),
       TO_CHAR(SYSDATE, 'RR/MM/DD HH:MI:SS'),
       TO_CHAR(SYSDATE, 'RR/MM/DD HH24:MI:SS'),
       TO_CHAR(SYSDATE, 'YY-MM-DD DAY'),
       TO_CHAR(SYSDATE, 'YY-MM-DD DY')
FROM DUAL;

--3. 날짜화 함수 : TO_DATE
SELECT '201006',
       TO_DATE('20-10-06'),
       TO_DATE('201006'),
       TO_DATE('201006', 'DDMMRR'),
       TO_DATE('20-10-06', 'DD-MM-RR')
FROM DUAL;
        