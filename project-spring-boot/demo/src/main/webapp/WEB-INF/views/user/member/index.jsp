<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>텀블업 - 크리에이터를 위한 크라우드 펀딩</title>
	<jsp:include page="/WEB-INF/views/user/common/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"></jsp:include>
	<main>
		<div class="container my-5">
			<h2 class="mb-5">내 정보</h2>
			<security:authorize access="hasRole('ROLE_MEMBER')">
		    	<a href="/member/edit/info">설정</a>
			</security:authorize>
			<security:authorize access="hasRole('ROLE_MEMBER') && !hasRole('ROLE_MEMBER_MAIL')">
		    	<a href="/member/auth/mail/submit">이메일 인증</a>
			</security:authorize>
			<p>알림</p>
			<p>좋아요한 프로젝트</p>
			<p>오픈한 프로젝트</p>
			<a href="/reserve/find">예약한 프로젝트</a>
			<p>신고 내역</p>
			<p>문의 내역</p>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>
</body>
</html>