<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/admin/common/head.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script type="text/javascript">
	$(function() {
		const labels = [
			  'January',
			  'February',
			  'March',
			  'April',
			  'May',
			  'June',
			];
		const data = {
				  labels: labels,
				  datasets: [{
				    label: 'My First dataset',
				    backgroundColor: 'rgb(255, 99, 132)',
				    borderColor: 'rgb(255, 99, 132)',
				    data: [0, 10, 5, 2, 20, 30, 45],
				  }]
				};
		const config = {
				  type: 'line',
				  data,
				  options: {}
		};
		var myLineChart = new Chart($('#myChart'), {
		    type: 'line',
		    data: data,
		    options: config
		});

		var myLineChart = new Chart($('#myChart2'), {
		    type: 'line',
		    data: data,
		    options: config
		});
	});
</script>
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
					<h1 class="h2">대시보드</h1>
					<div class="btn-toolbar mb-2 mb-md-0">
						<div class="btn-group me-2">
							<button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
							<button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
						</div>
						<button type="button"
							class="btn btn-sm btn-outline-secondary dropdown-toggle">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-calendar">
								<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
								<line x1="16" y1="2" x2="16" y2="6"></line>
								<line x1="8" y1="2" x2="8" y2="6"></line>
								<line x1="3" y1="10" x2="21" y2="10"></line></svg>
							This week
						</button>
					</div>
				</div>
				<div></div>

				<div class="row">
					<div class="col-lg-3">

						<h4 class="py-2">회원</h4>
						<p class="py-2">신규회원 : 1 명</p>
						<p class="py-2">탈퇴회원 : 1 명</p>
						<p class="py-2">차단회원 : 1 명</p>
					</div>
					<!-- /.col-lg-4 -->
					<div class="col-lg-3">
						<h4 class="py-2">프로젝트</h4>
						<p class="py-2">오픈 중인 프로젝트 : 1 명</p>
						<p class="py-2">심사 대기 중 프로젝트 : 1 명</p>
						<p class="py-2">마감된 프로젝트 : 1 명</p>
						<p class="py-2">신고된 프로젝트 : 1 명</p>
					</div>
					<!-- /.col-lg-4 -->
					<div class="col-lg-3 pb-5">

						<h4 class="py-2">주문</h4>
						<p class="py-2">주문 예약 현황 : 1 명</p>
						<p class="py-2">결제 완료 현황 : 1 명</p>
						<p class="py-2">취소 및 환불 현황 : 1 명</p>
					</div>
					<div class="col-lg-3 pb-5">

						<h4 class="py-2">고객</h4>
						<p class="py-2">문의 현황 : 23 개</p>
					</div>
					<!-- /.col-lg-4 -->
				</div>


				<hr class="featurette-divider">

				<div class="row featurette">
					<div class="col-md-7">

						<canvas id="myChart2"></canvas>
					</div>
					<div class="col-md-5">

						<canvas id="myChart"></canvas>
						<h2 class="featurette-heading">
							First featurette heading. <span class="text-muted">It’ll
								blow your mind.</span>
						</h2>
						<p class="lead">Some great placeholder content for the first
							featurette here. Imagine some exciting prose here.</p>
					</div>
				</div>
			</main>

		</div>
	</div>
	</side>
</body>
</html>