--tblPanme 테이블 생성
CREATE TABLE tblPanme (
    code VARCHAR2(10),
    part VARCHAR2(20),
    price NUMBER
);

--레코드 입력
INSERT INTO tblPanme(code, part, price)
    VALUES ('001', 'A영업부', 3000);
INSERT INTO tblPanme(code, part, price)
    VALUES ('002', 'B영업부', 6000);
INSERT INTO tblPanme(code, part, price)    
    VALUES ('003', 'A영업부', 2000);
INSERT INTO tblPanme(code, part, price)
    VALUES ('004', 'B영업부', 5000);
INSERT INTO tblPanme(code, part, price)
    VALUES ('005', 'C영업부', 1000);
INSERT INTO tblPanme(code, part, price)
    VALUES ('006', 'D영업부', 4000);

--전체 레코드 검색
SELECT * FROM tblPanme;

--tblPanme 테이블 삭제
DROP TABLE tblPanme;

--저장 완료
COMMIT;

--각 부서별(GROUP BY)로 판매 금액(PRICE)의 총합(SUM)을 구하여 출력
SELECT part, SUM(price) FROM tblPanme; -- 에러 발생
SELECT part, SUM(price) FROM tblPanme GROUP BY part;
SELECT part, SUM(price) AS total FROM tblPanme GROUP BY part;

--각 부서별로 판매 금액의 총합을 구하여 부서의 오름차순으로 정렬(ORDER BY)하여 출력
SELECT part, SUM(price) FROM tblPanme GROUP BY part ORDER BY part ASC;

--부서명을 출력(단, 중복된 부서는 제거하고 한번만 출력 : DISTINCT)
SELECT part FROM tblPanme;
SELECT DISTINCT part FROM tblPanme;
SELECT DISTINCT part FROM tblPanme ORDER BY part DESC;

--부서가 총 몇 개(COUNT) 부서인지 출력(단, 중복된 부서는 한 번만 출력
SELECT COUNT(part) FROM tblPanme;
SELECT COUNT(DISTINCT part) FROM tblPanme;
SELECT COUNT(DISTINCT part) AS partcount FROM tblPanme;

--각 부서별로 판매 금액의 총합을 구하여 부서의 오름차순으로 정렬하여 출력
--단, 부서가 2개 이상 있는 부서만 대상으로 하시오 ▶ A영업부, B영업부
SELECT part, SUM(price) AS total FROM tblPanme
    GROUP BY part HAVING COUNT(part) >= 2 ORDER BY part ASC;