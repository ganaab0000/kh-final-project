<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/user/common/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"></jsp:include>
  	<form action="/reserve/reserve" method="post">
		  	<input type="text" name="billingkey" placeholder="billingkey">
		  	<input type="text" name="additionalBillings" placeholder="additionalBillings">
		  	<input type="text" name="receiverName" placeholder="receiverName">
		  	<input type="text" name="receiverPhone" placeholder="receiverPhone">
		  	<input type="text" name="receiverAddress" placeholder="receiverAddress">
		  	<input type="text" name="requestForDelivery" placeholder="requestForDelivery">
		  	<input type="hidden" name="memberId" value="5">
		  	<input type="hidden" name="projectId" value="1">
		  	<input type="submit" value="예약 신청">
	</form>
	<c:if test="${reserve.reserveStatusCategoryId == 1}">
		<form action="reserve/cancel" method="post">
		  	<input type="hidden" name="memberId" value="${member.id}">
			<input type="hidden" name="projectId" value="${project.id}">
			<input type="submit" value="예약 취소">
		</form>
	</c:if>
	  <form action="reserve/find" method="post">
		<input type="hidden" name="memberId" value="${member.id}">
	  	<input type="submit" value="예약 확인">
	  </form>
	  <jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>
</body>
</html>