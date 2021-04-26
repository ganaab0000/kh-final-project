package com.example.demo.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.example.demo.cs.entity.FaqDto;
import com.example.demo.cs.entity.PagingVO;
import com.example.demo.cs.entity.QnaDto;
import com.example.demo.cs.entity.Search;

@Mapper
@Repository
public interface FaqRepository {
	
				
	
	@Select("select * from faq	where is_deleted = 'N' 	order by date_updated desc")
	public List<FaqDto> list() throws Exception;
	
	@Select("SELECT * FROM (SELECT ROWNUM RN, A.* "
			+ "FROM (	SELECT *	 FROM FAQ	WHERE  is_deleted = 'N' ORDER BY date_updated desc ) A) "
			+ "WHERE RN BETWEEN 1 AND 20")
	public List<FaqDto> answerList() throws Exception;
	
	@Select("SELECT COUNT(*) FROM FAQ where is_deleted = 'N'")
	public int countFaq() throws Exception;
	
	@Select("SELECT * FROM (SELECT ROWNUM RN, A.* "
			+ "FROM (SELECT * FROM FAQ WHERE is_deleted = 'N' ORDER BY ID DESC) A) "
			+ "WHERE RN BETWEEN #{start} AND #{end}")
	public List<FaqDto> selectFaq(PagingVO vo);
	
	@Select(" SELECT * FROM (SELECT ROWNUM RN, A.*	"
			+ "FROM (	SELECT *	 FROM FAQ	WHERE title like '%'||#{keyword}||'%' OR content like '%'||#{keyword}||'%' and is_deleted = 'N' "
			+ "ORDER BY ID DESC ) A) "
			+ "WHERE RN BETWEEN 1 AND 15")
	public ArrayList<FaqDto> searchList(Search search);
	
	@Select("select id, title, content, date_created, date_updated from faq where id= #{id} ")
	public FaqDto detail(Integer id) throws Exception;
	
	
	@Select(" SELECT * FROM (SELECT ROWNUM RN, A.*	"
			+ "FROM (	SELECT *	 FROM FAQ	WHERE title like '%'||#{keyword}||'%' ORDER BY ID DESC ) A) "
			+ "WHERE RN BETWEEN #{start} AND #{end}")
	public List<FaqDto> FaqResult(Search search);
	
	@Insert("insert into qna (id, header, email, title, content, path, is_consent) "
			+ "values (qna_ID_SEQ.nextVal, #{header}, #{email}, #{title}, #{content}, #{path}, #{isConsent})")
	public void resister(QnaDto qnaDto) throws Exception; 
	
	@Select("SELECT COUNT(*) FROM QNA where is_deleted = 'N'")
	public int countQna() throws Exception;
	
	@Select("SELECT * FROM (SELECT ROWNUM RN, A.* "
			+ "FROM (SELECT * FROM QNA WHERE is_deleted = 'N' ORDER BY ID DESC) A) "
			+ "WHERE RN BETWEEN #{start} AND #{end}")
	public List<QnaDto> selectQna(PagingVO vo);
	
	@Select("select id, header, email, title, content, path, date_created, is_state from qna where id= #{id} ")
	public QnaDto qRead(Integer id) throws Exception;
	
	
	@Select(" SELECT * FROM (SELECT ROWNUM RN, A.*	"
			+ "FROM (	SELECT *	 FROM QNA	WHERE title like '%'||#{keyword}||'%' ORDER BY ID DESC ) A) "
			+ "WHERE RN BETWEEN #{start} AND #{end}")
	public List<QnaDto> QnaResult(Search search);
	
	@Update("update QNA set IS_STATE=#{isState} where id=#{id}")
	public void confirmState(QnaDto qnaDto) throws Exception;
}
