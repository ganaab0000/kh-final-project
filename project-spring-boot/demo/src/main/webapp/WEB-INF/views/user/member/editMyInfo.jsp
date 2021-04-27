<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
  uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>텀블업 - 크리에이터를 위한 크라우드 펀딩</title>
<jsp:include page="/WEB-INF/views/user/common/head.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {

		$('.nav-choice').each(function(idx, el) {
			$(el).click(function() {
				$('.nav-choice').removeClass("active");
				$(this).addClass("active");
				$('.nav-choice-target').addClass("visually-hidden");
				$('.nav-choice-target').eq(idx).removeClass("visually-hidden");
			});
		});
		$('.change-profile-img').click(function() {
			$('.input-profile-img').click();
		});
		$('.input-profile-img').change(function() {
			$("#form-profile-img").submit();
		});
		$("#form-profile-img").submit(function(e) {
			e.preventDefault(); // avoid to execute the actual submit of the form.
			console.log(this);
			var formData = new FormData(this);
			var url = $(this).attr('action');
			$.ajax({
				url : url,
				//headers: {'X-CSRF-Token': ''},
				data : formData,
				dataType : "json",
				type : "POST",
				enctype : 'multipart/form-data',
				processData : false,
				contentType : false,
				cache : false,
				timeout : 10000,
				success : function(data) {
					console.log(data);
					//location.href="/member/";
					$('.img-profile-img').attr('src', data.url);
					$('#form-profile input[name="profileImg"]').val(data.id);
				},
				error : function(e) {
					alert("이미지 업로드에 실패하였습니다.");
					console.log("ERROR : ", e);
				}
			});
		});

	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"></jsp:include>
	<main>
		<div class="container my-5">
			<h2 class="mb-5">설정</h2>
			<ul class="nav nav-tabs my-3">
				<li class="nav-item"><a
					class="nav-choice nav-link text-dark active" aria-current="page"
					href="#">프로필</a></li>
				<li class="nav-item"><a class="nav-choice nav-link text-dark"
					href="#">계정</a></li>
			</ul>

			<div class="nav-choice-target">
				<div class="row g-3">

					<form id="form-profile-img" name="form" method="post"
						action="/api/file" enctype="multipart/form-data">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> <input
							class="visually-hidden input-profile-img" type="file" name="file">
					</form>


					<div class="row">
						<h5 class="my-3">프로필 사진</h5>

						<div class="col-12 col-sm-6 col-md-3 text-center">
							<div>
								<img style="width:100%;" src="${member.profileImgUrl}" alt="mdo"
									class="img-profile-img rounded-circle">
							</div>
							<div></div>
						</div>
					</div>


					<button class="col-12 col-sm-6 col-md-3 btn btn-light change-profile-img">업로드</button>



					<form id="form-profile" name="form" method="post"
						action="/member/edit/info">
						<input type="hidden" name="profileImg"
							value="${memberDto.profileImg}" />

						<div class="col-12 my-2">
							<label for="nickname" class="form-label fs-5">별명</label> <input
								type="text" class="form-control" name="nickname"
								required value="${memberDto.nickname}">
						</div>

						<div class="col-12 my-2">
							<label for="address" class="form-label fs-5">소개</label>
							<textarea class="form-control" placeholder=""
								name="profileDetail" style="height: 100px" required>${memberDto.profileDetail}</textarea>
						</div>

						<div class="col-12 my-2">
							<label for="address" class="form-label fs-5">주소</label> <input
								type="text" class="form-control" name="address"
								placeholder="서울특별시 강남구 강남대로 123, 5층" required value="${memberDto.address}">
						</div>

						<div class="col-12 my-2">
							<label for="phone" class="form-label fs-5">연락처</label> <input
								type="text" class="form-control" name="phone"
								placeholder="010-0000-0000" required value="${memberDto.phone}">
						</div>

						<input type="submit" class="w-100 btn btn-light my-4" value="변경" />
					</form>


				</div>
			</div>

			<div class="nav-choice-target visually-hidden">
		        <security:authorize access="!hasRole('ROLE_MEMBER_OAUTH')">
					<a class="w-100 btn btn-light my-2" href="/member/change/password">패스워드 변경</a>
		        </security:authorize>
				<a class="w-100 btn btn-light my-2" href="/member/withdraw">탈퇴</a>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>

</body>
</html>