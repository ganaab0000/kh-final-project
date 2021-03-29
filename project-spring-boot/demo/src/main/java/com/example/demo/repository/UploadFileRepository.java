package com.example.demo.repository;

import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.dto.UploadFileDTO;

@Mapper
public interface UploadFileRepository {

	@Select("select upload_file_id_seq.nextVal from dual")
	public int getNextId();

	@Insert("insert into upload_file (id, upload_name, save_name, file_size, file_type, member_id) "
			+ "values(#{id}, #{uploadName}, #{saveName}, #{fileSize}, #{fileType}, #{memberId})")
    int saveWithId(UploadFileDTO file);

	@Insert("insert into upload_file (id, upload_name, save_name, file_size, file_type, member_id) "
			+ "values(upload_file_id_seq.nextVal, #{uploadName}, #{saveName}, #{fileSize}, #{fileType}, #{memberId})")
    int save(UploadFileDTO file);

	@Select("select * from upload_file where id = #{id}")
	public Optional<UploadFileDTO> findById(int id);

}
