package com.example.demo.repository;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.dto.VisitorCountPerDayDto;
import com.example.demo.domain.vo.CountProjectCategoryVO;


@Mapper
public interface StatRepository {

	@Select("select count(*) from member "
			+ "where "
			+ "date_created between trunc(#{startDate}) and trunc(#{endDate}) + 1")
	public int getCountMemberCreated(Date startDate, Date endDate);

	@Select("select count(*) from member "
			+ "where is_deleted='Y' and "
			+ "date_created between trunc(#{startDate}) and trunc(#{endDate}) + 1")
	public int getCountMemberDeleted(Date startDate, Date endDate);

	@Select("select count(*) from member "
			+ "where is_blocked='Y' and "
			+ "date_created between trunc(#{startDate}) and trunc(#{endDate}) + 1")
	public int getCountMemberBlocked(Date startDate, Date endDate);


	@Select("select count(*) from project "
			+ "where project_status_category_id=#{status} and "
			+ "date_created between trunc(#{startDate}) and trunc(#{endDate}) + 1")
	public int getCountProjectByStatus(Date startDate, Date endDate, int status);

	@Select("select count(project_id) from blame "
			+ "where "
			+ "date_created between trunc(#{startDate}) and trunc(#{endDate}) + 1 ")
	public int getCountProjectBlame(Date startDate, Date endDate);

	@Select("select count(*) from reserve "
			+ "where reserve_status_category_id=#{status} and "
			+ "date_created between trunc(#{startDate}) and trunc(#{endDate}) + 1")
	public int getCountReserveByStatus(Date startDate, Date endDate, int status);

	@Select("select project.project_category_id, project_category.name, count from "
			+ "(select project_category_id, count(project_category_id) count from project where "
			+ "date_created between trunc(#{startDate}) and trunc(#{endDate}) + 1 "
			+ "group by project_category_id) project "
			+ "inner join project_category "
			+ "ON project_category_id = project_category.id"
			+ "")
	public List<CountProjectCategoryVO> getCountGroupProjectCategory(Date startDate, Date endDate);

	@Select("select * from visitor_count_per_day "
			+ "where "
			+ "date_visited between trunc(#{startDate}) and trunc(#{endDate}) + 1 ")
	public List<VisitorCountPerDayDto> getVisitorCountByDate(Date startDate, Date endDate);

}
