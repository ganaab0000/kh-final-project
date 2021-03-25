<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>
사용자 정보 제공에 동의해주세요.
</p>
<a href="/member">인덱스</a>
<a href="${url}">Naver Login1</a>
<a href="/oauth2/authorization/naver?auth_type=reprompt" class="btn btn-secondary active" role="button">Naver Login</a>


</body>
</html>