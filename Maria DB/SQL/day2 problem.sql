/*
problem
*/


INSERT INTO people VALUES('BBK','바비킴',1973,'서울','010','00000000',176,'2013-05-05');
INSERT INTO people VALUES('EJW','은지원',1972,'경북','011','88888888',174,'2014-03-03');
INSERT INTO people VALUES('JKW','조관우',1965,'경기','018','99999999',172,'2010-10-10');
INSERT INTO people VALUES('JYP','조용필',1950,'경기','011','44444444',166,'2009-04-04');
INSERT INTO people VALUES('KBS','김범수',1979,'경남','011','22222222',173,'2012-04-04');
INSERT INTO people VALUES('KKH','김경호',1971,'전남','019','33333333',177,'2007-07-07');
INSERT INTO people VALUES('LJB','임재범',1963,'서울','016','66666666',182,'2009-09-09');
INSERT INTO people VALUES('LSG','이승기',1987,'서울','011','11111111',182,'2008-08-08');
INSERT INTO people VALUES('SSK','성시경',1979,'서울',NULL,NULL,186,'2013-12-12');
INSERT INTO people VALUES('YJS','윤종신',1969,'경남',NULL,NULL,170,'2005-05-05');


INSERT INTO products VALUES(1,'KBS','운동화','전자',30,2);
INSERT INTO products VALUES(2,'KBS','노트북','전자',1000,1);
INSERT INTO products VALUES(3,'JYP','모니터','전자',200,1);
INSERT INTO products VALUES(4,'BBK','모니터','전자',200,5);
INSERT INTO products VALUES(5,'KBS','청바지','의류',50,3);
INSERT INTO products VALUES(6,'BBK','메모리','전자',80,10);
INSERT INTO products VALUES(7,'SSK','책','서적',15,5);
INSERT INTO products VALUES(8,'EJW','책','서적',15,2);
INSERT INTO products VALUES(9,'EJW','청바지','의류',50,1);
INSERT INTO products VALUES(10,'BBK','운동화','전자',30,2);
INSERT INTO products VALUES(11,'EJW','책','서적',15,1);
INSERT INTO products VALUES(12,'BBK','운동화','서적',30,2);


# BBK가 구매한 데이터를 출력하시오
SELECT userID,prodName,price,amount FROM products WHERE userID = 'BBK';


# 김씨인 사람중 이름과 키를 기준으로 이름, 키 주소를 내림차순으로 출력하시오
# (이름 뒤에는 '님'을 붙여서 출력)
SELECT CONCAT(NAME,'님') AS '이름',height AS '키' FROM people ORDER BY NAME,height DESC;


# user를 출생년도별 오름차순으로 이름,주소,키,출생년도를 출력하시오
# (이름은 성을 뺴고 출력)
SELECT SUBSTR(NAME,2) AS '이름',addr,height,birthYear FROM people ORDER BY birthYear  ASC;

# 모바일 번호가 011로 시작하는 사람이 몇명인지 출력하시오
SELECT COUNT(*) FROM people WHERE mobile1 = 011;

# 출생년도가 1960년에서 1979년까지 태어난 사람들이 구매한 품목을 출력하시오
SELECT pe.name,pd.prodName,pe.birthYear FROM products pd INNER JOIN people pe ON pe.userID = pd.userID AND birthYear >=1960 and birthYear <= 1979;

# userID별로 구매한 price, amount합계를 출력하시오 (이때 userID는 name으로 출력하시오)
SELECT pd.userID,sum(pd.price), sum(pd.amount) FROM products pd INNER JOIN people pe ON pe.userID = pd.userID GROUP BY userID;

# 주소가 서울인 사람이 구매한 총액을 구하시오
SELECT pe.name,SUM((pd.price*pd.amount)) AS '구매' FROM products pd INNER JOIN people pe ON pe.userID = pd.userid AND pe.addr ='서울' GROUP BY name;

# 품목별 판매 총액을 출력하시오
SELECT groupName,SUM((pd.price*pd.amount)) FROM products pd INNER JOIN people pe ON pe.userID = pd.userID  GROUP BY groupName ORDER BY SUM((pd.price*pd.amount)) DESC;

# 출생년도가 1970년도 이상인 사람을 대상으로 구매한 갯수가 2개 이상인 것의 판매 총합계를 구하시오
SELECT pe.name,pd.prodName,sum(pd.amount) FROM products pd INNER JOIN people pe ON pe.userId = pd.userID AND pe.birthYear >= 1970 AND pd.amount >= 2 GROUP BY prodName;

# 모든 유저를 출력하시오(이름중 김씨와 조씨는 모두 컬씨로 바꾸어 출력)
SELECT if (NAME LIKE '김%' OR NAME LIKE '조%', CONCAT('컬',SUBSTR(NAME,2)), NAME) AS '바뀐이름' FROM people;

# 책을 구매한 사람의 이름과 출생년도와 주소를 출력하시오.
SELECT pe.name,pe.birthYear,pe.addr FROM products pd INNER JOIN people pe ON pe.userID = pd.userID AND pd.prodName = '책' GROUP BY name;