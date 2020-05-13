CREATE TABLE book(
	title varchar2(30),
	auth varchar2(20),
	isbn varchar2(20),
	comp varchar2(20) PRIMARY KEY NOT NULL,
	cost number,
	su number,
	price number
);