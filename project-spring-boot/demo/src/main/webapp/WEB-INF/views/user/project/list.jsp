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
		.filterWrapper:nth-child(1)>button.filter{
			margin-right: 0.5rem;
		}
		p.card-text.cardSubTitle {
			font-size: 14px;
		}
		#projectCount{
			font-weight: bold;
		}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"></jsp:include>
	<div class="main">
		<div class="dropdown filterWrapper">
			<button class="btn filter btn-outline-dark" type="button" id="keyword"></button>
			<button class="btn dropdown-toggle filter btn-outline-dark" value="카테고리" type="button" id="category" data-bs-toggle="dropdown" aria-expanded="false">카테고리</button>
			<ul class="dropdown-menu" aria-labelledby="category">
				<li><button class="dropdown-item" name="category" value="">전체 보기</button></li>
				<c:forEach var="category" items="${category}">
					<li><button class="dropdown-item" name="category" value="${category.id}">${category.name}</button></li>
				</c:forEach>
			</ul>
			<button class="btn dropdown-toggle filter btn-outline-dark" value="상태" type="button" id="status" data-bs-toggle="dropdown" aria-expanded="false">상태</button>
			<ul class="dropdown-menu" aria-labelledby="status">
				<li><button class="dropdown-item" name="status" value="">전체 프로젝트</button></li>
				<li><button class="dropdown-item" name="status" value="1">진행중인 프로젝트</button></li>
				<li><button class="dropdown-item" name="status" value="2">성사된 프로젝트</button></li>
				<li><button class="dropdown-item" name="status" value="3">공개 예정 프로젝트</button></li>
			</ul>
			<button class="btn dropdown-toggle filter btn-outline-dark" value="달성률" type="button" id="rate" data-bs-toggle="dropdown" aria-expanded="false">달성률</button>
			<ul class="dropdown-menu" aria-labelledby="rate">
				<li><button class="dropdown-item" name="rate" value="">전체 보기</button></li>
				<li><button class="dropdown-item" name="rate" value="1">75% 이하</button></li>
				<li><button class="dropdown-item" name="rate" value="2">75% ~ 100%</button></li>
				<li><button class="dropdown-item" name="rate" value="3">100% 이상</button></li>
				<li><hr class="dropdown-divider"></li>
				<li>
					<div class="customFilterWrapper">
						<div class="customFilterHeader">직접 입력</div>
						<div class=customFilterInput>
							<span class="">
							<input type="text" pattern="[0-9]*" min="0" max="9999" placeholder="" maxlength="5" name="minRate" class="min" value="">
							<span class="">%</span>
							</span>-<span class="">
							<input type="text" pattern="[0-9]*" min="0" max="9999" placeholder="" maxlength="5" name="maxRate" class="max" value="">
							<span class="">%</span></span>
						</div>
						<button class="customFilter btn">
							<span>입력값 적용</span>
						</button>
					</div>
				</li>
			</ul>
			<button class="btn dropdown-toggle filter btn-outline-dark" value="모인 금액" type="button" id="collected" data-bs-toggle="dropdown" aria-expanded="false">모인 금액</button>
			<ul class="dropdown-menu" aria-labelledby="collected">
				<li><button class="dropdown-item" name="collected" value="">전체 보기</button></li>
				<li><button class="dropdown-item" name="collected" value="1">1백만원 이하</button></li>
				<li><button class="dropdown-item" name="collected" value="2">1백만원 ~ 1천만원</button></li>
				<li><button class="dropdown-item" name="collected" value="3">1천만원 ~ 5천만원</button></li>
				<li><button class="dropdown-item" name="collected" value="4">5천만원 이상</button></li>
				<li><hr class="dropdown-divider"></li>
				<li>
					<div class="customFilterWrapper">
						<div class=customFilterHeader>직접 입력</div>
						<div class="customFilterInput">
							<span class="">
							<input type="text" pattern="[0-9]*" min="0" max="9999" placeholder="" maxlength="13" name="minCollected" class="min" value="">
							<span class="">원</span>
							</span>-<span class="">
							<input type="text" pattern="[0-9]*" min="0" max="9999" placeholder="" maxlength="13" name="maxCollected" class="max" value="">
							<span class="">원</span></span>
						</div>
						<button class="customFilter btn">
							<span>입력값 적용</span>
						</button>
					</div>
				</li>
			</ul>
			<button class="btn filterReset btn-outline-dark">필터 초기화</button>
		</div>
		<div class="filterWrapper">
			<span id="projectCount"></span>개의 프로젝트가 있습니다.
			<button class="btn dropdown-toggle filter btn-outline-dark" value="인기순" type="button" id="sort" data-bs-toggle="dropdown" aria-expanded="false">
			</button>
			<ul class="dropdown-menu" aria-labelledby="sort">
				<li><button class="dropdown-item" name="sort" value="1">인기순</button></li>
				<li><button class="dropdown-item" name="sort" value="2">최신순</button></li>
				<li><button class="dropdown-item" name="sort" value="3">최다 후원수</button></li>
				<li><button class="dropdown-item" name="sort" value="4">최다 금액순</button></li>
				<li><button class="dropdown-item" name="sort" value="5">마감 임박순</button></li>
			</ul>
		</div>
		
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

		var keyword = urlParams.get("keyword");
		var category = urlParams.get("category");
		var pStatus = urlParams.get("status");
		var rate = urlParams.get("rate");
		var minRate = urlParams.get("minRate");
		var maxRate = urlParams.get("maxRate");
		var collected = urlParams.get("collected");
		var minCollected = urlParams.get("minCollected");
		var maxCollected = urlParams.get("maxCollected");
		var sort = urlParams.get("sort");
		var page = urlParams.get("page");
		page = page==null?1:page;
		
		class setParam{
			keyword(param){keyword = param;}
			category(param){category = param;}
			status(param){pStatus = param;}
			rate(param){rate = param;}
			minRate(param){minRate = param;}
			maxRate(param){maxRate = param;}
			collected(param){collected = param;}
			minCollected(param){minCollected = param;}
			maxCollected(param){maxCollected = param;}
			sort(param){sort = param;}
		}
		var paramSetter = new setParam();
		var max;
		
		//리스트 비동기 로딩
		function loadingList(){
			$(".cardContainer").append($($("#spinner").html()));
			$.ajax({
				url: "listajax",
				type: "get",
				data: {
					keyword : keyword,
					category : category,
					status : pStatus,
					rate : rate,
					minRate : minRate,
					maxRate : maxRate,
					collected : collected,
					minCollected : minCollected,
					maxCollected : maxCollected,
					sort : sort,
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
						}
						$(".noList").hide();
					} else{
						$(".noList").show();
					}
					
					if(page==1){
						$("#projectCount").text(data.projectCount);
						max = Math.ceil(data.projectCount/18);
					}
					
					var ajaxUrl = this.url;
					ajaxUrl = ajaxUrl.substr(0, ajaxUrl.indexOf("&page"));
					ajaxUrl = ajaxUrl.substr(ajaxUrl.indexOf("?"), ajaxUrl.length-1);
					ajaxUrl = new URL(location.origin + location.pathname + ajaxUrl);
					
					var ajaxParams = ajaxUrl.searchParams;
					var keys = ajaxParams.keys();
					var newParams = "?";
					var index = 0;
					while(true){
						var key = keys.next().value;
						if(!key) break;
						var value = ajaxParams.get(key);
						if(value){
							if(index!=0) newParams += "&";
							newParams += key + "=" + value;
							
							if(key=="keyword") {
								$("#keyword").show().text(value);
								var closeBtn = $('<button type="button" class="btn-close" aria-label="Close"></button>');
								$("#keyword").append(closeBtn);
								closeBtn.on("click", function(){
									keyword = "";
									$(".cardContainer").empty();
									loadingList();
								})
							} else{
								$("#"+key).text($("button[name="+key+"][value="+value+"]").text());
							}
							index++;
						} else{
							$("#"+key).text($("#"+key).val());
							if(key=='keyword') $("#keyword").hide();
						}
						$("button[name="+key+"][value='"+value+"']").addClass("active");
					}
					if(ajaxParams.get('minRate') || ajaxParams.get('maxRate')){
						let str;
						if(ajaxParams.get('minRate') && ajaxParams.get('maxRate')){
							str = ajaxParams.get('minRate') + "% ~ " + ajaxParams.get('maxRate') + "%";
						} else if(ajaxParams.get('minRate')){
							str = ajaxParams.get('minRate') + "% 이상";
						} else{
							str = ajaxParams.get('maxRate') + "% 이하";
						}
						$("#rate").text(str);
						$("button[name=rate]").removeClass("active");
					}
					if(ajaxParams.get('minCollected') || ajaxParams.get('maxCollected')){
						let str;
						if(ajaxParams.get('minCollected') && ajaxParams.get('maxCollected')){
							str = ajaxParams.get('minCollected') + "원 ~ " + ajaxParams.get('maxCollected') + "원";
						} else if(ajaxParams.get('minCollected')){
							str = ajaxParams.get('minCollected') + "원 이상";
						} else{
							str = ajaxParams.get('maxCollected') + "원 이하";
						}
						$("#collected").text(str);
						$("button[name=collected]").removeClass("active");
					}
					
					history.pushState(null, null, newParams);
				}
			});
		};
		
		//페이지 첫 로딩 때 리스트 호출
		window.onload = function () {
			loadingList();
		};

		//필터 변경으로 리스트 호출
		$(".dropdown-item").on("click", function(){
			$(".cardContainer").empty();
			$(this).parents(".dropdown-menu").find(".dropdown-item").removeClass("active");
			$(this).addClass("active");
			paramSetter[this.name](this.value);
			if(this.name=="rate"){
				minRate = "";
				maxRate = "";
				$("input[name=minRate]").val(null);
				$("input[name=maxRate]").val(null);
			}
			if(this.name=="collected"){
				minCollected = "";
				maxCollected = "";
				$("input[name=minCollected]").val(null);
				$("input[name=maxCollected]").val(null);
			}
			page = 1;
			loadingList();
		})
		$(".customFilter").on("click", function(){
			$(".cardContainer").empty();
			$(this).parents(".dropdown-menu").find(".dropdown-item").removeClass("active");
			var minValue = $(this).parents(".dropdown-menu").find(".min");
			var maxValue = $(this).parents(".dropdown-menu").find(".max");
			paramSetter[minValue.attr("name")](minValue.val());
			paramSetter[maxValue.attr("name")](maxValue.val());
			if(minValue.attr("name")=="minRate"){
				rate="";
			} else{
				collected="";
			}
			page = 1;
			loadingList();
		})
		
		//필터 초기화
		$(".filterReset").on("click", function(){
			$(".cardContainer").empty();
			$(".dropdown-item").removeClass("active");
			keyword = "";
			category = "";
			pStatus = "";
			rate = "";
			minRate = "";
			maxRate = "";
			collected = "";
			minCollected = "";
			maxCollected = "";
			sort = "";
			page = 1;
			$(".noList").hide();
			loadingList();
		})

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