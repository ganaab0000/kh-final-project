<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>텀블업 - 크리에이터를 위한 크라우드 펀딩</title>
<jsp:include page="/WEB-INF/views/admin/common/head.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script type="text/javascript">
	$(function() {
		var visitorCountByDate = ${propVisitorCountByDate};
		var countGroupProjectCategory =	${propCountGroupProjectCategory};

		var url_string = window.location.href;
		var url = new URL(url_string);
		var dateType = url.searchParams.get("dateType");
		var startDate = url.searchParams.get("startDate");
		var endDate = url.searchParams.get("endDate");
		if(!!dateType){
			$('.date-picker').removeClass('visually-hidden');
		}
		if(!!startDate){
			$('#startDate').val(startDate);
		}
		if(!!endDate){
			$('#endDate').val(endDate);
		}else{
			$('#endDate').val(new Date().toJSON().slice(0,10));
		}
		$('#startDate').change(function(){
			url.searchParams.set('startDate', $(this).val());
			location.href=url;
		})
		$('#endDate').change(function(){
			url.searchParams.set('endDate', $(this).val());
			location.href=url;
		})

		const data = {
				  labels: visitorCountByDate.map(el=>el.dateVisited.split(',')[0]),
				  datasets: [{
				    label: '방문자 수',
				    backgroundColor: 'rgb(255, 99, 132)',
				    borderColor: 'rgb(255, 99, 132)',
				    data: visitorCountByDate.map(el=>el.count),
				  },
/* 				  {
					    label: '가입자 수',
					    backgroundColor: 'rgb(200, 99, 132)',
					    borderColor: 'rgb(200, 99, 132)',
					    data: visitorCountByDate.map(el=>el.count + 2),
				  } */
				  ]
				};
		const config = {
				  type: 'line',
				  data,
				  options: {}
		};
		const myLineChart = new Chart($('#myChart'), {
		    type: 'line',
		    data: data,
		    options: config
		});

		const maxProjectCategoryId = countGroupProjectCategory.reduce(
				(prev, current) => (prev.projectCategoryId > current.projectCategoryId) ? prev : current).projectCategoryId;
		const donutData = {
				  labels: countGroupProjectCategory.map(el=>el.name),
				  datasets: [{
				    label: '프로젝트 카테고리 분포도',
				    data: countGroupProjectCategory.map(el=>el.count),
				    backgroundColor: countGroupProjectCategory.map(el=>{
						var redColor = 190 + Math.floor(60/maxProjectCategoryId *el.projectCategoryId);
						var greenColor = (50 + Math.floor(150/maxProjectCategoryId *el.projectCategoryId));
						var blueColor = 50 + Math.floor(150/maxProjectCategoryId *el.projectCategoryId);
				    	return 'rgb(' + redColor + ',' + greenColor + ',' + blueColor + ')'
			    	}),
				    hoverOffset: 4
				  }]
		};
		const donutConfig = {
		    type: 'doughnut',
		    data: data,
		};
		const myDonutChart = new Chart($('#myChart2'), {
		    type: 'doughnut',
		    data: donutData,
		    options: donutConfig
		});
	});
</script>
<style type="text/css">
canvas{
	max-height:300px !important;
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

						<div class="date-picker visually-hidden">
							<input type="date" id="startDate">
							<span class="px-3">~</span>
							<input type="date" id="endDate">
						</div>

						<!--
						<div class="btn-group me-2">
							<button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
							<button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
						</div>
						<div>

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

						 -->

					</div>
				</div>
				<div></div>

				<div class="row">
					<div class="col-lg-3">
						<h4 class="py-2">회원</h4>
						<p class="py-2">신규회원 : ${propCountMemberCreated} 명</p>
						<p class="py-2">탈퇴회원 : ${propCountMemberDeleted} 명</p>
						<p class="py-2">차단회원 : ${propCountMemberBlocked} 명</p>
					</div>
					<!-- /.col-lg-4 -->
					<div class="col-lg-3">
						<h4 class="py-2">프로젝트</h4>
						<p class="py-2">오픈 중인 프로젝트 : ${propCountProjectByStatus2} 개</p>
						<p class="py-2">심사 대기 중 프로젝트 : ${propCountProjectByStatus1} 개</p>
						<p class="py-2">마감된 프로젝트 : ${propCountProjectByStatus3} 개</p>
						<p class="py-2">신고된 프로젝트 : ${propCountProjectBlame} 개</p>
					</div>
					<!-- /.col-lg-4 -->
					<div class="col-lg-3 pb-5">
						<h4 class="py-2">주문</h4>
						<p class="py-2">주문 예약 : ${propCountReserveByStatus1} 개</p>
						<p class="py-2">결제 완료 : ${propCountReserveByStatus2} 개</p>
						<p class="py-2">결제 취소 : ${propCountReserveByStatus3} 개</p>
						<p class="py-2">결제 실패 : ${propCountReserveByStatus3} 개</p>
					</div>
					<div class="col-lg-3 pb-5">
						<h4 class="py-2">고객</h4>
						<p class="py-2">문의 : 1 개</p>
					</div>
				</div>


				<hr class="featurette-divider">

				<div class="row featurette">
					<div class="col-md-7">
						<canvas id="myChart"></canvas>
					</div>
					<div class="col-md-5">
						<canvas id="myChart2"></canvas>
					</div>
				</div>
			</main>

		</div>
	</div>
	</side>
</body>
</html>