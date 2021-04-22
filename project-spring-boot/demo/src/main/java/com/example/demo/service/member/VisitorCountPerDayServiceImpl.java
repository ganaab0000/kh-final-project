package com.example.demo.service.member;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.dto.VisitorCountPerDayDto;
import com.example.demo.repository.VisitorCountPerDayRepository;

@Service
public class VisitorCountPerDayServiceImpl implements VisitorCountPerDayService {

	@Autowired
	private VisitorCountPerDayRepository visitorCountPerDayRepository;

	@Override
	public Optional<VisitorCountPerDayDto> findBySysdate() {
		return visitorCountPerDayRepository.findBySysdate();
	}

	@Override
	public int save() {
		return visitorCountPerDayRepository.save();
	}
	@Override
	public int update() {
		return visitorCountPerDayRepository.update();
	}


}