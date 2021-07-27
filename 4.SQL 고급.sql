# 2021/05/18
# 김영현
# SQL 고급

CREATE TABLE `MEMBER` (`uid` VARCHAR(10) PRIMARY KEY,`name` VARCHAR(10),`hp` CHAR(13),`pos` VARCHAR(10),`dep` TINYINT,`rdate` DATETIME);
CREATE TABLE `DEPART` (`depNo` TINYINT PRIMARY KEY,`name` VARCHAR(10),`tel` CHAR(12));
CREATE TABLE `SALE` (`seq` INT AUTO_INCREMENT PRIMARY KEY,`uid` VARCHAR(10),`year` YEAR,`month` TINYINT,`sales` INT);

INSERT INTO `MEMBER` VALUES('a101','박혁거세','010-1234-1001','부장',101,NOW());
INSERT INTO `MEMBER` VALUES('a102','김유신','010-1234-1002','차장',101,NOW());
INSERT INTO `MEMBER` VALUES('a103','김춘추','010-1234-1003','사원',101,NOW());
INSERT INTO `MEMBER` VALUES('a104','장보고','010-1234-1004','대리',102,NOW());
INSERT INTO `MEMBER` VALUES('a105','강감찬','010-1234-1005','과장',102,NOW());
INSERT INTO `MEMBER` VALUES('a106','이성계','010-1234-1006','차장',103,NOW());
INSERT INTO `MEMBER` VALUES('a107','정철','010-1234-1007','차장',103,NOW());
INSERT INTO `MEMBER` VALUES('a108','이순신','010-1234-1008','부장',104,NOW());
INSERT INTO `MEMBER` VALUES('a109','허균','010-1234-1009','부장',104,NOW());
INSERT INTO `MEMBER` VALUES('a110','정약용','010-1234-1010','사원',105,NOW());
INSERT INTO `MEMBER` VALUES('a111','박지원','010-1234-1011','사원',105,NOW());

INSERT INTO `DEPART` VALUES(101,'영업1부','051-512-1001');
INSERT INTO `DEPART` VALUES(102,'영업2부','051-512-1002');
INSERT INTO `DEPART` VALUES(103,'영업3부','051-512-1003');
INSERT INTO `DEPART` VALUES(104,'영업4부','051-512-1004');
INSERT INTO `DEPART` VALUES(105,'영업5부','051-512-1005');
INSERT INTO `DEPART` VALUES(106,'영업지원부','051-512-1006');
INSERT INTO `DEPART` VALUES(107,'인사부','051-512-1007');

INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a101',2018,1,98100);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a102',2018,1,136000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a103',2018,1,80100);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a104',2018,1,78000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a105',2018,1,93000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a101',2018,2,23500);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a102',2018,2,126000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a103',2018,2,18500);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a105',2018,2,19000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a106',2018,2,53000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a101',2019,1,24000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a102',2019,1,109000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a103',2019,1,101000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a104',2019,1,53500);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a107',2019,1,24000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a102',2019,2,160000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a103',2019,2,101000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a104',2019,2,43000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a105',2019,2,24000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a106',2019,2,109000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a102',2020,1,201000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a104',2020,1,63000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a105',2020,1,74000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a106',2020,1,122000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a107',2020,1,111000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a102',2020,2,120000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a103',2020,2,93000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a104',2020,2,84000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a105',2020,2,180000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a108',2020,2,76000);


# 4-1 실습
SELECT * FROM `MEMBER` WHERE `name`='김유신';
SELECT * FROM `MEMBER` WHERE `name`!='김춘추';
SELECT * FROM `MEMBER` WHERE `name`<>'김춘추';

SELECT * FROM `MEMBER` WHERE `pos`='사원' OR '대리';
SELECT * FROM `MEMBER` WHERE `pos` IN('사원','대리');

SELECT * FROM `MEMBER` WHERE `name` LIKE '%신';
SELECT * FROM `MEMBER` WHERE `name` LIKE '김%';
SELECT * FROM `MEMBER` WHERE `name` LIKE '김__';
SELECT * FROM `MEMBER` WHERE `name` LIKE '_성_';
SELECT * FROM `MEMBER` WHERE `name`	LIKE '정_';


# 4-2 실습
SELECT * FROM `SALE` ORDER BY `sales`;
SELECT * FROM `SALE` ORDER BY `sales` ASC;
SELECT * FROM `SALE` ORDER BY `sales` DESC;
SELECT * FROM `SALE` WHERE `sales` > 50000 ORDER BY `sales` DESC;
SELECT * FROM `SALE` WHERE `sales` > 50000 ORDER BY `year`,`month`,`sales` DESC;

# 4-3 실습
SELECT * FROM `SALE` LIMIT 3;
SELECT * FROM `SALE` LIMIT 0,3;
SELECT * FROM `SALE` LIMIT 1,3;
SELECT * FROM `SALE` LIMIT 4,5;
SELECT * FROM `SALE` ORDER BY `sales` DESC LIMIT 3,5;

# 4-4 실습
SELECT SUM(`sales`) AS `합계` FROM `SALE`;
SELECT AVG(`sales`) AS `평균` FROM `SALE`;
SELECT MAX(`sales`) AS `최대값` FROM `SALE`;
SELECT MIN(`sales`) AS `최소값` FROM `SALE`;
SELECT COUNT(`sales`) AS `갯수` FROM `SALE`;
SELECT COUNT(*) AS `갯수` FROM `SALE`;
SELECT SUBSTRING(`hp`,10,4) AS `전화번호 끝자리` FROM `MEMBER`;
INSERT INTO `MEMBER` VALUES('b101','을지문덕','010-5555-1234','사장',107,now());

# 확인문제
SELECT SUM(`sales`) AS `매출합` from `SALE` WHERE `year`=2018 AND `month`=1;
SELECT SUM(`sales`) AS `매출합` ,AVG(`sales`) AS `매출평균` FROM `SALE` WHERE `sales` >= 50000 AND `year`=2019 AND `month`=2;
SELECT MIN(`sales`) AS `최저` , MAX(`sales`) AS `최고` FROM `SALE` WHERE `year`=2020;

# 4-5 실습
SELECT * FROM `SALE` GROUP BY `uid`;
SELECT * FROM `SALE` GROUP BY `year`;
SELECT * FROM `SALE` GROUP BY `uid`,`year`;
SELECT `uid`,COUNT(*) AS `건수` FROM `SALE` GROUP BY `uid`;
SELECT `uid`,SUM(`sales`) AS `합계` FROM `SALE` GROUP BY `uid`;
SELECT `uid`,avg(`sales`) AS `평균` FROM `SALE` GROUP BY `uid`;

SELECT `uid`,`year`,SUM(`sales`) AS `합계` FROM `SALE` WHERE `sales` > 50000 GROUP BY `uid`,`year`;
SELECT `uid`,`year`,SUM(`sales`) AS `합계` FROM `SALE` WHERE `sales` > 50000 GROUP BY `uid`,`year` ORDER BY `year` ASC, `합계`DESC;
SELECT `uid`,`year`,SUM(`sales`) AS `합계` FROM `SALE` WHERE `sales` > 50000 GROUP BY `uid`,`year` ORDER BY `합계`DESC;

# 4-6 실습
SELECT `uid`,SUM(`sales`) AS `합계` FROM `SALE` GROUP BY `uid` HAVING `합계` >=200000;
SELECT `uid`,`year`,SUM(`sales`) AS `합계` FROM `SALE` WHERE `sales` > 100000 GROUP BY `uid`,`year` HAVING `합계` >=200000 ORDER BY `합계`DESC;


# 4-7 실습
CREATE TABLE `SALE2` LIKE `SALE`;
INSERT INTO `SALE2` SELECT * FROM `SALE`;
UPDATE `SALE2` SET `year`= `year`+3;


# 4-8 실습
SELECT *FROM `SALE` UNION SELECT * FROM `SALE2`;
(SELECT *FROM `SALE`) UNION (SELECT * FROM `SALE2`);
SELECT `uid`,`year`,`sales` FROM `SALE` UNION SELECT `uid`,`year`,`sales` FROM `SALE2`;
SELECT `uid`,`year`,SUM(`sales`) AS `합계` FROM `SALE` GROUP BY `uid`,`year` UNION SELECT `uid`,`year`,SUM(`sales`) AS `합계` FROM `SALE2` GROUP BY `uid`,`year` ORDER BY `year` ASC,`합계` DESC;

UPDATE `SALE2` SET `year`= `year`-3;
SELECT `seq`,`uid`,`sales` FROM `SALE` UNION SELECT `seq`,`uid`,`sales` FROM `SALE2`; # 기본적으로 중복 불가
SELECT `seq`,`uid`,`sales` FROM `SALE` UNION ALL SELECT `seq`,`uid`,`sales` FROM `SALE2`; # 중복되는 데이터도 나옴

# 4-9 실습
SELECT * FROM `SALE` INNER JOIN `MEMBER` ON `SALE`.uid=`MEMBER`.uid; # INNER 생략 가능 (대부분 생략함)
SELECT a.`seq`,a.`uid`,a.`sales`,b.`name`,b.`pos` FROM `SALE` AS a JOIN `MEMBER` AS b ON a.uid=b.uid;
SELECT a.`seq`,a.`uid`,a.`sales`,b.`name`,b.`pos` FROM `SALE` AS a JOIN `MEMBER` AS b USING(`uid`);
SELECT * FROM `SALE` AS a, `MEMBER` AS b WHERE a.uid=b.uid;
SELECT * FROM `SALE` AS a, JOIN `MEMBER` AS b ON a.uid=b.uid JOIN `DEPART` AS c ON b.dep=c.depNo;

# 4-10 실습
SELECT * FROM `SALE` LEFT JOIN `MEMBER` ON `SALE`.uid=`MEMBER`.uid;
SELECT * FROM `SALE` RIGHT JOIN `MEMBER` ON `SALE`.uid=`MEMBER`.uid;
