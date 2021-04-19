package com.example.demo.service.reserve;

import java.util.List;

import com.example.demo.domain.dto.ReserveDto;

public interface ReserveService {
	
	public List<ReserveDto> findByProjectId(int projectId);
	
	public int getSponsorCount(int projectId);
	
	public int getCollected(int projectId);
	
	public int insertReserve(ReserveDto reserveDto);
	
	public List<ReserveDto> findByMemberId(int memberId);
	
	public int deleteReserve(int memberId, int projectId);
}
