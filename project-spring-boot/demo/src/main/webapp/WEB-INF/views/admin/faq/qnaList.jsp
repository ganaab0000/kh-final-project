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
<jsp:include page="/WEB-INF/views/admin/common/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cs-css/cs-common.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	function selChange() {
				var sel = document.getElementById('cntPerPage').value;
				location.href="noticePage?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
</head>
<style>
.isState{
	float: right;
}
.list-row{	
	border:none;
	border-bottom: 1px solid rgb(230, 230, 230) ;
}
	
</style>
<body>
   <jsp:include page="/WEB-INF/views/admin/common/header.jsp"></jsp:include>

	<div class="outbox">
		
		<div class= "note">
	 		 <span>Q&A</span>
		</div>

		<%-- <div class="menubar">
			<span><a href="${pageContext.request.contextPath}/cs/noticePage">공지사항</a></span>
			<span><a href="${pageContext.request.contextPath}/cs/tos">이용약관</a></span>
			<span><a href="${pageContext.request.contextPath}/cs/faqPage">FAQ</a></span>
		</div> --%>

	 	<jsp:include page="/WEB-INF/views/admin/common/sideNav.jsp"></jsp:include>
				 	
				 	
		<ul>
		  	<c:choose>
		  	  	<c:when test="${empty viewAll}">
                   	<li class="list-row" >
							게시물이 없습니다.
					</li>
				</c:when>
				<c:otherwise>
					<c:forEach items="${viewAll}" var="qna">
						<li class="list-row" align="left">
						    <span class="list">
						    	<input type="hidden" value="${qna.id}">
						    	<span class="pin">${qna.header}</span>    			    	
						       	<c:choose>
						    		<c:when  test="${qna.isState eq 'N' }">
						    			<span class="pin isState">처리중</span>
						    		</c:when>
						    		<c:otherwise >
						    			<span class="sPin isState">완료</span>
						    		</c:otherwise>
						    	</c:choose>
								<span class="title">
									<a href="${pageContext.request.contextPath}/admin/qRead?id=${qna.id}">
										${qna.title}																		
									</a>																					
								</span>
								<span class="date"><fmt:formatDate  value="${qna.dateCreated }"  type="date"  pattern="yyyy.MM.dd"/></span>																	
							</span>											
						</li>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</ul>
		
		<div style="display: block; text-align: center;" class="pagination">		
			<c:if test="${paging.startPage != 1}">
				<a href="qnaList?nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage}"  end="${paging.endPage}"  var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage}">
						<b>${p}</b>
					</c:when>
					<c:when test="${p != paging.nowPage}">
						<a href="qnaList?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="qnaList?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>
		
	</div>

</body>
</html>