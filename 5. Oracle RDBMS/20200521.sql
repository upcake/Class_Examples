--[연습문제 10 - 1]
--1. 테이블명 : STAR_WARS(영화 정보)
--   칼럼 : EPISODE_ID    : 에피소드 아이디, 숫자 타입(5), 기본키
--          EPISODE_NAME  : 에피소드에 따른 영화 제목, 가변 문자 타입(50)
--          OPEN_YEAR     : 개봉 연도, 숫자 타입(4)
CREATE TABLE star_wars (
episode_id NUMBER(5) CONSTRAINT sw_episode_id_pk PRIMARY KEY,
episode_name VARCHAR2(50),
open_year NUMBER(4)
);

--2. 테이블명 : characters(등장인물)
--   칼럼 : character_id    : 등장인물 아이디, 숫자 타입(5), 기본키
--          character_name  : 등장인물 이름, 가변 문자 타입(30)
--          master_id       : 등장인물이 제다이일 경우, 마스터 아이디 값을 가짐, 숫자 타입(5)
--          role_id         : 등장인물 역할 아이디, 숫자 타입(4)
--          email           : 등장인물 이메일 주소, 가변 문자 타입(40)
CREATE TABLE characters (
character_id NUMBER(5) CONSTRAINT char_character_id_pk PRIMARY KEY,
character_name VARCHAR2(30),
master_id NUMBER(5),
role_id NUMBER(4),
email VARCHAR2(40)
);

--3. 테이블명 : casting(등장인물과 실제 배우의 정보)
--   칼럼 : episode_id    : 에피소드 아이디, 숫자 타입(5), 기본키
--          character_id  : 등장인물 아이디, 숫자 타입(5), 기본키
--          real_name     : 등장인물의 실제 이름, 가변 문자 타입(30)
CREATE TABLE casting (
episode_id NUMBER(5),
character_id NUMBER(5),
real_name VARCHAR2(30),
CONSTRAINT cast_episode_character_id_pk PRIMARY KEY (episode_id, character_id)
);

--4. STAR_WARS 테이블에 다음과 같이 저장한다.
INSERT INTO star_wars
VALUES (4, '새로운 희망(A New Hope)', 1977);

INSERT INTO star_wars
VALUES (5, '제국의 역습(The Empires Strikes Back)', 1980);

INSERT INTO star_wars
VALUES (6, '제다이의 귀환(Return of the Jedi)', 1983);

INSERT INTO star_wars
VALUES (1, '보이지 않는 위험(The Phantom Menace)', 1999);

INSERT INTO star_wars
VALUES (2, '클론의 습격(Attack of the Clones)', 2002);

INSERT INTO star_wars
VALUES (3, '시스의 복수(Revenge of the Sith)', 2005);

--5. CHARACTERS 테이블에 다음과 같이 저장한다.
INSERT INTO characters
VALUES (1, '루크 스카이워커', '', '', 'luke@jedai.com');

INSERT INTO characters
VALUES (2, '한 솔로', '', '', 'solo@alliance.com');

INSERT INTO characters
VALUES (3, '레이아 공주', '', '', 'leia@alliance.com');

INSERT INTO characters
VALUES (4, '오비완 케노비', '', '', 'Obi-Wan@jedai.com');

INSERT INTO characters
VALUES (5, '다쓰 베이더', '', '', 'vader@sith.com');

INSERT INTO characters
VALUES (6, '다쓰 베이더(목소리)', '', '', 'vader_voice@sith.com');

INSERT INTO characters
VALUES (7, 'C-3PO', '', '', 'c3po@alliance.com');

INSERT INTO characters
VALUES (8, 'R2-D2', '', '', 'r2d2@alliance.com');

INSERT INTO characters
VALUES (9, '츄바카', '', '', 'Chewbacca@alliance.com');

INSERT INTO characters
VALUES (10, '랜도 칼리시안', '', '', '');

INSERT INTO characters
VALUES (11, '요다', '', '', 'yoda@jedai.com');

INSERT INTO characters
VALUES (12, '다쓰 시디어스', '', '', 'sidious@sith.com');

INSERT INTO characters
VALUES (13, '아나킨 스카이워커', '', '', 'Anakin@jedai,com');

INSERT INTO characters
VALUES (14, '콰이곤 진', '', '', '');

INSERT INTO characters
VALUES (15, '아미달라 여왕', '', '', '');

INSERT INTO characters
VALUES (16, '아나킨 어머니', '', '', '');

INSERT INTO characters
VALUES (17, '자자빙크스(목소리)', '', '', '');

INSERT INTO characters
VALUES (18, '다쓰 몰', '', '', 'maul@sith.com');

INSERT INTO characters
VALUES (19, '장고 펫', '', '', '');

INSERT INTO characters
VALUES (20, '마스터 윈두', '', '', 'windu@jedai.com');

INSERT INTO characters
VALUES (21, '두쿠 백작', '', '', 'dooku@jedai.com');

--6. ROLES 테이블을 생성하여 다음과 같이 저장한다.
CREATE TABLE roles (
role_id NUMBER(4) CONSTRAINT roles_role_id_pk PRIMARY KEY,
role_name VARCHAR2(30)
);

INSERT INTO roles
VALUES (1001, '제다이');

INSERT INTO roles
VALUES (1002, '시스');

INSERT INTO roles
VALUES (1003, '반란군');

--7. CHARACTERS 테이블의 ROLE_ID 칼럼의 데이터가 ROLES 테이블의 ROLE_ID 칼럼의 데이터를 참조하도록 CHARACTERS 테이블에 참조키를 생성한다.

--------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM star_wars;
SELECT * FROM characters;
DROP TABLE casting;
COMMIT;
--------------------------------------------------------------------------------------------------------------------------------