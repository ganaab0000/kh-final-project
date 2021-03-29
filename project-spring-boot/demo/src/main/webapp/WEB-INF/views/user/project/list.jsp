<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Project List</h2>
	<table border="1">
        <tr>
            <td>ID</td>
            <td>TITLE</td>
            <td>Writer</td>
        </tr>
		<c:forEach var="project" items="${projects}">
	        <tr>
	        	<td>${project.id}</td>
	        	<td>${project.title}</td>
	        	<td>${project.writerName}</td>
	        </tr>
		</c:forEach>

    </table>
	<div>
		<button>
			<a href="/member/sign-up">회원가입</a>
		</button>
	</div>
</body>
</html>