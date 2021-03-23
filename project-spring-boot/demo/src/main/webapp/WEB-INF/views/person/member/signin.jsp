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

	<div>
	    <form action="/member/signin" method="post">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	        <input type="text" name="email" placeholder="이메일 입력해주세요">
	        <input type="password" name="pwd" placeholder="비밀번호">
	        <button type="submit">로그인</button>
	    </form>
	</div>

</body>
</html>