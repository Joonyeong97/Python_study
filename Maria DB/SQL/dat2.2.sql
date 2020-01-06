INSERT INTO student VALUES(20120001, '고길동', 'm',27,'선박','seoul','010-000-0000',5000);
INSERT INTO student VALUES(20120002, '최둘리', 'm',22,'역사','busan','010-900-9000',4500);
INSERT INTO student VALUES(20120003, '도우너', 'w',15,'역사','daego','010-555-1500',6500);
INSERT INTO student VALUES(20120004, '희동이', 'm',15,'유아','mokpo','010-475-8599',7000);
INSERT INTO student VALUES(20120005, '류현진', 'm',45,'야구선수','seoul','010-122-2245',8000);
INSERT INTO student VALUES(20120006, '손흥민', 'm',29,'축구선수','seoul','010-980-1546',8000);


# 직업별로 급여의 합계를 내시오
SELECT major ,SUM(money) FROM student GROUP BY major;
SELECT COUNT(*) FROM student;
# 최씨로 시작하는사람 출력
SELECT *FROM student WHERE NAME LIKE '최%';
# 서울이 주소이고 고씨인 사람
SELECT *FROM student WHERE addr LIKE 'seoul' AND NAME LIKE '고%';

SELECT COUNT(*) "전체 행수", COUNT(money) "급여건수",
MAX(money) 최대급여, MIN(money) 최소급여,
ROUND(AVG(money),2) 평균급여 FROM student;

SELECT COUNT(*), COUNT(money) ,
MAX(money), MIN(money),ROUND(AVG(money),2) FROM student;
# money에 대하여 min-max 정규화를 실행하시오.
# 그룹함수이기 때문에 그룹값을 상수화해야 정상적으로 계산됨
SELECT MAX(money) - MIN(money) AS 급여구간 FROM student;
# money에 대하여 min-max 정규화를 실행하시오.
SELECT (money - MIN(money)) / (MAX(money) - MIN(money)) AS 정규화 FROM student;
# 프로그램으로 변경 ( 사용자변수 @,@@ 시스템변수)
SELECT MIN(money) INTO @MINVALUE FROM student;jeju
SELECT MAX(money) - MIN(money) INTO @rangevalue FROM student;
SELECT (money - @MINVALUE)/ @rangevalue AS 정규화값 FROM student;

problempeople