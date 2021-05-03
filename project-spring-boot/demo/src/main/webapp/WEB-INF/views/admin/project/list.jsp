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
	
		var goUrl = "/admin/project/getList";
		
		var params = {
			PAGE: pageNo,
			PROJECT_STATUS_CATEGORY_ID: "${PROJECT_STATUS_CATEGORY_ID}",
			DATE_PROJECT_STARTED: $("#start").val().replace(/-/gi, ""),
			DATE_PROJECT_CLOSED: $("#end").val().replace(/-/gi, ""),
			SEARCH_STRING: $("#searchString").val()
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
				strHtml += '	<td style="text-align:center"><a href="/project/' + data.ID + '">' + data.CATEGORY_NM + '</a></td>';					    	
				strHtml += '	<td><a href="/project/' + data.ID + '">' + data.TITLE + '</a></td>';
				strHtml += '	<td style="text-align:center">' + data.TARGET_AMOUNT + '</td>';				
				strHtml += '	<td style="text-align:center">' + data.DATE_PROJECT_STARTED + ' ~ ' + data.DATE_PROJECT_CLOSED + '</td>';
				strHtml += '	<td style="text-align:center">' + data.CATEGORY_STATUS_NM + '</td>';	
				strHtml += '	<td style="text-align:center">' + data.DATE_CREATED + '</td>';	
				strHtml += '	<td style="text-align:center">';
				strHtml += '		<button class="statusBtn" data-key="' + data.ID + '" data-value="2">승인</button>';
				strHtml += '		<button class="statusBtn" data-key="' + data.ID + '" data-value="1">미승인</button>';
				strHtml += '		<button class="statusBtn" data-key="' + data.ID + '" data-value="3">성사</button>';
				strHtml += '		<button class="statusBtn" data-key="' + data.ID + '" data-value="4">실패</button>';
				strHtml += '	</td>';	
				strHtml += '</tr>';
			
			}
			
			$("#list").html(strHtml);
		
		
			$(".statusBtn").click(function(){
				var id = $(this).attr("data-key");
				var value = $(this).attr("data-value");
				
				setStatus(id, value);
			});
		}
		
	}
	
	function setStatus(id, value) {
		var goUrl = "/admin/project/modifyStatus";
		
		var params = {
			ID: id,
			PROJECT_STATUS_CATEGORY_ID: value
		}
		
		$.ajax({
			url: goUrl,
			type: "post",
			data: JSON.stringify(params),
			dataType: "json",
			contentType: "application/json",
			success: function(data) {
				if (data.resultCode == "RSLT0000") {
					alert("상태를 변경하였습니다.");
					location.href = "/admin/project/list";
				} else {
					alert(data.resultMessage);
				}
			},
			error: function(request,status,error) {
			    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
</script>
<style>


.statusBtn{
	min-width: 90px;
    height: 30px;
    border-radius: 4px;
    border: 0;
    font-size: 12px;
  	font-weight: bold;
    color: #ffffff;
    background-color: rgba(0, 0, 0, 1);   
    line-height: 2.72;
    vertical-align: middle;
	float: right;
	margin-bottom: 10px;
	margin-left: 5px;
}
</style>
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

		<form id="frm" onsubmit="return false">
		<table class="table table-borderless">
			<tr>
				<td>프로젝트 기간</td>
				<td>

					<input type="date" id="start" name="trip-start" value="2018-07-22" min="2018-01-01">

					~
					<input type="date" id="end" name="trip-start" value="2018-07-22" min="2018-01-01">

				</td>
				<td>
					<div class="input-group mb-3">
						<input type="text" class="form-control" aria-label="Text input with dropdown button" id="searchString">
						<button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
					</div>
				</td>
			</tr>
			</tbody>
		</table>
		</form>
		<div class="menubar">
			<span><a href="${pageContext.request.contextPath}/admin/project/list?PROJECT_STATUS_CATEGORY_ID=" <c:if test="${empty PROJECT_STATUS_CATEGORY_ID}">class="active"</c:if>>전체</a></span>	
			<span><a href="${pageContext.request.contextPath}/admin/project/list?PROJECT_STATUS_CATEGORY_ID=1" <c:if test="${!empty PROJECT_STATUS_CATEGORY_ID && PROJECT_STATUS_CATEGORY_ID eq '1'}">class="active"</c:if>>미승인</a></span>		
			<span><a href="${pageContext.request.contextPath}/admin/project/list?PROJECT_STATUS_CATEGORY_ID=2" <c:if test="${!empty PROJECT_STATUS_CATEGORY_ID && PROJECT_STATUS_CATEGORY_ID eq '2'}">class="active"</c:if>>승인</a></span>		
			<span><a href="${pageContext.request.contextPath}/admin/project/list?PROJECT_STATUS_CATEGORY_ID=3" <c:if test="${!empty PROJECT_STATUS_CATEGORY_ID && PROJECT_STATUS_CATEGORY_ID eq '3'}">class="active"</c:if>>성사</a></span>		
			<span><a href="${pageContext.request.contextPath}/admin/project/list?PROJECT_STATUS_CATEGORY_ID=4" <c:if test="${!empty PROJECT_STATUS_CATEGORY_ID && PROJECT_STATUS_CATEGORY_ID eq '4'}">class="active"</c:if>>실패</a></span>		
			<span><a href="${pageContext.request.contextPath}/admin/blame/list">신고</a></span>		
			<span><a href="${pageContext.request.contextPath}/admin/project/listEnd">마감</a></span>			
		</div>
		<div class="table-responsive">
			<table class="table table-sm">
				<colgroup>
					<col width="50" />
					<col width="100" />
					<col width="*" />
					<col width="100" />
					<col width="250" />
					<col width="80" />
					<col width="100" />
					<col width="200" />
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
						<th style="text-align:center">관리</th>
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