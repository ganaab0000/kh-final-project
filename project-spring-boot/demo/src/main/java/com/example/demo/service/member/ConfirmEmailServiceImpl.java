package com.example.demo.service.member;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.dto.ConfirmEmailDto;
import com.example.demo.repository.ConfirmEmailRepository;

@Service
public class ConfirmEmailServiceImpl implements ConfirmEmailService{
	@Autowired
	ConfirmEmailRepository confirmEmailRepository;

	@Override
	public int deleteWhenExpired() {
		return confirmEmailRepository.deleteWhenExpired();
	}

	@Override
	public int deleteByMemberIdWhenExpired(int memberId) {
		return confirmEmailRepository.deleteByMemberIdWhenExpired(memberId);
	}

	@Override
	public Optional<ConfirmEmailDto> findByMemberIdWhenNotExpired(int memberId) {
		return confirmEmailRepository.findByMemberIdWhenNotExpired(memberId);
	}

	@Override
	public int deleteByMemberId(int memberId) {
		return confirmEmailRepository.deleteByMemberId(memberId);
	}

	@Override
	public int save(ConfirmEmailDto confirmEmailDto) {
		return confirmEmailRepository.save(confirmEmailDto);
	}

}
