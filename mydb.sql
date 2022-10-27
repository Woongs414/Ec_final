-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.8-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- mydb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `mydb`;

-- 테이블 mydb.admin_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `admin_tbl` (
  `admin_num` int(11) NOT NULL COMMENT '관리자 번호',
  `admin_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '관리자 아이디',
  `admin_pw` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '관리자 비밀번호',
  `admin_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관리자 명',
  `admin_tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관리자 연락처',
  `admin_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관리자 이메일',
  `level` int(11) NOT NULL COMMENT '관리자 등급레벨',
  `reg_date` date NOT NULL COMMENT '등록일',
  `mod_date` date NOT NULL COMMENT '수정일',
  PRIMARY KEY (`admin_num`),
  UNIQUE KEY `admin_id_UNIQUE` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.admin_tbl:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `admin_tbl` DISABLE KEYS */;
INSERT INTO `admin_tbl` (`admin_num`, `admin_id`, `admin_pw`, `admin_name`, `admin_tel`, `admin_email`, `level`, `reg_date`, `mod_date`) VALUES
	(1, 'admin', '1234', '김희재', '010-0000-0000', 'test@naver.com', 0, '2022-09-14', '2022-09-14');
/*!40000 ALTER TABLE `admin_tbl` ENABLE KEYS */;

-- 테이블 mydb.book_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `book_tbl` (
  `book_num` int(11) NOT NULL COMMENT '예약번호',
  `seller_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'FK(seller_tbl) 가게명',
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'FK(user_tbl)',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '예약자명',
  `reserv_date` date NOT NULL COMMENT '예약일',
  `reserv_time` time NOT NULL COMMENT '예약시간',
  `user_tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '예약자 휴대번호',
  `count_pp` int(11) DEFAULT NULL COMMENT '예약자수',
  `user_email` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일',
  `reserv_pay` int(11) DEFAULT 0 COMMENT '예약선금',
  `reg_date` date NOT NULL COMMENT '예약을 진행한 날짜',
  `order_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reserv_status` int(11) NOT NULL,
  PRIMARY KEY (`book_num`),
  KEY `seller_id` (`seller_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `FK_book_tbl_seller_tbl` FOREIGN KEY (`seller_id`) REFERENCES `seller_tbl` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_book_tbl_user_tbl` FOREIGN KEY (`user_id`) REFERENCES `user_tbl` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.book_tbl:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `book_tbl` DISABLE KEYS */;
INSERT INTO `book_tbl` (`book_num`, `seller_id`, `user_id`, `user_name`, `reserv_date`, `reserv_time`, `user_tel`, `count_pp`, `user_email`, `reserv_pay`, `reg_date`, `order_id`, `reserv_status`) VALUES
	(1, 'stest001', 'test1', '김희재', '2022-10-22', '13:00:00', '010-1234-5678', 2, NULL, 10000, '2022-10-06', 'asdfghjko', 1),
	(2, 'stest002', 'test1', '테스트1', '2022-10-26', '17:00:00', '010-0000-0000', 3, 'test1@test.com', 10000, '2022-10-07', 'BpMmEFJDXA', 2),
	(3, 'stest001', 'test1', '테스트1', '2022-10-17', '13:30:00', '010-0000-0000', 3, 'test1@test.com', 10000, '2022-10-07', 'Eg9zPi8Jdn', 1),
	(4, 'stest001', 'test1', '테스트1', '2022-10-20', '17:00:00', '010-0000-0000', 5, 'test1@test.com', 10000, '2022-10-07', 'U1OT8SzGfR', 1),
	(5, 'stest002', 'testuser', '이순신', '2022-10-25', '15:00:00', '010-1234-5678', 4, NULL, 0, '2022-10-19', 'abcdefg324', 2),
	(6, 'stest002', 'qwer1', '강감찬', '2022-10-26', '12:00:00', '010-1234-5678', 4, NULL, 0, '2022-10-18', 'rlagmlwo20', 2),
	(7, 'stest002', 'qwer1', '서태웅', '2022-09-19', '12:00:00', '010-1234-5678', 4, NULL, 0, '2022-10-19', 'rlagmlwo22', 2);
/*!40000 ALTER TABLE `book_tbl` ENABLE KEYS */;

-- 테이블 mydb.category_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `category_tbl` (
  `category_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '코드',
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이름(설명)',
  `parent_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '부모코드',
  PRIMARY KEY (`category_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.category_tbl:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `category_tbl` DISABLE KEYS */;
INSERT INTO `category_tbl` (`category_code`, `category_name`, `parent_code`) VALUES
	('1', '먹플리', '0'),
	('10', '먹거리', '0'),
	('2', '볼플리', '0'),
	('20', '볼거리', '0'),
	('9', '공지사항/이벤트', '0'),
	('9-1', '사용자 공지사항', '9'),
	('9-2', '사용자 이벤트', '9'),
	('9-3', '판매자 공지사항', '9');
/*!40000 ALTER TABLE `category_tbl` ENABLE KEYS */;

-- 테이블 mydb.custmanage_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `custmanage_tbl` (
  `custState_num` int(11) NOT NULL COMMENT '고객관리 번호\\n',
  `category_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '카테고리코드(제재/혜택)',
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자 아이디',
  `seller_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '판매자 아이디',
  `cust_kind` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '분류(화이트/블랙)',
  `cust_reason` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사유',
  `process` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '승인상태',
  `reg_date` date NOT NULL COMMENT '등록일',
  `mod_date` date NOT NULL COMMENT '수정일',
  PRIMARY KEY (`custState_num`),
  KEY `user_id` (`user_id`),
  KEY `seller_id` (`seller_id`),
  KEY `category_num` (`category_code`) USING BTREE,
  CONSTRAINT `FK_custmanage_tbl_category_tbl` FOREIGN KEY (`category_code`) REFERENCES `category_tbl` (`category_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_custmanage_tbl_seller_tbl` FOREIGN KEY (`seller_id`) REFERENCES `seller_tbl` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_custmanage_tbl_user_tbl` FOREIGN KEY (`user_id`) REFERENCES `user_tbl` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.custmanage_tbl:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `custmanage_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `custmanage_tbl` ENABLE KEYS */;

-- 프로시저 mydb.dummy_board 구조 내보내기
DELIMITER //
CREATE PROCEDURE `dummy_board`()
begin
DECLARE i INT DEFAULT 21;
while(i<=40) DO
INSERT INTO notice_tbl
(list_num,category_code,admin_id,image_fileName,no_title,no_content,hits,reg_date,mod_date)
VALUES
(i,'9-3','admin',NULL,CONCAT('판매자 공지사항 ',i),CONCAT('판매자 공지사항  내용',i),0,CURDATE(),NULL);

SET i = i+1;
END while;

END//
DELIMITER ;

-- 함수 mydb.FUNCTION_hierarchical_comment 구조 내보내기
DELIMITER //
CREATE FUNCTION `FUNCTION_hierarchical_comment`() RETURNS int(11)
    READS SQL DATA
    COMMENT 'comment리스트를 위한 함수'
BEGIN
	DECLARE v_comment_num INT;
	DECLARE v_parent_num INT;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET @comment_num = NULL;
	SET v_parent_num = @comment_num;
	SET v_comment_num = -1;
	if @comment_num IS NULL then
		RETURN NULL;
	END if;
	LOOP
	SELECT MIN(comment_num) INTO @comment_num
	FROM u_comments_tbl
	WHERE parent_num = v_parent_num 
		AND comment_num > v_comment_num;
	if(@comment_num IS NOT NULL) OR (v_comment_num = @start_with) then
		SET @LEVEL = @LEVEL+1;
		RETURN @comment_num;
	END if;
	SET @LEVEL := @LEVEL-1;
	SELECT comment_num,parent_num INTO v_comment_num, v_parent_num
	FROM u_comments_tbl
	WHERE comment_num = v_parent_num;
	END LOOP;
END//
DELIMITER ;

-- 테이블 mydb.kakao_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `kakao_tbl` (
  `k_number` int(11) NOT NULL,
  `k_name` varchar(20) NOT NULL DEFAULT '',
  `k_email` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`k_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.kakao_tbl:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `kakao_tbl` DISABLE KEYS */;
INSERT INTO `kakao_tbl` (`k_number`, `k_name`, `k_email`) VALUES
	(1, '성웅', 'sungwoong414@naver.com'),
	(2, '승현', 'rlatmd98@nate.com'),
	(3, '�꽦�썒', 'sungwoong414@naver.com'),
	(4, 'woongs', 'sungwoong414@naver.com'),
	(5, '�넚誘쇨꼍', 'tar1998@naver.com');
/*!40000 ALTER TABLE `kakao_tbl` ENABLE KEYS */;

-- 테이블 mydb.notice_image_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `notice_image_tbl` (
  `image_num` int(11) NOT NULL COMMENT '이미지번호',
  `list_num` int(11) NOT NULL COMMENT '글번호',
  `origin_filename` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '원본파일이름',
  `image_fileName` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '서버에 저장될 파일이름',
  PRIMARY KEY (`image_num`),
  UNIQUE KEY `stored_filename` (`image_fileName`) USING BTREE,
  KEY `fk_image_tbl_u_playlist_tbl1_idx` (`list_num`) USING BTREE,
  CONSTRAINT `FK_notice_image_tbl_notice_tbl` FOREIGN KEY (`list_num`) REFERENCES `notice_tbl` (`list_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.notice_image_tbl:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `notice_image_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice_image_tbl` ENABLE KEYS */;

-- 테이블 mydb.notice_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `notice_tbl` (
  `list_num` int(11) NOT NULL COMMENT '글 번호',
  `category_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '카테고리 코드\\n',
  `admin_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '관리자 아이디',
  `no_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '글제목',
  `no_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '내용',
  `image_fileName` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지이름',
  `reg_date` date NOT NULL COMMENT '등록일자',
  `mod_date` date DEFAULT NULL COMMENT '수정일자',
  `hits` int(11) DEFAULT 0 COMMENT '조회수',
  PRIMARY KEY (`list_num`),
  KEY `category_code` (`category_code`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `FK_notice_tbl_admin_tbl` FOREIGN KEY (`admin_id`) REFERENCES `admin_tbl` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_notice_tbl_category_tbl` FOREIGN KEY (`category_code`) REFERENCES `category_tbl` (`category_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.notice_tbl:~37 rows (대략적) 내보내기
/*!40000 ALTER TABLE `notice_tbl` DISABLE KEYS */;
INSERT INTO `notice_tbl` (`list_num`, `category_code`, `admin_id`, `no_title`, `no_content`, `image_fileName`, `reg_date`, `mod_date`, `hits`) VALUES
	(1, '9-1', 'admin', '공지사항 테스트1', '공지사항 내용1', '', '2022-10-04', NULL, 0),
	(2, '9-1', 'admin', '공지사항 테스트2', '공지사항 내용2', '', '2022-10-04', NULL, 0),
	(3, '9-1', 'admin', '공지사항 테스트3', '공지사항 내용3', '', '2022-10-04', NULL, 0),
	(4, '9-1', 'admin', '공지사항 테스트4', '공지사항 내용4', '', '2022-10-04', NULL, 0),
	(5, '9-1', 'admin', '공지사항 테스트5', '공지사항 내용5', '', '2022-10-04', NULL, 0),
	(6, '9-1', 'admin', '공지사항 테스트6', '공지사항 내용6', '', '2022-10-04', NULL, 0),
	(7, '9-1', 'admin', '공지사항 테스트7', '공지사항 내용7', '', '2022-10-04', NULL, 0),
	(8, '9-1', 'admin', '공지사항 테스트8', '공지사항 내용8', '', '2022-10-04', NULL, 0),
	(9, '9-1', 'admin', '공지사항 테스트9', '공지사항 내용9', '', '2022-10-04', NULL, 0),
	(10, '9-1', 'admin', '공지사항 테스트10', '공지사항 내용10', '', '2022-10-04', NULL, 5),
	(11, '9-2', 'admin', '이벤트 테스트11', '이벤트 내용11', 'event.png', '2022-10-04', NULL, 0),
	(12, '9-2', 'admin', '이벤트 테스트12', '이벤트 내용12', 'event.png', '2022-10-04', NULL, 0),
	(13, '9-2', 'admin', '이벤트 테스트13', '이벤트 내용13', 'event.png', '2022-10-04', NULL, 0),
	(14, '9-2', 'admin', '이벤트 테스트14', '이벤트 내용14', 'event.png', '2022-10-04', NULL, 1),
	(15, '9-2', 'admin', '이벤트 테스트15', '이벤트 내용15', 'event.png', '2022-10-04', NULL, 0),
	(16, '9-2', 'admin', '이벤트 테스트16', '이벤트 내용16', 'event.png', '2022-10-04', NULL, 0),
	(17, '9-2', 'admin', '이벤트 테스트17', '이벤트 내용17', 'event.png', '2022-10-04', NULL, 1),
	(18, '9-2', 'admin', '이벤트 테스트18', '이벤트 내용18', 'event.png', '2022-10-04', NULL, 0),
	(19, '9-2', 'admin', '이벤트 테스트19', '이벤트 내용19', 'event.png', '2022-10-04', NULL, 1),
	(20, '9-2', 'admin', '이벤트 테스트20', '이벤트 내용20', 'event.png', '2022-10-04', NULL, 25),
	(21, '9-3', 'admin', '판매자 공지사항 21', '판매자 공지사항  내용21', NULL, '2022-10-18', NULL, 0),
	(22, '9-3', 'admin', '판매자 공지사항 22', '판매자 공지사항  내용22', NULL, '2022-10-18', NULL, 0),
	(23, '9-3', 'admin', '판매자 공지사항 23', '판매자 공지사항  내용23', NULL, '2022-10-18', NULL, 0),
	(24, '9-3', 'admin', '판매자 공지사항 24', '판매자 공지사항  내용24', NULL, '2022-10-18', NULL, 0),
	(25, '9-3', 'admin', '판매자 공지사항 25', '판매자 공지사항  내용25', NULL, '2022-10-18', NULL, 0),
	(26, '9-3', 'admin', '판매자 공지사항 26', '판매자 공지사항  내용26', NULL, '2022-10-18', NULL, 1),
	(27, '9-3', 'admin', '판매자 공지사항 27', '판매자 공지사항  내용27', NULL, '2022-10-18', NULL, 0),
	(28, '9-3', 'admin', '판매자 공지사항 28', '판매자 공지사항  내용28', NULL, '2022-10-18', NULL, 0),
	(29, '9-3', 'admin', '판매자 공지사항 29', '판매자 공지사항  내용29', NULL, '2022-10-18', NULL, 0),
	(30, '9-3', 'admin', '판매자 공지사항 30', '판매자 공지사항  내용30', NULL, '2022-10-18', NULL, 0),
	(31, '9-3', 'admin', '판매자 공지사항 31', '판매자 공지사항  내용31', NULL, '2022-10-18', NULL, 1),
	(32, '9-3', 'admin', '판매자 공지사항 32', '판매자 공지사항  내용32', NULL, '2022-10-18', NULL, 1),
	(33, '9-3', 'admin', '판매자 공지사항 33', '판매자 공지사항  내용33', NULL, '2022-10-18', NULL, 0),
	(34, '9-3', 'admin', '판매자 공지사항 34', '판매자 공지사항  내용34', NULL, '2022-10-18', NULL, 0),
	(35, '9-3', 'admin', '판매자 공지사항 35', '판매자 공지사항  내용35', NULL, '2022-10-18', NULL, 0),
	(36, '9-3', 'admin', '판매자 공지사항 36', '판매자 공지사항  내용36', NULL, '2022-10-18', NULL, 1),
	(37, '9-3', 'admin', '판매자 공지사항 37', '판매자 공지사항  내용37', NULL, '2022-10-18', NULL, 2),
	(38, '9-3', 'admin', '판매자 공지사항 38', '판매자 공지사항  내용38', NULL, '2022-10-18', NULL, 5),
	(39, '9-3', 'admin', '판매자 공지사항 39', '판매자 공지사항  내용39', NULL, '2022-10-18', NULL, 6),
	(40, '9-3', 'admin', '판매자 공지사항 40', '판매자 공지사항  내용40', NULL, '2022-10-18', NULL, 61);
/*!40000 ALTER TABLE `notice_tbl` ENABLE KEYS */;

-- 테이블 mydb.nouser_book_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `nouser_book_tbl` (
  `book_num` int(11) NOT NULL COMMENT '예약번호',
  `seller_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'FK(seller_tbl) 가게명',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '예약자명',
  `reserv_date` date NOT NULL COMMENT '예약일',
  `reserv_time` time NOT NULL COMMENT '예약시간',
  `user_tel` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '예약자 휴대번호',
  `count_pp` int(11) DEFAULT NULL COMMENT '예약자수',
  `user_email` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일',
  `reserv_pay` int(11) DEFAULT 0 COMMENT '예약선금',
  `reg_date` date NOT NULL COMMENT '예약을 진행한 날짜',
  `order_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '예약번호',
  `reserv_status` int(11) NOT NULL COMMENT '예약 상태',
  PRIMARY KEY (`book_num`) USING BTREE,
  KEY `seller_id` (`seller_id`) USING BTREE,
  CONSTRAINT `nouser_book_tbl_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller_tbl` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 mydb.nouser_book_tbl:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `nouser_book_tbl` DISABLE KEYS */;
INSERT INTO `nouser_book_tbl` (`book_num`, `seller_id`, `user_name`, `reserv_date`, `reserv_time`, `user_tel`, `count_pp`, `user_email`, `reserv_pay`, `reg_date`, `order_id`, `reserv_status`) VALUES
	(1, 'stest001', '김희재', '2022-11-03', '12:30:00', '010-2222-2222', 2, NULL, 10000, '2022-10-06', 'asdfghjklp', 1),
	(2, 'stest002', '김희재', '2022-10-17', '14:00:00', '010-2222-2222', 2, 'dddd@test.com', 0, '2022-10-06', 'wUZOcWxaWP', 2),
	(3, 'stest002', '김희재', '2022-10-17', '14:00:00', '010-2222-2222', 2, 'dddd@test.com', 0, '2022-10-06', 'wUZOc234P', 2),
	(4, 'stest002', '김희재', '2022-10-17', '14:00:00', '010-2222-2222', 2, 'dddd@test.com', 0, '2022-10-06', 'wUZOcWzxcP', 2),
	(5, 'stest002', '김희재', '2022-10-17', '14:00:00', '010-2222-2222', 2, 'dddd@test.com', 0, '2022-10-06', 'wUZOcWwfaP', 2),
	(6, 'stest002', '김희재', '2022-10-18', '16:30:00', '010-2222-2222', 2, 'dddd@test.com', 10000, '2022-10-06', 'EnDqEKGXV0', 2),
	(7, 'stest002', '김희재', '2022-10-18', '16:30:00', '010-2222-2222', 2, 'dddd@test.com', 10000, '2022-10-06', 'EnDqEKABC0', 2),
	(8, 'stest002', '김희재', '2022-10-26', '20:00:00', '010-2222-2222', 2, '', 10000, '2022-10-07', 'KenGzsFTho', 2);
/*!40000 ALTER TABLE `nouser_book_tbl` ENABLE KEYS */;

-- 테이블 mydb.product_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `product_tbl` (
  `pro_num` int(11) NOT NULL COMMENT '상품번호',
  `category_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'FK(category_tbl)코드',
  `seller_id` varchar(20) NOT NULL COMMENT '판매자아이디',
  `pro_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '상품명',
  `pro_img` varchar(50) DEFAULT NULL,
  `pro_price` varchar(50) NOT NULL DEFAULT '' COMMENT '가격',
  `pro_stock` int(11) DEFAULT NULL COMMENT '수량(재고)',
  `pro_desc` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴설명',
  `pro_count` int(11) DEFAULT NULL COMMENT '누적판매량',
  `sales` int(11) DEFAULT NULL COMMENT '누적 매출',
  `commision` double DEFAULT NULL COMMENT 'sales*0.01(수수료)',
  `reg_date` date NOT NULL COMMENT '등록일자',
  `mod_date` date NOT NULL COMMENT '수정일자',
  PRIMARY KEY (`pro_num`),
  KEY `fk_product_tbl_product_category_tbl1_idx` (`category_code`) USING BTREE,
  CONSTRAINT `FK_product_tbl_category_tbl` FOREIGN KEY (`category_code`) REFERENCES `category_tbl` (`category_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.product_tbl:~70 rows (대략적) 내보내기
/*!40000 ALTER TABLE `product_tbl` DISABLE KEYS */;
INSERT INTO `product_tbl` (`pro_num`, `category_code`, `seller_id`, `pro_name`, `pro_img`, `pro_price`, `pro_stock`, `pro_desc`, `pro_count`, `sales`, `commision`, `reg_date`, `mod_date`) VALUES
	(1, '10', 'stest001', '프리미엄 작살 삼겹', '1.jpg', '14000', NULL, '국내산 삼겹살에 엄청난 칼집을 넣어 부드러운의 초 극대화', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(2, '10', 'stest001', '이베리코 끝판왕 플루마', '2.jpg', '21000', NULL, '이베리코 흑돼지 끝판왕 플루마 등심덧살부위로 천상의 맛이라 칭함', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(3, '10', 'stest001', '이베리코 흑돼지 황제살', '3.jpg', '15000', NULL, '이베리코 픅돼지중 부채살 부위로 소고기와 가장 흡사한 부위', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(4, '10', 'stest001', '이베리코 흑돼지 통갈비살', '4.jpg', '15000', NULL, '이베리코 흑돼지 늑간살로 고소하면 육즙이 풍부하면서 감칠맛이 진한부위', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(5, '10', 'stest001', '이베리코 흑돼지 치마살', '5.jpg', '15000', NULL, '이베리코 흑돼지중 쫀득한 식감과 고소한 맛을 동시에 즐기실수 있습니다', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(6, '10', 'stest001', '이베리코 흑돼지 눈꽃목살', '6.jpg', '14000', NULL, '이베리코 흑돼지 베요타 등급입니다.', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(7, '10', 'stest001', '이베리코 흑돼지 꽃삼겹', '7.jpg', '14000', NULL, '이베리코 꽃삼겹은 고소한 냉삼 같은 맛을 즐기실 수있습니다.', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(8, '10', 'stest001', '국내산 통갈매기살', '8.jpg', '13000', NULL, '국내산 돼지고기중 소고기맛을 즐길수있는 부위', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(9, '10', 'stest001', '이베리코 소시지', '9.jpg', '15000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(10, '10', 'stest001', '코다리비빔밀면', '10.jpg', '6000', NULL, '쫄깃한 면발 매콤 달콤', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(11, '10', 'stest001', '주먹밥', '11.jpg', '3000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(12, '10', 'stest021', '아메리카노', '1.jpg', '7000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(13, '10', 'stest021', '카페라떼', 'no_menu_img.png', '7000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(14, '10', 'stest021', '카푸치노', 'no_menu_img.png', '7000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(15, '10', 'stest021', '바닐라라떼', 'no_menu_img.png', '7500', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(16, '10', 'stest021', '카라멜라떼', '1.jpg', '7500', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(17, '10', 'stest021', '카페모카', '1.jpg', '7500', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(18, '10', 'stest021', '그린티라떼', '1.jpg', '7000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(19, '10', 'stest021', '밀크티라떼', '1.jpg', '8000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(20, '10', 'stest021', '고운쑥라떼', '1.jpg', '8000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(21, '10', 'stest021', '자색고구마라떼', '1.jpg', '8000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(22, '10', 'stest021', '초코라떼', '1.jpg', '8000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(23, '10', 'stest021', '카모마일', '1.jpg', '8000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(24, '10', 'stest022', '손칼국수', '1.jpg', '7000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(25, '10', 'stest023', '선녀물회', '1.jpg', '22000', NULL, '생선회, 한치, 육수, 야채로 이루어진 물회', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(26, '10', 'stest023', '낙지물회', '1.jpg', '30000', NULL, '생선회, 한치, 낙지, 육수, 야채로 이루어진 물회', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(27, '10', 'stest023', '황제물회 (중)', '1.jpg', '65000', NULL, '생선회,한치,전복,멍게,낙지,해삼,육수,야채로 이루어진 물회.', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(28, '10', 'stest023', '황제물회 (대)', '1.jpg', '85000', NULL, '생선회, 한치, 전복,멍게, 낙지,해삼,육수, 야채로 이루어진 물회.', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(29, '10', 'stest023', '해물파전', '2.jpg', '15000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(30, '10', 'stest024', '아메리카노', '1.jpg', '5500', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(31, '10', 'stest024', '카페라떼', 'no_menu_img.png', '6000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(32, '10', 'stest024', '에스프레소', 'no_menu_img.png', '5000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(33, '10', 'stest024', '카푸치노', 'no_menu_img.png', '6000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(34, '10', 'stest025', '떡볶이', '1.jpg', '2500', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(35, '10', 'stest025', '순대', '2.jpg', '3000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(36, '10', 'stest025', '쫄면', '3.jpg', '3500', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(37, '10', 'stest025', '김밥', '4.jpg', '2500', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(38, '10', 'stest025', '라면', '5.jpg', '3000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(39, '10', 'stest025', '만두', '6.jpg', '2500', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(40, '10', 'stest025', '오뎅', 'menu.jpeg', '2000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(41, '10', 'stest025', '냉면', 'menu.jpeg', '5000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(42, '10', 'stest025', '비조리생떡볶이(3인분포장)', 'menu.jpeg', '6500', NULL, '포장은 2인분부터 가능', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(43, '20', 'stest026', '입장료', 'no_price_img.png', '무료', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(44, '20', 'stest027', '아쿠아스파 평수기 성인', 'no_price_img.png', '50000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(45, '20', 'stest027', '아쿠아스파 평수기 청소년', 'no_price_img.png', '40000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(46, '20', 'stest027', '아쿠아스파 성수기 성인', 'no_price_img.png', '60000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(47, '20', 'stest027', '아쿠아스파 성수기 청소년', 'no_price_img.png', '50000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(48, '20', 'stest027', '아쿠아스파 극성수기 성인', 'no_price_img.png', '70000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(49, '20', 'stest027', '아쿠아스파 극성수기 청소년', 'no_price_img.png', '60000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(50, '20', 'stest027', '찜질스파권 상시 성인', 'no_price_img.png', '30000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(51, '20', 'stest027', '찜질스파권 상시 청소년', 'no_price_img.png', '24000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(52, '20', 'stest028', '상설전시관(어른)', 'no_price_img.png', '4000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(53, '20', 'stest028', '상설전시관(청소년 및 군인)', 'no_price_img.png', '2000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(54, '20', 'stest028', '상설전시관(어린이)', 'no_price_img.png', '2000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(55, '20', 'stest028', '4D영상관(어른)', 'no_price_img.png', '3000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(56, '20', 'stest028', '4D영상관(청소년 및 군인)', 'no_price_img.png', '1000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(57, '20', 'stest028', '4D영상관(어린이)', 'no_price_img.png', '1000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(58, '20', 'stest028', '상설전시관(어른단체)', 'no_price_img.png', '3000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(59, '20', 'stest028', '상설전시관(청소년 및 군인단체)', 'no_price_img.png', '1500', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(60, '20', 'stest028', '상설전시관(어린이단체)', 'no_price_img.png', '1500', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(61, '20', 'stest029', '대인', 'no_price_img.png', '9000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(62, '20', 'stest029', '소인(4~7세)', 'no_price_img.png', '6000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(63, '20', 'stest029', '단체(20인 이상) 대인', 'no_price_img.png', '8000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(64, '20', 'stest029', '경로우대,참전유공자,장애1~3급', 'no_price_img.png', '6000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(65, '20', 'stest029', '강화군민', 'no_price_img.png', '4000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(66, '20', 'stest030', '망원경 2분', 'no_price_img.png', '500', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(67, '20', 'stest030', '입장료(성인)', 'no_price_img.png', '2500', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(68, '20', 'stest030', '입장료(청소년, 군인)', 'no_price_img.png', '1700', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(69, '20', 'stest030', '입장료(어린이)', 'no_price_img.png', '1000', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06'),
	(70, '20', 'stest030', '단체요금(20인 이상)', 'no_price_img.png', '변동', NULL, '', NULL, NULL, NULL, '2022-10-06', '2022-10-06');
/*!40000 ALTER TABLE `product_tbl` ENABLE KEYS */;

-- 테이블 mydb.review_ans_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `review_ans_tbl` (
  `re_ans_num` int(11) NOT NULL COMMENT '답글 번호',
  `review_num` int(11) NOT NULL COMMENT '리뷰 번호',
  `seller_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '판매자 아이디',
  `re_ans_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '답글 내용',
  `reg_date` date NOT NULL COMMENT '등록일',
  `mod_date` date NOT NULL COMMENT '수정일',
  PRIMARY KEY (`re_ans_num`),
  KEY `review_num` (`review_num`),
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `FK_review_ans_tbl_review_tbl` FOREIGN KEY (`review_num`) REFERENCES `review_tbl` (`review_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_review_ans_tbl_seller_tbl` FOREIGN KEY (`seller_id`) REFERENCES `seller_tbl` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.review_ans_tbl:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `review_ans_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_ans_tbl` ENABLE KEYS */;

-- 테이블 mydb.review_image_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `review_image_tbl` (
  `image_num` int(11) NOT NULL COMMENT '이미지번호',
  `origin_filename` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '원본파일이름',
  `image_fileName` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '서버에 저장될 파일이름',
  `review_num` int(11) NOT NULL COMMENT '리뷰 번호',
  PRIMARY KEY (`image_num`),
  UNIQUE KEY `image_fileName` (`image_fileName`),
  KEY `fk_image_tbl_u_playlist_tbl1_idx` (`review_num`) USING BTREE,
  CONSTRAINT `FK_review_image_tbl_review_tbl` FOREIGN KEY (`review_num`) REFERENCES `review_tbl` (`review_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.review_image_tbl:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `review_image_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_image_tbl` ENABLE KEYS */;

-- 테이블 mydb.review_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `review_tbl` (
  `review_num` int(11) NOT NULL COMMENT '리뷰번호',
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자 아이디',
  `pro_num` int(11) DEFAULT NULL,
  `seller_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_fileName` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지 파일명',
  `content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '내용',
  `reg_date` date NOT NULL COMMENT '등록일자',
  `mod_date` date NOT NULL COMMENT '수정일자',
  `rating` int(11) NOT NULL COMMENT '별점',
  `liked` int(11) DEFAULT 0 COMMENT '좋아요',
  `user_nick` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`review_num`) USING BTREE,
  KEY `fk_review_tbl_user_tbl1_idx` (`user_id`) USING BTREE,
  KEY `FK_review_tbl_seller_tbl` (`seller_id`),
  CONSTRAINT `FK_review_tbl_seller_tbl` FOREIGN KEY (`seller_id`) REFERENCES `seller_tbl` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_review_tbl_user_tbl` FOREIGN KEY (`user_id`) REFERENCES `user_tbl` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.review_tbl:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `review_tbl` DISABLE KEYS */;
INSERT INTO `review_tbl` (`review_num`, `user_id`, `pro_num`, `seller_id`, `image_fileName`, `content`, `reg_date`, `mod_date`, `rating`, `liked`, `user_nick`) VALUES
	(1, 'test1', NULL, 'stest002', NULL, 'ddddd', '2022-10-07', '2022-10-07', 0, 13, '테스트1'),
	(2, 'test1', NULL, 'stest002', NULL, 'ddddd', '2022-10-07', '2022-10-07', 3, 5, '테스트1'),
	(3, 'test1', NULL, 'stest002', NULL, '하기 싫어요', '2022-10-07', '2022-10-07', 5, 5, '테스트1'),
	(4, 'test1', NULL, 'stest002', NULL, '123', '2022-10-07', '2022-10-07', 5, 0, '테스트1'),
	(5, 'test1', NULL, 'stest002', NULL, 'ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ', '2022-10-07', '2022-10-07', 5, 0, '테스트1'),
	(6, 'test1', NULL, 'stest001', NULL, '32333', '2022-10-07', '2022-10-07', 4, 0, '테스트1'),
	(7, 'test1', NULL, 'stest001', NULL, 'dddddddddd', '2022-10-07', '2022-10-07', 4, 52, '테스트1'),
	(8, 'test1', NULL, 'stest001', NULL, 'ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ', '2022-10-07', '2022-10-07', 0, 6, '테스트1'),
	(9, 'test1', NULL, 'stest001', NULL, '음식맛이 별로 였어요', '2022-10-07', '2022-10-07', 3, 0, '테스트1'),
	(10, 'test1', NULL, 'stest001', NULL, '지섭이가 바보같아요', '2022-10-07', '2022-10-07', 2, 0, '테스트1'),
	(11, 'test1', NULL, 'stest001', NULL, '성웅이바보', '2022-10-07', '2022-10-07', 5, 0, '테스트1'),
	(12, 'test1', NULL, 'stest002', NULL, '하기 싫어요', '2022-10-14', '2022-10-14', 5, 5, '테스트1');
/*!40000 ALTER TABLE `review_tbl` ENABLE KEYS */;

-- 테이블 mydb.sellerreg_image_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `sellerreg_image_tbl` (
  `image_num` int(11) NOT NULL COMMENT '사업자등록증 이미지 번호',
  `orgin_fileName` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '원본 이미지 명',
  `bizReg_image_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '서버 저장 이미지 명',
  `seller_num` int(11) NOT NULL COMMENT '판매자 번호',
  PRIMARY KEY (`image_num`),
  UNIQUE KEY `image_code_UNIQUE` (`bizReg_image_name`) USING BTREE,
  KEY `seller_num` (`seller_num`),
  CONSTRAINT `FK_sellerreg_image_tbl_seller_tbl` FOREIGN KEY (`seller_num`) REFERENCES `seller_tbl` (`seller_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.sellerreg_image_tbl:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sellerreg_image_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `sellerreg_image_tbl` ENABLE KEYS */;

-- 테이블 mydb.seller_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `seller_tbl` (
  `seller_num` int(11) NOT NULL AUTO_INCREMENT,
  `category_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '카테고리 코드(업종)\n',
  `seller_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '판매자 아이디\n',
  `seller_pw` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '판매자 비밀번호',
  `seller_tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '판매자 연락처',
  `seller_bizReg` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사업자 등록번호',
  `seller_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사업자명\n',
  `seller_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '판매자 이메일\n',
  `seller_addr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '판매자 주소',
  `bizReg_image_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사업자등록증 이미지 번호',
  `area` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '검색키워드',
  `reg_date` date NOT NULL COMMENT '등록일',
  `mod_date` date NOT NULL COMMENT '수정일\n',
  `seller_status` int(11) NOT NULL DEFAULT 1,
  `birth_yy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_mm` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_dd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`seller_num`),
  UNIQUE KEY `seller_id_UNIQUE` (`seller_id`),
  UNIQUE KEY `seller_bizReg_UNIQUE` (`seller_bizReg`),
  KEY `category_code` (`category_code`),
  CONSTRAINT `FK_seller_tbl_category_tbl` FOREIGN KEY (`category_code`) REFERENCES `category_tbl` (`category_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.seller_tbl:~20 rows (대략적) 내보내기
/*!40000 ALTER TABLE `seller_tbl` DISABLE KEYS */;
INSERT INTO `seller_tbl` (`seller_num`, `category_code`, `seller_id`, `seller_pw`, `seller_tel`, `seller_bizReg`, `seller_name`, `seller_email`, `seller_addr`, `bizReg_image_name`, `area`, `keyword`, `reg_date`, `mod_date`, `seller_status`, `birth_yy`, `birth_mm`, `birth_dd`, `gender`) VALUES
	(1, '10', 'stest001', '1234', '0507-1331-6400', '613-17-38218', '옥탑방', 'test001@test.com', '서울 은평구 서오릉로 115 ', 'testbizimg001.jpg', '서울특별시', '이베리코, 돼지고기구이, 삽겹살', '2022-10-06', '2022-10-06', 1, '', '', '', ''),
	(2, '10', 'stest002', '1234', '0507-1446-1498', '716-28-00768', '사만다 부대찌개 보라매공원점', 'chenchen**@naver.com', '서울 동작구 신대방동 395-69', 'testbizimg002.jpg', '서울특별시', '찌개, 전골, 부대찌개', '2022-10-06', '2022-10-06', 1, '', '', '', ''),
	(3, '10', 'stest003', '1234', '0507-1366-5348', '000-00-00000', '명동교자 본점', 'test003@test.com', '서울 중구 명동10길 29', 'testbizimg003.jpg', '서울특별시', '칼국수, 만두, 미쉐린 가이드 서울 2022', '2022-10-06', '2022-10-06', 1, '', '', '', ''),
	(4, '10', 'stest004', '1234', '0507-0000-0000', '274-77-00302', '런던 베이글 뮤지엄 안국점', 'test004@test.com', '서울 종로구 북촌로4길 20', 'testbizimg004.jpg', '서울특별시', '베이커리, 베이글, 빵', '2022-10-06', '2022-10-06', 1, '', '', '', ''),
	(5, '10', 'stest005', '1234', '02-465-6580', '364-10-00714', '소문난성수감자탕', 'test005@test.com', '서울 성동구 연무장길 45', 'testbizimg005.jpg', '서울특별시', '감자탕 , 성수감자탕, 백종원의3대천왕', '2022-10-06', '2022-10-06', 1, '', '', '', ''),
	(6, '10', 'stest006', '1234', '0507-1325-5142', '278-43-00425', '칼스토랑', 'test006@test.com', '서울 강서구 방화대로6라길 2', 'testbizimg006.jpg', '서울특별시', '칼국수, 만두, 줄서는 식당', '2022-10-06', '2022-10-06', 1, '', '', '', ''),
	(7, '10', 'stest007', '1234', '0507-1425-1540', '649-85-01325', '난포', 'test007@test.com', '서울 성동구 서울숲4길 18-8 ', 'testbizimg007.jpg', '서울특별시', '한식, 서울숲, 곰국', '2022-10-06', '2022-10-06', 1, '', '', '', ''),
	(8, '10', 'stest008', '1234', '02-745-2203', '101-10-50272', '콩지POT지', 'test008@test.com', '서울 종로구 북촌로 21-15', 'testbizimg008.jpg', '서울특별시', '이탈리아음식, 스테이크, 까르보나라', '2022-10-06', '2022-10-06', 1, '', '', '', ''),
	(9, '10', 'stest009', '1234', '0507-1350-1881', '237-34-00723', '미쁘동', 'test009@test.com', '서울 마포구 동교로38길 33-21', 'testbizimg009.jpg', '서울특별시', '일식당, 덮밥, 애견 동반', '2022-10-06', '2022-10-06', 1, '', '', '', ''),
	(10, '10', 'stest010', '1234', '0507-1418-8592', '506-23-99510', '몽탄', 'test010@test.com', '서울 용산구 백범로99길 50', 'testbizimg010.jpg', '서울특별시', '육류, 고기요리, 맛있는녀석들', '2022-10-06', '2022-10-06', 1, '', '', '', ''),
	(21, '10', 'stest021', '1234', '0507-1307-2192', '701-04-01172', '조양방직', 'test021@test.com', '인천 강화군 강화읍 향나무길5번길 12', 'testbizimg021.jpg', '인천광역시', '카페, 디저트, 레트로', '2022-10-06', '2022-10-06', 1, '', '', '', ''),
	(22, '10', 'stest022', '1234', '032-428-8844', '000-00-00001', '손칼국수', 'test022@test.com', '인천 남동구 인주대로 545-1', 'testbizimg022.jpg', '인천광역시', '칼국수, 만두, 손칼국수', '2022-10-06', '2022-10-06', 1, '', '', '', ''),
	(23, '10', 'stest023', '1234', '032-751-2121', '000-00-00002', '선녀풍', 'test023@test.com', '인천 중구 용유서로 272', 'testbizimg023.jpg', '인천광역시', '해물, 생선요리, 물회', '2022-10-06', '2022-10-06', 1, '', '', '', ''),
	(24, '10', 'stest024', '1234', '032-747-0137', '000-00-00003', '바다앞테라스', 'test024@test.com', '인천 중구 은하수로 10', 'testbizimg024.jpg', '인천광역시', '베이커리, 오션뷰, 카페', '2022-10-06', '2022-10-06', 1, '', '', '', ''),
	(25, '10', 'stest025', '1234', '032-821-5566', '000-00-00004', '남동공단떡볶이', 'test025@test.com', '인천 남동구 남동서로 226', 'testbizimg025.jpg', '인천광역시', '떡볶이, 분식, 옛날맛', '2022-10-06', '2022-10-06', 1, '', '', '', ''),
	(26, '20', 'stest026', '1234', '032-466-7282', '000-00-00005', '인천대공원', 'test026@test.com', '인천 남동구 장수동 산79', 'testbizimg026.jpg', '인천광역시', '테마공원', '2022-10-06', '2022-10-06', 1, '', '', '', ''),
	(27, '20', 'stest027', '1234', '02-1833-8855', '000-00-00006', '파라다이스시티 씨메르', 'test027@test.com', '인천 중구 영종해안남로321번길 186', 'testbizimg027.jpg', '인천광역시', '워터파크, 스파, 루프탑수영장', '2022-10-06', '2022-10-06', 1, '', '', '', ''),
	(28, '20', 'stest028', '1234', '032-456-2500', '000-00-00007', '인천어린이과학관', 'test028@test.com', '인천 계양구 방축로 21', 'testbizimg028.jpg', '인천광역시', '과학관, 전시관, 4D영상관', '2022-10-06', '2022-10-06', 1, '', '', '', ''),
	(29, '20', 'stest029', '1234', '032-930-7053', '000-00-00008', '강화석모도미네랄온천', 'test029@test.com', '인천 강화군 삼산면 삼산남로 865-17', 'testbizimg029.jpg', '인천광역시', '온천, 스파, 힐링', '2022-10-06', '2022-10-06', 1, '', '', '', ''),
	(30, '20', 'stest030', '1234', '032-930-7062', '000-00-00009', '강화평화전망대', 'test030@test.com', '인천 강화군 양사면 전망대로 797', 'testbizimg030.jpg', '인천광역시', '전망대, 힐링', '2022-10-06', '2022-10-06', 1, '', '', '', '');
/*!40000 ALTER TABLE `seller_tbl` ENABLE KEYS */;

-- 테이블 mydb.storeinfo_image_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `storeinfo_image_tbl` (
  `image_num` int(11) NOT NULL COMMENT '이미지번호',
  `storeInfo_num` int(11) NOT NULL COMMENT '글번호',
  `origin_filename` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '원본파일이름',
  `image_fileName` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '서버에 저장될 파일이름',
  PRIMARY KEY (`image_num`),
  UNIQUE KEY `image_fileName` (`image_fileName`),
  KEY `fk_image_tbl_u_playlist_tbl1_idx` (`storeInfo_num`) USING BTREE,
  CONSTRAINT `FK_storeinfo_image_tbl_storeinfo_tbl` FOREIGN KEY (`storeInfo_num`) REFERENCES `storeinfo2_tbl` (`storeInfo_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.storeinfo_image_tbl:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `storeinfo_image_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `storeinfo_image_tbl` ENABLE KEYS */;

-- 테이블 mydb.storeinfo_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `storeinfo_tbl` (
  `storeInfo_num` int(11) NOT NULL COMMENT '가게소개 번호',
  `seller_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '판매자 아이디',
  `image_fileName` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '가게 소개 이미지명',
  `store_introduce` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '가게 소개 내용',
  `openTime` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '영업시간',
  `closeDay` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴무일',
  `store_nic` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '가게이름(노출명)',
  `store_benefit` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '안내 및 혜택',
  `reg_date` date NOT NULL COMMENT '등록일',
  `mod_date` date NOT NULL COMMENT '수정일',
  `open_time` int(11) DEFAULT NULL COMMENT '예약 가능 시간',
  `close_time` int(11) DEFAULT NULL COMMENT '예약 불가 시간',
  `min_people` int(11) DEFAULT NULL COMMENT '최소 예약인원',
  `max_people` int(11) DEFAULT NULL COMMENT '최대 예약인원',
  `reserv_pay` int(11) DEFAULT 0 COMMENT '예약금',
  PRIMARY KEY (`storeInfo_num`),
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `FK_storeinfo_tbl_seller_tbl` FOREIGN KEY (`seller_id`) REFERENCES `seller_tbl` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.storeinfo_tbl:~20 rows (대략적) 내보내기
/*!40000 ALTER TABLE `storeinfo_tbl` DISABLE KEYS */;
INSERT INTO `storeinfo_tbl` (`storeInfo_num`, `seller_id`, `image_fileName`, `store_introduce`, `openTime`, `closeDay`, `store_nic`, `store_benefit`, `reg_date`, `mod_date`, `open_time`, `close_time`, `min_people`, `max_people`, `reserv_pay`) VALUES
	(1, 'stest001', 'stest001.jpg', '구산역에 혜성 처럼 나타난 인생고기집 구산역 맛집 옥탑방. 좋은 고기 …\r\n300번에 칼집…500도 참숯 초벌 그리고 정성 진심을 담아 음식을 만듭니다..\r\n프리미엄작살삼겹, 이베리코 끝판왕 플루마, 이베리코 흑돼지 황제살, 이베리코 흑돼지 통갈비살이 베스트 인기 메뉴 입니다.', '월-일 12:00 - 22:00\r\n21:30 라스트오더', '격주 화요일 정기 휴무', '옥탑방', '주차, 무선 인터넷, 남/녀 화장실 구분', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000),
	(2, 'stest002', 'stest002.jpg', '사만다 부대찌개의 약속 \r\n정직한 가격과 맛으로 보답하는 사만다에서 좋은 사람들과 좋은 추억 만드시고, \r\n한분한분에게 최선의 서비스를 제공하도록 노력하며 교육하고 있습니다.\r\n사랑하고 감사합니다.', '월-토 10:00 - 22:00 / 15:30 -17:00 브레이크타임 /15:00, 21:30 라스트오더', '매주 일요일 휴무', '사만다 부대찌개 보라매공원점', '단체석, 주차, 포장, 배달, 예약, 무선 인터넷, 남/녀 화장실 구분', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000),
	(3, 'stest003', 'stest003.jpg', '1966년 창업이후 명동에서 본점과 분점, 이태원에 직영점을 운영하고 있는 칼국수 전문 음식점입니다.\r\n명동 교자는 창업 이래 \'음식의 맛은 정성이 과학을 앞선다.\'는 신념을 지키기 위하여 가격에 상관없이 최고의 음식 재료, 신선한 음식재료만을 매일매일 구입하여 사용하고 있으며 남은 음식은 100% 완전히 폐기합니다.\r\n칼국수, 만두, 비빔국수, 콩국수를 드실 수 있으시고, 만두만 포장가능 합니다.', '월-일 10:30 - 21:00 / 20:30 라스트오더', '코로나 거리두기로 인해 한시적 20시 30분 라스트오더', '명동교자 본점', '포장, 남/녀 화장실 구분', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000),
	(4, 'stest004', 'stest004.jpg', '다정한 스텝과 방금 나온 베이글.\r\n그리고 따듯한 수프가 기다리는 \r\n가장 가까운 런던 속 베이글 뮤지엄,\r\n\r\n국내 어디에서도 맛볼 수 없었던\r\n베이글의 식감과 무드를 선보입니다 :)', '매일 08:00 - 18:00', '공휴일 정상영업 합니다.', '런던 베이글 뮤지엄 안국점', '포장, 무선 인터넷', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000),
	(5, 'stest005', 'stest005.jpg', '배종원의 3대천왕 43회, 맛슐랭 성수동맛집 백종원도 인정한 성수감자탕입니다!', '매일 00:00 - 24:00 (24시간 영업)', '연중 무휴', '소문난성수감자탕', '주차, 포장', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000),
	(6, 'stest006', 'stest006.jpg', '줄서는식당 36회, 생방송오늘저녁 1432회, 생방송투데이 2364회 / 칼스토랑입니다!', '월-토 11:00 - 21:00 / 20:00 라스트오더', '매주 일요일 정기휴무', '칼스토랑', '주차, 포장, 배달, 무선 인터넷', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000),
	(7, 'stest007', 'stest007.jpg', '아주 작은 바닷가마을, 푸르디 푸른 난포\r\n그 옛날 손녀만을 위해 만들어 주시던 할머니의 음식들을 많은 손자 손녀들에게 소개하려합니다. 성수동에서_', '매일 11:00 - 22:00 / 15:30 - 17:00 브레이크 타임 / 15:00, 20:30 라스트오더', '연중무휴', '난포', '단체석, 무선 인터넷', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000),
	(8, 'stest008', 'stest008.jpg', '북촌한옥마을 최고의 스카이뷰를 자랑하는 캐쥬얼이탈리안레스토랑인 콩지pot지 건물은 서울의 구도시안에 현대적 미학을 담아내 과거와 현재, 동양과 서양의 미적시선이 함께 공존하는 건축물로도 유명하며 방문자에게 맛있는 음식과 더불어 휼륭한 문화체험도 함께 선보입니다.', '월-일 11:30 - 22:00', '연중무휴', '콩지POT지', '단체석, 주차, 예약, 남/녀 화장실 구분', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000),
	(9, 'stest009', 'stest009.jpg', '미쁘동은 단맛과  찰기가 우수한 고시히카리 품종으로 밥을 짓고 매일 아침 성게알을 비롯한 신선한 해산물을 받아 손질합니다. 또한 양질의 가다랑어포 등을 넣어 끓인 전통 방식 간장을 곁들여 식탁 위 그릇에 건강함을 담았습니다.', '매일 11:00 - 22:00 / 21:30 라스트오더', '연중 무휴', '미쁘동', '단체석, 포장, 배달, 예약, 무선 인터넷, 반려동물 동반, 남/녀 화장실 구분', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000),
	(10, 'stest010', 'stest010.jpg', '웨이팅 리스트 작성은 11시부터 작성 도와드리고 있습니다.\r\n사회적 거리두기에 따라 인원제한으로 당분간 단체예약은 시행하지 않고 있습니다.', '매일 12:00 - 22:00 / 21:00 라스트오더', '연중 무휴', '몽탄', '단체석, 예약, 무선 인터넷, 남/녀 화장실 구분', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000),
	(21, 'stest021', 'stest021.jpg', '방직공장을 리모델링해서 만든 강화도 레트로 감성 카헤', '매일 11:00 - 20:00', '연중 무휴', '조양방직', '단체석, 주차, 포장, 예약, 무선인터넷, 남/녀 화장실 구분, 장애인 편의시설', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000),
	(22, 'stest022', 'stest022.jpg', '동네사람만 아는 점심장사집', '일-금 11:00 - 14:00', '매주 토요일 정기휴무 \r\n공휴일 휴무', '손칼국수', '포장,남/녀 화장실 구분', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000),
	(23, 'stest023', 'stest023.jpg', '해물이 가득한 물회', '수-일 11:00 - 21:00', '매주 월,화 정기휴무/ 공휴일은 영업합니다.', '선녀풍', '단체석, 주차, 포장 ,남/녀 화장실 구분', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000),
	(24, 'stest024', 'stest024.jpg', '휴식이 필요한 사람들이 늘 꿈꾸는 남쪽 해변의 섬, 휴양지를 닮은 공간이 되고자 하는 카페 \'바다 앞 테라스\'입니다.\r\n도시 생활을 잠시 잊고 휴식을 즐기고싶은 모든 사람들을 위해 서울과는 떨어진 \'영종도\'라는 섬으로 이끄는 카페입니다.', '매일 09:00 - 22:00 /  21:00 라스트 오더', '연중무휴', '바다앞테라스', '단체석, 주차, 포장, 무선 인터넷, 남/녀 화장실 구분', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000),
	(25, 'stest025', 'stest025.jpg', '남동인더스파트역 2번 출구 근처에 있는 떡볶이 맛집입니다 : )', '월-토 07:00 - 19:00 /  18:30 라스트오더', '매주 일요일 정기휴무', '남동공단떡볶이', '포장, 남/녀 화장실 구분', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000),
	(26, 'stest026', 'stest026.jpg', '인천대공원', '매일 05:00 - 23:00 하절기(3~10월) / \r\n매일 05:00 - 22:00 동절기(11~2월)', '매일 월요일 휴무', '인천대공원', '주차, 남/녀 화장실 구분', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000),
	(27, 'stest027', 'stest027.jpg', '힐링과 짜릿함을 모두 충족시켜주는 씨메르는 유럽 스타일의 공간과 여유로운 한국 고유의 찜질방 문화를 접목한 신겨념 스파입니다. 수영부터 풀파티, 짜릿한 워터 슬라이드, 아름다운 석양을 즐길수 있는 인피니티 풀과 노천 스파, 여유로운 찜질스파 존에 더해 각국의 시그니처 푸드를 만나 볼수 있는 2개의 식당과 스낵부터 칵테일까지 즐길 수 있는 4개의 바를 모두 즐겨보세요.', '매일 10:00 - 21:00', '연중무휴', '파라다이스시티 씨메르', '#워터파크 #찜질방 #스파 #물놀이 #루프탑수영장', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000),
	(28, 'stest028', 'stest028.jpg', '미취학어린이 전용 전시관(무지개마을) 입장시 증빙서류 (등본, 의료보험증, 여권) 지참 필수, 온라인 사전예약 필수', '화-일 09:00 -18:00', '정기휴관일(매주 월요일)이 법정공휴일인 경우 익일 휴관', '인천어린이과학관', '주차, 예약, 남/녀 화장실 구분', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000),
	(29, 'stest029', 'stest029.jpg', '편안한 분위기에서 가족과 함께 힐링하러 오세요~', '매일 07:00 - 19:30', '연중무휴', '강화석모도미네랄온천', '주차, 시설 깔끔, 남/녀 화장실 구분', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000),
	(30, 'stest030', 'stest030.jpg', '전망대는 예약제가 아닙니다. 서로가 추석 당일날은 10시 개관입니다. 연중무휴', '매일 09:00 - 17:00 / 매표마감시간 - 16:00', '연중무휴', '강화평화전망대', '주차', '2022-10-06', '2022-10-06', 1000, 2000, 2, 8, 10000);
/*!40000 ALTER TABLE `storeinfo_tbl` ENABLE KEYS */;

-- 테이블 mydb.s_board_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `s_board_tbl` (
  `list_num` int(11) NOT NULL COMMENT '글 번호',
  `parent_num` int(11) DEFAULT 0 COMMENT '부모번호',
  `seller_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '판매자 아이디',
  `image_fileName` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지이름',
  `s_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '글제목',
  `s_content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '내용',
  `reg_date` date NOT NULL COMMENT '등록일자',
  `mod_date` date NOT NULL COMMENT '수정일자',
  `hits` int(11) DEFAULT 0 COMMENT '조회수',
  `liked` int(11) DEFAULT 0 COMMENT '도움이돼요',
  `bad` int(11) DEFAULT 0 COMMENT '싫어요',
  PRIMARY KEY (`list_num`),
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `FK_s_board_tbl_admin_tbl` FOREIGN KEY (`seller_id`) REFERENCES `admin_tbl` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_s_board_tbl_seller_tbl` FOREIGN KEY (`seller_id`) REFERENCES `seller_tbl` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.s_board_tbl:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `s_board_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_board_tbl` ENABLE KEYS */;

-- 테이블 mydb.s_image_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `s_image_tbl` (
  `image_num` int(11) NOT NULL COMMENT '이미지번호',
  `list_num` int(11) NOT NULL,
  `origin_filename` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '원본파일이름',
  `image_fileName` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '서버에 저장될 파일이름',
  PRIMARY KEY (`image_num`),
  UNIQUE KEY `image_fileName` (`image_fileName`),
  KEY `fk_image_tbl_u_playlist_tbl1_idx` (`list_num`) USING BTREE,
  CONSTRAINT `FK_s_image_tbl_s_board_tbl` FOREIGN KEY (`list_num`) REFERENCES `s_board_tbl` (`list_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.s_image_tbl:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `s_image_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_image_tbl` ENABLE KEYS */;

-- 테이블 mydb.user_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_tbl` (
  `user_no` int(11) NOT NULL COMMENT '사용자 번호',
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자 아이디',
  `user_pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자 비밀번호(유효성 검사 필요)',
  `tel` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '전화번호',
  `user_nick` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자 닉네임',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자 이름',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이메일',
  `birth_yy` varchar(50) NOT NULL COMMENT '사용자 생일 연',
  `birth_mm` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자 생일 월',
  `birth_dd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자 생일 일',
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '성별',
  PRIMARY KEY (`user_no`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.user_tbl:~9 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user_tbl` DISABLE KEYS */;
INSERT INTO `user_tbl` (`user_no`, `user_id`, `user_pwd`, `tel`, `user_nick`, `user_name`, `user_email`, `birth_yy`, `birth_mm`, `birth_dd`, `gender`) VALUES
	(1, 'test1', '1234', '010-0000-0000', '테스트1', '테스트1', 'test1@test.com', '1988', '11', '10', '1'),
	(2, 'testuser', '1234', '01012345678', '구구구', '홍길동', 'ec_test@naver.com', '1988', '05', '05', '1'),
	(3, 'qwer1', '1234', '01012345678', '최초의가입자', '홍길동', 'hong@naver.com', '1995', '11', '14', '1'),
	(4, 'asdf', '1234', '01012345555', 'b', '차범근', 'char@naver.com', '1990', '10', '10', '1'),
	(5, 'qwer123', '1234', '01012341234', 'c', 'yang', 'yang@123.com', '1995', '11', '14', '1'),
	(6, 'Woong414', '12341234', '010123445444', 'd', '김씨', 'asdf@asdf.com', '1998', '04', '11', '1'),
	(7, 'song1234', '12341234', '01045677654', 'song', '송', 'vvvvv@123.cc', '1998', '06', '14', '2'),
	(8, 'test1234', '12341234', '01012344444', '밤하늘의퍼얼', '김흐재123', 'ccccc@cccc.com', '1998', '02', '22', 'M'),
	(9, 'test22', '1234card', '01022226666', '테스트22', '김희재', 'test22@test.com', '1988', '03', '3', 'M');
/*!40000 ALTER TABLE `user_tbl` ENABLE KEYS */;

-- 테이블 mydb.u_ask_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `u_ask_tbl` (
  `ask_num` int(11) NOT NULL COMMENT '문의번호',
  `category_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '글제목',
  `content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '내용',
  `is_ans` tinyint(4) NOT NULL COMMENT '답변여부',
  `reg_date` date NOT NULL COMMENT '등록일자',
  `mod_date` date NOT NULL COMMENT '수정일자',
  PRIMARY KEY (`ask_num`),
  KEY `fk_userask_tbl_user_tbl1_idx` (`user_id`) USING BTREE,
  KEY `fk_userask_tbl_product_category_tbl1_idx` (`category_code`) USING BTREE,
  CONSTRAINT `FK_u_ask_tbl_category_tbl` FOREIGN KEY (`category_code`) REFERENCES `category_tbl` (`category_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_ask_tbl_user_tbl` FOREIGN KEY (`user_id`) REFERENCES `user_tbl` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.u_ask_tbl:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `u_ask_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_ask_tbl` ENABLE KEYS */;

-- 테이블 mydb.u_board_bad_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `u_board_bad_tbl` (
  `bad_num` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `list_num` int(11) NOT NULL DEFAULT 0,
  `bad` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`bad_num`),
  KEY `FK_u_board_bad_tbl_user_tbl` (`user_id`),
  KEY `FK_u_board_bad_tbl_u_board_tbl` (`list_num`),
  CONSTRAINT `FK_u_board_bad_tbl_u_board_tbl` FOREIGN KEY (`list_num`) REFERENCES `u_board_tbl` (`list_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_board_bad_tbl_user_tbl` FOREIGN KEY (`user_id`) REFERENCES `user_tbl` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 mydb.u_board_bad_tbl:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `u_board_bad_tbl` DISABLE KEYS */;
INSERT INTO `u_board_bad_tbl` (`bad_num`, `user_id`, `list_num`, `bad`) VALUES
	(1, 'test1', 1, 0),
	(2, 'test1', 210, 1);
/*!40000 ALTER TABLE `u_board_bad_tbl` ENABLE KEYS */;

-- 테이블 mydb.u_board_liked_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `u_board_liked_tbl` (
  `liked_num` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `list_num` int(11) NOT NULL DEFAULT 0,
  `liked` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`liked_num`),
  KEY `FK_u_board_liked_tbl_user_tbl` (`user_id`),
  KEY `FK_u_board_liked_tbl_u_board_tbl` (`list_num`),
  CONSTRAINT `FK_u_board_liked_tbl_u_board_tbl` FOREIGN KEY (`list_num`) REFERENCES `u_board_tbl` (`list_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_board_liked_tbl_user_tbl` FOREIGN KEY (`user_id`) REFERENCES `user_tbl` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 mydb.u_board_liked_tbl:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `u_board_liked_tbl` DISABLE KEYS */;
INSERT INTO `u_board_liked_tbl` (`liked_num`, `user_id`, `list_num`, `liked`) VALUES
	(1, 'test1', 5, 0),
	(2, 'test1', 210, 1);
/*!40000 ALTER TABLE `u_board_liked_tbl` ENABLE KEYS */;

-- 테이블 mydb.u_board_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `u_board_tbl` (
  `list_num` int(11) NOT NULL COMMENT '글번호',
  `parent_num` int(11) DEFAULT NULL COMMENT '자식번호',
  `category_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '카테고리 번호',
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자 아이디',
  `image_fileName` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록 이미지 번호',
  `u_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '글제목',
  `u_content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '내용',
  `hits` int(11) DEFAULT 0 COMMENT '조회수',
  `liked` int(11) DEFAULT 0 COMMENT '도움이돼요',
  `bad` int(11) DEFAULT 0,
  `reg_date` date NOT NULL COMMENT '등록일자',
  `mod_date` date DEFAULT NULL COMMENT '수정일자',
  PRIMARY KEY (`list_num`),
  KEY `fk_playlist_tbl_product_category_tbl1_idx` (`category_code`) USING BTREE,
  KEY `fk_u_playlist_tbl_user_tbl1_idx` (`user_id`) USING BTREE,
  CONSTRAINT `FK_u_board_tbl_category_tbl` FOREIGN KEY (`category_code`) REFERENCES `category_tbl` (`category_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_board_tbl_user_tbl` FOREIGN KEY (`user_id`) REFERENCES `user_tbl` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.u_board_tbl:~213 rows (대략적) 내보내기
/*!40000 ALTER TABLE `u_board_tbl` DISABLE KEYS */;
INSERT INTO `u_board_tbl` (`list_num`, `parent_num`, `category_code`, `user_id`, `image_fileName`, `u_title`, `u_content`, `hits`, `liked`, `bad`, `reg_date`, `mod_date`) VALUES
	(1, 0, '1', 'test1', NULL, '게시판테스트1', '게시판테스트 내용1', 0, 1, 0, '2022-09-29', NULL),
	(2, 0, '1', 'test1', NULL, '게시판테스트2', '게시판테스트 내용2', 0, 0, 0, '2022-09-29', NULL),
	(3, 0, '1', 'test1', NULL, '게시판테스트3', '게시판테스트 내용3', 0, 0, 0, '2022-09-29', NULL),
	(4, 0, '1', 'test1', NULL, '게시판테스트4', '게시판테스트 내용4', 0, 0, 0, '2022-09-29', NULL),
	(5, 0, '1', 'test1', NULL, '게시판테스트5', '게시판테스트 내용5', 0, 0, 0, '2022-09-29', NULL),
	(6, 0, '1', 'test1', NULL, '게시판테스트6', '게시판테스트 내용6', 0, 0, 0, '2022-09-29', NULL),
	(7, 0, '1', 'test1', NULL, '게시판테스트7', '게시판테스트 내용7', 0, 0, 0, '2022-09-29', NULL),
	(8, 0, '1', 'test1', NULL, '게시판테스트8', '게시판테스트 내용8', 0, 0, 0, '2022-09-29', NULL),
	(9, 0, '1', 'test1', NULL, '게시판테스트9', '게시판테스트 내용9', 0, 0, 0, '2022-09-29', NULL),
	(10, 0, '1', 'test1', NULL, '게시판테스트10', '게시판테스트 내용10', 0, 0, 0, '2022-09-29', NULL),
	(11, 0, '1', 'test1', NULL, '게시판테스트11', '게시판테스트 내용11', 0, 0, 0, '2022-09-29', NULL),
	(12, 0, '1', 'test1', NULL, '게시판테스트12', '게시판테스트 내용12', 0, 0, 0, '2022-09-29', NULL),
	(13, 0, '1', 'test1', NULL, '게시판테스트13', '게시판테스트 내용13', 0, 0, 0, '2022-09-29', NULL),
	(14, 0, '1', 'test1', NULL, '게시판테스트14', '게시판테스트 내용14', 0, 0, 0, '2022-09-29', NULL),
	(15, 0, '1', 'test1', NULL, '게시판테스트15', '게시판테스트 내용15', 0, 0, 0, '2022-09-29', NULL),
	(16, 0, '1', 'test1', NULL, '게시판테스트16', '게시판테스트 내용16', 0, 0, 0, '2022-09-29', NULL),
	(17, 0, '1', 'test1', NULL, '게시판테스트17', '게시판테스트 내용17', 0, 0, 0, '2022-09-29', NULL),
	(18, 0, '1', 'test1', NULL, '게시판테스트18', '게시판테스트 내용18', 0, 0, 0, '2022-09-29', NULL),
	(19, 0, '1', 'test1', NULL, '게시판테스트19', '게시판테스트 내용19', 0, 0, 0, '2022-09-29', NULL),
	(20, 0, '1', 'test1', NULL, '게시판테스트20', '게시판테스트 내용20', 0, 0, 0, '2022-09-29', NULL),
	(21, 0, '1', 'test1', NULL, '게시판테스트21', '게시판테스트 내용21', 0, 0, 0, '2022-09-29', NULL),
	(22, 0, '1', 'test1', NULL, '게시판테스트22', '게시판테스트 내용22', 0, 0, 0, '2022-09-29', NULL),
	(23, 0, '1', 'test1', NULL, '게시판테스트23', '게시판테스트 내용23', 0, 0, 0, '2022-09-29', NULL),
	(24, 0, '1', 'test1', NULL, '게시판테스트24', '게시판테스트 내용24', 0, 0, 0, '2022-09-29', NULL),
	(25, 0, '1', 'test1', NULL, '게시판테스트25', '게시판테스트 내용25', 0, 0, 0, '2022-09-29', NULL),
	(26, 0, '1', 'test1', NULL, '게시판테스트26', '게시판테스트 내용26', 0, 0, 0, '2022-09-29', NULL),
	(27, 0, '1', 'test1', NULL, '게시판테스트27', '게시판테스트 내용27', 0, 0, 0, '2022-09-29', NULL),
	(28, 0, '1', 'test1', NULL, '게시판테스트28', '게시판테스트 내용28', 0, 0, 0, '2022-09-29', NULL),
	(29, 0, '1', 'test1', NULL, '게시판테스트29', '게시판테스트 내용29', 0, 0, 0, '2022-09-29', NULL),
	(30, 0, '1', 'test1', NULL, '게시판테스트30', '게시판테스트 내용30', 0, 0, 0, '2022-09-29', NULL),
	(31, 0, '1', 'test1', NULL, '게시판테스트31', '게시판테스트 내용31', 0, 0, 0, '2022-09-29', NULL),
	(32, 0, '1', 'test1', NULL, '게시판테스트32', '게시판테스트 내용32', 0, 0, 0, '2022-09-29', NULL),
	(33, 0, '1', 'test1', NULL, '게시판테스트33', '게시판테스트 내용33', 0, 0, 0, '2022-09-29', NULL),
	(34, 0, '1', 'test1', NULL, '게시판테스트34', '게시판테스트 내용34', 0, 0, 0, '2022-09-29', NULL),
	(35, 0, '1', 'test1', NULL, '게시판테스트35', '게시판테스트 내용35', 0, 0, 0, '2022-09-29', NULL),
	(36, 0, '1', 'test1', NULL, '게시판테스트36', '게시판테스트 내용36', 0, 0, 0, '2022-09-29', NULL),
	(37, 0, '1', 'test1', NULL, '게시판테스트37', '게시판테스트 내용37', 0, 0, 0, '2022-09-29', NULL),
	(38, 0, '1', 'test1', NULL, '게시판테스트38', '게시판테스트 내용38', 0, 0, 0, '2022-09-29', NULL),
	(39, 0, '1', 'test1', NULL, '게시판테스트39', '게시판테스트 내용39', 0, 0, 0, '2022-09-29', NULL),
	(40, 0, '1', 'test1', NULL, '게시판테스트40', '게시판테스트 내용40', 0, 0, 0, '2022-09-29', NULL),
	(41, 0, '1', 'test1', NULL, '게시판테스트41', '게시판테스트 내용41', 0, 0, 0, '2022-09-29', NULL),
	(42, 0, '1', 'test1', NULL, '게시판테스트42', '게시판테스트 내용42', 0, 0, 0, '2022-09-29', NULL),
	(43, 0, '1', 'test1', NULL, '게시판테스트43', '게시판테스트 내용43', 0, 0, 0, '2022-09-29', NULL),
	(44, 0, '1', 'test1', NULL, '게시판테스트44', '게시판테스트 내용44', 0, 0, 0, '2022-09-29', NULL),
	(45, 0, '1', 'test1', NULL, '게시판테스트45', '게시판테스트 내용45', 0, 0, 0, '2022-09-29', NULL),
	(46, 0, '1', 'test1', NULL, '게시판테스트46', '게시판테스트 내용46', 0, 0, 0, '2022-09-29', NULL),
	(47, 0, '1', 'test1', NULL, '게시판테스트47', '게시판테스트 내용47', 0, 0, 0, '2022-09-29', NULL),
	(48, 0, '1', 'test1', NULL, '게시판테스트48', '게시판테스트 내용48', 0, 0, 0, '2022-09-29', NULL),
	(49, 0, '1', 'test1', NULL, '게시판테스트49', '게시판테스트 내용49', 0, 0, 0, '2022-09-29', NULL),
	(50, 0, '1', 'test1', NULL, '게시판테스트50', '게시판테스트 내용50', 0, 0, 0, '2022-09-29', NULL),
	(51, 0, '1', 'test1', NULL, '게시판테스트51', '게시판테스트 내용51', 0, 0, 0, '2022-09-29', NULL),
	(52, 0, '1', 'test1', NULL, '게시판테스트52', '게시판테스트 내용52', 0, 0, 0, '2022-09-29', NULL),
	(53, 0, '1', 'test1', NULL, '게시판테스트53', '게시판테스트 내용53', 0, 0, 0, '2022-09-29', NULL),
	(54, 0, '1', 'test1', NULL, '게시판테스트54', '게시판테스트 내용54', 0, 0, 0, '2022-09-29', NULL),
	(55, 0, '1', 'test1', NULL, '게시판테스트55', '게시판테스트 내용55', 0, 0, 0, '2022-09-29', NULL),
	(56, 0, '1', 'test1', NULL, '게시판테스트56', '게시판테스트 내용56', 0, 0, 0, '2022-09-29', NULL),
	(57, 0, '1', 'test1', NULL, '게시판테스트57', '게시판테스트 내용57', 0, 0, 0, '2022-09-29', NULL),
	(58, 0, '1', 'test1', NULL, '게시판테스트58', '게시판테스트 내용58', 0, 0, 0, '2022-09-29', NULL),
	(59, 0, '1', 'test1', NULL, '게시판테스트59', '게시판테스트 내용59', 0, 0, 0, '2022-09-29', NULL),
	(60, 0, '1', 'test1', NULL, '게시판테스트60', '게시판테스트 내용60', 0, 0, 0, '2022-09-29', NULL),
	(61, 0, '1', 'test1', NULL, '게시판테스트61', '게시판테스트 내용61', 0, 0, 0, '2022-09-29', NULL),
	(62, 0, '1', 'test1', NULL, '게시판테스트62', '게시판테스트 내용62', 0, 0, 0, '2022-09-29', NULL),
	(63, 0, '1', 'test1', NULL, '게시판테스트63', '게시판테스트 내용63', 0, 0, 0, '2022-09-29', NULL),
	(64, 0, '1', 'test1', NULL, '게시판테스트64', '게시판테스트 내용64', 0, 0, 0, '2022-09-29', NULL),
	(65, 0, '1', 'test1', NULL, '게시판테스트65', '게시판테스트 내용65', 0, 0, 0, '2022-09-29', NULL),
	(66, 0, '1', 'test1', NULL, '게시판테스트66', '게시판테스트 내용66', 0, 0, 0, '2022-09-29', NULL),
	(67, 0, '1', 'test1', NULL, '게시판테스트67', '게시판테스트 내용67', 0, 0, 0, '2022-09-29', NULL),
	(68, 0, '1', 'test1', NULL, '게시판테스트68', '게시판테스트 내용68', 0, 0, 0, '2022-09-29', NULL),
	(69, 0, '1', 'test1', NULL, '게시판테스트69', '게시판테스트 내용69', 0, 0, 0, '2022-09-29', NULL),
	(70, 0, '1', 'test1', NULL, '게시판테스트70', '게시판테스트 내용70', 0, 0, 0, '2022-09-29', NULL),
	(71, 0, '1', 'test1', NULL, '게시판테스트71', '게시판테스트 내용71', 0, 0, 0, '2022-09-29', NULL),
	(72, 0, '1', 'test1', NULL, '게시판테스트72', '게시판테스트 내용72', 0, 0, 0, '2022-09-29', NULL),
	(73, 0, '1', 'test1', NULL, '게시판테스트73', '게시판테스트 내용73', 0, 0, 0, '2022-09-29', NULL),
	(74, 0, '1', 'test1', NULL, '게시판테스트74', '게시판테스트 내용74', 0, 0, 0, '2022-09-29', NULL),
	(75, 0, '1', 'test1', NULL, '게시판테스트75', '게시판테스트 내용75', 0, 0, 0, '2022-09-29', NULL),
	(76, 0, '1', 'test1', NULL, '게시판테스트76', '게시판테스트 내용76', 0, 0, 0, '2022-09-29', NULL),
	(77, 0, '1', 'test1', NULL, '게시판테스트77', '게시판테스트 내용77', 0, 0, 0, '2022-09-29', NULL),
	(78, 0, '1', 'test1', NULL, '게시판테스트78', '게시판테스트 내용78', 0, 0, 0, '2022-09-29', NULL),
	(79, 0, '1', 'test1', NULL, '게시판테스트79', '게시판테스트 내용79', 0, 0, 0, '2022-09-29', NULL),
	(80, 0, '1', 'test1', NULL, '게시판테스트80', '게시판테스트 내용80', 0, 0, 0, '2022-09-29', NULL),
	(81, 0, '1', 'test1', NULL, '게시판테스트81', '게시판테스트 내용81', 0, 0, 0, '2022-09-29', NULL),
	(82, 0, '1', 'test1', NULL, '게시판테스트82', '게시판테스트 내용82', 0, 0, 0, '2022-09-29', NULL),
	(83, 0, '1', 'test1', NULL, '게시판테스트83', '게시판테스트 내용83', 0, 0, 0, '2022-09-29', NULL),
	(84, 0, '1', 'test1', NULL, '게시판테스트84', '게시판테스트 내용84', 0, 0, 0, '2022-09-29', NULL),
	(85, 0, '1', 'test1', NULL, '게시판테스트85', '게시판테스트 내용85', 0, 0, 0, '2022-09-29', NULL),
	(86, 0, '1', 'test1', NULL, '게시판테스트86', '게시판테스트 내용86', 0, 0, 0, '2022-09-29', NULL),
	(87, 0, '1', 'test1', NULL, '게시판테스트87', '게시판테스트 내용87', 0, 0, 0, '2022-09-29', NULL),
	(88, 0, '1', 'test1', NULL, '게시판테스트88', '게시판테스트 내용88', 0, 0, 0, '2022-09-29', NULL),
	(89, 0, '1', 'test1', NULL, '게시판테스트89', '게시판테스트 내용89', 0, 0, 0, '2022-09-29', NULL),
	(90, 0, '1', 'test1', NULL, '게시판테스트90', '게시판테스트 내용90', 0, 0, 0, '2022-09-29', NULL),
	(91, 0, '1', 'test1', NULL, '게시판테스트91', '게시판테스트 내용91', 0, 0, 0, '2022-09-29', NULL),
	(92, 0, '1', 'test1', NULL, '게시판테스트92', '게시판테스트 내용92', 0, 0, 0, '2022-09-29', NULL),
	(93, 0, '1', 'test1', NULL, '게시판테스트93', '게시판테스트 내용93', 0, 0, 0, '2022-09-29', NULL),
	(94, 0, '1', 'test1', NULL, '게시판테스트94', '게시판테스트 내용94', 0, 0, 0, '2022-09-29', NULL),
	(95, 0, '1', 'test1', NULL, '게시판테스트95', '게시판테스트 내용95', 5, 0, 0, '2022-09-29', NULL),
	(96, 0, '1', 'test1', NULL, '게시판테스트96', '게시판테스트 내용96', 1, 0, 0, '2022-09-29', NULL),
	(97, 0, '1', 'test1', NULL, '게시판테스트97', '게시판테스트 내용97', 10, 0, 0, '2022-09-29', NULL),
	(98, 0, '1', 'test1', NULL, '게시판테스트98', '게시판테스트 내용98', 3, 0, 0, '2022-09-29', NULL),
	(99, 0, '1', 'test1', NULL, '게시판테스트99', '게시판테스트 내용99', 13, 0, 0, '2022-09-29', NULL),
	(100, 0, '1', 'test1', NULL, '게시판테스트100', '게시판테스트 내용100', 46, 0, 0, '2022-09-29', NULL),
	(101, 0, '2', 'test1', NULL, '게시판테스트101', '게시판테스트 내용101', 0, 0, 0, '2022-09-29', NULL),
	(102, 0, '2', 'test1', NULL, '게시판테스트102', '게시판테스트 내용102', 0, 0, 0, '2022-09-29', NULL),
	(103, 0, '2', 'test1', NULL, '게시판테스트103', '게시판테스트 내용103', 0, 0, 0, '2022-09-29', NULL),
	(104, 0, '2', 'test1', NULL, '게시판테스트104', '게시판테스트 내용104', 0, 0, 0, '2022-09-29', NULL),
	(105, 0, '2', 'test1', NULL, '게시판테스트105', '게시판테스트 내용105', 0, 0, 0, '2022-09-29', NULL),
	(106, 0, '2', 'test1', NULL, '게시판테스트106', '게시판테스트 내용106', 2, 0, 0, '2022-09-29', NULL),
	(107, 0, '2', 'test1', NULL, '게시판테스트107', '게시판테스트 내용107', 0, 0, 0, '2022-09-29', NULL),
	(108, 0, '2', 'test1', NULL, '게시판테스트108', '게시판테스트 내용108', 0, 0, 0, '2022-09-29', NULL),
	(109, 0, '2', 'test1', NULL, '게시판테스트109', '게시판테스트 내용109', 0, 0, 0, '2022-09-29', NULL),
	(110, 0, '2', 'test1', NULL, '게시판테스트110', '게시판테스트 내용110', 6, 0, 0, '2022-09-29', NULL),
	(111, 0, '2', 'test1', NULL, '게시판테스트111', '게시판테스트 내용111', 0, 0, 0, '2022-09-29', NULL),
	(112, 0, '2', 'test1', NULL, '게시판테스트112', '게시판테스트 내용112', 0, 0, 0, '2022-09-29', NULL),
	(113, 0, '2', 'test1', NULL, '게시판테스트113', '게시판테스트 내용113', 1, 0, 0, '2022-09-29', NULL),
	(114, 0, '2', 'test1', NULL, '게시판테스트114', '게시판테스트 내용114', 1, 0, 0, '2022-09-29', NULL),
	(115, 0, '2', 'test1', NULL, '게시판테스트115', '게시판테스트 내용115', 5, 0, 0, '2022-09-29', NULL),
	(116, 0, '2', 'test1', NULL, '게시판테스트116', '게시판테스트 내용116', 0, 0, 0, '2022-09-29', NULL),
	(117, 0, '2', 'test1', NULL, '게시판테스트117', '게시판테스트 내용117', 0, 0, 0, '2022-09-29', NULL),
	(118, 0, '2', 'test1', NULL, '게시판테스트118', '게시판테스트 내용118', 0, 0, 0, '2022-09-29', NULL),
	(119, 0, '2', 'test1', NULL, '게시판테스트119', '게시판테스트 내용119', 0, 0, 0, '2022-09-29', NULL),
	(120, 0, '2', 'test1', NULL, '게시판테스트120', '게시판테스트 내용120', 0, 0, 0, '2022-09-29', NULL),
	(121, 0, '2', 'test1', NULL, '게시판테스트121', '게시판테스트 내용121', 0, 0, 0, '2022-09-29', NULL),
	(122, 0, '2', 'test1', NULL, '게시판테스트122', '게시판테스트 내용122', 0, 0, 0, '2022-09-29', NULL),
	(123, 0, '2', 'test1', NULL, '게시판테스트123', '게시판테스트 내용123', 0, 0, 0, '2022-09-29', NULL),
	(124, 0, '2', 'test1', NULL, '게시판테스트124', '게시판테스트 내용124', 0, 0, 0, '2022-09-29', NULL),
	(125, 0, '2', 'test1', NULL, '게시판테스트125', '게시판테스트 내용125', 0, 0, 0, '2022-09-29', NULL),
	(126, 0, '2', 'test1', NULL, '게시판테스트126', '게시판테스트 내용126', 0, 0, 0, '2022-09-29', NULL),
	(127, 0, '2', 'test1', NULL, '게시판테스트127', '게시판테스트 내용127', 0, 0, 0, '2022-09-29', NULL),
	(128, 0, '2', 'test1', NULL, '게시판테스트128', '게시판테스트 내용128', 0, 0, 0, '2022-09-29', NULL),
	(129, 0, '2', 'test1', NULL, '게시판테스트129', '게시판테스트 내용129', 0, 0, 0, '2022-09-29', NULL),
	(130, 0, '2', 'test1', NULL, '게시판테스트130', '게시판테스트 내용130', 0, 0, 0, '2022-09-29', NULL),
	(131, 0, '2', 'test1', NULL, '게시판테스트131', '게시판테스트 내용131', 1, 0, 0, '2022-09-29', NULL),
	(132, 0, '2', 'test1', NULL, '게시판테스트132', '게시판테스트 내용132', 0, 0, 0, '2022-09-29', NULL),
	(133, 0, '2', 'test1', NULL, '게시판테스트133', '게시판테스트 내용133', 0, 0, 0, '2022-09-29', NULL),
	(134, 0, '2', 'test1', NULL, '게시판테스트134', '게시판테스트 내용134', 0, 0, 0, '2022-09-29', NULL),
	(135, 0, '2', 'test1', NULL, '게시판테스트135', '게시판테스트 내용135', 0, 0, 0, '2022-09-29', NULL),
	(136, 0, '2', 'test1', NULL, '게시판테스트136', '게시판테스트 내용136', 0, 0, 0, '2022-09-29', NULL),
	(137, 0, '2', 'test1', NULL, '게시판테스트137', '게시판테스트 내용137', 0, 0, 0, '2022-09-29', NULL),
	(138, 0, '2', 'test1', NULL, '게시판테스트138', '게시판테스트 내용138', 0, 0, 0, '2022-09-29', NULL),
	(139, 0, '2', 'test1', NULL, '게시판테스트139', '게시판테스트 내용139', 0, 0, 0, '2022-09-29', NULL),
	(140, 0, '2', 'test1', NULL, '게시판테스트140', '게시판테스트 내용140', 0, 0, 0, '2022-09-29', NULL),
	(141, 0, '2', 'test1', NULL, '게시판테스트141', '게시판테스트 내용141', 0, 0, 0, '2022-09-29', NULL),
	(142, 0, '2', 'test1', NULL, '게시판테스트142', '게시판테스트 내용142', 0, 0, 0, '2022-09-29', NULL),
	(143, 0, '2', 'test1', NULL, '게시판테스트143', '게시판테스트 내용143', 0, 0, 0, '2022-09-29', NULL),
	(144, 0, '2', 'test1', NULL, '게시판테스트144', '게시판테스트 내용144', 0, 0, 0, '2022-09-29', NULL),
	(145, 0, '2', 'test1', NULL, '게시판테스트145', '게시판테스트 내용145', 0, 0, 0, '2022-09-29', NULL),
	(146, 0, '2', 'test1', NULL, '게시판테스트146', '게시판테스트 내용146', 0, 0, 0, '2022-09-29', NULL),
	(147, 0, '2', 'test1', NULL, '게시판테스트147', '게시판테스트 내용147', 0, 0, 0, '2022-09-29', NULL),
	(148, 0, '2', 'test1', NULL, '게시판테스트148', '게시판테스트 내용148', 0, 0, 0, '2022-09-29', NULL),
	(149, 0, '2', 'test1', NULL, '게시판테스트149', '게시판테스트 내용149', 0, 0, 0, '2022-09-29', NULL),
	(150, 0, '2', 'test1', NULL, '게시판테스트150', '게시판테스트 내용150', 0, 0, 0, '2022-09-29', NULL),
	(151, 0, '2', 'test1', NULL, '게시판테스트151', '게시판테스트 내용151', 0, 0, 0, '2022-09-29', NULL),
	(152, 0, '2', 'test1', NULL, '게시판테스트152', '게시판테스트 내용152', 0, 0, 0, '2022-09-29', NULL),
	(153, 0, '2', 'test1', NULL, '게시판테스트153', '게시판테스트 내용153', 0, 0, 0, '2022-09-29', NULL),
	(154, 0, '2', 'test1', NULL, '게시판테스트154', '게시판테스트 내용154', 0, 0, 0, '2022-09-29', NULL),
	(155, 0, '2', 'test1', NULL, '게시판테스트155', '게시판테스트 내용155', 0, 0, 0, '2022-09-29', NULL),
	(156, 0, '2', 'test1', NULL, '게시판테스트156', '게시판테스트 내용156', 0, 0, 0, '2022-09-29', NULL),
	(157, 0, '2', 'test1', NULL, '게시판테스트157', '게시판테스트 내용157', 0, 0, 0, '2022-09-29', NULL),
	(158, 0, '2', 'test1', NULL, '게시판테스트158', '게시판테스트 내용158', 0, 0, 0, '2022-09-29', NULL),
	(159, 0, '2', 'test1', NULL, '게시판테스트159', '게시판테스트 내용159', 0, 0, 0, '2022-09-29', NULL),
	(160, 0, '2', 'test1', NULL, '게시판테스트160', '게시판테스트 내용160', 0, 0, 0, '2022-09-29', NULL),
	(161, 0, '2', 'test1', NULL, '게시판테스트161', '게시판테스트 내용161', 0, 0, 0, '2022-09-29', NULL),
	(162, 0, '2', 'test1', NULL, '게시판테스트162', '게시판테스트 내용162', 0, 0, 0, '2022-09-29', NULL),
	(163, 0, '2', 'test1', NULL, '게시판테스트163', '게시판테스트 내용163', 0, 0, 0, '2022-09-29', NULL),
	(164, 0, '2', 'test1', NULL, '게시판테스트164', '게시판테스트 내용164', 0, 0, 0, '2022-09-29', NULL),
	(165, 0, '2', 'test1', NULL, '게시판테스트165', '게시판테스트 내용165', 0, 0, 0, '2022-09-29', NULL),
	(166, 0, '2', 'test1', NULL, '게시판테스트166', '게시판테스트 내용166', 0, 0, 0, '2022-09-29', NULL),
	(167, 0, '2', 'test1', NULL, '게시판테스트167', '게시판테스트 내용167', 0, 0, 0, '2022-09-29', NULL),
	(168, 0, '2', 'test1', NULL, '게시판테스트168', '게시판테스트 내용168', 0, 0, 0, '2022-09-29', NULL),
	(169, 0, '2', 'test1', NULL, '게시판테스트169', '게시판테스트 내용169', 0, 0, 0, '2022-09-29', NULL),
	(170, 0, '2', 'test1', NULL, '게시판테스트170', '게시판테스트 내용170', 0, 0, 0, '2022-09-29', NULL),
	(171, 0, '2', 'test1', NULL, '게시판테스트171', '게시판테스트 내용171', 0, 0, 0, '2022-09-29', NULL),
	(172, 0, '2', 'test1', NULL, '게시판테스트172', '게시판테스트 내용172', 0, 0, 0, '2022-09-29', NULL),
	(173, 0, '2', 'test1', NULL, '게시판테스트173', '게시판테스트 내용173', 0, 0, 0, '2022-09-29', NULL),
	(174, 0, '2', 'test1', NULL, '게시판테스트174', '게시판테스트 내용174', 0, 0, 0, '2022-09-29', NULL),
	(175, 0, '2', 'test1', NULL, '게시판테스트175', '게시판테스트 내용175', 0, 0, 0, '2022-09-29', NULL),
	(176, 0, '2', 'test1', NULL, '게시판테스트176', '게시판테스트 내용176', 0, 0, 0, '2022-09-29', NULL),
	(177, 0, '2', 'test1', NULL, '게시판테스트177', '게시판테스트 내용177', 0, 0, 0, '2022-09-29', NULL),
	(178, 0, '2', 'test1', NULL, '게시판테스트178', '게시판테스트 내용178', 0, 0, 0, '2022-09-29', NULL),
	(179, 0, '2', 'test1', NULL, '게시판테스트179', '게시판테스트 내용179', 0, 0, 0, '2022-09-29', NULL),
	(180, 0, '2', 'test1', NULL, '게시판테스트180', '게시판테스트 내용180', 0, 0, 0, '2022-09-29', NULL),
	(181, 0, '2', 'test1', NULL, '게시판테스트181', '게시판테스트 내용181', 0, 0, 0, '2022-09-29', NULL),
	(182, 0, '2', 'test1', NULL, '게시판테스트182', '게시판테스트 내용182', 0, 0, 0, '2022-09-29', NULL),
	(183, 0, '2', 'test1', NULL, '게시판테스트183', '게시판테스트 내용183', 0, 0, 0, '2022-09-29', NULL),
	(184, 0, '2', 'test1', NULL, '게시판테스트184', '게시판테스트 내용184', 0, 0, 0, '2022-09-29', NULL),
	(185, 0, '2', 'test1', NULL, '게시판테스트185', '게시판테스트 내용185', 0, 0, 0, '2022-09-29', NULL),
	(186, 0, '2', 'test1', NULL, '게시판테스트186', '게시판테스트 내용186', 0, 0, 0, '2022-09-29', NULL),
	(187, 0, '2', 'test1', NULL, '게시판테스트187', '게시판테스트 내용187', 0, 0, 0, '2022-09-29', NULL),
	(188, 0, '2', 'test1', NULL, '게시판테스트188', '게시판테스트 내용188', 0, 0, 0, '2022-09-29', NULL),
	(189, 0, '2', 'test1', NULL, '게시판테스트189', '게시판테스트 내용189', 0, 0, 0, '2022-09-29', NULL),
	(190, 0, '2', 'test1', NULL, '게시판테스트190', '게시판테스트 내용190', 0, 0, 0, '2022-09-29', NULL),
	(191, 0, '2', 'test1', NULL, '게시판테스트191', '게시판테스트 내용191', 0, 0, 0, '2022-09-29', NULL),
	(192, 0, '2', 'test1', NULL, '게시판테스트192', '게시판테스트 내용192', 0, 0, 0, '2022-09-29', NULL),
	(193, 0, '2', 'test1', NULL, '게시판테스트193', '게시판테스트 내용193', 0, 0, 0, '2022-09-29', NULL),
	(194, 0, '2', 'test1', NULL, '게시판테스트194', '게시판테스트 내용194', 2, 0, 0, '2022-09-29', NULL),
	(195, 0, '2', 'test1', NULL, '게시판테스트195', '게시판테스트 내용195', 0, 0, 0, '2022-09-29', NULL),
	(196, 0, '2', 'test1', NULL, '게시판테스트196', '게시판테스트 내용196', 0, 0, 0, '2022-09-29', NULL),
	(197, 0, '2', 'test1', NULL, '게시판테스트197', '게시판테스트 내용197', 0, 0, 0, '2022-09-29', NULL),
	(198, 0, '2', 'test1', NULL, '게시판테스트198', '게시판테스트 내용198', 0, 0, 0, '2022-09-29', NULL),
	(199, 0, '2', 'test1', NULL, '게시판테스트199-수정', '게시판테스트 내용199', 7, 0, 0, '2022-09-29', '2022-10-21'),
	(201, 0, '1', 'test1', NULL, 'sdfsdfsd', 'sdfsdfsdf', 1, 0, 0, '2022-09-29', '2022-09-29'),
	(202, 0, '1', 'test1', NULL, 'sdfsdfsd', 'sdsdsdsd', 0, 0, 0, '2022-09-29', '2022-09-29'),
	(203, 0, '1', 'test1', NULL, 'tttttttttttttttt', 'ttttttttttttttttttt', 0, 0, 0, '2022-09-29', '2022-09-29'),
	(204, 0, '2', 'test1', NULL, '33333333333333', '333333333333333333333', 1, 0, 0, '2022-09-29', '2022-09-29'),
	(205, 0, '1', 'test1', NULL, '4444444444', '44444444444444444', 2, 0, 0, '2022-09-29', '2022-09-29'),
	(206, 0, '2', 'test1', NULL, 'ㄴㄴㄴㄴㄴ', 'ㄴㄴㄴㄴㄴㄴㄴㄴ', 1, 0, 0, '2022-09-30', '2022-09-30'),
	(207, 0, '2', 'test1', NULL, 'ㅇㅇㅇㅇㅇㅇㅇ', 'ㅇㅇㅇㅇㅇㅇㅇ', 1, 0, 0, '2022-09-30', '2022-09-30'),
	(210, 0, '1', 'test1', NULL, 'ㄴㄴㄴㄴㄴ', 'ㄴㄴㄴㄴㄴ', 193, 2, 2, '2022-09-30', '2022-09-30'),
	(211, 0, '2', 'test1', NULL, 'tttttttttttttttt', 'ㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅ', 0, 0, 0, '2022-09-30', '2022-09-30'),
	(212, 0, '2', 'test1', NULL, 'sdfsdfsd', 'ㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈ', 0, 0, 0, '2022-09-30', '2022-09-30'),
	(213, 0, '2', 'test1', NULL, 'sdfsdfsdfs', 'ssssssssssss', 0, 0, 0, '2022-09-30', '2022-09-30'),
	(214, 0, '2', 'test1', NULL, 'sssssssssssssssssss', 'sssssssssssssssssssssssssssss', 0, 0, 0, '2022-09-30', '2022-09-30'),
	(216, 0, '2', 'test1', 'hero_1.jpg', 'ddddddddddddddd', 'dddddddddddddddddddd', 276, 9, 0, '2022-09-30', '2022-09-30'),
	(217, 0, '2', 'test1', '', 'ㄴㄴㄴㄴㄴ', '', 13, 0, 0, '2022-10-07', '2022-10-07');
/*!40000 ALTER TABLE `u_board_tbl` ENABLE KEYS */;

-- 테이블 mydb.u_comments_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `u_comments_tbl` (
  `comment_num` int(11) NOT NULL AUTO_INCREMENT,
  `list_num` int(11) NOT NULL,
  `comments` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `mod_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `parent_num` int(11) DEFAULT 0,
  PRIMARY KEY (`comment_num`),
  KEY `list_num` (`list_num`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `FK_u_comments_tbl_u_board_tbl` FOREIGN KEY (`list_num`) REFERENCES `u_board_tbl` (`list_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_comments_tbl_user_tbl` FOREIGN KEY (`comment_id`) REFERENCES `user_tbl` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.u_comments_tbl:~13 rows (대략적) 내보내기
/*!40000 ALTER TABLE `u_comments_tbl` DISABLE KEYS */;
INSERT INTO `u_comments_tbl` (`comment_num`, `list_num`, `comments`, `comment_id`, `reg_date`, `mod_date`, `parent_num`) VALUES
	(1, 1, 'sdfsdfsf', 'test1', '2022-09-29 18:37:42', '2022-09-29 18:37:43', 0),
	(2, 99, 'sdfsdfsddf', 'test1', '2022-09-29 18:38:25', '2022-09-29 18:38:25', 0),
	(3, 97, 'dddddd', 'test1', '2022-09-29 18:38:57', '2022-09-29 18:38:57', 0),
	(4, 99, 'ddddddd', 'test1', '2022-09-29 18:40:47', '2022-09-29 18:40:47', 0),
	(5, 99, 'ccccccc', 'test1', '2022-09-29 18:41:28', '2022-09-29 18:41:28', 0),
	(6, 100, 'dfdfsdf', 'test1', '2022-09-29 18:42:44', '2022-09-29 18:42:44', 0),
	(7, 97, 'cccccc', 'test1', '2022-09-29 18:43:33', '2022-09-29 18:43:33', 0),
	(8, 210, 'dfdfdf', 'test1', '2022-10-05 19:19:17', '2022-10-05 19:19:17', 0),
	(9, 210, 'sssss', 'test1', '2022-10-05 20:49:23', '2022-10-05 20:49:23', 0),
	(10, 210, 'ddddd', 'test1', '2022-10-05 20:49:26', '2022-10-05 20:49:26', 0),
	(11, 216, '성웅이 바보', 'test1', '2022-10-07 15:16:29', '2022-10-07 15:16:29', 0),
	(12, 217, '22222', 'test1', '2022-10-07 15:24:12', '2022-10-07 15:24:12', 0),
	(13, 199, '테스트 중입니다', 'test1', '2022-10-21 11:49:49', '2022-10-21 11:49:49', 0);
/*!40000 ALTER TABLE `u_comments_tbl` ENABLE KEYS */;

-- 테이블 mydb.u_image_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `u_image_tbl` (
  `image_num` int(11) NOT NULL COMMENT '이미지번호',
  `list_num` int(11) NOT NULL COMMENT '글번호',
  `origin_filename` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '원본파일이름',
  `image_fileName` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '서버에 저장될 파일이름',
  PRIMARY KEY (`image_num`),
  UNIQUE KEY `stored_filename` (`image_fileName`) USING BTREE,
  KEY `fk_image_tbl_u_playlist_tbl1_idx` (`list_num`) USING BTREE,
  CONSTRAINT `FK_u_image_tbl_u_board_tbl` FOREIGN KEY (`list_num`) REFERENCES `u_board_tbl` (`list_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.u_image_tbl:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `u_image_tbl` DISABLE KEYS */;
INSERT INTO `u_image_tbl` (`image_num`, `list_num`, `origin_filename`, `image_fileName`) VALUES
	(1, 1, 'rain.png', 'rain.png'),
	(2, 216, 'hero_1.jpg', 'hero_1.jpg'),
	(3, 217, '', '');
/*!40000 ALTER TABLE `u_image_tbl` ENABLE KEYS */;

-- 테이블 mydb.wish_tbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `wish_tbl` (
  `wish_num` int(11) NOT NULL COMMENT '찜 번호',
  `category_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '카테고리 코드',
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자 아이디',
  `seller_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '판매자 아이디',
  PRIMARY KEY (`wish_num`),
  KEY `fk_wish_tbl_user_tbl1_idx` (`user_id`) USING BTREE,
  KEY `fk_wish_tbl_product_category_tbl1_idx` (`category_code`) USING BTREE,
  KEY `fk_wish_tbl_review_tbl1_idx` (`seller_id`) USING BTREE,
  CONSTRAINT `FK_wish_tbl_category_tbl` FOREIGN KEY (`category_code`) REFERENCES `category_tbl` (`category_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_wish_tbl_seller_tbl` FOREIGN KEY (`seller_id`) REFERENCES `seller_tbl` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_wish_tbl_user_tbl` FOREIGN KEY (`user_id`) REFERENCES `user_tbl` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.wish_tbl:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `wish_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `wish_tbl` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
