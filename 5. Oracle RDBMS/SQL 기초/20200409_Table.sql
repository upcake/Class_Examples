--[DDL : 데이터 정의어]
--tblMember 테이블 생성
CREATE TABLE tblMember (
    num NUMBER,
    name VARCHAR2(10),
    age NUMBER,
    addr VARCHAR2(50),
    tel VARCHAR2(20)
);

--tblMember 테이블에 phone 필드 추가
alter table tblMember add phone varchar(10);

--tblMember 테이블에 phone 필드의 크기 변경
alter table tblMember modify (phone varchar2(20));

--tblMember 테이블의 phone 필드의 이름을 mobilephone 변경
alter table tblMember rename column phone to mobilephone;

--tblMember 테이블의 mobilephone 필드 삭제
alter table tblMember DROP COLUMN mobilephone;

--tblMember 테이블 제거
drop table tblMember;

--[DML : 데이터 조작어]
--임의의 레코드를 삽입
INSERT INTO tblmember(num, name, age, addr, tel)
    VALUES (1, '홍길동', 30, '광주시 서구 농성동 ', '010-1111-1111');
    
INSERT INTO tblmember (tel, addr, age, num, name)
    VALUES ('010-2222-2222', '광주시 서구 쌍촌동', 27, 2, '김길동');

INSERT INTO tblmember
    VALUES (3, '박길동', 47, '광주시 북구 용봉동', '010-3333-3333');

INSERT INTO tblmember (num, name, age) VALUES (4, '이순신', 55);

--4번 레코드의 정보를 갱신(수정)
UPDATE tblMember
	SET addr = '광주시 광산구 신가동', tel ='010-4444-4444'
		WHERE num = 4;

--3번 레코드의 주소를 수정
update tblMember set addr = '서울시 강서구 화곡동' where num = 3;

--4번 레코드의 정보를 삭제
DELETE FROM tblMember WHERE num = 4;

--전체 레코드 삭제
DELETE FROM tblMember;

--전체 레코드 검색
select all * from tblMember;

select num, name, age, addr, tel from tblMember;

select * from tblMember;

--번호, 이름, 주소만 출력
select num, name, addr from tblMember;

--이름이 김길동인 회원을 출력
select * from tblMember where name = '김길동';

--이름이 김길동인 회원의 이름, 나이, 주소만 출력
select name, age, addr from tblMember where name = '김길동';

--나이가 50세 이상인 회원만 출력(비교 연산자)
select * from tblMember where age >= 40;

--나이가 40세 이상인 회원의 이름, 주소, 전화번호 출력
select name, addr, tel from tblMember where age >= 40;

--나이가 30 ~ 50세 사이의 회원만 출력
select * from tblMember where age >= 30 and age <= 50;
select * from tblMember where age between 30 and 50;

--주소에 특정 글자가 포함된 회원을 출력(LIKE 연산자 %)
select * from tblMember where addr like '%서구%'; --서구가 포함된 레코드 출력
select * from tblMember where addr like '광%';   --광으로 시작하는 레코드 출력
select * from tblMember where addr like '%광';   --광으로 끝나는 레코드 출력
/*
[김밥, 꼬마김밥, 양반김, 김치, 김치찌개, 총각김치, 파김치]
▶ 김% : 김밥, 김치, 김치찌개
▶ %김 : 양반김
▶ %김치% : 김치, 김치찌개, 총각김치, 파김치
*/

--내장함수(count, sum, avg, max, min)
select count(name) from tblMember;              --name 필드의 개수
select count(name) as nameCnt from tblMember;   --count(name) → namecnt로 필드명변경
select sum(age) from tblMember;                 --age의 합계
select avg(age) from tblMember;                 --age의 평균
select max(age) from tblMember;                 --age의 최댓값
select min(age) from tblMember;                 --age의 최솟값
select age + 2 from tblMember;                  --입력된 age의 값에 2를 더한 후 출력
select sum(age) from tblMember where addr like '%서구%';

--기타 연산
select * from tblMember where num in (1,3);     --num값이 1 또는 3인 레코드 검색
select * from tblMember where num = 1 or num = 3;
select sysdate from dual;   -- DBMS에 저장된 날짜 출력
select to_char(sysdate, 'YYYY/MM/DD') from dual;

--저장 완료
commit;