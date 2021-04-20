//alert('js');

//프로젝트 둘러보기 모달창 카테고리 불러오기
$(function(){
	$.ajax({
		url: location.origin + "/project/category",
		type: "get",
		success: function(res){
			for(var i=0; i<res.length; i++){
				var div = $("<div>", {"class" : "modelMenuItem"});
				var a = $("<a>");
				a.text(res[i].name);
				a.attr("href", location.origin + "/project/list?category=" + res[i].id);
				div.append(a);
				$(".modalCategoryWrapper").append(div);
			}
		}
	});
})