package com.example.demo.service.member;

import java.util.Optional;

import com.example.demo.domain.dto.ConfirmEmailDto;

public interface ConfirmEmailService {
	public ConfirmEmailDto saveNewKeyByMemberId(int memberId);

	public int deleteWhenExpired();

	public int deleteByMemberIdWhenExpired(int memberId);

	public Optional<ConfirmEmailDto> findByMemberIdWhenNotExpired(int memberId);

	public int deleteByMemberId(int memberId);

	public int save(ConfirmEmailDto ConfirmEmailDto);
}
