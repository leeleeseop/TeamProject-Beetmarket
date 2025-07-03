-- 리뷰 시퀀스 제거 생성 테이블 제거 
DROP SEQUENCE review_seq;
CREATE SEQUENCE review_seq;
DROP TABLE review CASCADE CONSTRAINTS PURGE;

-- 리뷰답변 테이블 제거 
DROP TABLE review_reply CASCADE CONSTRAINTS PURGE;

-- 리뷰 좋아요 기능 시퀀스 제거 생성 테이블 제거 
DROP SEQUENCE review_Like_seq;
CREATE SEQUENCE review_Like_seq;
DROP TABLE review_Like CASCADE CONSTRAINTS PURGE;

--리뷰 테이블 생성
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

--리뷰 답글 테이블 생성
CREATE TABLE review_reply
(
	id                    VARCHAR2(30)  NOT NULL ,
	reviewNo              NUMBER  NOT NULL ,
	content               VARCHAR2(1000)  NOT NULL ,
	WriteDate             DATE   DEFAULT  sysdate NULL ,
 PRIMARY KEY (reviewNo),
 FOREIGN KEY (reviewNo) REFERENCES review(reviewNo),
 FOREIGN KEY (id) REFERENCES member(id) ON DELETE SET NULL
);

--리뷰 좋아요기능 생성
CREATE TABLE review_Like
(
	id                    VARCHAR2(30)  NOT NULL ,
	reviewNo              NUMBER  NOT NULL ,
	reviewLike_No         NUMBER  NOT NULL ,
 PRIMARY KEY (reviewLike_No),
 FOREIGN KEY (reviewNo) REFERENCES review(reviewNo) ON DELETE SET NULL,
 FOREIGN KEY (id) REFERENCES member(id) ON DELETE SET NULL
);
