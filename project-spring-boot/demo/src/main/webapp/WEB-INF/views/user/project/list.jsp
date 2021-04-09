<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous">
	</script>
	<style>
		.main{
			max-width: 1080px;
			min-width: 320px;
			margin: 0 auto;
			padding: 10px;
		}
		.card{
			padding: 10px;
		}
		.mainImgWrapper{
			height: 240px;
		}
		a{
			color: black;
			text-decoration: none;
		}
		a:hover{
			color: black;
			text-decoration: underline;
		}
	</style>
</head>
<body>
	<div class="main">
		<h2>Project List</h2>
		<div>검색된 프로젝트 개수 : <span id="projectCount"></span></div>
		<div>
			<select id="category" class="filter">
				<option value="">카테고리</option>
				<c:forEach var="category" items="${category}">
					<option value="${category.id}">${category.name}</option>
				</c:forEach>
			</select>
			
			<select id="status" class="filter">
				<option value="">상태</option>
				<c:forEach var="status" items="${status}">
					<option value="${status.id}">${status.detail}</option>
				</c:forEach>
			</select>
			
			<select id="sort" class="filter">
				<option value="1">최신순</option>
				<option value="2">최다 후원수</option>
				<option value="3">최다 금액순</option>
				<option value="4">마감 임박순</option>
			</select>
		</div>
		
		<div class="row row-cols-1 row-cols-md-3 g-4 cardContainer"></div>
	</div>
	
	<script type="text/template" id="cardTemplate">
		<div class="col cardWrapper">
			<div class="card h-100">
				<div class="mainImgWrapper">
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
		function removeAllChild(parent) {
			while (parent.firstChild) {
				parent.removeChild(parent.firstChild);
			}
		}
		
		var loadingBtn = document.querySelector("#loadingList");

		//url 파라미터 가져오기
		var url = new URL(location.href);
		var urlParams = url.searchParams;

		var category = urlParams.get("category");
		var pStatus = urlParams.get("status");
		var sort = urlParams.get("sort");
		var page = urlParams.get("page");
		page = page==null?1:page;
		
		class setParam{
			category(param){category = param;}
			status(param){pStatus = param;}
			sort(param){sort = param;}
		}
		var paramSetter = new setParam();
		var max;
		
		var loadingList = function(){
			$.ajax({
				url: "listajax",
				type: "get",
				data: {
					category : category,
					status : pStatus,
					sort : sort,
					page : page
				},
				dataType: "json",
				success: function(data){
					$(".spinner").remove();
					
					var listTable = document.querySelector("#listTable>tbody");
					
					for(var i=0; i<data.projectList.length; i++){
						var cardWrapper = $($("#cardTemplate").html());
						var card = cardWrapper.children(".card");

						card.find(".mainImg").attr("src", "http://127.0.0.1:9090/api/file/" + data.projectList[i].mainImg);
						card.find("a").attr("href", location.origin + "/project/" + data.projectList[i].id);

						var cardBody = card.children(".card-body");
						cardBody.find(".cardTitle").text(data.projectList[i].title);
						cardBody.find(".cardCategory").text(data.projectList[i].projectCategoryId).attr("href", location.origin + "/project/list?category=" + data.projectList[i].projectCategoryId);
						cardBody.find(".cardWriter").text(data.projectList[i].writerName).attr("href", location.origin + "/member/" + data.projectList[i].memberId);
						cardBody.find(".cardSubTitle").text(data.projectList[i].subTitle);

						var cardFooter = card.children(".card-footer");
						cardFooter.find(".collected").text((data.projectList[i].collected == null ? 0 : data.projectList[i].collected) + "원");
						cardFooter.find(".rate").text((data.projectList[i].rate == null ? 0 : data.projectList[i].rate) + "%");
						cardFooter.find(".remainTime").text((data.projectList[i].remainDay > 0 ? data.projectList[i].remainDay + "일" : data.projectList[i].remainHour + "시간")+" 남음");

						$(".cardContainer").append(cardWrapper);
					}
					
					if(page==1){
						$("#projectCount").text(data.projectCount);
						max = Math.ceil(data.projectCount/18);
					}
					
					//통신 후 url 변경
					var ajaxUrl = this.url;
					ajaxUrl = ajaxUrl.substr(0, ajaxUrl.indexOf("&page"));
					history.pushState(null, null, "list" + ajaxUrl.substr(ajaxUrl.indexOf("?"), ajaxUrl.length-1));
				}
			});
		};
		
		//페이지 첫 로딩 때 리스트 호출
		window.onload = function () {
			$(".cardContainer").append($($("#spinner").html()));
			loadingList();
		};

		//필터 변경으로 리스트 호출
		document.querySelectorAll(".filter").forEach(function (ele) {
			ele.addEventListener("change", function () {
				removeAllChild(document.querySelector(".cardContainer"));
				paramSetter[this.id](this.value);
				page = 1;
				$(".cardContainer").append($($("#spinner").html()));
				loadingList();
			});
		});

		//스크롤이 끝으로 가면 리스트 호출
		document.addEventListener("scroll", function(){
			if(document.documentElement.scrollTop + document.documentElement.clientHeight == document.documentElement.scrollHeight){
				if (page < max) {
					$(".cardContainer").append($($("#spinner").html()));
					page++;
					loadingList();
				}
			}
		});
	</script>
</body>
</html>