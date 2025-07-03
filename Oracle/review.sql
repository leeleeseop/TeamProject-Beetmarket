DROP SEQUENCE review_seq;

CREATE SEQUENCE review_seq;

DROP TABLE review CASCADE CONSTRAINTS PURGE;

CREATE TABLE review
(
	orderNo               NUMBER  NULL ,
	reviewContent         VARCHAR2(1000)  NOT NULL ,
	reviewNo              NUMBER  NOT NULL ,
	WriteDate             DATE   DEFAULT  sysdate NULL ,
	starscore             NUMBER  NOT NULL ,
	reviewImage           VARCHAR2(200)  NULL ,
 PRIMARY KEY (reviewNo),
 FOREIGN KEY (orderNo) REFERENCES orders(orderNo) ON DELETE SET NULL
);
