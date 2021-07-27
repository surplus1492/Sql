CREATE TABLE `Book` (`bookid` INT AUTO_INCREMENT PRIMARY KEY, `bookname` VARCHAR(20),`publisher` VARCHAR(20),`price` INT);

CREATE TABLE `Customer` (`custid` INT AUTO_INCREMENT PRIMARY KEY,`name` VARCHAR(10),`address` VARCHAR(20),`phone` CHAR(13));

CREATE TABLE `Order` (`orderid` INT AUTO_INCREMENT PRIMARY KEY,`custid` INT,`bookid` INT,`saleprice` INT,orderdate DATE);


INSERT INTO `Book` (`bookname`,`publisher`,`price`) VALUES ('축구의 역사','굿스포츠',7000);
INSERT INTO `Book` (`bookname`,`publisher`,`price`) VALUES ('축구아는 여자','나무수',13000);
INSERT INTO `Book` (`bookname`,`publisher`,`price`) VALUES ('축구의 이해','대한미디어',22000);
INSERT INTO `Book` (`bookname`,`publisher`,`price`) VALUES ('골프 바이블','대한미디어',35000);
INSERT INTO `Book` (`bookname`,`publisher`,`price`) VALUES ('피겨 교본','굿스포츠',8000);
INSERT INTO `Book` (`bookname`,`publisher`,`price`) VALUES ('역도 단계별기술','굿스포츠',6000);
INSERT INTO `Book` (`bookname`,`publisher`,`price`) VALUES ('야구의 추억','이상미디어',20000);
INSERT INTO `Book` (`bookname`,`publisher`,`price`) VALUES ('야구를 부탁해','이상미디어',13000);
INSERT INTO `Book` (`bookname`,`publisher`,`price`) VALUES ('올림픽 이야기','삼성당',7500);
INSERT INTO `Book` (`bookname`,`publisher`,`price`) VALUES ('Olympic Champions','Pearson',13000);

INSERT INTO `Customer` (`name`,`address`,`phone`) VALUES ('박지성','영국 맨체스타','000-5000-0001');
INSERT INTO `Customer` (`name`,`address`,`phone`) VALUES ('김연아','대한민국 서울','000-6000-0001');
INSERT INTO `Customer` (`name`,`address`,`phone`) VALUES ('장미란','대한민국 강원도','000-7000-0001');
INSERT INTO `Customer` (`name`,`address`,`phone`) VALUES ('추신수','미국 클리블랜드','000-8000-0001');
INSERT INTO `Customer` (`name`,`address`) VALUES ('박세리','대한민국 대전');

INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (1,1,6000,"2014-07-01");
INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (1,3,21000,"2014-07-03");
INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (2,5,8000,"2014-07-03");
INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (3,6,6000,"2014-07-04");
INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (4,7,20000,"2014-07-05");
INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (1,2,12000,"2014-07-07");
INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (4,8,13000,"2014-07-07");
INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (3,10,12000,"2014-07-08");
INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (2,10,7000,"2014-07-09");
INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (3,8,13000,"2014-07-10");

SELECT * FROM `Book`;
SELECT `publisher` FROM `Book`; # distinct (중복 제거 중복을 제거하려는 값 뒤에 넣으면 됨)
SELECT * FROM `Book` WHERE `price` < 20000;

SELECT * FROM `Book` WHERE `price` >=10000 AND `price` <= 20000;
SELECT * FROM `Book` WHERE `publisher` = '굿스포츠' OR `publisher` ='대한미디어';

SELECT `publisher` FROM `Book` WHERE `bookname` ='축구의 역사';
SELECT `publisher` FROM `Book` WHERE `bookname` LIKE '%축구%';
SELECT * FROM `Book` WHERE `bookname` LIKE '_구%';

SELECT * FROM `Book` WHERE `bookname` LIKE '%축구%' AND `price`>=20000;
SELECT * FROM `Book` Order BY `bookname` ASC;
SELECT * FROM `Book` Order BY `price` ASC , `bookname` ASC;
SELECT * FROM `Book` Order BY `price` DESC , `publisher` ASC;

SELECT SUM(`saleprice`) AS `총판매액` FROM `Order`;
SELECT SUM(`saleprice`) AS `총매출` FROM `Order` WHERE `custid` = (SELECT `custid` FROM `Customer` WHERE `name`='김연아'); # `custid`=2 로 풀었음
SELECT SUM(`saleprice`) AS `총판매액`, AVG(`saleprice`) AS `평균값`,MIN(`saleprice`) AS `최저가`,MAX(`saleprice`) AS `최고가` FROM `Order`;
SELECT COUNT(*) AS `판매건수` FROM `Order`;
SELECT `custid`,COUNT(*) AS `수량` FROM `Order` WHERE `saleprice` >8000 GROUP BY `custid` HAVING `수량` >= 2;
SELECT * FROM `Customer` JOIN `Order` ON `Customer`.custid=`Order`.custid;

SELECT * FROM `Customer` JOIN `Order` ON `Customer`.custid=`Order`.custid Order BY `Customer`.custid ASC;
SELECT `name`, `saleprice` FROM `Customer` JOIN `Order` ON `Customer`.custid=`Order`.custid Order BY `custid` ASC;
SELECT `name`, SUM(`saleprice`) FROM `Customer` JOIN `Order` ON `Customer`.custid=`Order`.custid GROUP BY `name` Order BY `name` ASC ;
SELECT `name`, `bookname` FROM `Order` JOIN `Customer` ON `Customer`.custid=`Order`.custid JOIN `Book` ON `Order`.bookid=`Book`.bookid;

SELECT `name`,`bookname` FROM `Order` JOIN `Customer` ON `Customer`.custid=`Order`.custid JOIN `Book` ON `Order`.bookid=`Book`.bookid WHERE `saleprice`=20000;
SELECT `bookname` FROM `Book` WHERE `price`= (SELECT MAX(`price`) FROM `Book`);
INSERT INTO `Book` (`bookname`,`publisher`,`price`) VALUES ('스포츠 의학','한솔의학서적',90000);
INSERT INTO `Book` (`bookname`,`publisher`) VALUES ('스포츠 의학','한솔의학서적');
UPDATE `Customer` SET `address` = '대한민국 부산' WHERE `custid`=5;
DELETE FROM `Customer` WHERE `custid`=5;
