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
	<h2>비밀번호 찾기</h2>
	<div>
	    <form action="/member/find/password/confirm" method="post">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        	<input type="hidden" name="id" value="${id}" />
        	<input type="hidden" name="key" value="${key}" />
	        <input type="password" name="password" placeholder="비밀번호">
	        <input type="password" name="repassword" placeholder="비밀번호 확인">
	        <button type="submit">확인</button>
	    </form>
	</div>
</body>
</html>