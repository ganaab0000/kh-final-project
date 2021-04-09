package com.example.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.example.demo.domain.dto.OauthDto;

@Mapper
public interface OauthRepository {

	@Insert("insert into oauth (member_id, access_token, provider, provider_profile_img) "
			+ "values(#{memberId}, #{accessToken}, #{provider}, #{providerProfileImg})")
	public int save(OauthDto oauthDto);

}