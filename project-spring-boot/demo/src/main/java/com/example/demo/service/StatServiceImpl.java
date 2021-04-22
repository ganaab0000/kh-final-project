package com.example.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.dto.VisitorCountPerDayDto;
import com.example.demo.domain.vo.CountProjectCategoryVO;
import com.example.demo.repository.StatRepository;

@Service
public class StatServiceImpl implements StatService {

	@Autowired
	private StatRepository statRepository;

	@Override
	public int getCountMemberCreated(Date startDate, Date endDate) {
		return statRepository.getCountMemberCreated(startDate, endDate);
	}

	@Override
	public int getCountMemberDeleted(Date startDate, Date endDate) {
		return statRepository.getCountMemberDeleted(startDate, endDate);
	}

	@Override
	public int getCountMemberBlocked(Date startDate, Date endDate) {
		return statRepository.getCountMemberBlocked(startDate, endDate);
	}

	@Override
	public int getCountProjectByStatus(Date startDate, Date endDate, int status) {
		return statRepository.getCountProjectByStatus(startDate, endDate, status);
	}

	@Override
	public int getCountProjectBlame(Date startDate, Date endDate) {
		return statRepository.getCountProjectBlame(startDate, endDate);
	}

	@Override
	public int getCountReserveByStatus(Date startDate, Date endDate, int status) {
		return statRepository.getCountReserveByStatus(startDate, endDate, status);
	}

	@Override
	public List<CountProjectCategoryVO> getCountGroupProjectCategory(Date startDate, Date endDate) {
		return statRepository.getCountGroupProjectCategory(startDate, endDate);
	}

	@Override
	public List<VisitorCountPerDayDto> getVisitorCountByDate(Date startDate, Date endDate) {
		return statRepository.getVisitorCountByDate(startDate, endDate);
	}

}
