<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인</h2>
	<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
	    <font color="red">
	        <p>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
	        <p>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"]}</p>
	        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
	    </font>
	</c:if>


	<div>
	    <form action="/member/signin" method="post">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	        <input type="text" name="email" placeholder="이메일 입력해주세요">
	        <input type="password" name="pwd" placeholder="비밀번호">

	        <button type="submit">로그인</button>
	        <label>자동 로그인</label>
	        <input type="checkbox" name="remember-me">
	    </form>
	    <hr>
        <a href="/oauth2/authorization/google" class="btn btn-success active" role="button">Google Login</a>
		<a href="/oauth2/authorization/naver" class="btn btn-secondary active" role="button">Naver Login</a>
		<a href="/oauth2/authorization/renaver" class="btn btn-secondary active" role="button">Naver Login</a>
	</div>
   	<a href="#">비밀번호 찾기</a>

</body>
</html>