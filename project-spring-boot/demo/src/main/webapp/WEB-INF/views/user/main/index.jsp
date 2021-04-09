<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<jsp:include page="/WEB-INF/views/user/common/head.jsp"></jsp:include>
	<script type="text/javascript">
	$(function(){
		var myCarousel = document.querySelector('#carouselExampleDark')
		var carousel = new bootstrap.Carousel(myCarousel, {
		  interval: 3000
		})
	});
	</script>
	<style type="text/css">
	.shadow-txt {
  		font-weight: 900 !important;
	    color: white !important;
	    text-shadow: 2px 2px 5px black !important;
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
		width:100%;
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

	.card {
		padding: 10px;
		border: none;
	}
	.card-body {
		padding: 0px;
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
			    <div class="carousel-item active" data-bs-interval="10000">
			      <img class="" src="https://placeimg.com/600/360/1" alt="First slide">
			      <div class="carousel-caption d-none d-md-block">
			        <h2 class="shadow-txt">아이디어가 잠시 머무르는 정류장</h2>
			        <p class="shadow-txt">서류와 책, 작은 소품까지 보관하는 메모 오거나이저</p>
			      </div>
			    </div>
			    <div class="carousel-item" data-bs-interval="2000">
			      <img class="d-block" src="https://placeimg.com/600/360/2" alt="First slide">
			      <div class="carousel-caption d-none d-md-block">
			        <h2 class="shadow-txt">아이디어가 잠시 머무르는 정류장</h2>
			        <p class="shadow-txt">서류와 책, 작은 소품까지 보관하는 메모 오거나이저</p>
			      </div>
			    </div>
			    <div class="carousel-item">
			      <img class="d-block" src="https://placeimg.com/600/360/3" alt="First slide">
			      <div class="carousel-caption d-none d-md-block">
			        <h2 class="shadow-txt">아이디어가 잠시 머무르는 정류장</h2>
			        <p class="shadow-txt">서류와 책, 작은 소품까지 보관하는 메모 오거나이저</p>
			      </div>
			    </div>

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

			<h5 class="py-3 fw-bold">주목할만한 프로젝트 &gt;</h5>
				<div class="container mb-5 px-0">
			      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

			        <div class="col">
			          <div class="card">
			      		<img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">
			            <div class="card-body mt-3">
						  <p class="card-text" style="color:#afafaf; font-size:0.8rem;">
					    	카테고리 | 작성자
				          </p>
			              <p class="card-text">
			             	 내면의 평화를 위한 플레이리스트 가이드북 &lt;뮤직포이너피스&gt;
			              </p>
			              <div class="d-flex justify-content-between align-items-center">
			              	<p class="text-danger fw-bold">249% 달성</p>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body mt-3">
						  <p class="card-text" style="color:#afafaf; font-size:0.8rem;">
					    	카테고리 | 작성자
				          </p>
			              <p class="card-text">
			             	 내면의 평화를 위한 플레이리스트 가이드북 &lt;뮤직포이너피스&gt;
			              </p>
			              <div class="d-flex justify-content-between align-items-center">
			              	<p class="text-danger fw-bold">249% 달성</p>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">
			            <div class="card-body mt-3">
						  <p class="card-text" style="color:#afafaf; font-size:0.8rem;">
					    	카테고리 | 작성자
				          </p>
			              <p class="card-text">
			             	 내면의 평화를 위한 플레이리스트 가이드북 &lt;뮤직포이너피스&gt;
			              </p>
			              <div class="d-flex justify-content-between align-items-center">
			              	<p class="text-danger fw-bold">249% 달성</p>
			              </div>
			            </div>
			          </div>
			        </div>

			        <div class="col">
			          <div class="card">
			      		<img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">
			            <div class="card-body mt-3">
						  <p class="card-text" style="color:#afafaf; font-size:0.8rem;">
					    	카테고리 | 작성자
				          </p>
			              <p class="card-text">
			             	 내면의 평화를 위한 플레이리스트 가이드북 &lt;뮤직포이너피스&gt;
			              </p>
			              <div class="d-flex justify-content-between align-items-center">
			              	<p class="text-danger fw-bold">249% 달성</p>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body mt-3">
						  <p class="card-text" style="color:#afafaf; font-size:0.8rem;">
					    	카테고리 | 작성자
				          </p>
			              <p class="card-text">
			             	 내면의 평화를 위한 플레이리스트 가이드북 &lt;뮤직포이너피스&gt;
			              </p>
			              <div class="d-flex justify-content-between align-items-center">
			              	<p class="text-danger fw-bold">249% 달성</p>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">
			            <div class="card-body mt-3">
						  <p class="card-text" style="color:#afafaf; font-size:0.8rem;">
					    	카테고리 | 작성자
				          </p>
			              <p class="card-text">
			             	 내면의 평화를 위한 플레이리스트 가이드북 &lt;뮤직포이너피스&gt;
			              </p>
			              <div class="d-flex justify-content-between align-items-center">
			              	<p class="text-danger fw-bold">249% 달성</p>
			              </div>
			            </div>
			          </div>
			        </div>


			      </div>
			    </div>

			<h5 class="py-3 fw-bold">공개예정 프로젝트 &gt;</h5>

				<div class="container mb-5 px-0">
			      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>

			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>

			      </div>
			    </div>

			<h5 class="py-3 fw-bold">진행중인 기획전 &gt;</h5>

				<div class="container mb-5 px-0">
			      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>

			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>

			      </div>
			    </div>

			<h5 class="py-3 fw-bold">인기추천 프로젝트 &gt;</h5>

				<div class="container mb-5 px-0">
			      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>

			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>

			      </div>
			    </div>

			<h5 class="py-3 fw-bold">성공임박 프로젝트 &gt;</h5>

				<div class="container mb-5 px-0">
			      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>

			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>

			      </div>
			    </div>

			<h5 class="py-3 fw-bold">신규추천 프로젝트 &gt;</h5>

				<div class="container mb-5 px-0">
			      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>

			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card">
			            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="https://placeimg.com/600/360/blank" alt="First slide">

			            <div class="card-body">
			              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted">9 mins</small>
			              </div>
			            </div>
			          </div>
			        </div>

			      </div>
			    </div>


		</div>
	</main>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>
</body>
</html>