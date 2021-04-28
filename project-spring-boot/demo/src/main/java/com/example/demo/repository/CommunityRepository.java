package com.example.demo.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.domain.dto.CommunityDto;
import com.example.demo.domain.vo.CommunityVo;

@Mapper
public interface CommunityRepository {

	public List<CommunityVo> findByProjectId(HashMap<String, Object> params);

	public int getCountByCategory(HashMap<String, Object> params);
	
	public List<CommunityVo> findReply(HashMap<String, Object> params);
	
	public CommunityVo findById(Integer id);
	
	public int getReplyCount(Integer parentId);

	@Insert("insert into community values(community_id_seq.nextval, #{content}, 'N', sysdate, sysdate,#{projectId}, #{memberId}, #{communityCategoryId}, '')")
	public void save(CommunityDto communityDto);
	
	@Insert("insert into community values(community_id_seq.nextval, #{content}, 'N', sysdate, sysdate,#{projectId}, #{memberId}, #{communityCategoryId}, #{parentCommunityId})")
	public void saveReply(CommunityDto communityDto);

	@Select("select count(*) from community where project_id = #{projectId} and parent_community_id is null and is_deleted = 'N'")
	public int getCount(Integer projectId);

	@Update("update community set content = #{content}, date_updated = sysdate where id = #{id}")
	public void update(CommunityDto communityDto);

	@Update("update community set is_deleted = 'Y' where id = #{communityId}")
	public void delete(Integer communityId);
	
	
}
