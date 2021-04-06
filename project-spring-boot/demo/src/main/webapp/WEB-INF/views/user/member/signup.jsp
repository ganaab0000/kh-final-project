<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입</h2>

	<div>

	    <form action="/member/signup" method="post">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

        	<div>
		        <input type="text" name="email" placeholder="이메일 입력해주세요" value="${memberDto.email}">
	            <span>비동기 자동 중복 확인</span>
	            <span>${valid_email}</span>
        	</div>
        	<div>
		        <input type="text" name="nickname" placeholder="닉네임 입력해주세요" value="${memberDto.nickname}">
	            <span>비동기 자동 중복 확인</span>
	            <span>${valid_nickname}</span>
        	</div>
        	<div>
		        <input type="password" name="pwd" placeholder="비밀번호">
	            <span>${valid_pwd}</span>
        	</div>

	        <button type="submit">회원가입</button>
	    </form>
	</div>
</body>
</html>