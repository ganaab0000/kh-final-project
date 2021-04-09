package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.dto.RewardDto;
import com.example.demo.repository.RewardRepository;

@Service
public class RewardServiceImpl implements RewardService{

	@Autowired
	private RewardRepository rewardRepository;
	
	@Override
	public List<RewardDto> findByProjectId(int projectId){
		return rewardRepository.findByProjectId(projectId);
	}
}
