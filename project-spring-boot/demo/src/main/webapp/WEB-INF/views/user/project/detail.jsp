<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Project Detail</h2>
	<table border="1">
        <tr>
            <td>ID</td>
            <td width="160">${project.id}</td>
        </tr>
        <tr>
            <td>TITLE</td>
            <td>${project.title}</td>
        </tr>
        <tr>
            <td>STORY</td>
            <td>${project.story}</td>
        </tr>
        <tr>
            <td>Writer</td>
            <td>${project.writerName}</td>
        </tr>
    </table>
	<div>
		<button>
			<a href="/member/sign-up">회원가입</a>
		</button>
	</div>
</body>
</html>