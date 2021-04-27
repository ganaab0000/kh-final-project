<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/user/common/head.jsp"></jsp:include>
</head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
<script>

$(document).ready(function() {
	
	$('#summernote').summernote ({
		  height: 300,                 // 에디터 높이
		  minHeight: 300,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정			 
        
	});		
	
	
	
	 $('.showList').hide();
	
	  $('#selectBox').change(function() {
	    var result = $('#selectBox option:selected').val();
	   // if (result == 'option2') {
	    if (result) {
	      $('.showList').show();
	    } else {
	      $('.showList').hide();
	    }
	  }); 
	}); 

</script>
<style>
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
.sub-nav ol {
    display: block;
    list-style-type: decimal;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 0px;
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

.header{
	margin-bottom:2rem;
}		
.header>h1{
	margin-bottom: 30px;
}
.section>h5{
	margin-top: 5rem;
	font-size: 14px;
	font-weight: bold;
    color: rgb(158, 158, 158);
}
.columns {
    display: flex;
    flex-wrap: wrap;
    margin: 0 -1.5rem;
}
ul {
    list-style: none;
    margin: 0;
    padding: 0;
}
.three.collapsible.columns .column {
    flex-basis: 33.33%;
}
.columns .column {
    flex-shrink: 0;
    flex-grow: 0;
    padding: 0 1.5rem;
}
.articles-item a {
    z-index: 5;
    text-decoration: none;
    color: #3d3d3d;
    border-top: 1px solid rgba(0,0,0,0.05);
    background-color: #ffffff;
    display: block;
    padding: 12px 0;
    height: 100%;
    font-size: 0.9rem;
}
.button-large, input[type="submit"] {
    background-color: rgba(0, 0, 0, 1);
    border: 0;
    border-radius: 4px;
    color: #ffffff;
    font-size: 18px;
    font-weight: bold;
    line-height: 2.72;
    min-width: 190px;
    padding: 0 1.9286em;
    width: 100%;
}
.form-group label,
.form-check label{
    display: block;
    font-size: 0.9rem;
    margin-bottom: 10px;
    color: #333;
    font-weight: bold;
}
.form-group small,
.form-check small{
    color: #666;
    font-size: 12px;
    margin: 5px 0;
}

</style>
<body>
	
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"></jsp:include>
	
	<div class="row">		
		<div class="container">
				
			<nav class="sub-nav">
				<ol class="sub-menu">
					<li title="FAQ">
						<a href="${pageContext.request.contextPath}/cs/faqPage">FAQ</a>	
					</li>
					<li title="메일 문의">
						메일 문의
					</li>
				</ol>
			
			</nav>
				
			
			<div class="header">
				
				<h1>	텀블업에 문의하기</h1>
				<p>	
					이메일 주소와 함께 문의를 남겨주세요. 영업일 기준 2일 내에 답변 드리겠습니다.
				</p>
				<p>	
					특정 프로젝트에 관한 질문은 해당 프로젝트 페이지 창작자에게 문의하기를 이용해 주세요.
				</p>
			</div>
			
		<form action="/cs/QWrite"  method="post" enctype="multipart/form-data">			
			<div class="form-group">
			    <label for="exampleInputEmail1">문의 유형</label>
			    <select class="form-control" id="selectBox" name="header">
			        <option value="" selected="selected">도움이 필요한 주제를 골라주세요</option>
						  <option value="후원자">[후원자]밀어주기(후원), 결제</option>
						  <option value="후원자">[후원자]후원내역관리, 선물수령</option>
						  <option value="창작자">[창작자]프로젝트올리기, 공개검토</option>
						  <option value="창작자">[창작자]정산, 후원자관리, 선물실행</option>
						  <option value="일반">[일반]가입, 로그인, 계정관리</option>
						  <option value="일반">[일반]사용상의 불편, 버그, 기타문의 </option>
						  <option value="일반">[일반]탈퇴요청(계정삭제)</option>
			    </select>
		  	</div>

		<div class="showList">
		
			  <div class="form-group">
			    <label for="exampleInputEmail1">텀블업에 가입된 이메일 주소</label>
			    <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp"  required="required">
			    <small id="emailHelp" class="form-text text-muted">이 이메일 주소로 답변을 보내드립니다. 이 이메일을 확인하시기 어려우신 경우 문의 내용에 연락처를 남겨주세요. 비회원이시면 사용하시는 이메일을 적어주세요.</small>
			  </div>
			   <div class="form-group">
			    <label for="exampleInputEmail1">문의 제목</label>
			    <input type="text" class="form-control" name="title" id="exampleInputEmail1" aria-describedby="emailHelp"  required="required">   
			  </div>
			
			
			  <div class="form-group">
			    <label for="exampleTextarea">문의 내용</label>
			    <textarea class="form-control" id="summernote"  name="content" rows="3" required="required"></textarea>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputEmail1">프로젝트 제목 또는 고유주소</label>
			    <input type="text" class="form-control" name="path"  id="exampleInputEmail1" aria-describedby="emailHelp" >
			    <small id="emailHelp" class="form-text text-muted">고유주소란 프로젝트 페이지 주소 중 뒷부분을 말합니다. (예: /project의 경우 'project')</small>
			  </div>
			   <div class="form-check">
			    <label class="form-check-label">
			      <input type="checkbox" class="form-check-input" value="Y" name="isConsent" required="required">
			      개인정보 수집·이용에 동의합니다.
			    </label>
			     <small id="fileHelp" class="form-text text-muted">목적: 이용자 식별 및 문의 답변 / 제공 항목: 이메일 주소, 문의 내용 / 보유기간: 문의 해결 후 30일까지</small>
			  </div>
			<!--   <div class="form-group">
			    <label for="exampleInputFile">첨부 파일</label>
			    <input type="file" class="form-control-file" name="file" id="exampleInputFile" aria-describedby="fileHelp" accept="image/png, image/jpeg">   
			  </div> -->
			 
			  <button type="submit" class="btn btn-primary button-large">제출</button>
			</form>
		</div>		
		
		<section class="section">
				<h5 class="section-title">자주 묻는 질문들</h5>
				<ul class="articles three collapsible columns">
					 <c:choose>
					 		<c:when test="${empty viewAll}">
	                   			<li class="list-row" >
										게시물이 없습니다.
								</li>
							</c:when>
							<c:otherwise>
								<c:forEach items="${viewAll}" var="FaqDto">
										<li class="articles-item column">											
											<div class="search-result-description">
												<input type="hidden" value="${FaqDto.id }">
											</div>
											<div>
											<a href="${pageContext.request.contextPath}/cs/faqDetail?id=${FaqDto.id}">
													${FaqDto.title}		
											</a>												
											</div>
										</li>		
								</c:forEach>
						</c:otherwise>
					 </c:choose>			
				</ul>
			</section>

	</div>
</div>
<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>
</body>
</html>