
-- MEMBER - ID: cook, PW: test
INSERT INTO "MEMBER"(ID, EMAIL, NICKNAME, PWD, IS_EMAIL_VERIFIED) 
VALUES(MEMBER_ID_SEQ.NEXTVAL, 'cook@cook.com', '양과자점 플레지르', '$2a$10$ANWWqRFVxCrr4tqkzA/KB.JM6BnS.cqouOj995eNGJgPGkE366/CO', 'Y');

-- MEMBER - ID: art, PW: test
INSERT INTO "MEMBER"(ID, EMAIL, NICKNAME, PWD, IS_EMAIL_VERIFIED) 
VALUES(MEMBER_ID_SEQ.NEXTVAL, 'art@art.com', 'MUSIC&ART COMPANY', '$2a$10$ANWWqRFVxCrr4tqkzA/KB.JM6BnS.cqouOj995eNGJgPGkE366/CO', 'Y');

-- MEMBER - ID: book, PW: test
INSERT INTO "MEMBER"(ID, EMAIL, NICKNAME, PWD, IS_EMAIL_VERIFIED) 
VALUES(MEMBER_ID_SEQ.NEXTVAL, 'book@book.com', '맛있는 책방', '$2a$10$ANWWqRFVxCrr4tqkzA/KB.JM6BnS.cqouOj995eNGJgPGkE366/CO', 'Y');

-- MEMBER - ID: buyer1, PW: test
INSERT INTO "MEMBER"(ID, EMAIL, NICKNAME, PWD, IS_EMAIL_VERIFIED) 
VALUES(MEMBER_ID_SEQ.NEXTVAL, 'buyer1@buyer.com', '후원자1', '$2a$10$ANWWqRFVxCrr4tqkzA/KB.JM6BnS.cqouOj995eNGJgPGkE366/CO', 'Y');

-- MEMBER - ID: buyer2, PW: test
INSERT INTO "MEMBER"(ID, EMAIL, NICKNAME, PWD, IS_EMAIL_VERIFIED) 
VALUES(MEMBER_ID_SEQ.NEXTVAL, 'buyer2@buyer.com', '후원자2', '$2a$10$ANWWqRFVxCrr4tqkzA/KB.JM6BnS.cqouOj995eNGJgPGkE366/CO', 'Y');

-- MEMBER - ID: buyer3, PW: test
INSERT INTO "MEMBER"(ID, EMAIL, NICKNAME, PWD, IS_EMAIL_VERIFIED) 
VALUES(MEMBER_ID_SEQ.NEXTVAL, 'buyer3@buyer.com', '후원자3', '$2a$10$ANWWqRFVxCrr4tqkzA/KB.JM6BnS.cqouOj995eNGJgPGkE366/CO', 'Y');

-- ADMIN - dashboard statistics
insert into visitor_per_day (member_id, date_visited) values(1, trunc(sysdate)-1);
insert into visitor_per_day (member_id, date_visited) values(2, trunc(sysdate)-2);
insert into visitor_per_day (member_id, date_visited) values(1, trunc(sysdate)-3);
insert into visitor_per_day (member_id, date_visited) values(1, trunc(sysdate)-3
insert into visitor_count_per_day (count, date_visited) values(6, trunc(sysdate)-200);
insert into visitor_count_per_day (count, date_visited) values(3, trunc(sysdate)-75);
insert into visitor_count_per_day (count, date_visited) values(7, trunc(sysdate)-35);
insert into visitor_count_per_day (count, date_visited) values(4, trunc(sysdate)-15);
insert into visitor_count_per_day (count, date_visited) values(1, trunc(sysdate)-9);
insert into visitor_count_per_day (count, date_visited) values(3, trunc(sysdate)-8);
insert into visitor_count_per_day (count, date_visited) values(2, trunc(sysdate)-7);
insert into visitor_count_per_day (count, date_visited) values(6, trunc(sysdate)-6);
insert into visitor_count_per_day (count, date_visited) values(5, trunc(sysdate)-5);
insert into visitor_count_per_day (count, date_visited) values(16, trunc(sysdate)-4);
insert into visitor_count_per_day (count, date_visited) values(11, trunc(sysdate)-3);
insert into visitor_count_per_day (count, date_visited) values(26, trunc(sysdate)-2);
insert into visitor_count_per_day (count, date_visited) values(19, trunc(sysdate)-1);
insert into visitor_count_per_day (count, date_visited) values(36, trunc(sysdate)-0);

-- 프로젝트 작성
INSERT INTO "PROJECT"(
	ID, TITLE, SUB_TITLE, TARGET_AMOUNT, DATE_PROJECT_STARTED, DATE_PROJECT_CLOSED, HASHTAG, 
	THUMB_IMG, MAIN_IMG, SUMMARY, STORY, WRITER_NAME, WRITER_PROFILE_IMG, 
	WRITER_SNS_INSTAGRAM, WRITER_SNS_FACEBOOK, WRITER_PHONE, WRITER_EMAIL, 
	MEMBER_ID, PROJECT_CATEGORY_ID, PROJECT_STATUS_CATEGORY_ID
) 
VALUES(
	PROJECT_ID_SEQ.NEXTVAL, 
	'제목', '부제목', 1000, SYSDATE, SYSDATE, '베이커리, ㅇㅇ, ㅇㅇ',
	'/img/test.jpg', '/img/test.jpg', '요약', '본문', '작성자이름', '프로필 이미지',
	'http://google.com', 'http://google.com', '010-1234-1234', 'test@test.com',	
	(SELECT ID FROM "MEMBER" WHERE EMAIL = 'cook@cook.com'), '1', '1'
);
INSERT INTO "PROJECT"(
	ID, TITLE, SUB_TITLE, TARGET_AMOUNT, DATE_PROJECT_STARTED, DATE_PROJECT_CLOSED, HASHTAG, 
	THUMB_IMG, MAIN_IMG, SUMMARY, STORY, WRITER_NAME, WRITER_PROFILE_IMG, 
	WRITER_SNS_INSTAGRAM, WRITER_SNS_FACEBOOK, WRITER_PHONE, WRITER_EMAIL, 
	MEMBER_ID, PROJECT_CATEGORY_ID, PROJECT_STATUS_CATEGORY_ID
) 
VALUES(
	PROJECT_ID_SEQ.NEXTVAL, 
	'제목', '부제목', 1000, SYSDATE, SYSDATE, '베이커리, ㅇㅇ, ㅇㅇ',
	'/img/test.jpg', '/img/test.jpg', '요약', '본문', '작성자이름', '프로필 이미지',
	'http://google.com', 'http://google.com', '010-1234-1234', 'test@test.com',	
	(SELECT ID FROM "MEMBER" WHERE EMAIL = 'cook@cook.com'), '2', '1'
);
INSERT INTO "PROJECT"(
	ID, TITLE, SUB_TITLE, TARGET_AMOUNT, DATE_PROJECT_STARTED, DATE_PROJECT_CLOSED, HASHTAG, 
	THUMB_IMG, MAIN_IMG, SUMMARY, STORY, WRITER_NAME, WRITER_PROFILE_IMG, 
	WRITER_SNS_INSTAGRAM, WRITER_SNS_FACEBOOK, WRITER_PHONE, WRITER_EMAIL, 
	MEMBER_ID, PROJECT_CATEGORY_ID, PROJECT_STATUS_CATEGORY_ID
) 
VALUES(
	PROJECT_ID_SEQ.NEXTVAL, 
	'제목', '부제목', 1000, SYSDATE, SYSDATE, '베이커리, ㅇㅇ, ㅇㅇ',
	'/img/test.jpg', '/img/test.jpg', '요약', '본문', '작성자이름', '프로필 이미지',
	'http://google.com', 'http://google.com', '010-1234-1234', 'test@test.com',	
	(SELECT ID FROM "MEMBER" WHERE EMAIL = 'cook@cook.com'), '3', '1'
);

INSERT INTO "PROJECT"(
	ID, TITLE, SUB_TITLE, TARGET_AMOUNT, DATE_PROJECT_STARTED, DATE_PROJECT_CLOSED, HASHTAG, 
	THUMB_IMG, MAIN_IMG, SUMMARY, STORY, WRITER_NAME, WRITER_PROFILE_IMG, 
	WRITER_SNS_INSTAGRAM, WRITER_SNS_FACEBOOK, WRITER_PHONE, WRITER_EMAIL, 
	MEMBER_ID, PROJECT_CATEGORY_ID, PROJECT_STATUS_CATEGORY_ID
) 
VALUES(
	PROJECT_ID_SEQ.NEXTVAL, 
	'제목', '부제목', 1000, SYSDATE, SYSDATE, '베이커리, ㅇㅇ, ㅇㅇ',
	'/img/test.jpg', '/img/test.jpg', '요약', '본문', '작성자이름', '프로필 이미지',
	'http://google.com', 'http://google.com', '010-1234-1234', 'test@test.com',	
	(SELECT ID FROM "MEMBER" WHERE EMAIL = 'cook@cook.com'), '7', '1'
);

INSERT INTO "PROJECT"(
	ID, TITLE, SUB_TITLE, TARGET_AMOUNT, DATE_PROJECT_STARTED, DATE_PROJECT_CLOSED, HASHTAG, 
	THUMB_IMG, MAIN_IMG, SUMMARY, STORY, WRITER_NAME, WRITER_PROFILE_IMG, 
	WRITER_SNS_INSTAGRAM, WRITER_SNS_FACEBOOK, WRITER_PHONE, WRITER_EMAIL, 
	MEMBER_ID, PROJECT_CATEGORY_ID, PROJECT_STATUS_CATEGORY_ID
) 
VALUES(
	PROJECT_ID_SEQ.NEXTVAL, 
	'제목', '부제목', 1000, SYSDATE, SYSDATE, '베이커리, ㅇㅇ, ㅇㅇ',
	'/img/test.jpg', '/img/test.jpg', '요약', '본문', '작성자이름', '프로필 이미지',
	'http://google.com', 'http://google.com', '010-1234-1234', 'test@test.com',	
	(SELECT ID FROM "MEMBER" WHERE EMAIL = 'cook@cook.com'), '1', '1'
);

-- 리워드(상품) 종류 작성
INSERT INTO "REWARD"(
	ID, PRICE, NAME, DETAIL, MAX_STOCK, CURRENT_STOCK, IS_ADDRESS_REQUIRED, DATE_DELIVERY_ESTIMATED, 
	PROJECT_ID, OPTION_FORM
) 
VALUES(
	REWARD_ID_SEQ.NEXTVAL, 
	1000, 'NAME', 'DETAIL', 1000, 100, 'Y', SYSDATE,
	(SELECT max(ID) FROM "PROJECT"),
	''
);

-- 예약 작성
INSERT INTO "RESERVE"(
	ID, BILLINGKEY, ADDITIONAL_BILLINGS, DATE_CREATED, RECEIVER_NAME, RECEIVER_PHONE, RECEIVER_ADDRESS, REQUEST_FOR_DELIVERY, 
	RESERVE_STATUS_CATEGORY_ID, MEMBER_ID, PROJECT_ID
) 
VALUES(
	RESERVE_ID_SEQ.NEXTVAL, 
	'BILLINGKEY', 1000, SYSDATE, 'NAME', 01012341234, 
	'RECEIVER_ADDRESS', 'REQUEST_FOR_DELIVERY', 1, 
    (SELECT ID FROM "MEMBER" WHERE EMAIL = 'cook@cook.com'),
    (SELECT max(ID) FROM "PROJECT")
);

-- 예약 내역 작성
INSERT INTO "RESERVE_REWARD"(
	RESERVE_ID, REWARD_ID, REWARD_SUM
) 
VALUES(
	(SELECT max(ID) FROM "RESERVE"), 
	(SELECT max(ID) FROM "REWARD"), 
	2
);


-- notice
-- insert


-- faq
-- insert


-- COMMIT
COMMIT;