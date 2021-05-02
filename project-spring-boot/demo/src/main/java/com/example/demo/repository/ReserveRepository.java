package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.domain.dto.ReserveDto;
import com.example.demo.domain.vo.ReserveVo;

@Mapper
public interface ReserveRepository {
	
	@Select("select * from reserve where project_id = #{projectId}")
	public List<ReserveDto> findByProjectId(int projectId);
	
	//회원의 예약 확인
	@Select("select * from reserve where member_id = #{memberId}")
	public List<ReserveDto> findByMemberId(int memberId);
	
	@Select("select * from reserve where id = #{id}")
	public List<ReserveDto> detail(int id);
	
	//결제상태가 대기,완료만 카운트
	@Select("select count(*) from reserve where project_id = #{projectId} and (reserve_status_category_id = 1 or reserve_status_category_id = 2)")
	public int getSponsorCount(int projectId);
	
	public int getCollected(int projectId);
	
	//예약 신청
	@Insert("insert into reserve (id, billingkey, project_name, reward_name, reward_price, additional_billings, date_created, receiver_name, receiver_phone, receiver_address, request_for_delivery, reserve_status_category_id, member_id, project_id) values(reserve_id_seq.nextVal, #{billingkey}, #{projectName}, #{rewardName}, #{rewardPrice}, #{additionalBillings}, sysdate, #{receiverName}, #{receiverPhone}, #{receiverAddress}, #{requestForDelivery}, 1, #{memberId}, #{projectId})")
	public int insertReserve(ReserveDto reserveDto);
	
	//예약 취소
	@Delete("delete from reserve where (reserve_status_category_id = 1) and id = #{id}")
	public int deleteReserve(int id);
	
	//예약 수정
	@Update("update reserve set receiver_name = #{receiverName} , receiver_phone = #{receiverPhone} , receiver_address = #{receiverAddress} , request_for_delivery = #{requestForDelivery} where (reserve_status_category_id = 1) and id = #{id}")
	public int fixReserve(ReserveVo reserveVo);
}
