package com.example.demo.service.member;

import java.util.Optional;

import com.example.demo.domain.dto.VisitorCountPerDayDto;

public interface VisitorCountPerDayService {

	public Optional<VisitorCountPerDayDto> findBySysdate();

	public int save();

	public int update();

}
