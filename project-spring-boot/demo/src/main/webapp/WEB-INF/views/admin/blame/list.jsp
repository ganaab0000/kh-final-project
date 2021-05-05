<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/admin/common/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cs-css/cs-common.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	function goPage(pageNo) {
		search(pageNo);
	}
	
	$(document).ready(function(){
		
		search(1);
		
		$(".searchBtn").click(function(){
			search(1);
		});
	
	});
	
	function search(pageNo) {
		$("#list").html("");
	
		var goUrl = "/admin/blame/getList";
		
		var params = {
			PAGE: pageNo,
			SEARCH_STRING: $("#SEARCH_STRING").val()
		}
		
		$.ajax({
			url: goUrl,
			type: "post",
			data: JSON.stringify(params),
			dataType: "json",
			contentType: "application/json",
			success: function(data) {
			
				console.log("result = " + JSON.stringify(data));
			
				if ("RSLT0000" == data.resultCode) {
					var startNo = Number(data.result.startNo);
					drawList(data.result.list, startNo);
					
					$(".page").html(data.result.pages);
				} else {
					alert(data.resultMessage);
				}
			},
			error: function(request,status,error) {
			    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	function drawList(list, startNo) {
	
		if (list != undefined) {
		
			var strHtml = "";
		
			for (var i=0;i<list.length;i++) {
			
				var data = list[i];
			
				strHtml += '<tr>';
				strHtml += '	<td>' + (startNo--) + '</td>';
				strHtml += '	<td><a href="/admin/blame/view?ID=' + data.ID + '">' + data.PROJECT_TITLE + '</a></td>';					    	
				strHtml += '	<td>' + data.CONTENT + '</td>';							
				strHtml += '	<td>' + data.NICKNAME + '</td>';				
				strHtml += '	<td>' + data.DATE_CREATED + '</td>';																								
				strHtml += '	<td>' + (data.REPLY_YN == 'Y' ? '답변완료' : '답변미작성') + '</td>';											
				strHtml += '</tr>';
			
			}
			
			$("#list").html(strHtml);
		
		}
		
	}
</script>
</head>

<body>
     
	<jsp:include page="/WEB-INF/views/admin/common/header.jsp"></jsp:include>
     
	<div class="outbox">
		
		<div class= "note">
	 		 <span>신고관리</span>
		</div>
			
		<jsp:include page="/WEB-INF/views/admin/common/sideNav.jsp"></jsp:include>
			
		<div class="menubar">		
			<span><a href="${pageContext.request.contextPath}/admin/blame/list" class="active">신고관리</a></span>
		</div>
		<form id="frm" onsubmit="return false">
		<div class="search-row">		 		
			<input type="hidden" value="${search.searchType}"> 			
			<input class="input-search"  type="search" name="keyword" id="SEARCH_STRING" value="${search.keyword}" placeholder="검색어를 입력하세요 !">
			<button class="searchBtn" type="submit">검색</button>
		</div>
		</form>
		<div class="table-responsive">
			<table class="table table-sm">
				<thead>
					<tr>
						<th>#</th>
						<th>프로젝트명</th>
						<th>신고내용</th>
						<th>닉네임</th>
						<th>등록일자</th>
						<th>답변여부</th>
					</tr>
				</thead>
				<tbody id="list">
				</tbody>
			</table>
		</div>
		
		<nav class="page" aria-label="Page navigation example">
		</nav>
	</div>
	
</body>
</html>