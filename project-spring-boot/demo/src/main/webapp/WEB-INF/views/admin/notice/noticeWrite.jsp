<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="/css/summernote/summernote-lite.css">

<title>Insert title here</title>
</head>
<script src="/js/summernote/SnoteContent.js"></script>
<style>
.creadted_settingTitle{
	border-bottom: 1px solid rgb(230, 230, 230);
}

.container-header{
	width: 100%;
	padding: 32px 16px 24px;
	word-break: break-all;
	box-sizing: inherit;
	display: block;
	width: 1080px;
    margin: 0px auto;    
	
}
.container-header h1{
	margin: 0;
    padding: 0;
    font-size: 30px;
    line-height: 45px;
    letter-spacing: -0.03em;
    font-weight: 300;
}
.container-container{
	padding: 32px 24px 120px;
	width: 1080px;
    margin: 0px auto;
}
h3, p, div {
    word-break: break-all;
}
div {
    display: block;
}
body {
    margin: 0px;
    padding: 0px;
    overflow-x: hidden;
    min-width: 320px;    
    font-family: 'SpoqaHanSans', 'Helvetica Neue', Arial, Helvetica, sans-serif;
    font-size: 14px;
    line-height: 1.7em;
    color: rgba(0, 0, 0, 0.87);
    font-smoothing: antialiased;
}
#summernote-title{
	width: 1080px;
	border: 1px solid #ddd;
    border-radius: 4px;
    padding: 10px;
    font-weight: 400;
    max-width: 100%;
    box-sizing: border-box;
    outline: none;
    transition: border .12s ease-in-out;
    color: #000;
    font-size: 14px;
    margin-bottom: 10px;
}
#writeBtn{
	width: 76px;
    height: 30px;
    border-radius: 4px;
    border: 1px solid #00c3bd;
    font-size: 12px;
    color: #00c3bd;
    background-color: #fff;    
    line-height: 1.5;
    vertical-align: middle;
	float: right;
	margin-bottom: 10px;
}
</style>
<body>
	<div class="creadted_settingTitle">
		<div class="container-header">
			<h1>공지 등록</h1>
		</div>
		<a href="${pageContext.request.contextPath}/cs/noticePage">공지사항</a>	
	</div>
	
	<div class="container-container">
		<form method="post" action="notice/noticeWrite">
			<button id="writeBtn">저장</button>
			<input id="summernote-title" type="text" placeholder="제목을 입력하세요" >			
			<textarea id="summernote" class="summernote" name="editordata"></textarea>			
		</form>	
	</div>
	
</body>
</html>