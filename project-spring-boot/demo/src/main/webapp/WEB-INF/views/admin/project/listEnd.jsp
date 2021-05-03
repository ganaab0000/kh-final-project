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
		search(parsetInt(pageNo));
	}
	
	$(document).ready(function(){
	
		$("#start").val("${currentDate}");
		$("#end").val("${currentDate}");
		
		search(1);
		
		$("#button-addon2").click(function(){
			search(1);
		});
	
	});
	
	function search(pageNo) {
		$("#list").html("");
	
		var goUrl = "/admin/project/getListEnd";
		
		var params = {
			PAGE: pageNo
		}
		
		console.log("params = " + JSON.stringify(params));
		
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
					
					$("#page").html(data.result.pages);
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
				strHtml += '	<td style="text-align:center">' + (startNo--) + '</td>';
				strHtml += '	<td style="text-align:center">' + data.CATEGORY_NM + '</td>';					    	
				strHtml += '	<td>' + data.TITLE + '</td>';							
				strHtml += '	<td style="text-align:center">' + data.TARGET_AMOUNT + '</td>';				
				strHtml += '	<td style="text-align:center">' + data.DATE_PROJECT_STARTED + ' ~ ' + data.DATE_PROJECT_CLOSED + '</td>';
				strHtml += '	<td style="text-align:center">' + data.CATEGORY_STATUS_NM + '</td>';	
				strHtml += '	<td style="text-align:center">' + data.DATE_CREATED + '</td>';	
				strHtml += '</tr>';
			
			}
			
			$("#list").html(strHtml);
		}
		
	}
</script>
</head>

<body>
     
	<jsp:include page="/WEB-INF/views/admin/common/header.jsp"></jsp:include>
     
	<side class="p-3 mb-3 border-bottom">
	<div class="container-fluid">
		<div class="row">
			
		<jsp:include page="/WEB-INF/views/admin/common/sideNav.jsp"></jsp:include>
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<div class="chartjs-size-monitor">
			<div class="chartjs-size-monitor-expand">
				<div class=""></div>
			</div>
			<div class="chartjs-size-monitor-shrink">
				<div class=""></div>
			</div>
		</div>
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 class="h2">프로젝트관리</h1>

		</div>
		<div class="menubar">
			<span><a href="${pageContext.request.contextPath}/admin/project/list?PROJECT_STATUS_CATEGORY_ID=" >전체</a></span>	
			<span><a href="${pageContext.request.contextPath}/admin/project/list?PROJECT_STATUS_CATEGORY_ID=1" >미승인</a></span>		
			<span><a href="${pageContext.request.contextPath}/admin/project/list?PROJECT_STATUS_CATEGORY_ID=2" >승인</a></span>		
			<span><a href="${pageContext.request.contextPath}/admin/project/list?PROJECT_STATUS_CATEGORY_ID=3" >성사</a></span>		
			<span><a href="${pageContext.request.contextPath}/admin/project/list?PROJECT_STATUS_CATEGORY_ID=4" >실패</a></span>		
			<span><a href="${pageContext.request.contextPath}/admin/project/list?PROJECT_STATUS_CATEGORY_ID=5" >신고</a></span>		
			<span><a href="${pageContext.request.contextPath}/admin/project/listEnd" class="active">마감</a></span>		
		</div>
		<div class="table-responsive">
			<table class="table table-sm">
				<colgroup>
					<col width="50" />
					<col width="80" />
					<col width="*" />
					<col width="100" />
					<col width="250" />
					<col width="70" />
					<col width="100" />
				</colgroup>
				<thead>
					<tr>
						<th style="text-align:center">번호</th>
						<th style="text-align:center">구분</th>
						<th style="text-align:center">프로젝트명</th>
						<th style="text-align:center">금액</th>
						<th style="text-align:center">프로젝트기간</th>
						<th style="text-align:center">상태</th>
						<th style="text-align:center">등록일자</th>
					</tr>
				</thead>
				<tbody id="list">
				</tbody>
			</table>
		</div>
		
		<nav id="page" aria-label="Page navigation example">
		</nav>
		</main>
		</div>
	</div>
	</side>
	
</body>
</html>