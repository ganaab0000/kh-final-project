<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>텀블업 - 크리에이터를 위한 크라우드 펀딩</title>
	<jsp:include page="/WEB-INF/views/user/common/head.jsp"></jsp:include>
	<script type="text/javascript">
	$(function(){
		var myCarousel = document.querySelector('#carouselExampleDark')
		var carousel = new bootstrap.Carousel(myCarousel, {
		  interval: 3000
		})
	});
	</script>
	<link rel="stylesheet" href="/css/projectCommon.css">
	<style type="text/css">
	.shadow-txt {
  		font-weight: 900 !important;
	    color: white !important;
	    text-shadow: 2px 2px 5px #000000a1 !important;
	}

	.img-txt-centered {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	}

	.img-container {
	    position: relative;
	    text-align: center;
	    color: white;
	}
	.carousel-item img {
		width:60%;
		float:left;
		height:400px;
		object-fit:cover;
	}
	.carousel-caption {
		bottom: 50%;
	}
	.container h5 {
		margine-top: 20px;
		margine-bottom: 20px;
	}
	.contentWrapper {
        width: 40%;
	    height: 400px;
	    float: right;
	    background-color: #ff9494;
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    padding-left: 30px;
    	padding-right: 10%;
	    word-break: break-all;
	}
	h2.shadow-txt {
	    margin-bottom: 1rem;
	}
	.carousel-control-next, .carousel-control-prev {
		width: 5%;
	}
	.carousel-control-prev{
		left: auto;
		right: 5%;
	}
	.card {
		padding: 10px;
		border: none;
		max-width: 420px;
	}
	.card-body {
		padding: 0px;
	}
	.noList{
	    margin-top: 200px;
	    text-align: center;
	    height: 300px;
	    font-size: 3rem;
	    font-weight: bold;
	    color: darkgray;
	}
	div.mainImgWrapper{
		position: relative;
	}
	.like{
		position: absolute;
		right: 0;
		border-radius: 100%;
		width: 30px;
		height: 30px;
		padding: 0;
	}
	.bi-heart-fill{
		color: #ff4b4b;
	}
	button.like.btn:hover {
	    background: #ffffffba;
	}
	.contentWrapper a{
		color: white;
		text-decoration: none;
	}
	.linkBtn>* {
	    font-size: 0.8rem;
	    color: #545454;
	    text-decoration: none;
	}
	.card .title>a, .a-tag{
	    text-decoration: none;
	    color: black;
		font-size: 20px;	
		font-weight: bold;	
	}
	.card a:hover, .a-tag:hover{
	    text-decoration: underline;
	}
	a.linkBtn{
		font-size: 16px;
	    line-height: 27px;
	    border: 1px solid rgb(230, 230, 230);
	    text-align: center;
	    color: rgb(109, 109, 109);
	    display: flex;
	    height: 44px;
	    justify-content: center;
	    align-items: center;
	    border-radius: 22px;
	    text-decoration: none;
	    width: 233px;
    	margin: 0 auto 0px;
	}
	a.linkBtn:hover{
		background-color: #b5b5b580;
	}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"></jsp:include>
	<main class="mb-3">
		<div class="container">

			<div id="carouselExampleDark" class="carousel carousel-light slide mb-5" data-bs-ride="carousel">
			  <div class="carousel-indicators">
			    <button class="active" type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" aria-current="true" aria-label="Slide 1"></button>
			    <button class="" type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button class="" type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
			  </div>

			  <div class="carousel-inner">
			  	<c:forEach var="project" items="${carousel}">
				    <div class="carousel-item" data-bs-interval="5000">
				    	<div class="imgWrapper">
				    		<a href="/project/${project.id}">
						    	<img class="carouselImg" src="/api/file/${project.mainImg}" alt="First slide">
				    		</a>
				    	</div>
					    <div class="contentWrapper">
						    <h2 class="shadow-txt"><a href="/project/${project.id}">${project.title}</a></h2>
					        <p class="shadow-txt">${project.subTitle}</p>
					    </div>
				    </div>
			  	</c:forEach>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
			    <h1 class="shadow-txt">&lt;</h1>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
			    <h1 class="shadow-txt">&gt;</h1>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>

			<h5 class="py-3 fw-bold"><a href="/project/list?status=1" class="a-tag">인기 프로젝트 &gt;</a></h5>
			
			<div class="container mb-5 px-0">
				<c:if test="${hot.size()!=0}">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<c:forEach var="project" items="${hot}">
						<div class="col">
						    <div class="card">
						    	<div class="mainImgWrapper">
							    	<button class="like btn"><i class="bi ${project.vote eq null ? 'bi-heart' : 'bi-heart-fill'}"></i></button>
							      	<a href="/project/${project.id}">
								      	<img class="bd-placeholder-img card-img-top" width="100%" height="225" src="/api/file/${project.mainImg}" alt="First slide">
							    	</a>
						    	</div>
						      	<div class="card-body mt-3">
								<p class="card-text linkBtn" style="color:#afafaf; font-size:0.8rem;">
									<a href="/project/list?category=${project.projectCategoryId}">${project.projectCategory}</a> | 
									<a href="#">${project.writerName}</a>
								</p>
								<p class="card-text title"><a href="/project/${project.id}">${project.title}</a></p>
								<div class="d-flex justify-content-between align-items-center">
									<p class="text-danger fw-bold">${project.rate}% 달성</p>
								</div>
								</div>
						    </div>
					  	</div>
					</c:forEach>
				</div>
				<a href="/project/list?status=1" class="linkBtn">인기 프로젝트</a>
				</c:if>
				<c:if test="${hot.size()==0}">
					<div class="noList">
						발견된 프로젝트가 없습니다.
					</div>
				</c:if>
		    </div>

			

			<h5 class="py-3 fw-bold"><a href="/project/list?status=1&minRate=75&maxRate=99" class="a-tag">성공 임박 프로젝트 &gt;</a></h5>
			
			<div class="container mb-5 px-0">
				<c:if test="${attainment.size()!=0}">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<c:forEach var="project" items="${attainment}">
						<div class="col">
						    <div class="card">
						    	<div class="mainImgWrapper">
							    	<button class="like btn"><i class="bi ${project.vote eq null ? 'bi-heart' : 'bi-heart-fill'}"></i></button>
							      	<a href="/project/${project.id}">
								      	<img class="bd-placeholder-img card-img-top" width="100%" height="225" src="/api/file/${project.mainImg}" alt="First slide">
							    	</a>
						    	</div>
						      	<div class="card-body mt-3">
								<p class="card-text linkBtn" style="color:#afafaf; font-size:0.8rem;">
									<a href="/project/list?category=${project.projectCategoryId}">${project.projectCategory}</a> | 
									<a href="#">${project.writerName}</a>
								</p>
								<p class="card-text title"><a href="/project/${project.id}">${project.title}</a></p>
								<div class="d-flex justify-content-between align-items-center">
									<p class="text-danger fw-bold">${project.rate}% 달성</p>
								</div>
								</div>
						    </div>
					  	</div>
					</c:forEach>
				</div>
				<a href="/project/list?status=1&minRate=75&maxRate=99" class="linkBtn">성공 임박 프로젝트</a>
				</c:if>
				<c:if test="${attainment.size()==0}">
					<div class="noList">
						발견된 프로젝트가 없습니다.
					</div>
				</c:if>
		    </div>


			<h5 class="py-3 fw-bold"><a href="/project/list?status=1&sort=2" class="a-tag">신규 프로젝트 &gt;</a></h5>

			<div class="container mb-5 px-0">
				<c:if test="${newProject.size()!=0}">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<c:forEach var="project" items="${newProject}">
					  	<div class="col">
						    <div class="card">
						    	<div class="mainImgWrapper">
							    	<button class="like btn"><i class="bi ${project.vote eq null ? 'bi-heart' : 'bi-heart-fill'}"></i></button>
							      	<a href="/project/${project.id}">
								      	<img class="bd-placeholder-img card-img-top" width="100%" height="225" src="/api/file/${project.mainImg}" alt="First slide">
							    	</a>
						    	</div>
						      	<div class="card-body mt-3">
								<p class="card-text linkBtn" style="color:#afafaf; font-size:0.8rem;">
									<a href="/project/list?category=${project.projectCategoryId}">${project.projectCategory}</a> | 
									<a href="#">${project.writerName}</a>
								</p>
								<p class="card-text title"><a href="/project/${project.id}">${project.title}</a></p>
								<div class="d-flex justify-content-between align-items-center">
									<p class="text-danger fw-bold">${project.rate}% 달성</p>
								</div>
								</div>
						    </div>
					  	</div>
					</c:forEach>
				</div>
				<a href="/project/list?status=1&sort=2" class="linkBtn">신규 프로젝트</a>
				</c:if>
				<c:if test="${newProject.size()==0}">
					<div class="noList">
						발견된 프로젝트가 없습니다.
					</div>
				</c:if>
		    </div>

			<h5 class="py-3 fw-bold"><a href="/project/list?status=3" class="a-tag">공개 예정 프로젝트 &gt;</a></h5>
			
			<div class="container mb-5 px-0">
				<c:if test="${coming.size()!=0}">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<c:forEach var="project" items="${coming}">
						 <div class="col">
						    <div class="card">
						    	<div class="mainImgWrapper">
							    	<button class="like btn"><i class="bi ${project.vote eq null ? 'bi-heart' : 'bi-heart-fill'}"></i></button>
							      	<a href="/project/${project.id}">
								      	<img class="bd-placeholder-img card-img-top" width="100%" height="225" src="/api/file/${project.mainImg}" alt="First slide">
							    	</a>
						    	</div>
						      	<div class="card-body mt-3">
								<p class="card-text linkBtn" style="color:#afafaf; font-size:0.8rem;">
									<a href="/project/list?category=${project.projectCategoryId}">${project.projectCategory}</a> | 
									<a href="#">${project.writerName}</a>
								</p>
								<p class="card-text title"><a href="/project/${project.id}">${project.title}</a></p>
								<div class="d-flex justify-content-between align-items-center">
								</div>
								</div>
						    </div>
					  	</div>
					</c:forEach>
				</div>
				<a href="/project/list?status=3" class="linkBtn">공개 예정 프로젝트</a>
				</c:if>
				<c:if test="${coming.size()==0}">
					<div class="noList">
						발견된 프로젝트가 없습니다.
					</div>
				</c:if>
		    </div>


		</div>
	</main>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>
	<script>
		//좋아요 버튼 이벤트
		$(".like").on("click", function(){
			var target = $(this).next().attr("href") + "/like";
			var btn = $(this);
			$.ajax({
				url: target,
				type: "post",
				success: function(data){
					if(data==1){
						btn.html('<i class="bi bi-heart-fill"></i>');
					} else{
						btn.html('<i class="bi bi-heart"></i>');
					}
				},
				error: function(){
					if(confirm("로그인 페이지로 이동합니다.")){
						location.href = "/member/signin";
					}
				}
			});
		})
		
		$(".carousel-item").eq(0).addClass("active");
		$(".contentWrapper").eq(0).css("background-color", "#ff9494");
		$(".contentWrapper").eq(1).css("background-color", "#939597");
		$(".contentWrapper").eq(2).css("background-color", "#F5dF4D");
	</script>
</body>
</html>