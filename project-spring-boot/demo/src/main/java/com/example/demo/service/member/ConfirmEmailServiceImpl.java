package com.example.demo.service.member;

import java.util.Calendar;
import java.util.Date;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.domain.dto.ConfirmEmailDto;
import com.example.demo.repository.ConfirmEmailRepository;

@Service
public class ConfirmEmailServiceImpl implements ConfirmEmailService {
	@Autowired
	ConfirmEmailRepository confirmEmailRepository;

	@Override
	public ConfirmEmailDto saveNewKeyByMemberId(int memberId) {

		int EXPIRED_MINUTES = 30; // 만료시간(분) //설정파일로 설정하기.
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.add(Calendar.MINUTE, EXPIRED_MINUTES);
		Date dateExpired = calendar.getTime();

		Random rn = new Random();
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String securedKey = passwordEncoder.encode("salt_239481_" + rn.nextLong());
		ConfirmEmailDto confirmEmailDto = new ConfirmEmailDto();
		confirmEmailDto.setMemberId(memberId);
		confirmEmailDto.setDateExpired(dateExpired);
		confirmEmailDto.setSecuredKey(securedKey);
		deleteByMemberId(memberId);
		save(confirmEmailDto);
		return confirmEmailDto;

	}

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
