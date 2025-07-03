-- 1. goods_Q&a 테이블 삭제
DROP TABLE goods_qna CASCADE CONSTRAINTS PURGE;

-- 2. goods_Q&a 시퀀스 삭제
DROP SEQUENCE goods_qna_seq;

-- 3. goods_Q&a 테이블 생성
CREATE TABLE goods_qna
(
	goodsNo               NUMBER(13)  NULL ,
	id                    VARCHAR2(30)  NOT NULL ,
	answerDate            DATE  NULL ,
	goodsQNA              NUMBER  NOT NULL ,
	question              VARCHAR2(1000)  NOT NULL ,
	answer                VARCHAR2(1000)  NULL ,
	writeDate             DATE   DEFAULT  sysdate NOT NULL ,
	status                VARCHAR2(20)   DEFAULT  '답변대기중' NOT NULL ,
 PRIMARY KEY (goodsQNA),
 FOREIGN KEY (id) REFERENCES member(id) ON DELETE SET NULL,
 FOREIGN KEY (goodsNo) REFERENCES goods(goodsNo) ON DELETE SET NULL
);

-- 4. goods_Q&a 시퀀스 생성
CREATE SEQUENCE goods_qna_seq;
