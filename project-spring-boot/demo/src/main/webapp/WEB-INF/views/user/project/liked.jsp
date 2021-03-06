<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>텀블업 - 크리에이터를 위한 크라우드 펀딩</title>
	<jsp:include page="/WEB-INF/views/user/common/head.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/projectCommon.css">
	<style>
		.main{
			max-width: 1080px;
			min-width: 320px;
			margin: 0 auto;
			padding: 10px;
			margin-bottom: 50px;
		}
		.cardWrapper{
			margin: 2rem 0;
		}
		.card{
			padding: 10px;
			border: none;
		}
		.mainImgWrapper{
			height: 220px;
		    position: relative;
		    overflow: hidden;
		    display: flex;
		    justify-content: center;
		}
		img.card-img-top.mainImg {
		    width: auto;
		    height: 240px;
		}
		.card-body {
		    flex: 1 1 auto;
		    padding: 1rem 0;
		}
		a.card-title.cardTitle {
		    font-size: 20px;
		    font-weight: bold;
		}
		.linkBtn {
		    margin: 0.5rem 0;
		}
		.linkBtn>*{
			font-size: 0.8rem;
			color: #545454;
		}
		a{
			color: black;
			text-decoration: none;
		}
		a:hover{
			color: black;
			text-decoration: underline;
		}
		.spinner{
			width: 100%;
		}

		.card-footer{
			background-color: white;
			padding: 0;
			border: none;
		}
		.rateBar{
			height: 2px;
			width: 100%;
			position: relative;
			margin: 1rem 0;
		}
		.targetBar{
			position: absolute;
			height: 100%;
			width: 100%;
			background-color: #939597;
		}
		.collectedBar{
			position: absolute;
			height: 100%;
			background-color: lightcoral;
		}
		.remainTime{
			float: right;
			font-size: 0.8rem;
   			color: #545454;
		}
		.rate{
			font-size: 0.8rem;
		}
		.filterWrapper{
			position: relative;
			display: flex;
			align-items: center;
			margin-bottom: 1rem;
		}
		.filterReset, #sort{
			position: absolute;
			right: 0;
		}
		.noList{
		    margin-top: 200px;
		    text-align: center;
		    height: 300px;
		    font-size: 3rem;
		    font-weight: bold;
		    color: darkgray;
		}
		.like{
			position: absolute;
			right: 0;
		}
		.bi-heart-fill{
			color: #ff4b4b;
		}
		button.like.btn:hover {
		    background: #ffffffba;
		}
		button.like.btn {
		    border-radius: 100%;
		    width: 30px;
		    height: 30px;
		    padding: 0;
		}
		#keyword>button.btn-close {
		    width: 14px;
		    height: 14px;
		    padding: 0;
		    margin-left: 0.25rem;
		}
		input.min, input.max{
			width: 120px;
		}
		div.customFilterWrapper{
			padding: 0.5rem;
		}
		button.customFilter {
		    width: 100%;
		    margin-top: 0.5rem;
		}
		button.btn.comingSoon {
		    width: 100%;
		    color: white;
		    background: lightcoral;
		    font-weight: bold;
		}
		.likedTitle{
		    font-size: 3rem;
		    margin-bottom: 2rem;
		    padding: 2rem 0;
		    border-bottom: 1px solid lightgray;
		}
		p.card-text.cardSubTitle {
			font-size: 14px;
		}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"></jsp:include>
	<div class="main">
		<div class="likedTitle">좋아한 프로젝트</div>
		<span id="projectCount"></span>개의 프로젝트가 있습니다.
		
		<div class="row row-cols-1 row-cols-md-3 g-4 cardContainer"></div>
		<div class="noList" style="display: none;">
			발견된 프로젝트가 없습니다.
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>
	
	<script type="text/template" id="cardTemplate">
		<div class="col cardWrapper">
			<div class="card h-100">
				<div class="mainImgWrapper">
					<button class="like btn"><i class="bi bi-heart"></i></button>
					<a href="">
						<img class="card-img-top mainImg" alt="프로젝트 메인 이미지">
					</a>
				</div>
				<div class="card-body">
					<a href="" class="card-title cardTitle"></a>
					<div class="linkBtn">
						<a href="" class="cardCategory"></a> | 
						<a href="" class="cardWriter"></a>
					</div>
					<p class="card-text cardSubTitle"></p>
				</div>
				<div class="card-footer">
					<div class="rateBar">
						<div class="targetBar"></div>
						<div class="collectedBar"></div>
					</div>
					<span class="collected"></span>
					<span class="rate"></span>
					<span class="remainTime"></span>
				</div>
			</div>
		</div>
	</script>	

	<script type="text/template" id="spinner">
		<div class="text-center spinner">
			<div class="spinner-border m-5" role="status">
			  <span class="visually-hidden">Loading...</span>
			</div>
		</div>
	</script>
	
	<script>
		//url 파라미터 가져오기
		var url = new URL(location.href);
		var urlParams = url.searchParams;
		
		var page = urlParams.get("page");
		page = page==null?1:page;

		var max;
		
		//리스트 비동기 로딩
		function loadingList(){
			$(".cardContainer").append($($("#spinner").html()));
			$.ajax({
				url: "likedajax",
				type: "get",
				data: {
					page : page
				},
				dataType: "json",
				success: function(data){
					$(".spinner").remove();
					if(data.projectCount!=0){
						var listTable = document.querySelector("#listTable>tbody");
						
						for(var i=0; i<data.projectList.length; i++){
							var project = data.projectList[i];
							
							var cardWrapper = $($("#cardTemplate").html());
							var card = cardWrapper.children(".card");
	
							card.find(".mainImg").attr("src", "/api/file/" + project.mainImg);
							card.find("a").attr("href", location.origin + "/project/" + project.id);
							
							var cardBody = card.children(".card-body");
							cardBody.find(".cardTitle").text(project.title);
							cardBody.find(".cardCategory").text(project.projectCategory).attr("href", location.origin + "/project/list?category=" + project.projectCategoryId);
							cardBody.find(".cardWriter").text(project.writerName).attr("href", location.origin + "/member/" + project.memberId);
							cardBody.find(".cardSubTitle").text(project.subTitle);
	
							var cardFooter = card.children(".card-footer");
							
							cardFooter.find(".collected").text((project.collected == null ? 0 : project.collected) + "원");
							let rate = project.rate;
							rate = rate==null ? 0 : rate;
							cardFooter.find(".rate").text(rate + "%");
							cardFooter.find(".collectedBar").width((rate > 100 ? 100 : rate) + "%");
							if(project.isOpen == 'Y' && project.isClose == 'N'){
								cardFooter.find(".remainTime").text(project.remainTime + " 남음");
							} else if(project.isOpen == 'N'){
								cardFooter.empty();
								let btn = $("<button class='btn comingSoon'></button>");
								btn.text("공개 예정");
								btn.click(function(){
									location.href = $(this).parents(".card").find(".card-title").attr("href");
								})
								cardFooter.append(btn);
							} else{
								if(project.collected >= project.targetAmount){
									cardFooter.find(".remainTime").text(project.sponsor + "명의 후원으로 펀딩 성공");
								} else{
									cardFooter.find(".remainTime").text("펀딩 무산");
								}
							}
							
							$(".cardContainer").append(cardWrapper);
							
							var like = card.find(".like");
							if(project.vote!=null){
								like.html('<i class="bi bi-heart-fill"></i>');
							} else{
								like.html('<i class="bi bi-heart"></i>');
							}
							
							//좋아요 버튼 이벤트
							like.on("click", function(){
								var target = $(this).next().attr("href") + "/like";
								var btn = $(this);
								$.ajax({
									url: target,
									type: "post",
									success: function(){
										$(".cardContainer").empty();
										page = 1;
										loadingList();
									}
								});
							})
						}
						$(".noList").hide();
					} else{
						$(".noList").show();
					}
					if(page==1){
						$("#projectCount").text(data.projectCount);
						max = Math.ceil(data.projectCount/18);
					}
				}
			});
		};
		
		//페이지 첫 로딩 때 리스트 호출
		window.onload = function () {
			loadingList();
		};

		//스크롤이 끝으로 가면 리스트 호출
		document.addEventListener("scroll", function(){
			if(document.documentElement.scrollTop + document.documentElement.clientHeight == document.documentElement.scrollHeight){
				if (page < max) {
					page++;
					loadingList();
				}
			}
		});
	</script>
</body>
</html>