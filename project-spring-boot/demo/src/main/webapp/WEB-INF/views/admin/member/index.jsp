<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/admin/common/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/common/header.jsp"></jsp:include>

	<side class="p-3 mb-3 border-bottom">
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/views/admin/common/sideNav.jsp"></jsp:include>



			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div class="chartjs-size-monitor">
					<div class="chartjs-size-monitor-expand">
						<div class=""></div>
					</div>
					<div class="chartjs-size-monitor-shrink">
						<div class=""></div>
					</div>
				</div>
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">계정 관리</h1>

				</div>

				<div class="input-group mb-3">
					<select class="form-select" id="inputGroupSelect04"
						aria-label="Example select with button addon">
						<option value="1" selected>이메일</option>
						<option value="2">닉네임</option>
						<option value="3">휴대폰</option>
						<option value="4">회원번호</option>
					</select> <input type="text" class="form-control"
						aria-label="Text input with dropdown button">
					<button class="btn btn-outline-secondary" type="button"
						id="button-addon2">검색</button>
				</div>

				<table class="table table-borderless">
					<tr>
						<td>접속일자</td>
						<td>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="inlineRadioOptions" id="inlineRadio1" value="option1">
								<label class="form-check-label" for="inlineRadio1">오름차순</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="inlineRadioOptions" id="inlineRadio2" value="option2">
								<label class="form-check-label" for="inlineRadio2">내림차순</label>
							</div>
						</td>
						<td>가입일자</td>
						<td>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="inlineRadioOptions2" id="inlineRadio2-1" value="option1">
								<label class="form-check-label" for="inlineRadio2-1">오름차순</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="inlineRadioOptions2" id="inlineRadio2-2" value="option2">
								<label class="form-check-label" for="inlineRadio2-2">내림차순</label>
							</div>
						</td>
					</tr>
					<tr>
						<td>가입일자</td>
						<td>

							<input type="date" id="start" name="trip-start"
							       value="2018-07-22"
							       min="2018-01-01" max="2018-12-31">

							~
							<input type="date" id="start" name="trip-start"
							       value="2018-07-22"
							       min="2018-01-01" max="2018-12-31">

						</td>
						<td>차단여부</td>
						<td>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="flexCheckDefault"> <label class="form-check-label"
									for="flexCheckDefault"> 해당 </label>
							</div>
						</td>
					</tr>
					</tbody>
				</table>
				<div class="table-responsive">
					<table class="table table-sm">
						<thead>
							<tr>
								<th>#</th>
								<th>이메일</th>
								<th>닉네임</th>
								<th>가입일자</th>
								<th>관리 - 상세정보, 메세지, 차단, 권한</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1,001</td>
								<td>random</td>
								<td>data</td>
								<td>placeholder</td>
								<td>text</td>
							</tr>
							<tr>
								<td>1,002</td>
								<td>placeholder</td>
								<td>irrelevant</td>
								<td>visual</td>
								<td>layout</td>
							</tr>
							<tr>
								<td>1,003</td>
								<td>data</td>
								<td>rich</td>
								<td>dashboard</td>
								<td>tabular</td>
							</tr>
							<tr>
								<td>1,003</td>
								<td>information</td>
								<td>placeholder</td>
								<td>illustrative</td>
								<td>data</td>
							</tr>
							<tr>
								<td>1,004</td>
								<td>text</td>
								<td>random</td>
								<td>layout</td>
								<td>dashboard</td>
							</tr>
							<tr>
								<td>1,005</td>
								<td>dashboard</td>
								<td>irrelevant</td>
								<td>text</td>
								<td>placeholder</td>
							</tr>
							<tr>
								<td>1,006</td>
								<td>dashboard</td>
								<td>illustrative</td>
								<td>rich</td>
								<td>data</td>
							</tr>
							<tr>
								<td>1,007</td>
								<td>placeholder</td>
								<td>tabular</td>
								<td>information</td>
								<td>irrelevant</td>
							</tr>
							<tr>
								<td>1,008</td>
								<td>random</td>
								<td>data</td>
								<td>placeholder</td>
								<td>text</td>
							</tr>
							<tr>
								<td>1,009</td>
								<td>placeholder</td>
								<td>irrelevant</td>
								<td>visual</td>
								<td>layout</td>
							</tr>
							<tr>
								<td>1,010</td>
								<td>data</td>
								<td>rich</td>
								<td>dashboard</td>
								<td>tabular</td>
							</tr>
							<tr>
								<td>1,011</td>
								<td>information</td>
								<td>placeholder</td>
								<td>illustrative</td>
								<td>data</td>
							</tr>
							<tr>
								<td>1,012</td>
								<td>text</td>
								<td>placeholder</td>
								<td>layout</td>
								<td>dashboard</td>
							</tr>
							<tr>
								<td>1,013</td>
								<td>dashboard</td>
								<td>irrelevant</td>
								<td>text</td>
								<td>visual</td>
							</tr>
							<tr>
								<td>1,014</td>
								<td>dashboard</td>
								<td>illustrative</td>
								<td>rich</td>
								<td>data</td>
							</tr>
							<tr>
								<td>1,015</td>
								<td>random</td>
								<td>tabular</td>
								<td>information</td>
								<td>text</td>
							</tr>
						</tbody>
					</table>
				</div>

				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link text-dark" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link text-dark" href="#">1</a></li>
						<li class="page-item"><a class="page-link text-dark" href="#">2</a></li>
						<li class="page-item"><a class="page-link text-dark" href="#">3</a></li>
						<li class="page-item"><a class="page-link text-dark" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>



			</main>


		</div>
	</div>

	</side>

</body>
</html>