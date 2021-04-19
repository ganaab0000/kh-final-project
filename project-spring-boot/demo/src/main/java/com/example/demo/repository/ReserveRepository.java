package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.dto.ReserveDto;

@Mapper
public interface ReserveRepository {
	
	@Select("select * from reserve where project_id = #{projectId}")
	public List<ReserveDto> findByProjectId(int projectId);
	
	//회원의 예약 확인
	@Select("select * from reserve where member_id = #{memberId}")
	public List<ReserveDto> findByMemberId(int memberId);
	
	//결제상태가 대기,완료만 카운트
	@Select("select count(*) from reserve where project_id = #{projectId} and (reserve_status_category_id = 1 or reserve_status_category_id = 2)")
	public int getSponsorCount(int projectId);
	
	public int getCollected(int projectId);
	
	//예약 신청
	@Insert("insert into reserve (id, billingkey, additional_billings, date_created, receiver_name, receiver_phone, receiver_address, request_for_delivery, reserve_status_category_id, member_id, project_id) values(reserve_id_seq.nextVal, #{billingkey}, #{additionalBillings}, sysdate, #{receiverName}, #{receiverPhone}, #{receiverAddress}, #{requestForDelivery}, 1, #{memberId}, #{projectId})")
	public int insertReserve(ReserveDto reserveDto);
	
	//예약 취소
	@Delete("delete from reserve where member_id = #{memberId} and project_id = #{projectId}")
	public int deleteReserve(int memberId, int projectId);
}
