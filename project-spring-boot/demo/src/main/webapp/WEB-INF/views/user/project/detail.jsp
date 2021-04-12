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
    <title>Document</title>
	<jsp:include page="/WEB-INF/views/user/common/head.jsp"></jsp:include>
    <style>
        .main{
            width: 1080px;
            margin: 0 auto;
        }
        .projectInfo{
            display: flex;
            flex-wrap: wrap;
        }
        .projectHeader{
            width: 100%;
            text-align: center;
            margin: 2rem 0;
        }
        .projectTitle{
            margin: 1rem 0;
        }
        .projectMainImgWrapper{
            width: 660px;
            height: auto;
        }
        .mainImg{
            width: 100%;
        }
        .projectFundingStatus{
            width: auto;
            max-width: 354px;
            margin: 0 0 0 28px;
            flex-grow: 1;
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
        .rewardWrapper{
        
        }
        .reward{
            padding: 0.5rem;
        }
        .extraSupport>div{
            margin-bottom: 1rem;
        }
        .extraComment{
            font-size: 0.8rem;
        }
        .extraSupportBtnWrapper{
            text-align: center;
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
            padding: 1rem;
            border: 1px solid lightgray;
            margin-bottom: 1rem;
        }
        #writeBtn{
            float: right;
        }
        .reply{
        	border: 1px solid lightgray;
        }
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"></jsp:include>
	<div class="main">
        <div class="main">
        <div class="projectInfo">
            <div class="projectHeader">
                <div class="projectCategory">
                    <a href="list?category=${project.projectCategoryId}"><span>${project.projectCategory}</span></a>
                </div>
                <div class="projectTitle"><h1>${project.title}</h1></div>
                <div class="projectWriter">
                	<a href="${project.memberId}">${project.writerName}</a>
                </div>
            </div>
            <div class="projectMainImgWrapper">
                <img height="490" class="mainImg" src="http://127.0.0.1:9090/api/file/${project.mainImg}" alt="">
            </div>
            <div class="projectFundingStatus">
                <div class="collected statusItem">
                    <div class="statusTitle">모인 금액</div>
                    <div class="statusValue">
                    	<fmt:formatNumber value="${project.collected == null ? 0 : project.collected}" pattern="#,###"/>원
                    	<span class="statusRate"><fmt:formatNumber value="${project.rate == null ? 0 : project.rate}" pattern="#,###"/>%</span>
                    </div>
                </div>
                <div class="remainTime statusItem">
                    <div class="statusTitle">남은 시간</div>
                    <div class="statusValue">
                    	<c:if test="${project.remainDay > 0}">
				        	${project.remainDay}일
			        	</c:if>
			        	<c:if test="${project.remainDay == 0}">
				        	${project.remainHour}시간
			        	</c:if>
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
                    <button class="like btn">좋아</button>
                </div>
            </div>
        </div>
        <div class="projectContent">
            <div class="contentNav">
                <a href="" id="storyLink">스토리</a>
                <a href="" id="communityLink">커뮤니티</a>
                <a href="" id="">펀딩 안내</a>
            </div>
            <div class="contentWrapper">
                <div class="mainColumn">
                    <div class="contentBox communityBtnWrapper">
                        <div>
                            <button class="filter communityBtn btn" value="1">모든 게시글</button>
                            <button class="filter communityBtn btn" value="2">창작자 업데이트</button>
	                        <button class="communityBtn communityWriteBtn btn">글쓰기</button>
	                        <button class="backToCommunity btn">커뮤니티로 돌아가기</button>
                        </div>
                    </div>
                    <div class="content"></div>
                </div>
                <div class="subColumn">
                    <div class="writerWrapper contentBox">
                        <div class="writerInfoHeader">창작자 소개</div>
                        <div class="writerName">${writer.nickname}</div>
                        <div class="writerContent">작성자 소개입니다.</div>
                        <hr>
                        <div class="lastLoggedIn">마지막 로그인 : ${writer.dateLoggedin}</div>
                        <div class="writerProject">
                            <span class="createdProject">진행한 프로젝트 ?</span> / 
                            <span class="joinedProject">밀어준 프로젝트 ?</span>
                        </div>
                    </div>
                    <div class="rewardWrapper">
                        <div class="rewardHeader">선물 목록</div>
                        <div class="rewardList">
                        	<div class="reward contentBox">
                                <div class="rewardInfo">
                                    <div class="rewardPrice">1000원 +</div>
                                    <div class="rewardDetail">선물을 선택하지 않고 밀어만 줍니다.</div>
                                </div>
                            </div>
                        	<c:forEach items="${rewardList}" var="reward">
                        		<div class="reward contentBox">
	                                <div class="rewardInfo">
	                                    <div class="rewardSold">${reward.maxStock - reward.currentStock}명이 선택</div>
	                                    <div class="rewardPrice">${reward.price}원 +</div>
	                                    <div class="rewardName">선물 : ${reward.name}</div>
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
    </div>
	
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>
	
	<script type="text/template" id="extraSupport">
        <hr>
        <div class="extraSupport">
            <div class="extraTitle">
                추가 후원금(선택)
            </div>
            <div class="input">
                <input type="text" placeholder="0">
            </div>
            <div class="extraComment">
                *추가 후원을 하시면 프로젝트 성사가 앞당겨집니다.
            </div>
            <div class="extraSupportBtnWrapper">
                <button class="extraSupportBtn btn">+5천원</button>
                <button class="extraSupportBtn btn">+1만원</button>
                <button class="extraSupportBtn btn">+5만원</button>
                <button class="extraSupportBtn btn">+10만원</button>
            </div>
        </div>
        <div class="projectJoin">
            <button class="btn">프로젝트 후원하기</button>
        </div>
    </script>

    <script type="text/template" id="postTemplate">
        <div class="post contentBox">
            <div class="postHeader"></div>
            <div class="postCreated"></div>
            <div class="postContent"></div>
            <div class="postReply">
				<div class="replyCount"></div>
				<div class="postReplyForm">
					<form action="" id="replyForm">
						<input type="text" name="content" id="content">
						<button class="btn" id="replySubmitBtn">댓글 쓰기</button>
					</form>
				</div>
				<div class="replyWrapper"></div>
			</div>
        </div>
    </script>

	<script type="text/template" id="replyTemplate">
		<div class="reply">
            <div class="replyHeader"></div>
            <div class="replyCreated"></div>
            <div class="replyContent"></div>
        </div>
	</script>
    <script type="text/template" id="postFormTemplate">
        <div class="communityPostForm contentBox">
            <div class="fromHeader">게시글 작성하기</div>
            <form action="" id="postForm">
                <textarea name="content" id="content" cols="30" rows="10"></textarea>
                <div>
                    <button id="submitBtn" class="btn">올리기</button>
                </div>
            </form>
        </div>
    </script>
    <script>
    	var rootUrl = location.href;
    	//리워드 클릭 시 엑스트라 인포 열고 닫기
        $(".rewardInfo").on("click", function(){
            if($(this).parent().children().length == 1){
                $(this).after($($("#extraSupport").html()));
            } else{
                $(this).nextAll().remove();
            }
        });

        //스토리 불러오기
        $("#storyLink").on("click", function(e){
            e.preventDefault();
            loadingStory();
        });
        function loadingStory(){
        	$(".communityBtnWrapper").hide();
            $.ajax({
                url: rootUrl + "/story",
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
        //커뮤니티 불러오기
        $(".communityBtn.filter").on("click", function(){
        	$.ajax({
                url: rootUrl + "/community",
                type: "get",
                data: {
                	category : this.value
                },
                success: function(data){
                    $(".writeBtn").show();
                    $(".content").children().remove();
                    $(".content").append($($("#communityBtnWrapperTemplate").html()));

                    $(".content").append($("<div class='postWrapper'></div>"));
                    for(var i=0; i<data.length; i++){
                        var post = $($("#postTemplate").html());
                        post.attr("id", data[i].id);
                        post.find(".postHeader").text(data[i].nickname);
                        post.find(".postCreated").text(data[i].dateCreated);
                        post.find(".postContent").text(data[i].content);
                        post.find(".replyCount").text(data[i].replyCount + "개의 댓글이 있습니다.");
                        $(".postWrapper").append(post);
                        
                        post.on("click", function(){
							readPost(this.id);
                        })
                    }
                    $(".postReplyForm").hide();
                }
            });
        });
        
        //커뮤니티 글 작성 폼 생성
        $(".communityWriteBtn").on("click", function(){
            $(this).hide();
            $(".backToCommunity").show();
            $(".communityBtn").hide();
            $(".content").children().remove();

            $(".content").append($($("#postFormTemplate").html()));
            
            //커뮤니티 글 작성 통신
            $("#submitBtn").on("click", function(e){
                e.preventDefault();
                $.ajax({
                    url: rootUrl + "/community",
                    type: "post",
                    data: {
                    	writerId : ${writer.id},
                    	content : $("#content").val()
                    },
                    success: function(data){
                    	$("#communityLink").trigger("click");
                    }
                });
            });
        });
        $(".backToCommunity").on("click", function(){
            $("#communityLink").trigger("click");
        });
        
        //커뮤니티 글 읽기
        function readPost(id){
        	$(".backToCommunity").show();
            $(".communityBtn").hide();
            $(".content").children().remove();
            
            $.ajax({
                url: rootUrl + "/community/" + id,
                type: "get",
                data: {
                },
                success: function(data){
                	$(".content").append($("<div class='postWrapper'></div>"));
                	
                	var post = $($("#postTemplate").html());
                    post.attr("id", data.id);
                    post.find(".postHeader").text(data.nickname);
                    post.find(".postCreated").text(data.dateCreated);
                    post.find(".postContent").text(data.content);
                    post.find(".replyCount").text(data.replyCount + "개의 댓글이 있습니다.");
                    
                    //댓글 작성 
                    post.find("#replySubmitBtn").on("click", function(e){
                        e.preventDefault();
                        $.ajax({
                            url: rootUrl + "/community",
                            type: "post",
                            data: {
                            	parentId : id,
                            	writerId : ${writer.id},
                            	content : $("#content").val()
                            },
                            success: function(data){
								readPost(id);
                            }
                        });
                    });
                    
                    //댓글 불러오기
                    $.ajax({
                        url: this.url + "/reply",
                        type: "get",
                        data: {},
                        success: function(data){
                        	var replyWrapper = post.find(".replyWrapper");
                        	for(var i=0; i<data.length; i++){
                        		var reply = $($("#replyTemplate").html());
                        		reply.find(".replyHeader").text(data[i].nickname);
                        		reply.find(".replyCreated").text(data[i].dateCreated);
                        		reply.find(".replyContent").text(data[i].content);
                        		replyWrapper.append(reply);
                        	}
                        }
                    });
                    
                    
                    $(".postWrapper").append(post);
                }
            });
        }
        
        
        loadingStory();
    </script>
</body>
</html>