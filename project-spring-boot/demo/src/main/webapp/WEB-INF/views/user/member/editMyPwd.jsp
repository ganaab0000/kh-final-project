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
		<div class="container">
			<h2>메인</h2>
			<h2>person</h2>
			<div>${memberDto.id}</div>
			<div>${memberDto.email}</div>
			<div>${memberDto.nickname}</div>
			<div>${memberDto.dateCreated}</div>
		   	<a href="/member">인덱스</a>
		   	<a href="/member">수정</a>
		   	<a href="/member">탈톼</a>

		</div>
	</main>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>

</body>
</html>