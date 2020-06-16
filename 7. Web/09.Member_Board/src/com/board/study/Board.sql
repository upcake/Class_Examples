--테이블 생성
CREATE TABLE memberBoard(
    Board_num NUMBER PRIMARY KEY NOT NULL,
    Board_id VARCHAR2(15),
    Board_subject VARCHAR2(50),
    Board_content VARCHAR2(2000),
    Board_file VARCHAR2(20),
    Board_re_ref NUMBER,
    Board_re_lev NUMBER,
    Board_re_seq NUMBER,
    Board_readcount NUMBER,
    Board_date DATE
);

--제약조건 추가
ALTER TABLE memberBoard
ADD CONSTRAINT pk_board_id FOREIGN KEY(Board_id)
REFERENCES boardMember(Member_id);

--테이블 조회
SELECT * FROM memberBoard;