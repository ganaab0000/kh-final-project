<-- regist.sql  임시 project table 생성을 위해 member_id null값으로 변경-->

ALTER TABLE PROJECT modify member_id null;
<--현재 검토만 됨-->
insert into project_status_category values(0, '임시');
insert into project_status_category values(1, '임시저장');
insert into project_status_category values(2, '검토');
<-- 등록 카테고리 -->
insert into project_category values(project_category_id_seq.nextval, '게임');
insert into project_category values(project_category_id_seq.nextval, '공연');
insert into project_category values(project_category_id_seq.nextval, '디자인');
insert into project_category values(project_category_id_seq.nextval, '만화');
insert into project_category values(project_category_id_seq.nextval, '예술');
insert into project_category values(project_category_id_seq.nextval, '공예');
insert into project_category values(project_category_id_seq.nextval, '사진');
insert into project_category values(project_category_id_seq.nextval, '영화·비디오');
insert into project_category values(project_category_id_seq.nextval, '푸드');
insert into project_category values(project_category_id_seq.nextval, '음악');
insert into project_category values(project_category_id_seq.nextval, '패션');
