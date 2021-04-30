<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>텀블업 - 크리에이터를 위한 크라우드 펀딩</title>
	<jsp:include page="/WEB-INF/views/user/common/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"></jsp:include>
	<div class="Container">
		<h1>후원 현황</h1>
		<table>
			<thead>
				<tr>
					<th>프로젝트 번호</th>
					<th>수령인 이름</th>
					<th>수령인 연락처</th>
					<th>배송지</th>
					<th>배송시 요청사항(선택)</th>
					<th>추가 후원금</th>
					<th>결제 상태</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${reserve}" var="reserve">
				<tr>
					<td>${reserve.project_id}</td>
					<td>${reserve.receiver_name}</td>
					<td>${reserve.receiver_phone}</td>
					<td>${reserve.receiver_address}</td>
					<td>${reserve.request_for_delivery}</td>
					<td>${reserve.additional_billings}</td>
					<td>${reserve.reserve_status_category_id}</td>
					<td><form method="post" action="/reserve/cancel"><input type="hidden" value="${reserve.id}"><input type="hidden" value="<%= request.getAttribute("memberId") %>"><input type="submit" value="취소"></form></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>
</body>
</html>