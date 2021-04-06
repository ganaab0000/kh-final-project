package com.example.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.example.demo.domain.dto.OauthDto;

@Mapper
public interface OauthRepository {

	@Insert("insert into oauth (id, memberId, accessToken, provider, providerProfileImg) "
			+ "values(oauth_id_seq.nextVal, #{memberId}, #{accessToken}, #{provider}, #{providerProfileImg})")
	public int save(OauthDto oauthDto);

}