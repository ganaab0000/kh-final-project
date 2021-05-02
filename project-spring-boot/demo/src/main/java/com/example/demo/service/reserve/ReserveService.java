package com.example.demo.service.reserve;

import java.util.List;

import com.example.demo.domain.dto.ReserveDto;
import com.example.demo.domain.vo.ReserveVo;

public interface ReserveService {
	
	public List<ReserveDto> findByProjectId(int projectId);
	
	public int getSponsorCount(int projectId);
	
	public int getCollected(int projectId);
	
	public int insertReserve(ReserveDto reserveDto);
	
	public List<ReserveDto> findByMemberId(int memberId);
	
	public List<ReserveDto> detail(int id);
	
	public int deleteReserve(int id);
	
	public int fixReserve(ReserveVo reserveVo);
}
