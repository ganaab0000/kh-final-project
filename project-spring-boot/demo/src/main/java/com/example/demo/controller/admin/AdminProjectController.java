package com.example.demo.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.admin.service.AdminProjectService;
import com.example.demo.util.ConstantCode;
import com.example.demo.util.PagingUtils;
import com.example.demo.util.Result;

@Controller
@RequestMapping("/admin/project")
public class AdminProjectController {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private AdminProjectService service;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, 
			@RequestParam(value="PROJECT_STATUS_CATEGORY_ID", required=false) Integer PROJECT_STATUS_CATEGORY_ID) throws Exception {
		
		request.setAttribute("PROJECT_STATUS_CATEGORY_ID", PROJECT_STATUS_CATEGORY_ID);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate = sdf.format(new Date());
		
		request.setAttribute("currentDate", currentDate);
		
		return "admin/project/list";
	}
	
	@RequestMapping("/getList")
	public @ResponseBody String getList(@RequestBody HashMap<String, Object> parameters) throws Exception {
		Result result = new Result("RSLT0000", "SUCCESS");
		
		try {
			
			int currentPageNo = (int) parameters.get("PAGE");
			
			int rowsPerPage = ConstantCode.ROWS_PER_PAGE;
				
			int startRowNo = ((currentPageNo - 1) * rowsPerPage) + 1;
			int endRowNo = currentPageNo * rowsPerPage;
			
			int totalCnt = service.getProjectListCount(parameters);
			
			if (totalCnt > 0) {
				parameters.put("START_ROW_NO", startRowNo);
				parameters.put("END_ROW_NO", endRowNo);
				
				List<HashMap<String, Object>> list = service.getProjectList(parameters);
				
				HashMap<String, Object> dataMap = new HashMap<String, Object>();
				dataMap.put("totalCount", totalCnt);
				dataMap.put("rowsPerPage", rowsPerPage);
				dataMap.put("startNo", totalCnt - ((currentPageNo - 1) * rowsPerPage));
				dataMap.put("list", list);
				dataMap.put("pages", PagingUtils.getPageHtml(totalCnt, currentPageNo, rowsPerPage));
				
				result = new Result("RSLT0000", "SUCCESS", dataMap);
				
			}
			
		} catch (Exception e) {
		}
		
		return result.toJson();
	}
	
	@RequestMapping("/listEnd")
	public String listEnd(HttpServletRequest request) throws Exception {
		
		return "admin/project/listEnd";
	}
	
	@RequestMapping("/getListEnd")
	public @ResponseBody String getListEnd(@RequestBody HashMap<String, Object> parameters) throws Exception {
		Result result = new Result("RSLT0000", "SUCCESS");
		
		try {
			
			int currentPageNo = (int) parameters.get("PAGE");
			
			int rowsPerPage = ConstantCode.ROWS_PER_PAGE;
				
			int startRowNo = ((currentPageNo - 1) * rowsPerPage) + 1;
			int endRowNo = currentPageNo * rowsPerPage;
			
			int totalCnt = service.getProjectListEndCount();
			
			if (totalCnt > 0) {
				parameters.put("START_ROW_NO", startRowNo);
				parameters.put("END_ROW_NO", endRowNo);
				
				List<HashMap<String, Object>> list = service.getProjectListEnd(parameters);
				
				HashMap<String, Object> dataMap = new HashMap<String, Object>();
				dataMap.put("totalCount", totalCnt);
				dataMap.put("rowsPerPage", rowsPerPage);
				dataMap.put("startNo", totalCnt - ((currentPageNo - 1) * rowsPerPage));
				dataMap.put("list", list);
				dataMap.put("pages", PagingUtils.getPageHtml(totalCnt, currentPageNo, rowsPerPage));
				
				result = new Result("RSLT0000", "SUCCESS", dataMap);
				
			}
			
		} catch (Exception e) {
		}
		
		return result.toJson();
	}
	
	@RequestMapping("/modifyStatus")
	public @ResponseBody String modifyStatus(@RequestBody HashMap<String, Object> parameters) throws Exception {
		Result result = new Result("RSLT0000", "SUCCESS");
		
		try {
			
			if (parameters != null && parameters.size() > 0) {
				
				int successCnt = service.modifyProjectStatus(parameters);
				
				if (successCnt <= 0) {
					result = new Result("RSLT7777", "상태 변경에 실패하였습니다.");
				}
				
			} else {
				result = new Result("RSLT8888", "파라메터가 존재하지 않습니다.");
			}
			
		} catch (Exception e) {
		}
		
		return result.toJson();
	}
}
