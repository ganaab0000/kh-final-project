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
			<h2>설정</h2>
			<div>${memberDto.id}</div>
			<div>${memberDto.email}</div>
			<div>${memberDto.nickname}</div>
			<div>${memberDto.dateCreated}</div>
			<div>프로필 이미지</div>
			<div>프로필 글</div>
			<div>주소</div>
			<div>연락처</div>
		   	<a href="/member">수정</a>
		   	<a href="/member">패스워드 변경</a>
		   	<a href="/member">탈톼</a>

		</div>
	</main>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>

</body>
</html>