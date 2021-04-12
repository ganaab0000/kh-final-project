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
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<style>
body {
    background-color: #FFFFFF;
    color: #3d3d3d;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.5;
    -webkit-font-smoothing: antialiased;
    word-break: keep-all;
}
section{
	display: block;
}
.container {
    max-width: 1160px;
    margin: 0 auto;
    padding: 0 5%;
    
}

.sub-menu li + li::before {
    content: ">";
    margin: 0 4px;
    color: #cccccc;
}
.sub-menu li {
    color: #666;
    display: inline;
    font-weight: 400;
    font-size: 13px;
    max-width: 450px;
    overflow: hidden;
    text-overflow: ellipsis;
}
ol {
    display: block;
    list-style-type: decimal;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.sub-nav {
    display: flex;
   	align-items: baseline;
    flex-direction: row;
    justify-content: space-between;
    margin-bottom: 20px;
    min-height: 50px;
    padding-bottom: 10px;
}
.sub-menu > li >a {
    color: rgb(39, 163, 255);
    text-decoration: none;
    background-color: transparent;
}
* {
    box-sizing: border-box;
}
.page-header h1 {
    flex-grow: 1;
    margin-bottom: 10px;
    font-weight: 400;
    display: block;
    font-size: 2em;
    margin-block-start: 0.67em;
    margin-block-end: 0.67em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

.page-header {
    align-items: baseline;
    flex-direction: row;
    margin: 0;
}

.search-results {
    flex-direction: row;   
    display: flex;    
    flex-wrap: wrap;
    justify-content: space-between;
}

.search-results-column {
    flex: 0 0 45%;
}
h3 {
    font-size: 18px;
    font-weight: 600;
}
.search-results-list {
    margin-bottom: 25px;
    list-style: none;
    margin: 0;
    padding: 0;
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.search-results-list > li:first-child {
    border-top: 1px solid #ddd;
}
.search-results-list > li {
    border-bottom: 1px solid #ddd;
    padding: 20px 0;
    display: list-item;
    text-align: -webkit-match-parent;
    list-style: none;
}
.search-result-description {
    margin-top: 15px;
}
ul {
    list-style: none;
    margin: 0;
    padding: 0;
}
.search input[type="search"] {
    border: 1px solid rgb(230, 230, 230);
    border-radius: 4px;
    box-sizing: border-box;
    color: #999;
    height: 40px;
    padding-left: 40px;
    padding-right: 20px;
    -webkit-appearance: none;
    width: 50%;
}
.sub-nav input[type="search"] {
    min-width: 200px;
}
input {
    line-height: normal;
}
.searchBtn{
 	border: 1px solid rgb(230, 230, 230);
    border-radius: 4px;
    box-sizing: border-box;
    color: #999;
    height: 40px;   
    -webkit-appearance: none;
	 width: 20%;
}
a{
		text-decoration: none
	}
a:link{
		 color: rgb(61, 61, 61);
		cursor: pointer;
	}
a:visited {
	text-decoration: none; 
	 color: rgb(61, 61, 61);
	}

</style>
</head>

<body>       
	
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"></jsp:include>
	
	<div class="container">
		
		<nav class="sub-nav">
			<ol class="sub-menu">
				<li title="FAQ">
					<a href="${pageContext.request.contextPath}/cs/faqPage">FAQ</a>	
				</li>
				<li title="검색결과">
					검색결과
				</li>
			</ol>
			<form class="search" action="seachResult2"  name="searchForm"  method="GET">
				<input type="hidden" value="${search.searchType}"> 
				<input type="search"  name="keyword"  value="${search.keyword}" placeholder="검색">
				<button class="searchBtn" type="submit">검색</button>
			</form>		
		</nav>
		
		<header class= "page-header">
	 		 <h1>검색 결과</h1>
	 		 <p></p>
		</header>
		<div class="search-results">
			<section class="search-results-column">
				<h3 class="search-results-subheading">주제별 도움말</h3>
				<ul class="search-results-list">
					 <c:choose>
					 		<c:when test="${empty viewAll}">
	                   			<li class="list-row" >
										'${search.keyword}' 에 대한 검색 결과가 없습니다
								</li>
							</c:when>
							<c:otherwise>
								<c:forEach items="${viewAll}" var="faq">
										<li class="search-result">											
											<div class="search-result-description">
												<input type="hidden" value="${faq.id }">
											</div>
											<div>
											<a href="${pageContext.request.contextPath}/cs/faqDetail?id=${faq.id}">
													${faq.title}		
											</a>												
											</div>
										</li>		
								</c:forEach>
						</c:otherwise>
					 </c:choose>			
				</ul>
			</section>
			<section class="search-results-column">
				<h3 class="search-results-subheading">창작자 가이드</h3>
					<ul class="search-results-list">
						<li class="search-result">							
							<div class="search-result-description">
								'${search.keyword}' 에 대한 검색 결과가 없습니다  
							</div>
						</li>					
						
					</ul>
			</section>
		</div>
		
		
	
	</div>
	
</body>
</html>