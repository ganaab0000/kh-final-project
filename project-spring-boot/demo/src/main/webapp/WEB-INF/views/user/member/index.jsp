<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>인덱스</h2>
	<security:authorize access="isAuthenticated()">
		<img alt="profileImg" src="${member.profileImg}">
		<p>${member.id}</p>
		<p>${member.nickname}</p>
		<p>${member.email}</p>
	    authenticated as <security:authentication property="principal" />
	</security:authorize>
    <hr>
	<security:authorize access="!isAuthenticated()">
    	<a href="/member/signin">로그인</a>
    	<a href="/member/signup">회원가입</a>
	</security:authorize>
	<security:authorize access="isAuthenticated()">
    	<a href="/member/signout">로그아웃</a>
	</security:authorize>
	<security:authorize access="hasRole('ROLE_MEMBER')">
    	<a href="/member/info">내 정보</a>
	</security:authorize>
	<security:authorize access="hasRole('ROLE_ADMIN')">
    	<a href="/admin">관리자 페이지</a>
	</security:authorize>
	<security:authorize access="hasRole('ROLE_MEMBER') && !hasRole('ROLE_MEMBER_MAIL')">
    	<a href="/member/auth/mail/submit">이메일 인증</a>
	</security:authorize>
</body>
</html>