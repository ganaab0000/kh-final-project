package com.example.demo.service;

import java.util.Date;
import java.util.List;

import com.example.demo.domain.dto.VisitorCountPerDayDto;
import com.example.demo.domain.vo.CountProjectCategoryVO;

public interface StatService {

	public int getCountMemberCreated(Date startDate, Date endDate);

	public int getCountMemberDeleted(Date startDate, Date endDate);

	public int getCountMemberBlocked(Date startDate, Date endDate);

	public int getCountProjectByStatus(Date startDate, Date endDate, int status);

	public int getCountProjectBlame(Date startDate, Date endDate);

	public int getCountReserveByStatus(Date startDate, Date endDate, int status);

	public List<CountProjectCategoryVO> getCountGroupProjectCategory(Date startDate, Date endDate);

	public List<VisitorCountPerDayDto> getVisitorCountByDate(Date startDate, Date endDate);

}
