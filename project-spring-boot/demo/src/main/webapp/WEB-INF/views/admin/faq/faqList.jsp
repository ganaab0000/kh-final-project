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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cs-css/cs-common.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
/* 	function selChange() {
				var sel = document.getElementById('cntPerPage').value;
				location.href="faqPage?nowPage=${paging.nowPage}&cntPerPage="+sel;
	} */
	
	
	/* $(document).on('click', '.searchBtn', function(e){

		e.preventDefault();

		var url = "${pageContext.request.contextPath}/cs/faqPage";

		url = url + "?searchType=" + $('#searchType').val();

		url = url + "&keyword=" + $('#faqSearch').val();

		location.href = url;

		console.log(url);

	}); */


</script>
</head>

<body>
         <div>
    		<button>
    			<a href="/member/sign-up">회원가입</a>
    		</button>
    	</div>
	
	
	<div class="outbox">
		
		<div class= "note">
	 		 <span>FAQ</span>
		</div>

		<div class="menubar">
			<span><a href="${pageContext.request.contextPath}/cs/noticePage">공지사항</a></span>
			<span><a href="${pageContext.request.contextPath}/cs/tos">이용약관</a></span>
			<span><a class="active" href="${pageContext.request.contextPath}/cs/faqPage">FAQ</a></span>
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
		 
		   <div class="row">		 		
			 	<form class="search" action="seachResult2"  name="searchForm" method="GET">		
			 		<input type="hidden" value="${search.searchType}"> 			
			 		<input class="input-search"  type="search" name="keyword" value="${search.keyword}" placeholder="결제, 정산, 공개검토 등으로 검색해보세요 !">
			 		<button class="searchBtn" type="submit">검색</button>
			 	</form>
		 	</div>
		<ul>
		  	<c:choose>
		  	  	<c:when test="${empty viewAll}">
                   	<li class="row" >
							게시물이 없습니다.
					</li>
				</c:when>
				<c:otherwise>
					<c:forEach items="${viewAll}" var="faq">
						<li class="row" align="left">
						    <span class="list">
						    	<input type="hidden" value="${faq.id}">
						    	<span class="cate">도움말</span>						    	
								<span class="title">									
									<a href="${pageContext.request.contextPath}/fRead?id=${faq.id}">
										${faq.title}									
									</a>						
								</span>																								
							</span>											
						</li>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</ul>
		
		<div style="display: block; text-align: center;" class="pagination">		
			<c:if test="${paging.startPage != 1}">
				<a href="faqList?nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage}"  end="${paging.endPage}"  var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage}">
						<b>${p}</b>
					</c:when>
					<c:when test="${p != paging.nowPage}">
						<a href="faqList?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="faqList?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>
		
	</div>
	
</body>
</html>