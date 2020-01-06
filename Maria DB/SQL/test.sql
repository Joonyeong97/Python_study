CREATE TABLE Students(
	name VARCHAR(50) NULL DEFAULT NULL,
	kor INT(11) NULL DEFAULT NULL,
	eng INT(11) NULL DEFAULT NULL,
	math INT(11) NULL DEFAULT NULL,
	hap FLOAT NULL DEFAULT NULL,
	avg FLOAT NULL DEFAULT NULL
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

# CRUD (Create, select, update, delete)
insert into Students(name, kor, eng, math, hap, avg) VALUES("대한이", 90,90,90,SUM(90,90,90),90);
insert into Students(name, kor, eng, math, hap, avg) VALUES("민국이", 80,80,81,241,80.33);
insert into Students(name, kor, eng, math, hap, avg) VALUES("만세", 100,100,100,300,100);
insert into Students(name, kor, eng, math, hap, avg) VALUES("만세11111", 100,100,100,300,100);
# 데이터베이스 (외부접속단위),테이블,필드,레코드
# * : 모두다
SELECT * FROM authors;
SELECT * FROM authors WHERE NAME = "대한이";
SELECT address FROM authors WHERE NAME ="만세";

# update set
UPDATE authors SET NAME="대한민국" WHERE NAME = "대한이";

# delete
DELETE FROM authors WHERE NAME="만세"

# 3인분의 성적을 students 테이블에 입력하고 출력하시오
# 이름 국어 영어 수학 총점 평균