<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/user/common/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cs-css/cs-common.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	function selChange() {
				var sel = document.getElementById('cntPerPage').value;
				location.href="noticePage?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/user/common/header.jsp"></jsp:include>

	<div class="outbox">
		
		<div class= "note">
	 		 <span>공지 사항</span>
		</div>

		<div class="menubar">
			<span><a class="active" href="${pageContext.request.contextPath}/cs/noticePage">공지사항</a></span>
			<span><a href="${pageContext.request.contextPath}/cs/tos">이용약관</a></span>
			<span><a href="${pageContext.request.contextPath}/cs/faqPage">FAQ</a></span>
		</div>
		<!-- 옵션선택 끝 -->
		<!-- 
		<div style="float: right;">
			<select id="cntPerPage" name="sel" onchange="selChange()">
				<option value="5"
					<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
			</select>
		</div> 
		 -->
		
		 
		<ul>
		  	<c:choose>
		  	  	<c:when test="${empty viewAll}">
                   	<li class="list-row" >
							게시물이 없습니다.
					</li>
				</c:when>
				<c:otherwise>
					<c:forEach items="${viewAll}" var="notice">
						<li class="list-row" align="left">
						    <span class="list">
						    	<input type="hidden" value="${notice.id}">
						    	<span class="pin">공지사항</span>
								<span class="title">
									<a href="${pageContext.request.contextPath}/cs/noticeDetail?id=${notice.id}">
										${notice.title}																		
									</a>																					
								</span>
								<span class="date"><fmt:formatDate  value="${notice.dateUpdated }"  type="date"  pattern="yyyy.MM.dd"/></span>																	
							</span>											
						</li>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</ul>
		
		<div style="display: block; text-align: center;" class="pagination">		
			<c:if test="${paging.startPage != 1}">
				<a href="noticePage?nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage}"  end="${paging.endPage}"  var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage}">
						<b>${p}</b>
					</c:when>
					<c:when test="${p != paging.nowPage}">
						<a href="noticePage?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="noticePage?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>
		
	</div>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>
</body>
</html>