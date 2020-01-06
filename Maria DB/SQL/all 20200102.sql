-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.4.11-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- jeju 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `jeju` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `jeju`;

-- 테이블 jeju.authors 구조 내보내기
CREATE TABLE IF NOT EXISTS `authors` (
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `열 2` int(11) DEFAULT NULL,
  `열 3` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.authors:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` (`name`, `address`, `열 2`, `열 3`) VALUES
	('대한민국', '서울시', NULL, NULL),
	('민국이', '광주시', NULL, NULL);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;

-- 테이블 jeju.goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods` (
  `code` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `su` int(11) DEFAULT NULL,
  `dan` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='primnary key : 중복이 불가능, 외부에서 참조가 가능한키.';

-- 테이블 데이터 jeju.goods:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`code`, `name`, `su`, `dan`) VALUES
	(1, '냉장고', 2, 850000),
	(2, '세탁기', 3, 550000),
	(3, '전자레인지', 2, 350000),
	(4, 'HDTV', 3, 1500000),
	(5, 'VR기기', 2, 1440000),
	(6, 'Drone', 1, 890000),
	(7, '고성능컴퓨터', 3, NULL);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

-- 테이블 jeju.school 구조 내보내기
CREATE TABLE IF NOT EXISTS `school` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `schoolname` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `schoolcode` char(10) NOT NULL,
  `studentcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`schoolcode`),
  KEY `no` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.school:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` (`no`, `schoolname`, `address`, `schoolcode`, `studentcount`) VALUES
	(1, '충주여자고등학고', '충주시', 'CH00000001', 300),
	(2, '신성여자고등학고', '제주시', 'IC00000001', 560),
	(3, '종로여자고등학교', '종로구', 'JR00000001', 300),
	(4, '제주여자고등학교', '서울시', 'SE00000001', 300);
/*!40000 ALTER TABLE `school` ENABLE KEYS */;

-- 테이블 jeju.student 구조 내보내기
CREATE TABLE IF NOT EXISTS `student` (
  `bunho` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `kor` tinyint(4) DEFAULT NULL,
  `mat` tinyint(4) DEFAULT NULL,
  `eng` tinyint(4) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `average` float DEFAULT NULL,
  `grade` char(2) DEFAULT NULL,
  `schoolcode` char(10) DEFAULT NULL,
  PRIMARY KEY (`bunho`),
  KEY `schoolcode` (`schoolcode`),
  CONSTRAINT `FK_student_school` FOREIGN KEY (`schoolcode`) REFERENCES `school` (`schoolcode`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.student:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`bunho`, `name`, `kor`, `mat`, `eng`, `total`, `average`, `grade`, `schoolcode`) VALUES
	(2, '전공인', 81, 82, 91, 254, 84.67, 'B', 'SE00000001'),
	(3, '전공이', 82, 82, 82, 246, 82, 'B', 'SE00000001'),
	(4, '전공삼', 92, 101, 101, 294, 98, 'A', 'CH00000001'),
	(5, '전공사', 101, 101, 101, 303, 101, 'A', 'CH00000001'),
	(6, '고려인', 101, 101, 101, 303, 101, 'A', 'CH00000001'),
	(7, '성남시', 101, 82, 72, 255, 85, 'B', 'IC00000001'),
	(8, '성남시', 101, 82, 72, 255, 85, 'B', 'IC00000001'),
	(9, '제주도', 101, 101, 101, 303, 101, 'A', 'IC00000001');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- 테이블 jeju.student2 구조 내보내기
CREATE TABLE IF NOT EXISTS `student2` (
  `num` int(11) NOT NULL,
  `name` varchar(12) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  `addr` varchar(15) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.student2:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `student2` DISABLE KEYS */;
INSERT INTO `student2` (`num`, `name`, `sex`, `age`, `major`, `addr`, `tel`, `money`) VALUES
	(20120001, '고길동', 'm', 27, '선박', 'seoul', '010-000-0000', 5000),
	(20120002, '최둘리', 'm', 22, '역사', 'busan', '010-900-9000', 4500),
	(20120003, '도우너', 'w', 15, '역사', 'daego', '010-555-1500', 6500),
	(20120004, '희동이', 'm', 15, '유아', 'mokpo', '010-475-8599', 7000),
	(20120005, '류현진', 'm', 45, '야구선수', 'seoul', '010-122-2245', 8000),
	(20120006, '손흥민', 'm', 29, '축구선수', 'seoul', '010-980-1546', 8000);
/*!40000 ALTER TABLE `student2` ENABLE KEYS */;

-- 테이블 jeju.students2 구조 내보내기
CREATE TABLE IF NOT EXISTS `students2` (
  `name` varchar(50) DEFAULT NULL,
  `kor` int(11) DEFAULT NULL,
  `eng` int(11) DEFAULT NULL,
  `math` int(11) DEFAULT NULL,
  `hap` float DEFAULT NULL,
  `avg` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.students2:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `students2` DISABLE KEYS */;
INSERT INTO `students2` (`name`, `kor`, `eng`, `math`, `hap`, `avg`) VALUES
	('대한이', 90, 90, 90, 270, 90),
	('민국이', 80, 80, 81, 241, 80.33),
	('만세', 100, 100, 100, 300, 100);
/*!40000 ALTER TABLE `students2` ENABLE KEYS */;

-- 프로시저 jeju.student_insert 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_insert`(
	IN `name` VARCHAR(50),
	IN `kor` INT,
	IN `mat` INT,
	IN `eng` INT,
	IN `schoolcode` CHAR(10),
	OUT `result` INT
)
BEGIN
	DECLARE exit handler FOR sqlexception
	begin
	ROLLBACK; # COMMIT, SAVEPOINT
	SET result = -1;
	END;
	START TRANSACTION;
	INSERT INTO student(NAME,kor,mat,eng,schoolcode)
	VALUE(NAME, kor, mat, eng, schoolcode);
	COMMIT;
	SET result = 0;
	
END//
DELIMITER ;

-- 프로시저 jeju.student_namechange 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_namechange`(
	IN `oldname` VARCHAR(50),
	IN `newname` VARCHAR(50),
	OUT `result` INT
)
BEGIN

DECLARE cnt int DEFAULT 0;
SELECT COUNT(*) INTO cnt FROM student WHERE NAME = oldname;

if cnt>0 then 
UPDATE student SET name = newname WHERE NAME = oldname LIMIT 1;
set result := 0;


ELSE SET result := -1;
END if;

END//
DELIMITER ;

-- 프로시저 jeju.student_select 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_select`()
BEGIN
	SELECT * FROM student;

END//
DELIMITER ;

-- 프로시저 jeju.student_sum 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_sum`()
BEGIN
DROP TABLE if EXISTS sungjuk_hab;
CREATE TABLE sungjuk_hab(korhab FLOAT,mathab FLOAT, enghab FLOAT) AS SELECT SUM(kor) AS korhab, SUM(mat) AS mathab,
SUM(eng) AS enghab FROM student;

INSERT INTO sungjuk_hab (korhab, mathab, enghab)
SELECT ROUND(AVG(kor),2) , ROUND(AVG(mat),2), ROUND(AVG(eng),2)
FROM student;
SELECT * FROM sunjuk_hab;
END//
DELIMITER ;

-- 프로시저 jeju.student_updateone 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_updateone`()
BEGIN
declare _done int default false; # 무한루트의 종료조건
declare name_var varchar(20); # 하나의 데이터를 처리하기 위한 변수
declare kor_var int;
declare mat_var int;
declare eng_var int;
# cursor : 데이터를 가리키는 위치
declare cursor_student cursor for select name, kor, mat, eng
from student;
declare continue handler for not found set _done = True;
open cursor_student;
repeat
fetch cursor_student into name_var, kor_var, mat_var, eng_var;
if not _done then # 거짓을 부정
update student set kor = kor_var+1, mat =  mat_var +1 ,eng = eng_var +1
where name = name_var;
set _done = false;
end if;
until _done # true 가 될때까지 무한루프
end repeat;
close cursor_student;

END//
DELIMITER ;

-- 테이블 jeju.sungjuk_hab 구조 내보내기
CREATE TABLE IF NOT EXISTS `sungjuk_hab` (
  `korhab` float DEFAULT NULL,
  `mathab` float DEFAULT NULL,
  `enghab` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.sungjuk_hab:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sungjuk_hab` DISABLE KEYS */;
INSERT INTO `sungjuk_hab` (`korhab`, `mathab`, `enghab`) VALUES
	(752, 724, 713),
	(94, 90.5, 89.13);
/*!40000 ALTER TABLE `sungjuk_hab` ENABLE KEYS */;

-- 트리거 jeju.student_before_insert 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `student_before_insert` BEFORE INSERT ON `student` FOR EACH ROW BEGIN # OLD : 입력된값, NEW 새롭게 만들어질 데이터 , SET
	SET NEW.total = NEW.kor + NEW.mat + NEW.eng;
	SET NEW.average = ROUND(NEW.total/3,2);
	
	IF NEW.average >=90 THEN SET NEW.grade='A';
	ELSEIF NEW.average >=80 THEN SET NEW.grade='B';
	ELSEIF NEW.average >=70 THEN SET NEW.grade='C';
	ELSEIF NEW.average >=60 THEN SET NEW.grade='D';
	ELSE SET NEW.grade='F';
	END if;
	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 트리거 jeju.student_before_update 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `student_before_update` BEFORE UPDATE ON `student` FOR EACH ROW BEGIN
	SET NEW.total = NEW.kor + NEW.mat + NEW.eng;
	SET NEW.average = ROUND(NEW.total/3,2);
	
	IF NEW.average >=90 THEN SET NEW.grade='A';
	ELSEIF NEW.average >=80 THEN SET NEW.grade='B';
	ELSEIF NEW.average >=70 THEN SET NEW.grade='C';
	ELSEIF NEW.average >=60 THEN SET NEW.grade='D';
	ELSE SET NEW.grade='F';
	END if;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- problem 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `problem` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `problem`;

-- 테이블 problem.people 구조 내보내기
CREATE TABLE IF NOT EXISTS `people` (
  `userID` char(3) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `birthYear` int(4) DEFAULT NULL,
  `addr` varchar(4) DEFAULT NULL,
  `mobile1` char(3) DEFAULT NULL,
  `mobile2` char(8) DEFAULT NULL,
  `height` int(3) DEFAULT NULL,
  `mDate` date DEFAULT NULL,
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='people';

-- 테이블 데이터 problem.people:~10 rows (대략적) 내보내기
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` (`userID`, `name`, `birthYear`, `addr`, `mobile1`, `mobile2`, `height`, `mDate`) VALUES
	('BBK', '바비킴', 1973, '서울', '010', '00000000', 176, '2013-05-05'),
	('EJW', '은지원', 1972, '경북', '011', '88888888', 174, '2014-03-03'),
	('JKW', '조관우', 1965, '경기', '018', '99999999', 172, '2010-10-10'),
	('JYP', '조용필', 1950, '경기', '011', '44444444', 166, '2009-04-04'),
	('KBS', '김범수', 1979, '경남', '011', '22222222', 173, '2012-04-04'),
	('KKH', '김경호', 1971, '전남', '019', '33333333', 177, '2007-07-07'),
	('LJB', '임재범', 1963, '서울', '016', '66666666', 182, '2009-09-09'),
	('LSG', '이승기', 1987, '서울', '011', '11111111', 182, '2008-08-08'),
	('SSK', '성시경', 1979, '서울', NULL, NULL, 186, '2013-12-12'),
	('YJS', '윤종신', 1969, '경남', NULL, NULL, 170, '2005-05-05');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;

-- 테이블 problem.products 구조 내보내기
CREATE TABLE IF NOT EXISTS `products` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `userID` char(3) DEFAULT NULL,
  `prodName` varchar(50) DEFAULT NULL,
  `groupName` char(3) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `userID` (`userID`),
  CONSTRAINT `FK_products_people` FOREIGN KEY (`userID`) REFERENCES `people` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- 테이블 데이터 problem.products:~11 rows (대략적) 내보내기
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`num`, `userID`, `prodName`, `groupName`, `price`, `amount`) VALUES
	(1, 'KBS', '운동화', '전자', 30, 2),
	(2, 'KBS', '노트북', '전자', 1000, 1),
	(3, 'JYP', '모니터', '전자', 200, 1),
	(4, 'BBK', '모니터', '전자', 200, 5),
	(5, 'KBS', '청바지', '의류', 50, 3),
	(6, 'BBK', '메모리', '전자', 80, 10),
	(7, 'SSK', '책', '서적', 15, 5),
	(8, 'EJW', '책', '서적', 15, 2),
	(9, 'EJW', '청바지', '의류', 50, 1),
	(10, 'BBK', '운동화', '전자', 30, 2),
	(11, 'EJW', '책', '서적', 15, 1),
	(12, 'BBK', '운동화', '서적', 30, 2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
