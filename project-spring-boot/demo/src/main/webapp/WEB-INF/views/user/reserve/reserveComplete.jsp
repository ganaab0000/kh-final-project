<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>텀블업 - 크리에이터를 위한 크라우드 펀딩</title>
	<jsp:include page="/WEB-INF/views/user/common/head.jsp"></jsp:include>
<style>
	#divH1{
		margin-top:15px;
		margin-bottom:5px;
	}
	#table{
		margin:2px;
	}
	table > thead > tr > th{
		min-width: 100px;
	}
	#main{
		padding-left:22%;
		padding-right:22%;
		min-height:800px;
	}
	#reserveAddr{
		min-width:250px;
	}
	#tbNo{
		text-align:center;
	}
	#detailBtn {
		border:none;
	    width: 100px;
	    height: 30px;
	    background-color:#F39C12;
	    font-color:black;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"></jsp:include>
	<div id="main">
		<br>
			<h1 id="divH1">후원 현황</h1>
			<br>
			<br>
			<br>
			<table>
				<thead>
					<tr>
						<td colspan="9"><hr></td>
					</tr>
					<tr>
						<th id="tbNo">No</th>
						<th id="reserveAddr">프로젝트 이름</th>
						<th id="reserveAddr">리워드 이름</th>
						<th id="tbNo">리워드 금액</th>
						<th id="tbNo">추가 후원금</th>
						<th id="tbNo">예약 신청일</th>
						<th id="tbNo">결제 상태</th>
						<th></th>
					</tr>
					<tr>
						<td colspan="9"><hr></td>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${reserve}" var="reserve">
					<tr>
						<td id="tbNo">${reserve.projectId}</td>
						<td>${reserve.projectName}</td>
						<td>${reserve.rewardName}</td>
						<td id="tbNo">${reserve.rewardPrice}<span>원</span></td>
						<td id="tbNo">${reserve.additionalBillings}<span>원</span></td>
						<td id="tbNo">${reserve.dateCreated}</td>
						<td id="tbNo">
						<%if("${reserve.reserveStatusCategoryId}".equals("6")){%>
							<span>환불 요청</span>
						<%}else if("${reserve.reserveStatusCategoryId}".equals("2")){%>
							<span>결제 완료</span>
						<%}else if("${reserve.reserveStatusCategoryId}".equals("3")){%>
							<span>결제 취소</span>
						<%}else if("${reserve.reserveStatusCategoryId}".equals("4")){%>
							<span>결제 실패</span>
						<%}else if("${reserve.reserveStatusCategoryId}".equals("5")){%>
							<span>교환 요청</span>
						<%}else{%>
							<span>결제 대기</span>
						<%}%>
						</td>
						<td>
							<form method="get" action="/reserve/detail/{id}">
								<input type="hidden" name="reserveId" value="${reserve.id}">
								<input type="submit" id="detailBtn" value="상세 보기">
							</form>
						</td>
					</tr>
					<tr>
						<td colspan="9"><hr></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>
	</body>
</html>