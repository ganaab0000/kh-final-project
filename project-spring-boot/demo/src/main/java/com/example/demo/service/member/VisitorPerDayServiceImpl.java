package com.example.demo.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.VisitorPerDayRepository;

@Service
public class VisitorPerDayServiceImpl implements VisitorPerDayService {

	@Autowired
	private VisitorPerDayRepository visitorPerDayRepository;

	@Override
	public int save(int memberId) {
		return visitorPerDayRepository.save(memberId);
	}

}