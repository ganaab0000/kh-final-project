package com.example.demo.service.reserve;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.dto.ReserveDto;
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
	public int insertReserve(String billingkey, int additionalBillings, String receiverName, int receiverPhone, String receiverAddress, String requestForDelivery, int memberId, int projectId) {
		return reserveRepository.insertReserve(billingkey, additionalBillings, receiverName, receiverPhone, receiverAddress, requestForDelivery, memberId, projectId);
	}

	@Override
	public List<ReserveDto> findByMemberId(int memberId) {
		return reserveRepository.findByMemberId(memberId);
	}

	@Override
	public int deleteReserve(int memberId, int projectId) {
		return reserveRepository.deleteReserve(memberId, projectId);
	}

}
