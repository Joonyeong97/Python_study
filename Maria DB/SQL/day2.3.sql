SELECT (money-@MINVALUE)/@rangevalue AS 정규화값 FROM student;


INSERT INTO school(schoolname, address, schoolcode, studentcount)
VALUES("충주여자고등학고", "충주시", "CH00000001",300);

INSERT INTO school(schoolname, address, schoolcode, studentcount)
VALUES("신성여자고등학고", "제주시", "IC00000001", 560);

INSERT INTO school(schoolname, address, schoolcode, studentcount)
VALUES("종로여자고등학교", "종로구", "JR00000001", 300);

INSERT INTO school(schoolname, address, schoolcode, studentcount)
VALUES("제주여자고등학교", "서울시", "SE00000001", 300);


INSERT INTO student(NAME, kor,mat,eng,schoolcode)
VALUES("전공인", 81,81,81,"SE00000001");

INSERT INTO student(NAME, kor, mat, eng, schoolcode)
VALUES("전공이", 81,81,81,"SE00000001");

INSERT INTO student(NAME, kor, mat, eng, schoolcode)
VALUES("전공삼", 91,100,100, "CH00000001");

INSERT INTO student(NAME, kor, mat, eng, schoolcode)
VALUES("전공사", 100,100,100, "CH00000001");

INSERT INTO student(NAME, kor, mat, eng, schoolcode)
VALUES("고려인", 100,100,100, "CH00000001");

INSERT INTO student(NAME, kor ,mat, eng, schoolcode)
VALUES("종로구", 100,81,71, "IC00000001");

INSERT INTO student(NAME, kor ,mat, eng, schoolcode)
VALUES("종로구", 100,81,71, "IC00000001");



SELECT * FROM school;
SELECT * FROM student;
SELECT * FROM school WHERE schoolcode = 'CH00000001';
SELECT * FROM student WHERE NAME ='고려인';
SELECT NAME, kor, eng, mat FROM student WHERE NAME = '전공인';

SELECT NAME AS '이름', kor AS '국어', mat AS '수학', eng AS '영어'
FROM student WHERE NAME = '전공이';
# 서브 쿼리
SELECT NAME, kor,mat, eng FROM student WHERE schoolcode
IN SELECT schoolcode FROM school WHERE schoolcode = 'CH00000001';

SELECT NAME, kor, mat,eng FROM student WHERE NAME LIKE '전공%';
SELECT NAME, kor, mat, eng FROM student WHERE NAME LIKE '%공%';
SELECT NAME, kor, mat, eng FROM student WHERE NAME LIKE '_려_';



SELECT * FROM student WHERE kor>90 AND mat>90 AND eng>90;
SELECT *FROM student WHERE kor>90 OR mat>90 OR eng>90;
SELECT * FROM student WHERE kor>80 AND kor <90;
SELECT * FROM student WHERE kor BETWEEN 80 AND 100;
# group by, having, order by, limit
SELECT * FROM student LIMIT 1;

SELECT * FROM student ORDER BY NAME DESC; # descending 내림차순
SELECT * FROM student ORDER BY NAME ASC; # ascending 오름차순

SELECT sc.schoolname, sc.schoolcode, st.name, st.average
FROM student st INNER JOIN school sc # 두개의 조건이 만족 outer  
ON st.schoolcode = sc.schoolcode;




SELECT NAME AS '이름', kor AS '국어', mat AS '수학', eng AS '영어'
FROM student WHERE NAME ='전공이';
SELECT CONCAT(NAME,'님') AS '이름', kor AS '국어' , mat AS '수학', eng AS '영어' FROM student WHERE NAME='전공인';

SELECT CONCAT(NAME,'님') AS '이름', kor AS '국어' , mat AS '수학', eng AS '영어' FROM student WHERE NAME='전공삼';

SELECT REPLACE(CONCAT(NAME,'님'), '님','형') AS '이름', LPAD(kor,10,'*') AS '국어', mat AS '수학', eng AS '영어' FROM student WHERE NAME='전공삼';

SELECT SUBSTR(REPLACE(CONCAT(NAME, '님'), '님','형'),1,2) AS '이름', LPAD(kor,10,'*') AS '국어', mat AS '수학', eng AS '영어' FROM student WHERE NAME= '전공이';

SELECT LENGTh(SUBSTR(REPLACE(CONCAT(NAME,'님'),'님','형'),1,2)) AS '이름', LPAD(kor,10,'*') AS '국어', mat AS '수학', eng AS '영어' FROM student WHERE NAME= '전공인';





# 문제


-- 전공인의 국어:80, 영어:90으로 변경하고 합계와 평균 그리고 grade를 수정
-- 계산을 수동으로 하고 변화만 적용하시오
SELECT  * FROM student WHERE NAME = '전공인';
UPDATE student SET kor=80,eng=90 WHERE NAME ='전공인';
UPDATE student SET total = 90+80+90, average = ROUND((90+80+90)/3,2),
grade = 'B' WHERE NAME = "전공인";

UPDATE student SET total = 90+80+90, average = ROUND((90+80+90)/3,2),
grade = 
case when average>= 90 then 'A'
when (average>= 80 AND average <90) then 'B'
when (average>= 70 AND average <80) then 'C'
when (average>= 60 AND average <70) then 'D'
ELSE 'F'
END
 WHERE NAME = "전공인";

-- student 중 kor , mat 정수만 출력하시오
SELECT kor,mat FROM student ;

-- student중 average가 90이상인 사람의 name, schoolname을 출력하시오
SELECT NAME,schoolname FROM student,school WHERE average >=90;

SELECT st.name, sc.schoolname
FROM student AS st INNER JOIN school AS sc
ON st.average >90 AND ON st.schoolcode = sc.schoolcode;

-- student중 eng  점수를 출력하되 그 이름을 '영어'로 하시오
SELECT eng AS '영어'  FROM student ;

-- 이름 가운데 자가 '공'인 사람을 모두 출력하시오
SELECT * FROM student WHERE NAME LIKE '%공%';
-- 학교 이름이 충주 여자고등학고인 사람의 name 과 tatal을 출력하시오
SELECT NAME AS '이름', total AS '합계' FROM school,student WHERE schoolname = '충주여자고등학고'
 AND student.schoolcode = school.schoolcode;

SELECT st.name, st.total FROM student AS st
INNER JOIN school AS sc
ON sc.schoolname ="충주여자고등학고"
AND st.schoolcode = sc.schoolcode;

-- student에서 total 을 이용하여 정렬하고 상위 2사람만 출력하시오.
# SELECT * FROM student ORDER BY NAME ASC; # ascending 오름차순
# where , group by, having, order by, limit
SELECT * FROM student ORDER BY total DESC LIMIT 2;


# 저장 프로시져 연습
CALL student_select();
CALL student_insert("제주도11",100,100,10, 'tC00000001', @res);
SELECT @res;

# 문제
# 이름을 변경하는 프로시져를 작성하시오.
call student_namechange('서울시','성남시',@res);
SELECT @res;

call student_sum();
SELECT @res;

call student_updateone();
SELECT * FROM student;