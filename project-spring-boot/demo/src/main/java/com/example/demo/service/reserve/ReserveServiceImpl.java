package com.example.demo.service.reserve;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.dto.ReserveDto;
import com.example.demo.domain.vo.ReserveVo;
import com.example.demo.repository.ReserveRepository;

@Service
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	private ReserveRepository reserveRepository;
	
	@Override
	public List<ReserveDto> findByProjectId(int projectId) {
		return reserveRepository.findByProjectId(projectId);
	}

	@Override
	public int getSponsorCount(int projectId) {
		return reserveRepository.getSponsorCount(projectId);
	}

	@Override
	public int getCollected(int projectId) {
		return reserveRepository.getCollected(projectId);
	}

	@Override
	public int insertReserve(ReserveDto reserveDto) {
		return reserveRepository.insertReserve(reserveDto);
	}

	@Override
	public List<ReserveDto> findByMemberId(int memberId) {
		return reserveRepository.findByMemberId(memberId);
	}

	@Override
	public int deleteReserve(int id) {
		return reserveRepository.deleteReserve(id);
	}

	@Override
	public int fixReserve(ReserveVo reserveVo) {
		return reserveRepository.fixReserve(reserveVo);
	}

	@Override
	public List<ReserveDto> detail(int id) {
		return reserveRepository.detail(id);
	}

}
