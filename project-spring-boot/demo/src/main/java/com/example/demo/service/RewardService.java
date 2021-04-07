package com.example.demo.service;

import java.util.List;

import com.example.demo.domain.dto.RewardDto;

public interface RewardService {

	public List<RewardDto> findByProjectId(int projectId);

}
