package com.example.demo.controller.admin;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.admin.service.AdminBlameService;
import com.example.demo.config.auth.dto.SessionMember;
import com.example.demo.util.ConstantCode;
import com.example.demo.util.PagingUtils;
import com.example.demo.util.Result;

@Controller
@RequestMapping("/admin/blame")
public class AdminBlameController {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private AdminBlameService service;
	
	@RequestMapping("/list")
	public String list() throws Exception {
		return "admin/blame/list";
	}
	
	@RequestMapping("/getList")
	public @ResponseBody String getList(@RequestBody HashMap<String, Object> parameters) throws Exception {
		Result result = new Result("RSLT0000", "SUCCESS");
		
		try {
			logger.debug("CHECK PARAMETERS=" + parameters);
			
			int currentPageNo = (int) parameters.get("PAGE");
			
			int rowsPerPage = ConstantCode.ROWS_PER_PAGE;
				
			int startRowNo = ((currentPageNo - 1) * rowsPerPage) + 1;
			int endRowNo = currentPageNo * rowsPerPage;
			
			int totalCnt = service.getBlameListCount(parameters);
			
			if (totalCnt > 0) {
				parameters.put("START_ROW_NO", startRowNo);
				parameters.put("END_ROW_NO", endRowNo);
				
				List<HashMap<String, Object>> list = service.getBlameList(parameters);
				
				HashMap<String, Object> dataMap = new HashMap<String, Object>();
				dataMap.put("totalCount", totalCnt);
				dataMap.put("rowsPerPage", rowsPerPage);
				dataMap.put("startNo", totalCnt - ((currentPageNo - 1) * rowsPerPage));
				dataMap.put("list", list);
//				dataMap.put("pages", PagingUtils.getPageHtml(totalCnt, currentPageNo, rowsPerPage));
				
				result = new Result("RSLT0000", "SUCCESS", dataMap);
				
			} else {
				result = new Result("RSLT0001", "조회된 내역이 없습니다.");
			}
			
		} catch (Exception e) {
		}
		
		return result.toJson();
	}
	
	@RequestMapping("/view")
	public String view(HttpServletRequest request, 
			@RequestParam(value="ID", required=true) Integer ID) throws Exception {
		
		try {
			
			HashMap<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("ID", ID);
			
			HashMap<String, Object> info = service.getBlameInfo(parameters);
			
			request.setAttribute("info", info);
			
		} catch (Exception e) {
		}
		
		return "admin/blame/view";
	}
	
	@RequestMapping("/registReply")
	public @ResponseBody String registReply(HttpSession session
			, @RequestBody HashMap<String, Object> parameters) throws Exception {
		Result result = new Result("RSLT0000", "SUCCESS");
		
		try {
			
			if (parameters != null && parameters.size() > 0) {
				
				SessionMember member = (SessionMember) session.getAttribute("member");
				
				logger.debug("SESSION MEMBER = " + member);
				parameters.put("MEMBER_ID", member.getId());
				
				int successCnt = service.createBlameReply(parameters);
				
				if (successCnt <= 0) {
					result = new Result("RSLT7777", "답변 등록에 실패하였습니다.");
				}
				
			} else {
				result = new Result("RSLT8888", "파라메터가 존재하지 않습니다.");
			}
			
		} catch (Exception e) {
		}
		
		return result.toJson();
	}
	
	@RequestMapping("/modifyReply")
	public @ResponseBody String modifyReply(@RequestBody HashMap<String, Object> parameters) throws Exception {
		Result result = new Result("RSLT0000", "SUCCESS");
		
		try {
			
			if (parameters != null && parameters.size() > 0) {
				
				int successCnt = service.modifyBlameReply(parameters);
				
				if (successCnt <= 0) {
					result = new Result("RSLT7777", "답변 수정에 실패하였습니다.");
				}
				
			} else {
				result = new Result("RSLT8888", "파라메터가 존재하지 않습니다.");
			}
			
		} catch (Exception e) {
		}
		
		return result.toJson();
	}
}
