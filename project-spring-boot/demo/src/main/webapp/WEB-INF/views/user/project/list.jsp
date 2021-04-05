<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
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
	<table border="1" id="listTable">
		<thead>
	        <tr>
	            <td>ID</td>
	            <td>TITLE</td>
	            <td>Writer</td>
	            <td>남은 시간</td>
	            <td>메인 이미지</td>
	        </tr>
		</thead>
		<tbody>
		</tbody>
    </table>
	<div>
		<button>
			<a href="/member/sign-up">회원가입</a>
		</button>
		<button id="loadingList">
			리스트 로딩
		</button>
	</div>
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
					
					var listTable = document.querySelector("#listTable>tbody");
					
					for(var i=0; i<data.projectList.length; i++){
						var newTr = document.createElement("tr");
						
						var idTd = document.createElement("td");
						idTd.innerText = data.projectList[i].id;
						var titleTd = document.createElement("td");
						titleTd.innerText = data.projectList[i].title;
						var writerTd = document.createElement("td");
						writerTd.innerText = data.projectList[i].writerName;
						var remainTd = document.createElement("td");
						remainTd.innerText = data.projectList[i].remainDay;
						var imgTd = document.createElement("td");
						var img = document.createElement("img");
						img.src = location.origin+"/api/file/" + data.projectList[i].mainImg;
						imgTd.append(img);
						
						listTable.append(newTr);
						newTr.append(idTd);
						newTr.append(titleTd);
						newTr.append(writerTd);
						newTr.append(remainTd);
						newTr.append(imgTd);
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
		
		//다음 리스트 호출
		loadingBtn.addEventListener("click", function(){
			if(page<max) {
				page++;
				loadingList();
			}
		});
		
		//필터 변경으로 리스트 호출
		document.querySelectorAll(".filter").forEach(function(ele){
			ele.addEventListener("change", function(){
				removeAllChild(document.querySelector("#listTable>tbody"));
				paramSetter[this.id](this.value);
				page = 1;
				loadingList();
			});
		});
		
		window.onload = function(){
			loadingList();
		};
	</script>
</body>
</html>