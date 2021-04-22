-- PROJECT_CATEGORY
-- 책, 그림, 등.
insert into project_category values(project_category_id_seq.nextval, '게임');
insert into project_category values(project_category_id_seq.nextval, '공연');
insert into project_category values(project_category_id_seq.nextval, '디자인');
insert into project_category values(project_category_id_seq.nextval, '만화');
insert into project_category values(project_category_id_seq.nextval, '예술');
insert into project_category values(project_category_id_seq.nextval, '공예');
insert into project_category values(project_category_id_seq.nextval, '사진');
insert into project_category values(project_category_id_seq.nextval, '영상');
insert into project_category values(project_category_id_seq.nextval, '푸드');
insert into project_category values(project_category_id_seq.nextval, '음악');
insert into project_category values(project_category_id_seq.nextval, '출판');
insert into project_category values(project_category_id_seq.nextval, '테크');
insert into project_category values(project_category_id_seq.nextval, '패션');

-- PROJECT_STATUS_CATEGORY
-- 미승인, 승인, 펀딩성공, 펀딩실패, 차단 등...
insert into project_status_category values(project_status_category_id_seq.nextval, '미승인');
insert into project_status_category values(project_status_category_id_seq.nextval, '승인');
insert into project_status_category values(project_status_category_id_seq.nextval, '성사');
insert into project_status_category values(project_status_category_id_seq.nextval, '실패');
insert into project_status_category values(project_status_category_id_seq.nextval, '차단');
-- insert into project_status_category values(project_status_category_id_seq.nextval, '승인요청');

-- COMMUNITY_CATEGORY
-- 문의,,,...
insert into community_category values(1, '후원자');
insert into community_category values(2, '창작자');

-- RESERVE_STATUS_CATEGORY
-- ready,paid,failed,cancelled,...
insert into reserve_status_category values(1, '결제대기');
insert into reserve_status_category values(2, '결제완료');
insert into reserve_status_category values(3, '결제취소');
insert into reserve_status_category values(4, '결제실패');
-- insert into reserve_status_category values(5, '교환요청');
-- insert into reserve_status_category values(6, '환불요청');

-- ROLE_CATEGORY
-- all, member, project, notice, faq, ...
INSERT INTO "ROLE_CATEGORY"(ID, NAME) 
VALUES(ROLE_CATEGORY_ID_SEQ.NEXTVAL, 'all');

INSERT INTO "ROLE_CATEGORY"(ID, NAME) 
VALUES(ROLE_CATEGORY_ID_SEQ.NEXTVAL, 'member');

INSERT INTO "ROLE_CATEGORY"(ID, NAME) 
VALUES(ROLE_CATEGORY_ID_SEQ.NEXTVAL, 'project');

INSERT INTO "ROLE_CATEGORY"(ID, NAME) 
VALUES(ROLE_CATEGORY_ID_SEQ.NEXTVAL, 'notice');

INSERT INTO "ROLE_CATEGORY"(ID, NAME) 
VALUES(ROLE_CATEGORY_ID_SEQ.NEXTVAL, 'faq');

-- MEMBER - ID: admin, PW: admin
INSERT INTO "MEMBER"(ID, EMAIL, NICKNAME, PWD, IS_EMAIL_VERIFIED) 
VALUES(MEMBER_ID_SEQ.NEXTVAL, 'admin@admin.com', 'admin', '$2a$10$GCfK98O7Pn5frUh76Cpu4uSEd33a6Ghr6KUZtcg7d18I0EAEbiy9C', 'Y');
-- MEMBER - ID: customeradmin, PW: admin
INSERT INTO "MEMBER"(ID, EMAIL, NICKNAME, PWD, IS_EMAIL_VERIFIED) 
VALUES(MEMBER_ID_SEQ.NEXTVAL, 'customeradmin@admin.com', 'admin', '$2a$10$GCfK98O7Pn5frUh76Cpu4uSEd33a6Ghr6KUZtcg7d18I0EAEbiy9C', 'Y');
-- MEMBER - ID: memberadmin, PW: admin
INSERT INTO "MEMBER"(ID, EMAIL, NICKNAME, PWD, IS_EMAIL_VERIFIED) 
VALUES(MEMBER_ID_SEQ.NEXTVAL, 'memberadmin@admin.com', 'admin', '$2a$10$GCfK98O7Pn5frUh76Cpu4uSEd33a6Ghr6KUZtcg7d18I0EAEbiy9C', 'Y');
-- MEMBER - ID: projectadmin, PW: admin
INSERT INTO "MEMBER"(ID, EMAIL, NICKNAME, PWD, IS_EMAIL_VERIFIED) 
VALUES(MEMBER_ID_SEQ.NEXTVAL, 'projectadmin@admin.com', 'admin', '$2a$10$GCfK98O7Pn5frUh76Cpu4uSEd33a6Ghr6KUZtcg7d18I0EAEbiy9C', 'Y');

-- MEMBER - ADMIN ROLE_CATEGORY
INSERT INTO "MEMBER_ROLE_CATEGORY"(MEMBER_ID, ROLE_CATEGORY_ID) 
VALUES(
    (SELECT ID FROM "MEMBER" WHERE EMAIL = 'admin@admin.com'), 
    (SELECT ID FROM "ROLE_CATEGORY" WHERE NAME = 'all')
);

INSERT INTO "MEMBER_ROLE_CATEGORY"(MEMBER_ID, ROLE_CATEGORY_ID) 
VALUES(
    (SELECT ID FROM "MEMBER" WHERE EMAIL = 'customeradmin@admin.com'), 
    (SELECT ID FROM "ROLE_CATEGORY" WHERE NAME = 'notice')
);

INSERT INTO "MEMBER_ROLE_CATEGORY"(MEMBER_ID, ROLE_CATEGORY_ID) 
VALUES(
    (SELECT ID FROM "MEMBER" WHERE EMAIL = 'customeradmin@admin.com'), 
    (SELECT ID FROM "ROLE_CATEGORY" WHERE NAME = 'faq')
);

INSERT INTO "MEMBER_ROLE_CATEGORY"(MEMBER_ID, ROLE_CATEGORY_ID) 
VALUES(
    (SELECT ID FROM "MEMBER" WHERE EMAIL = 'memberadmin@admin.com'), 
    (SELECT ID FROM "ROLE_CATEGORY" WHERE NAME = 'member')
);

INSERT INTO "MEMBER_ROLE_CATEGORY"(MEMBER_ID, ROLE_CATEGORY_ID) 
VALUES(
    (SELECT ID FROM "MEMBER" WHERE EMAIL = 'projectadmin@admin.com'), 
    (SELECT ID FROM "ROLE_CATEGORY" WHERE NAME = 'project')
);
-- COMMIT
COMMIT;
