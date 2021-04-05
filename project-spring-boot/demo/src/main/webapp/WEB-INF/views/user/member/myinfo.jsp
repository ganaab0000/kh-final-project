<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>person</h2>
	<div>${memberDto.id}</div>
	<div>${memberDto.email}</div>
	<div>${memberDto.nickname}</div>
   	<a href="/member">인덱스</a>
   	<a href="/member">수정</a>
   	<a href="/member">탈톼</a>

</body>
</html>