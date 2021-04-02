<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <td>${member.email}</td>
        </tr>
    </table>
        <div>
        	모인 금액 : ${project.collected == null ? 0 : project.collected}원
        </div>
        <div>
        	달성률 : ${project.rate == null ? 0 : project.rate}%
        </div>
        <div>
        	<c:if test="${project.remainDay > 0}">
	        	남은 시간 : ${project.remainDay}일
        	</c:if>
        	<c:if test="${project.remainDay == 0}">
	        	남은 시간 : ${project.remainHour}시간
        	</c:if>
        </div>
        <div>
        	후원자 수 : ${project.sponsor}명
        </div>
	<div>
		<button>
			<a href="/member/sign-up">회원가입</a>
		</button>
		<button>
			<a href="list">리스트</a>
		</button>
	</div>
</body>
</html>