<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/user/common/head.jsp"></jsp:include>
<script type="text/javascript">

$(function() {

	var url_string = window.location.href;
	var url = new URL(url_string);

	/* var searchKeywordType = url.searchParams.get("searchKeywordType");
	var searchKeyword = url.searchParams.get("searchKeyword"); */
	var pageSize = url.searchParams.get("pageSize");
	var pageNumber = url.searchParams.get("pageNumber");
	var searchTypeList = ['content', 'id'];
	searchTypeList.forEach(function(key){
		var value = url.searchParams.get(key);
		if(!!value){
			$('.form-select-search-keyword-type').val(key);
			$('.form-input-search-keyword').val(value);
		}
	});

	if(!pageSize){
		pageSize = 10;
	}else{
		$('.form-select-page-size').val(pageSize);
	}
	if(!pageNumber){
		pageNumber = 1;
	}
	/* if(!!searchKeywordType){
		$('.form-select-search-keyword-type').val(searchKeywordType);
	}
	if(!!searchKeyword){
		$('.form-input-search-keyword').val(searchKeyword);
	} */

	$('.form-select-page-size').change(function(){
		url.searchParams.set('pageSize', $(this).val());
		location.href=url;
	});

	$('#button-search').click(function(){
		var searchKeywordType = $('.form-select-search-keyword-type').val();
		var searchKeyword = $('.form-input-search-keyword').val();
		url.searchParams.set("pageNumber", 1);
		searchTypeList.forEach(function(el){
			url.searchParams.delete(el);
		});
		if(searchKeyword == ''){
			/* url.searchParams.delete('searchKeywordType');
			url.searchParams.delete('searchKeyword'); */
			location.href=url;
			return;
		}
		/* url.searchParams.set('searchKeywordType', searchKeywordType);
		url.searchParams.set('searchKeyword', searchKeyword); */
		url.searchParams.set(searchKeywordType, searchKeyword);
		location.href=url;
	});

	$('.page-link-number').click(function(){
		event.preventDefault();
		if($(this).hasClass("disabled")){
            new SnackBar({
                message: "더 이상 이동할 수 없습니다."
            });
            return;
		}
		url.searchParams.set('pageNumber', $(this).attr("data"));
		location.href=url;
	});


});


</script>
<style type="text/css">
.disabled {
	cursor: default;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/user/common/header.jsp"></jsp:include>
	<main class="mb-3">
		<div class="container">


			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h2">알림</h1>
				<div class="col-2">

					<select class="form-select form-select-page-size"
						aria-label="Default select example">
						<option selected value="10">10개씩 보기</option>
						<option value="20">20개씩 보기</option>
						<option value="50">50개씩 보기</option>
						<option value="100">100개씩 보기</option>
						<option value="100">200개씩 보기</option>
					</select>
				</div>
			</div>

			<div class="input-group mb-3">
				<select class="form-select form-select-search-keyword-type"
					id="inputGroupSelect04"
					aria-label="Example select with button addon">
					<option value="content" selected>내용</option>
					<option value="id">번호</option>
				</select> <input type="text" class="form-control form-input-search-keyword"
					aria-label="Text input with dropdown button">
				<button class="btn btn-outline-secondary" type="button"
					id="button-search">검색</button>
			</div>

			<div class="table-responsive">
				<table class="table table-sm text-center">
					<thead>
						<tr>
							<th>#</th>
							<th width="70%">내용</th>
							<th>일자</th>
							<th>선택</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="notificationDto" items="${notificationList}">
							<tr data-id="${notificationDto.id}">
								<td><c:out value="${notificationDto.id}" /></td>
								<td><c:out value="${notificationDto.content}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
										value="${notificationDto.dateCreated}" /></td>
								<td><input class="form-check-input button-member-block"
									type="checkbox" id="input-block-${notificationDto.id}">
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a
						class="page-link text-dark page-link-number
						<c:if test="${startBlock == 1}">disabled</c:if>"
						href="#" data="${startBlock-1}" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>


					<c:forEach begin="${startBlock}" end="${endBlock}" varStatus="loop">
						<li class="page-item"><a
							class="page-link text-dark page-link-number" href="#"
							data="${loop.current}">${loop.current}</a></li>
					</c:forEach>

					<li class="page-item"><a
						class="page-link text-dark page-link-number
							<c:if test="${endBlock == fixedEndBlock}">disabled</c:if>"
						href="#" data="${endBlock+1}" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>

				</ul>
			</nav>


		</div>
	</main>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>




	</side>
	<div class="visually-hidden el-prototype-archive"></div>
</body>
</html>