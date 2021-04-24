<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>텀블업 - 크리에이터를 위한 크라우드 펀딩</title>
<jsp:include page="/WEB-INF/views/admin/common/head.jsp"></jsp:include>
<script type="text/javascript">

$(function() {

	var url_string = window.location.href;
	var url = new URL(url_string);

	var searchKeywordType = url.searchParams.get("searchKeywordType");
	var searchKeyword = url.searchParams.get("searchKeyword");
	var pageSize = url.searchParams.get("pageSize");
	var pageNumber = url.searchParams.get("pageNumber");
	var searchTypeList = ['email', 'nickname', 'phone', 'id'];
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

	$('.button-member-detail').click(function(){
		var memberId = $(this).parents('tr').attr('data-id');
		var form = $('#form-member-detail');
		var tbodyDetailForm = $('#form-member-detail .tbody-detail-form');
		tbodyDetailForm.text('');
		var params = {
			memberId: memberId
		}
        $.ajax({
            type : "GET",
            url : "/api/admin/member",
            data : params,
            success : function(res){
				for (const [key, value] of Object.entries(res)) {
				  var newTr = $("<tr>");
				  var newTdKey = $("<td>");
				  var newTdVal = $("<td>");
				  newTdKey.text(key);
				  newTdVal.text(value);
				  newTdKey.appendTo(newTr);
				  newTdVal.appendTo(newTr);
				  newTr.appendTo(tbodyDetailForm);
				}
            },
            error : function(err){
                new SnackBar({
                    message: "통신에 실패하였습니다."
                });
            }
        });
	});
	$('.button-member-message').click(function(){
		var memberId = $(this).parents('tr').attr('data-id');
		var form = $('#form-send-message');
		var formTextArea = $('#form-send-message textarea');
		var submitBtn = $('#form-send-message .submit-btn');
		formTextArea.val('');
		submitBtn.off();
		submitBtn.bind("click", clickFunc );
		function clickFunc(){
			var params = {
					memberId: memberId,
					content: formTextArea.val()
				}
		        $.ajax({
		            type : "POST",
		            url : "/api/admin/member/notification",
		            data : params,
		            success : function(res){
		                if(!res.isSuccess){
		                    new SnackBar({
		                        message: "통신에 실패하였습니다."
		                    });
		                    return;
		                }
		                new SnackBar({
		                    message: "전송 되었습니다."
		                });
		            },
		            error : function(XMLHttpRequest, textStatus, errorThrown){
		                new SnackBar({
		                    message: "통신에 실패하였습니다."
		                });
		            }
		        });
		};

	});
	$('.button-member-role').click(function(){
		var memberId = $(this).parents('tr').attr('data-id');
		var form = $('#form-edit-role form');
		var params = {
			memberId: memberId
		};
		form.text('');
        $.ajax({
            type : "GET",
            url : "/api/admin/member/role",
            data : params,
            success : function(res){
				res.map(function(el){
					var formCheck = $('.el-prototype-archive .form-check').clone();
					var input = formCheck.children('input');
					var label = formCheck.children('label');
					var idPrefix = 'form-edit-role-';
					var id = el.id;
					formCheck.appendTo(form);
					label.text(el.name.toUpperCase());
					label.attr('for', idPrefix + el.id);
					if(el.isChecked == 'Y'){
						input.prop('checked', true);
					}
					input.attr('id', idPrefix + el.id);
					input.click(function(){
						event.preventDefault();
						var methodType = input.prop('checked')? "POST":"DELETE";
						var checkAjaxParams = {
								memberId: memberId,
								roleCategoryId: id
						}
				        $.ajax({
				            type : methodType,
				            url : "/api/admin/member/role",
				            data : checkAjaxParams,
				            success : function(checkRes){
				                if(!checkRes.isSuccess){
				                    new SnackBar({
				                        message: "통신에 실패하였습니다."
				                    });
				                    return;
				                }
				                input.prop('checked', !input.prop('checked'));
				                new SnackBar({
				                    message: "변경 되었습니다."
				                });
				            },
				            error : function(XMLHttpRequest, textStatus, errorThrown){
				                new SnackBar({
				                    message: "통신에 실패하였습니다."
				                });
				            }
				        });
					});
				});
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){
                new SnackBar({
                    message: "통신에 실패하였습니다."
                });
            }
        });
	});
	$('.button-member-block').click(function(){
		event.preventDefault();
		var checkbox = $(this);
		var memberId = $(this).parents('tr').attr('data-id');
		var isChecked = $(this).is(':checked');
		var params = {
			memberId: memberId
		}
        $.ajax({
            type : "PUT",
            url : "/api/admin/member/block",
            data : params,
            success : function(res){
                if(!res.isSuccess){
                    new SnackBar({
                        message: "통신에 실패하였습니다."
                    });
                    return;
                }
                checkbox.prop('checked', !checkbox.prop('checked'));
                new SnackBar({
                    message: "변경 되었습니다."
                });
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){
                new SnackBar({
                    message: "통신에 실패하였습니다."
                });
            }
        });
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
	<jsp:include page="/WEB-INF/views/admin/common/header.jsp"></jsp:include>

	<side class="p-3 mb-3 border-bottom">
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/views/admin/common/sideNav.jsp"></jsp:include>

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">계정 관리</h1>
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
						<option value="email" selected>이메일</option>
						<option value="nickname">닉네임</option>
						<option value="phone">휴대폰</option>
						<option value="id">회원번호</option>
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
								<th>이메일</th>
								<th>닉네임</th>
								<th>관리</th>
								<th>차단</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="memberDetail" items="${memberDetailList}">
								<tr data-id="${memberDetail.id}">
									<td><c:out value="${memberDetail.id}" /></td>
									<td><c:out value="${memberDetail.email}" /></td>
									<td><c:out value="${memberDetail.nickname}" /></td>
									<td>
										<!--
										<button type="button"
											class="btn btn-light btn-sm button-member-detail">상세정보</button>
										 --> <!-- Button trigger modal -->
										<button type="button"
											class="btn btn-light btn-sm button-member-detail"
											data-bs-toggle="modal" data-bs-target="#form-member-detail">
											상세정보</button> <!-- Button trigger modal -->
										<button type="button"
											class="btn btn-light btn-sm button-member-message"
											data-bs-toggle="modal" data-bs-target="#form-send-message">
											메시지</button> <!-- Button trigger modal -->
										<button type="button"
											class="btn btn-light btn-sm button-member-role"
											data-bs-toggle="modal" data-bs-target="#form-edit-role">
											권한</button>



									</td>
									<td><input class="form-check-input button-member-block"
										type="checkbox" id="input-block-${memberDetail.id}"
										<c:if test="${memberDetail.isBlocked eq 'Y'}">
												checked
											</c:if>>
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


						<c:forEach begin="${startBlock}" end="${endBlock}"
							varStatus="loop">
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



				<!-- Modal -->
				<div class="modal fade" id="form-send-message" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">메시지</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form>
									<div class="mb-3">
										<label for="message-text" class="col-form-label">메시지
											내용:</label>
										<textarea class="form-control" id="message-text"></textarea>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary submit-btn" data-bs-dismiss="modal">전송</button>
							</div>
						</div>
					</div>
				</div>


				<!-- Modal -->
				<div class="modal fade" id="form-edit-role" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">권한</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form></form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Modal -->
				<div class="modal fade" id="form-member-detail" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">상세정보</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">

								<div class="table-responsive">
									<table class="table table-sm">
										<thead>
											<tr>
												<th>속성</th>
												<th>값</th>
											</tr>
										</thead>
										<tbody class="tbody-detail-form">
										</tbody>
									</table>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
			</main>


		</div>
	</div>

	</side>
	<div class="visually-hidden el-prototype-archive">
		<div class="form-check mb-3">
			<input class="form-check-input" type="checkbox" value=""
				id="flexCheckChecked"> <label class="form-check-label"
				for="flexCheckChecked"> check </label>
		</div>
	</div>
</body>
</html>