<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<jsp:include page="/WEB-INF/views/user/common/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"></jsp:include>
	<main>
		<h2>메인</h2>
		<h2>가입 성공</h2>
		<div>메일이 발송되었습니다. 메일을 확인하여 인증을 완료하여 주시기 바랍니다.</div>
	   	<a href="/member">인덱스</a>
	   	<div>Resend Mail</div>
	   	<div>Change Mail</div>
	</main>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>
</body>
</html>