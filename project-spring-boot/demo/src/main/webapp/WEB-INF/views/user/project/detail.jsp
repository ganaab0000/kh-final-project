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
    	.pointer{
    		cursor: pointer;
    	}
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
		}
		span.manageBtnWrapper{
			position: absolute;
			right: 5px;
			font-size: 0.75rem;
		    color: #4c4c4c;
		}
		.communityBtnWrapper{
			position: relative;
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
                    <button class="like btn"><i class="bi bi-heart-fill"></i></button>
                </div>
            </div>
        </div>
        <div class="projectContent">
            <div class="contentNav">
                <a href="" id="storyLink">스토리</a>
                <a href="" id="communityLink">커뮤니티 <span class="count"></span></a>
                <a href="" id="">펀딩 안내</a>
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
            <div class="postHeader header">
				<span class="postWriterImg"><i class="bi bi-person-circle" style="font-size: 40px;"></i></span>
				<div style="display: inline-block;">
        		    <div class="postWriter"></div>
        		    <div class="postCreated"></div>
				</div>
			</div>
            <div class="postContent"></div>
            <div class="postReply">
				<div class="replyCount"><i class="bi bi-chat-dots-fill"></i><span></span></div>
				<div class="postReplyForm">
					<form id="replyForm">
						<div class="input-group mb-3">
  							<input type="text" name="content" id="replyContent" class="form-control" aria-describedby="button-addon2">
  							<button class="btn btn-outline-secondary" type="button" id="replySubmitBtn">등록</button>
						</div>
					</form>
				</div>
				<div class="replyWrapper"></div>
			</div>
        </div>
    </script>

	<script type="text/template" id="replyTemplate">
		<div class="reply">
            <div class="replyHeader header">
				<span class="replyWriterImg"><i class="bi bi-person-circle" style="font-size: 30px;"></i></span>
				<span class="replyWriter"></span>
        		<span class="replyCreated"></span>			
			</div>
            <div class="replyContent"></div>
        </div>
	</script>
    <script type="text/template" id="postFormTemplate">
        <div class="communityPostForm contentBox">
            <div class="formHeader">게시글 작성하기</div>
            <form action="" id="postForm">
				<input type="hidden" name="id" class="id">
                <textarea name="content" id="content" cols="30" rows="10"></textarea>
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
                    
					if(data.length == 0) $(".postWrapper").append($("<div class='noList'>게시글이 없습니다.</div>"));
					
                    for(var i=0; i<data.length; i++){
                        var post = $($("#postTemplate").html());
                        post.attr("id", data[i].id);
                        post.find(".postWriter").text(data[i].nickname);
                        post.find(".postCreated").text(data[i].dateCreated);
                        post.find(".postContent").text(data[i].content);
                        post.find(".replyCount>span").text(data[i].replyCount);
                        $(".postWrapper").append(post);
                        
                        post.find(".postContent").on("click", function(){
							readPost($(this).parent().attr("id"));
                        })
                        
                        if(loginUser == data[i].memberId) setManageBtn(post);
                    }
                    
                    $(".postReplyForm").hide();
                }
            });
        });
        
        //커뮤니티 글 작성 폼 생성
        $(".communityWriteBtn").on("click", function(){
            $(".communityWriteBtn").hide();
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
                    	getCount();
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
                    post.find(".postWriter").text(data.nickname);
                    post.find(".postCreated").text(data.dateCreated);
                    post.find(".postContent").text(data.content);
                    post.find(".replyCount").text(data.replyCount + "개의 댓글이 있습니다.");
                    
                    if(loginUser == data.memberId) setManageBtn(post);
                    //댓글 작성 
                    post.find("#replySubmitBtn").on("click", function(e){
                        e.preventDefault();
                        $.ajax({
                            url: rootUrl + "/community",
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
                        		reply.attr("id", data[i].id);
                        		reply.find(".replyWriter").text(data[i].nickname);
                        		reply.find(".replyCreated").text("(" + data[i].dateCreated + ")");
                        		reply.find(".replyContent").text(data[i].content);
                        		replyWrapper.append(reply);
                        		
		                        if(loginUser == data[i].memberId) setManageBtn(reply);
                        	}
                        }
                    });
                    
                    $(".postWrapper").append(post);
                }
            });
        }
        
        //커뮤니티 포스트 개수 불러오기
        function getCount(){
        	$.ajax({
                url: rootUrl + "/community/count",
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
                    url: rootUrl + "/community/" + ele.attr("id"),
                    type: "get",
                    data: {
                    	content : $("#content").val()
                    },
                    success: function(data){
                    	$("#content").val(data.content);
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
	                    	content : $("#content").val()
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
				url: rootUrl + "/like",
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
        	$.ajax({
				url: rootUrl + "/like",
				type: "post",
				success: function(data){
					if(data==1){
						$(".like").html('<i class="bi bi-heart-fill"></i>');
					} else{
						$(".like").html('<i class="bi bi-heart"></i>');
					}
				}
			});
        })
        loadingStory();
        getCount();
        getLike();
    </script>
</body>
</html>