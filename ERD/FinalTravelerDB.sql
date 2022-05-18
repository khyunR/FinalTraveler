SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS t_authority;
DROP TABLE IF EXISTS t_post_location;
DROP TABLE IF EXISTS t_post_notice;
DROP TABLE IF EXISTS t_reservation;
DROP TABLE IF EXISTS t_member;




/* Create Tables */

-- 복합키(mb_uid, auth) 설정
CREATE TABLE t_authority
(
	mb_uid int NOT NULL,
	auth varchar(20) NOT NULL,
	CONSTRAINT t_Authority_compositeKey UNIQUE (mb_uid, auth)
) COMMENT = '복합키(mb_uid, auth) 설정';


CREATE TABLE t_member
(
	uid int NOT NULL AUTO_INCREMENT,
	username varchar(20) NOT NULL,
	nickname varchar(20),
	password varchar(200) NOT NULL,
	email varchar(60) NOT NULL,
	mobile varchar(14),
	PRIMARY KEY (uid),
	UNIQUE (username),
	UNIQUE (nickname),
	UNIQUE (email)
);


CREATE TABLE t_post_location
(
	uid int NOT NULL AUTO_INCREMENT,
	mb_uid int NOT NULL,
	subject varchar(100) NOT NULL,
	locationName varchar(100) NOT NULL,
	locationAddr varchar(100) NOT NULL,
	content text,
	regDate datetime NOT NULL DEFAULT now(),
	PRIMARY KEY (uid)
);


CREATE TABLE t_post_notice
(
	uid int NOT NULL AUTO_INCREMENT,
	mb_uid int NOT NULL,
	subject varchar(100) NOT NULL,
	content text NOT NULL,
	regDate datetime NOT NULL DEFAULT now(),
	PRIMARY KEY (uid)
);


CREATE TABLE t_reservation
(
	uid int NOT NULL AUTO_INCREMENT,
	mb_uid int NOT NULL,
	accommoName varchar(20) NOT NULL,
	resDate datetime NOT NULL,
	resPeriod int NOT NULL,
	price int NOT NULL,
	PRIMARY KEY (uid)
);



/* Create Foreign Keys */

ALTER TABLE t_authority
	ADD FOREIGN KEY (mb_uid)
	REFERENCES t_member (uid)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE t_post_location
	ADD FOREIGN KEY (mb_uid)
	REFERENCES t_member (uid)
	ON UPDATE RESTRICT
	ON DELETE NO ACTION
;


ALTER TABLE t_post_notice
	ADD FOREIGN KEY (mb_uid)
	REFERENCES t_member (uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE t_reservation
	ADD FOREIGN KEY (mb_uid)
	REFERENCES t_member (uid)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


