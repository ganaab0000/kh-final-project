<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>텀블업 - 크리에이터를 위한 크라우드 펀딩</title>
<jsp:include page="/WEB-INF/views/admin/common/head.jsp"></jsp:include>
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
.article-container{
	padding: 24px 24px 64px;
	width: 1080px;
    margin: 0px auto;
}
.article-main {
    background-color: #ffffff;
    padding: 25px 30px;
    border: 1px solid rgba(0, 0, 0, .05);
}
.content{
    padding: 48px 44px 0px;
    font-size: 16px;
    line-height: 27px;
    letter-spacing: -0.02em;
    word-wrap: break-word;
}
.article-main > header{
	padding: 0px 0px 16px;
	border-bottom: 1px solid rgb(230, 230, 230);
}
.date{
	font-size: 13px;
    line-height: 20px;
    letter-spacing: -0.015em;
}
.cate{
	float: right;
}
.cate>a{
		text-decoration: none
	}	
	
.cate > a:link{
	color: rgb(39, 163, 255);
	cursor: pointer;
}
.cate > a:visited {
	text-decoration: none; 
	 color: rgb(39, 163, 255);
	}
.isState{
	padding: 25px 10px;
	float: right;
}
.footer>p{
	font-size: 12px;
	color: rgb(158, 158, 158);
}
.footer>pathPin,
.footer>filePin{
	font-size: 12px;
}
.isState>button{
	border: 1px solid rgb(230, 230, 230);
    border-radius: 4px;
    box-sizing: border-box;
    color: #999;
    height: 40px;   
    -webkit-appearance: none;
	width: 80px;
}

</style>
</head>
<script>
	$(function(){
		$("#deleteBtn").on("click", function(){
 			if(confirm("삭제하시겠습니까?")){
 				self.location.href="/admin/NDelete";
 			}
 			else{
 				return false;
 			}
 		});
	});
</script>
<body>     

	<jsp:include page="/WEB-INF/views/admin/common/header.jsp"></jsp:include>
	
	<div class="container">
		
		<nav class="sub-nav">
			<ol class="sub-menu">
				<li title="NOTICE">
					<a href="${pageContext.request.contextPath}/admin/noticeList">공지사항</a>	
				</li>
				<li title="상세페이지">
					상세페이지
				</li>
			</ol>
			<form class="search" action="/admin/nAdminSeach"  name="searchForm"  method="GET">
				<input type="hidden" value="${search.searchType}"> 
				<input type="search"  name="keyword"  value="${search.keyword}" placeholder="검색">
				<button class="searchBtn" type="submit">검색</button>
			</form>		
		</nav>
		
		<jsp:include page="/WEB-INF/views/admin/common/sideNav.jsp"></jsp:include>
		
			<div class="article-container">
					<form action="nRead" method="get" >
							<input type="hidden" value="${notice.id }">
							<div class="article-main">
								<header>									
									<h3>${notice.title}</h3>
									<span class="date"><fmt:formatDate  value="${notice.dateUpdated }"  type="date"  pattern="yyyy.MM.dd"/></span>
									<span class="cate" ><a href="${pageContext.request.contextPath}/admin/nModify?id=${notice.id}">수정</a></span>	
								</header>							
								<div class="content">
								<!--escapeXml = "false"  html 태그를 해석해서 보여줌  -->
									<c:out value="${notice.content}"  escapeXml = "false"/>
								</div>		
							</div>
					</form>
			</div>		
			
				 <form action="/admin/NDelete" method="post"> 
						<div class="isState ">
							<input type="hidden" name="id"  value="${notice.id }">
							<input type="hidden" name="isDeleted" value="Y">
							<button type="submit" id="deleteBtn" class="isStateBtn">삭제</button>
						</div>
					</form>				
					
		</div>
</body>
</html>