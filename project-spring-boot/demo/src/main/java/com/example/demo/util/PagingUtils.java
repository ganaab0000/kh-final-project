package com.example.demo.util;

public class PagingUtils {
	
	public static String getPageHtml(int totalCount, int pageNo, int rowsPerPage) {
		String rtnHtml = "";
		
		int totalPageCount = totalCount > 0 ? totalCount / rowsPerPage : 1;
		if (totalCount > 0 && totalCount % rowsPerPage > 0) {
			totalPageCount += 1;
		}
		
		int currentBlockNo = (pageNo / ConstantCode.PAGE_COUNT_PER_BLOCK);
		
		int startPageNo = (currentBlockNo * ConstantCode.PAGE_COUNT_PER_BLOCK) + 1;
		if (startPageNo <= 0) {
			startPageNo = 1;
		}
		int currentMaxPageNo = (currentBlockNo + 1) * ConstantCode.PAGE_COUNT_PER_BLOCK;
		if (totalPageCount <= 0) {
			currentMaxPageNo = 1;
		} else if (currentMaxPageNo > totalPageCount) {
			currentMaxPageNo = totalPageCount;
		}
		
		rtnHtml = "<ul class=\"pagination justify-content-center\">";
		rtnHtml += "<li class=\"page-item\"><a href=\"javascript:goPage('" + (pageNo > 1 ? pageNo - 1 : pageNo) + "')\" class=\"page-link text-dark\" aria-label=\"Previous\"> <span aria-hidden=\"true\">&laquo;</span></a>";
		for (int i = startPageNo; i <= currentMaxPageNo; i++) {
			rtnHtml += "<li class=\"page-item\"><a href=\"javascript:goPage('" + i + "')\">" + i + "</a></li>";
		}
		rtnHtml += "<li class=\"page-item\"><a href=\"javascript:goPage('" +  (pageNo < currentMaxPageNo ? pageNo + 1 : pageNo) + "')\" class=\"page-link text-dark\" aria-label=\"Next\"> <span aria-hidden=\"true\">&raquo;</span></a>";
		rtnHtml += "</ul>";
		
		return rtnHtml;
	}
}
