--project_view
create or replace view project_view as
select P.*, C.name project_category, nvl(RRR.sponsor, 0) sponsor, nvl(RRR.collected, 0) collected, nvl(round(collected/P.target_amount*100), 0) rate, nvl(VC.vote_count, 0) vote_count from (
    select project.*, case when sysdate >= date_project_started then 'Y' else 'N' end is_open, case when sysdate > date_project_closed then 'Y' else 'N' end is_close from project
    where project_status_category_id != 1 and project_status_category_id != 5
)P
left outer join project_category C on P.project_category_id = C.id
left outer join (select R.project_id, count(R.id) sponsor, sum(RR.reward_sum) collected from reserve R 
    left outer join reserve_reward RR on R.id = rr.reserve_id where R.reserve_status_category_id = 1 or R.reserve_status_category_id = 2 group by R.project_id
)RRR on P.id = RRR.project_id
left outer join (select project_id, count(*) vote_count from vote group by project_id) VC on P.id = VC.project_id;