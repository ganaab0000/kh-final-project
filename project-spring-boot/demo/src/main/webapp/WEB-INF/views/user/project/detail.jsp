<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>텀블업 - 크리에이터를 위한 크라우드 펀딩</title>
	<jsp:include page="/WEB-INF/views/user/common/head.jsp"></jsp:include>
    <style>
    	.pointer{
    		cursor: pointer;
    	}
        .main{
            width: 1080px;
            margin: 0 auto;
            margin-bottom: 100px;
        }
        .projectInfo{
            display: flex;
            flex-wrap: wrap;
        }
        .projectInfo.notOpen {
		    margin-top: 100px;
		}
        .projectHeader{
            width: 100%;
            text-align: center;
            margin: 2rem 0;
        }
        .projectTitle{
            margin: 1rem 0;
        }
        .subTitle {
		    margin: 1.5rem 0;
		    font-size: 1.5rem;
		}
        .projectMainImgWrapper{
            width: 660px;
		    height: 490px;
		    overflow: hidden;
		    display: flex;
		    justify-content: center;
        }
        .mainImg{
            width: auto;
        }
        .projectFundingStatus{
            width: auto;
            max-width: 354px;
            margin: 0 0 0 28px;
            flex-grow: 1;
        }
        .projectFundingStatus.notOpen {
		    display: flex;
		    flex-direction: column;
		    justify-content: center;
		}
        .projectCategory a{
            font-size: 0.9rem;
            font-weight: 600;
            padding: 0.6rem;
            color: rgb(117, 117, 117);
            background-color: rgb(250, 250, 250);
            border: 1px solid rgb(239, 239, 239);
            border-radius: 2px;
            text-decoration: none;
        }
        .statusItem{
            margin-bottom: 1rem;
        }
        .statusValue{
            font-size: 2.75rem;
        }
        .statusRate{
        	font-size: 1rem;
        	font-weight: bold;
        }
        .fundingInfo{
            background-color: rgb(250, 250, 250);
            border: 1px solid rgb(239, 239, 239);
            margin: 2rem 0;
            padding: 1rem;
        }
        .fundingInfoHeader{
            font-weight: bold;
            font-size: 1rem;
            margin-bottom: 10px;
        }
        .fundingInfoContent{
            font-size: 0.8rem;
        }
        .projectBtnWrapper{
            text-align: center;
        }
        .join{
            width: 240px;
            height: 50px;
            margin-right: 1rem;
        }
        .like{
            width: 50px;
            height: 50px;
        }

        .contentWrapper{
            display: flex;
            flex-wrap: wrap;
        }
        .contentWrapper .mainColumn{
            max-width: 660px;
            width: auto;
            flex-grow: 1;
        }
        .contentWrapper .subColumn{
            max-width: 354px;
            width: 100%;
            margin-left: 28px;
        }
        .writerWrapper{
            margin-bottom: 20px;
        }
        .writerWrapper>div{
        	padding: 0.5rem 1.5rem;
        }
        .lastLoggedIn, .writerProject {
		    font-size: 0.75rem;
		}
        .reward{
            padding: 0.5rem;
        }
        .reward .btn{
        	border: 3px solid #00000087;
		    border-radius: 15px;
		    padding: 0.25rem 0.5rem;
		    margin: 0 0.2rem;
        }
        .reward .btn:hover{
        }
        .rewardSold {
		    font-size: 0.75rem;
		}
        .rewardPrice {
		    font-size: 1.5rem;
		    font-weight: bold;
		    margin: 0.5rem 0;
		}
		.rewardName {
		    font-weight: bold;
		}
		.rewardDetail {
		    font-size: 0.9rem;
		}
		.rewardDeliveryDate {
			margin-top: 0.5rem;
		    font-size: 0.75rem;
		}
        .extraSupport>div{
            margin-bottom: 1rem;
        }
        .extraComment{
            font-size: 0.8rem;
        }
        .extraSupportBtnWrapper{
            text-align: center;
		    display: flex;
		    flex-grow: 1;
        }
        .submitBtn{
        	width: 100%;
        }
        .projectJoin{
            text-align: center;
        }
        
        .contentNav{
            height: 52px;
            margin: 1rem 0;
            border-top: 1px solid lightgray;
            border-bottom: 1px solid lightgray;
            display: flex;
            align-items: center;
        }
        .contentNav>a{
            padding: 1rem;
            text-decoration: none;
            color: black;
            font-weight: bold;
        }
        
        .contentBox{
            border: 1px solid lightgray;
            margin-bottom: 1rem;
        }
        #writeBtn{
            float: right;
        }
        
        .like{
        	padding: 0;
        }
        .noList{
		    margin-top: 200px;
		    text-align: center;
		    height: 300px;
		    font-size: 3rem;
		    font-weight: bold;
		    color: darkgray;
		}
		.header{
			position: relative;
			display: flex;
			padding: 0.5rem;
		}
		span.manageBtnWrapper{
			position: absolute;
			right: 5px;
			font-size: 0.75rem;
		    color: #4c4c4c;
		}
		.communityBtnWrapper{
			position: relative;
			border: none;
		}
		.communityBtnWrapper>button{
			background-color: lightgray;
		}
		.story{
			padding: 2rem 1.5rem;
		}
		.communityWriteBtn{
			position: absolute;
			right: 0;
		}
		i.bi.bi-chat-dots-fill {
		    margin-right: 0.5rem;
		}
		.postHeader{
			padding: 0.5rem;
		}
		.postWriter, .replyWriter{
			font-weight: bold;
		}
		.postCreated, .replyCreated{
			font-size: 12px;
			color: #616161;
		}
		.postContent{
			padding: 2rem;
		}
		.postReply{
			border-top: 1px solid lightgray;
			padding: 0.5rem 1rem;
		}
		.reply{
        	border-top: 1px solid lightgray;
        }
        .replyHeader{
        	display: flex;
        	align-items: center;
        }
        .replyContent{
        	padding-left: 2.5rem;
        	margin-bottom: 5px;
        }
		.postWriterImg{
			width: 40px;
			height: 40px;
			margin-right: 0.5rem;
		}
		.replyWriterImg{
			margin-right: 0.5rem;
		}
		.bi-heart-fill{
			color: #ff4b4b;
		}
		button.like.btn:hover {
		    background: rgb(0 0 0 / 25%);
		}
		.ck.ck-content{
		    height: 400px;
		}
		.moreList {
		    text-align: center;
		    margin: 2rem 0;
		}
		.moreListBtn{
			background-color: lightgray;
		}
		img.profileImg{
			width: 40px;
		    height: 40px;
		    margin-right: 0.5rem;
		}
		span.writerMark {
	        background-color: lightcoral;
		    color: white;
		    font-size: 10px;
		    padding: 2px 4px;
		    font-weight: bold;
		    margin-left: 0.25rem;
		    border-radius: 20px;
		}
		span.projectCount {
		    font-weight: bold;
		}
		button.btn.comingSoon {
		    width: 100%;
		    color: white;
		    background: lightcoral;
		    font-weight: bold;
		}
    </style>
    <script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"></jsp:include>
	
	<c:set var="writerProfileImg" value="${writer.profileImg==0 ? '/img/default_profile_img.jpg' : '/api/file/'+=writer.profileImg}"/>
	<c:set var="isLoggedIn" value="${member==null ? false : true}"/>
	<c:set var="isOpen" value="${project.isOpen eq 'Y'}" />
	
	<div class="main">
        <div class="projectInfo ${isOpen ? '' : 'notOpen'}">
        	<c:if test="${isOpen}">
	            <div class="projectHeader">
	                <div class="projectCategory">
	                    <a href="list?category=${project.projectCategoryId}"><span>${project.projectCategory}</span></a>
	                </div>
	                <div class="projectTitle"><h1>${project.title}</h1></div>
	                <div class="projectWriter">
	                	<img src="${writerProfileImg}" alt="profileImg" class="profileImg rounded-circle"><a href="${project.memberId}">${project.writerName}</a>
	                </div>
	            </div>
        	</c:if>
            <div class="projectMainImgWrapper">
                <img height="490" class="mainImg" src="/api/file/${project.mainImg}" alt="">
            </div>
            <div class="projectFundingStatus ${isOpen ? '' : 'notOpen'}">
            	<c:if test="${isOpen}">
	                <div class="collected statusItem">
	                    <div class="statusTitle">모인 금액</div>
	                    <div class="statusValue">
	                    	<fmt:formatNumber value="${project.collected}" pattern="#,###"/>원
	                    	<span class="statusRate"><fmt:formatNumber value="${project.rate}" pattern="#,###"/>%</span>
	                    </div>
	                </div>
	                <div class="remainTime statusItem">
	                    <div class="statusTitle">남은 시간</div>
	                    <div class="statusValue">
				        	${project.remainTime}
	                    </div>
	                </div>
	                <div class="sponsor statusItem">
	                    <div class="statusTitle">후원자</div>
	                    <div class="statusValue">${project.sponsor }명</div>
	                </div>
	                <div class="fundingInfo">
	                    <div class="fundingInfoHeader">펀딩 진행중</div>
	                    <div class="fundingInfoContent">
				                      목표 금액인 <fmt:formatNumber value="${project.targetAmount}" pattern="#,###"/>원이 모여야만 결제됩니다.<br>
				                      결제는 <fmt:formatDate value="${project.dateProjectClosed}" pattern="yyyy년 MM월 dd일"/>에 다함께 진행됩니다.
	                    </div>
	                </div>
	                <div class="projectBtnWrapper">
	                    <button class="join btn">프로젝트 밀어주기</button>
	                    <button class="like btn"><i class="bi bi-heart-fill"></i></button>
	                </div>
            	</c:if>
            	<c:if test="${!isOpen}">
            		<div class="projectCategory">
	                    <a href="list?category=${project.projectCategoryId}"><span>${project.projectCategory}</span></a>
	                </div>
	                <div class="projectTitle"><h1>${project.title}</h1></div>
	                <div class="projectWriter">
	                	<img src="${writerProfileImg}" alt="profileImg" class="profileImg rounded-circle"><a href="${project.memberId}">${project.writerName}</a>
	                </div>
            		<div class="subTitle">${project.subTitle}</div>
            		<div><button class='btn comingSoon'>
            			<fmt:formatDate value="${project.dateProjectStarted}" pattern="yyyy년 MM월 dd일 HH시 mm분"/> 공개 예정
            		</button></div>
            	</c:if>
            </div>
        </div>
        <div class="projectContent">
            <div class="contentNav">
                <a href="" id="storyLink">스토리</a>
                <a href="" id="communityLink">커뮤니티 <span class="count"></span></a>
            </div>
            <div class="contentWrapper">
                <div class="mainColumn">
                    <div class="contentBox communityBtnWrapper">
                        <button class="filter communityBtn btn" value="1">모든 게시글</button>
                        <button class="filter communityBtn btn" value="2">창작자 업데이트</button>
                        <button class="communityBtn communityWriteBtn btn">글쓰기</button>
                        <button class="backToCommunity btn">커뮤니티로 돌아가기</button>
                    </div>
                    <div class="content"></div>
                </div>
                <div class="subColumn">
                    <div class="writerWrapper contentBox">
                        <div class="writerInfoHeader">창작자 소개</div>
                        <div class="writerName"><img src="${writerProfileImg}" alt="profileImg" class="profileImg rounded-circle"><a href="${writer.id}">${writer.nickname}</a></div>
                        <div class="writerContent">${writer.profileDetail}</div>
                        <hr>
                        <div class="lastLoggedIn">마지막 로그인 : ${writer.dateLoggedin}</div>
                        <div class="writerProject">
                            <span class="createdProject">진행한 프로젝트 <span class="projectCount">${createdProjectCount}</span></span> / 
                            <span class="joinedProject">밀어준 프로젝트 <span class="projectCount">${joinedProjectCount}</span></span>
                        </div>
                    </div>
                    <div class="rewardWrapper">
                        <div class="rewardHeader">선물 목록</div>
                        <div class="rewardList">
                        	<div class="reward contentBox">
                                <div class="rewardInfo">
                                	<input type="hidden" name="rewardPrice" value="1000">
                                    <div class="rewardPrice">1000원 +</div>
                                    <div class="rewardDetail">선물을 선택하지 않고 밀어만 줍니다.</div>
                                </div>
                            </div>
                        	<c:forEach items="${rewardList}" var="reward">
                        		<div class="reward contentBox">
	                                <div class="rewardInfo">
	                                	<input type="hidden" name="rewardPrice" value="${reward.price}">
	                                    <div class="rewardSold">${reward.maxStock - reward.currentStock}명이 선택</div>
	                                    <div class="rewardPrice">${reward.price}원 +</div>
	                                    <div class="rewardName">${reward.name}</div>
	                                    <div class="rewardDetail">${reward.detail}</div>
	                                    <div class="rewardDeliveryDate">예상 전달일 : ${reward.dateDeliveryEstimated}</div>
	                                </div>
	                            </div>
                        	</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   	</div>
	
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>
	
	<script type="text/template" id="extraSupport">
        <hr>
        <div class="extraSupport">
            <div class="extraTitle">추가 후원금(선택)</div>
            <div class="input">
                <input type="text" class="extraAmount form-control" placeholder="0">
            </div>
            <div class="extraComment">*추가 후원을 하시면 프로젝트 성사가 앞당겨집니다.</div>
            <div class="extraSupportBtnWrapper">
                <button class="extraSupportBtn btn" value="5000">+5천원</button>
                <button class="extraSupportBtn btn" value="10000">+1만원</button>
                <button class="extraSupportBtn btn" value="50000">+5만원</button>
                <button class="extraSupportBtn btn" value="100000">+10만원</button>
            </div>
        </div>
        <div class="projectJoin">
            <button class="btn submitBtn"><span class="totalAmount"></span>원 후원하기</button>
        </div>
    </script>

    <script type="text/template" id="postTemplate">
        <div class="post contentBox">
            <div class="postHeader header">
				<img src="" alt="프로필 이미지" class="profileImg rounded-circle">
				<div style="display: inline-block;">
        		    <div class="postWriter"></div>
        		    <div class="postCreated"></div>
				</div>
			</div>
            <div class="postContent"></div>
            <div class="postReply">
				<div class="replyCount"><i class="bi bi-chat-dots-fill"></i><span></span></div>
				<div class="postReplyForm"></div>
				<div class="replyWrapper"></div>
				<div class="replyPagination"></div>
			</div>
        </div>
    </script>
    
    <script type="text/template" id="replyPaginationTemplate">
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		  </ul>
		</nav>
    </script>
    
    <script type="text/template" id="replyFormTemplate">
		<form id="replyForm">
			<div class="input-group mb-3">
				<input type="text" name="content" id="replyContent" class="form-control" aria-describedby="button-addon2">
				<button class="btn btn-outline-secondary" type="submit" id="replySubmitBtn">등록</button>
			</div>
		</form>
	</script>

	<script type="text/template" id="replyTemplate">
		<div class="reply">
            <div class="replyHeader header">
				<img src="" alt="프로필 이미지" class="profileImg rounded-circle">
				<div style="display: inline-block;">
        		    <div class="replyWriter"></div>
        		    <div class="replyCreated"></div>
				</div>
			</div>
            <div class="replyContent"></div>
        </div>
	</script>
    <script type="text/template" id="postFormTemplate">
        <div class="communityPostForm contentBox">
            <div class="formHeader">게시글 작성하기</div>
            <form action="" id="postForm">
				<input type="hidden" name="id" class="id">
                <textarea name="content" id="content"></textarea>
                <div>
                    <button id="submitBtn" class="btn">올리기</button>
                </div>
            </form>
        </div>
    </script>
    <script type="text/template" id="manageBtnTemplate">
		<span class="manageBtnWrapper">
        	<span class="update pointer">수정</span>
        	<span class="separator"> | </span>
       		<span class="delete pointer">삭제</span>
    	</span>
    </script>
    <script>
	    
    	var loginUser = ${member.id == null ? 0 : member.id};
    	
    	//리워드 엑스트라 
        $(".rewardInfo").on("click", function(){
        	$(".rewardInfo").nextAll().remove();
        	var extraSupport = $($("#extraSupport").html());
            $(this).after(extraSupport);
            
            extraSupport.find(".extraSupportBtn").on("click", function(){
            	var extraAmount = $(".extraAmount").val();
            	extraAmount = extraAmount == "" ? 0 : extraAmount;
            	$(".extraAmount").val(parseInt(extraAmount) + parseInt($(this).val()));
            	$(".extraAmount").trigger("input");
            })
            $(".extraAmount").on("input", function(){
            	var price = this.value;
            	price = price == "" ? 0 : price;
            	$(".totalAmount").text(parseInt(price) + parseInt($(this).parents(".reward").find("input[name=rewardPrice]").val()));
            })
            $(".extraAmount").trigger("input");
        });

        //스토리 불러오기
        $("#storyLink").on("click", function(e){
            e.preventDefault();
            loadingStory();
        });
        //스토리 로딩
        function loadingStory(){
        	$(".communityBtnWrapper").hide();
            $.ajax({
                url: location.href + "/story",
                type: "get",
                data: {},
                success: function(data){
                    $(".content").children().remove();
                    var story = $("<div class='story contentBox'><div>");
                    story.text(data);
                    $(".content").append(story);
                }
            });
        }

        //커뮤니티 버튼 이벤트
        $("#communityLink").on("click", function(e){
            e.preventDefault();
            $(".communityBtnWrapper").show();
            $(".communityBtn").show();
            $(".backToCommunity").hide();
            $(".communityBtn.filter").first().trigger("click");
        });
        
        var category;
        var page;
        var max;
        //커뮤니티 불러오기
        $(".communityBtn.filter").on("click", function(){
            $(".writeBtn").show();
            $(".content").children().remove();
            $(".content").append($($("#communityBtnWrapperTemplate").html()));

            $(".content").append($("<div class='postWrapper'></div>"));
        	category = this.value;
        	page = 1;
            loadingCommunity();
        });
        
        
        //커뮤니티 로딩
        function loadingCommunity(){
        	$.ajax({
                url: location.href + "/community",
                type: "get",
                data: {
                	category : category,
                	page : page
                },
                success: function(data){
					if(data.count == 0){
						$(".postWrapper").append($("<div class='noList'>게시글이 없습니다.</div>"));
						return;
					}
                	if(page==1) max = Math.ceil(data.count/5);
					
					var list = data.list;
                    for(var i=0; i<list.length; i++){
                        var post = $($("#postTemplate").html());
                        post.attr("id", list[i].id);
                        post.find(".profileImg").attr("src", list[i].profileImg==0 ? '/img/default_profile_img.jpg' : '/api/file/' + list[i].profileImg);
                        post.find(".postWriter").text(list[i].nickname);
                        if(isProjectWriter(list[i].memberId)) post.find(".postWriter").append($("<span class='writerMark'>창작자</span>"));
                		post.find(".postCreated").text(list[i].formattedDate);
                        post.find(".postContent").html(list[i].content);
                        post.find(".replyCount>span").text(list[i].replyCount);
                        $(".postWrapper").append(post);
                        
                        post.find(".postContent").on("click", function(){
							readPost($(this).parent().attr("id"));
                        })
                        
                        if(loginUser == list[i].memberId) setManageBtn(post);
                    }
                    
                    if(page<max){
	                    var moreList = $('<div class="moreList"><button class="moreListBtn btn">게시글 더 보기</button></div>');
	                    $(".postWrapper").append(moreList);
                    	
	                  	//커뮤니티 다음 페이지
	                    moreList.on("click", function(){
		                  	page++;
	           	        	loadingCommunity()
	                    	this.remove();
	                    })
                    }
                    
                    $(".postReplyForm").hide();
                }
            });
        }
        
        let editor;
        //커뮤니티 글 작성 폼 생성
        $(".communityWriteBtn").on("click", function(){
        	if(checkLogin()){
	            $(".communityWriteBtn").hide();
	            $(".backToCommunity").show();
	            $(".communityBtn").hide();
	            $(".content").children().remove();
	
	            $(".content").append($($("#postFormTemplate").html()));
	            
	
	    		ClassicEditor
	    			.create( document.querySelector( '#content' ) )
	    			.then( newEditor => {
	    				editor = newEditor;
	    			} )
	    			.catch( error => {
	    				console.error( error );
	    			} );
	            
	            //커뮤니티 글 작성 통신
	            $("#submitBtn").on("click", function(e){
	                e.preventDefault();
	                $.ajax({
	                    url: location.href + "/community",
	                    type: "post",
	                    data: {
	                    	writerId : ${writer.id},
	                    	content : editor.getData()
	                    },
	                    success: function(data){
	                    	$("#communityLink").trigger("click");
	                    	getCount();
	                    }
	                });
	            });
        	}
        });
        $(".backToCommunity").on("click", function(){
            $("#communityLink").trigger("click");
        });
        
        var replyPageMax;
        //커뮤니티 글 읽기
        function readPost(id){
        	$(".backToCommunity").show();
            $(".communityBtn").hide();
            $(".content").children().remove();
            
            $.ajax({
                url: location.href + "/community/" + id,
                type: "get",
                data: {
                },
                success: function(data){
                	$(".content").append($("<div class='postWrapper'></div>"));
                	
                	var post = $($("#postTemplate").html());
                    post.attr("id", data.id);
                    post.find(".profileImg").attr("src", data.profileImg==0 ? '/img/default_profile_img.jpg' : '/api/file/' + data.profileImg);
                    post.find(".postWriter").text(data.nickname);
                    if(isProjectWriter(data.memberId)) post.find(".postWriter").append($("<span class='writerMark'>창작자</span>"));
            		post.find(".postCreated").text(data.formattedDate);
                    post.find(".postContent").html(data.content);
                    post.find(".replyCount").text(data.replyCount + "개의 댓글이 있습니다.");
					post.find(".postReplyForm").append($($("#replyFormTemplate").html()));
					post.find(".replyPagination").append($($("#replyPaginationTemplate").html()));
					
					replyPageMax = Math.ceil(data.replyCount/10);
					
                    if(loginUser == data.memberId) setManageBtn(post);
                    //댓글 작성 
                    post.find("#replyForm").on("submit", function(e){
                        e.preventDefault();
                    	if(checkLogin()){
	                        $.ajax({
	                            url: location.href + "/community",
	                            type: "post",
	                            data: {
	                            	parentId : id,
	                            	writerId : ${writer.id},
	                            	content : $("#replyContent").val()
	                            },
	                            success: function(data){
									readPost(id);
	                            }
	                        });
                    	}
                    });
                    $(".postWrapper").append(post);
                    
                    getReply(id, 1);
                }
            });
        }
        
       	//댓글 불러오기
        function getReply(id, page){
            $.ajax({
                url: location.href + "/community/" + id + "/reply",
                type: "get",
                data: {
					page : page
                },
                success: function(data){
                	var replyWrapper = $(".post").find(".replyWrapper");
                	replyWrapper.empty();
                	for(var i=0; i<data.length; i++){
                		var reply = $($("#replyTemplate").html());
                		reply.attr("id", data[i].id);
                		reply.find(".profileImg").attr("src", data[i].profileImg==0 ? '/img/default_profile_img.jpg' : '/api/file/' + data[i].profileImg);
                		reply.find(".replyWriter").text(data[i].nickname);
                		if(isProjectWriter(data[i].memberId)) reply.find(".replyWriter").append($("<span class='writerMark'>창작자</span>"));
                		reply.find(".replyCreated").text("(" + data[i].formattedDate + ")");
                		reply.find(".replyContent").text(data[i].content);
                		replyWrapper.append(reply);
                		
                        if(loginUser == data[i].memberId) setManageBtn(reply);
                	}
                	if(data.length>0) paintReplyPagination(id, page);
                }
            });
        }
       	//댓글 페이지네이션
       	function paintReplyPagination(id, page){
       		$(".post").find(".pagination").empty();
       		
       		var size = 10;
       		var end = Math.ceil(page/size)*size;
       		var start = end - size + 1;
       		if(end > replyPageMax) end = replyPageMax;
       		
       		var prev = $('<li class="page-item"><a class="page-link" href="" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>');
            prev.find("a").attr("href", (start-1 == 0 ? start : start-1));
       		$(".post").find(".pagination").append(prev);
            for(var i=start; i<=end; i++){
            	var nav = $('<li class="page-item"><a class="page-link" href=""></a></li>');
            	nav.find("a").attr("href", i).text(i);
            	if(i==page) nav.addClass("active");
            	$(".post").find(".pagination").append(nav);
            }
            var next = $('<li class="page-item"><a class="page-link" href="" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>');
            next.find("a").attr("href", (end+1 > replyPageMax ? end : end+1));
            
            $(".post").find(".pagination").append(next);
            $(".page-link").on("click", function(e){
        		e.preventDefault();
        		getReply(id, $(this).attr("href"));
        	})
       	}
        
        //커뮤니티 포스트 개수 불러오기
        function getCount(){
        	$.ajax({
                url: location.href + "/community/count",
                type: "get",
                data: {},
                success: function(data){
					$(".count").text(data);
                }
            });
        }

        //커뮤니티 수정/삭제 버튼 이벤트
        function setManageBtn(ele){
        	var manageBtn = $($("#manageBtnTemplate").html());
			ele.find(".header").append(manageBtn);
			if(ele.hasClass("reply")){
				manageBtn.find(".update").remove();
				manageBtn.find(".separator").remove();
			}
			manageBtn.find(".update").on("click", function(){
				$(".communityWriteBtn").trigger("click");
				$(".formHeader").text("게시글 수정하기");
				$(".id").val(ele.attr("id"));
				//글 내용 가져오기
				$.ajax({
                    url: location.href + "/community/" + ele.attr("id"),
                    type: "get",
                    success: function(data){
						editor.setData(data.content);
                    }
                });
				$("#submitBtn").unbind();
				//수정 통신
				$("#submitBtn").on("click", function(e){
					e.preventDefault();
	                $.ajax({
	                    url: location.origin + "/project/community/" + ele.attr("id"),
	                    type: "put",
	                    data: {
	                    	content : editor.getData()
	                    },
	                    success: function(data){
							readPost(data);
	                    	getCount();
	                    }
	                });
				})
			})
			manageBtn.find(".delete").on("click", function(){
				if(confirm("삭제하시겠습니까?")){
					deleteCommunity(ele, this);
				}
			})
        }
        
        //커뮤니티 삭제 통신
        function deleteCommunity(ele, btn){
        	$.ajax({
				url: location.origin + "/project/community/" + ele.attr("id"),
				type: "delete",
				success: function(){
					if($(btn).parent().parent().parent().hasClass("post")){
						$("#communityLink").trigger("click");
					} else{
						readPost($(btn).parents(".post").attr("id"));
					}
			        getCount();
				}
			});
        }
        
        //좋아요 통신
        function getLike(){
        	$.ajax({
				url: location.href + "/like",
				type: "get",
				success: function(data){
					if(data==1){
						$(".like").html('<i class="bi bi-heart-fill"></i>');
					} else{
						$(".like").html('<i class="bi bi-heart"></i>');
					}
				}
			});
        }
        //좋아요 업데이트
        $(".like").on("click", function(){
        	if(checkLogin()){
	        	$.ajax({
					url: location.href + "/like",
					type: "post",
					success: function(data){
						if(data==1){
							$(".like").html('<i class="bi bi-heart-fill"></i>');
						} else{
							$(".like").html('<i class="bi bi-heart"></i>');
						}
					}
				});
        	}
        })
        
        //프로젝트 밀어주기 클릭시 reward로 스크롤 이동
        $(".join").click(function(){
			document.querySelector(".rewardHeader").scrollIntoView();
        })
		
		function checkLogin(){
        	if(!${isLoggedIn}){
	        	if(confirm("로그인 페이지로 이동합니다.")){
					location.href = "/member/signin";
				}
        	} else{
        		return true;
        	}
        }
        
        function isProjectWriter(id){
        	var writerId = ${writer.id};
        	return writerId == id;
        }
        
        loadingStory();
        getCount();
        getLike();
        
        if(${!isOpen}) $(".projectContent").remove();
    </script>
</body>
</html>