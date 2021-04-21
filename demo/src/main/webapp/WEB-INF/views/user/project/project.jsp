<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트 등록</title>
<link rel="stylesheet" type="text/css"
	href="/static/css/registForm.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<script>
	
</script>
</head>
<body>
	<div id="insertForm">
		<!-- 임시저장, 미리보기, 제출하기-->
		<div></div>
		<div id="menubar">
			<span id="menu1">개요</span> <span id="menu2">아티스트</span> <span
				id="menu3">리워드</span> <span id="menu4">프로젝트</span>
		</div>
		<div class="formbox">
			<form id="insertfrm" method="POST" enctype="multipart/form-data" action="/user/project/success">
			<input type="hidden" name="id" value="${projectVo.id }">
            <input type="hidden" name="projectStatusCategoryId" id="statusNum" value="${projectVo.projectStatusCategoryId}">
			<input type="submit" value="전송" id="submitbtn">
				<div id="menu1work">
					<div class="summary">
						<span class="header-info">프로젝트 개요</span>
					</div>
					<div class="summaryForm">

						<div class="summary-info1">
							<div class="summary-leftbox">
								<span class="summary-title-info">프로젝트 제목</span>
							</div>
							<div class="summary-rightbox">
								<input class="summary-title" name="title" type="text"
									maxlength="50" placeholder="50자 내외로 입력해주세요" autocomplete="off">
								<span class="lengthchk">0</span>/50
							</div>
						</div>
						<hr style="width: 1000px; opacity: 0.5" />
						<div class="summary-info2">
							<div class="summary-leftbox">
								<span class="summary-subtitle-info">프로젝트 부제목</span>
							</div>
							<div class="summary-rightbox">
								<input class="summary-subtitle" name="subTitle" type="text"
									maxlength="50" placeholder="50자 내외로 입력해주세요" autocomplete="off">
								<span class="lengthchk2">0</span>/50
							</div>
						</div>
						<hr style="width: 1000px; opacity: 0.5" />
						<!-- 목표 금액 -->
						<div class="summary-info3">
							<div class="summary-leftbox">
								<span class="summary-subtitle-info">목표금액</span>
							</div>
							<div class="summary-rightbox">
								<input class="summary-mount" name="TargetAmount" type="text" value="0"
									autocomplete="off" onkeyup="pricecomma2(0);"> <span
									class="span-design" style="color: black;">원</span>
							</div>
						</div>
						<hr style="width: 1000px; opacity: 0.5" />
						<!-- 썸네일 -->
						<div class="summary-info4">
							<div class="summary-leftbox">
								<span class="summary-thumb-info">프로젝트 썸네일</span>
							</div>
							<div class="summary-rightbox" style="margin-left: 10px;">
								<div class="thumb-box">
									<div class="wrapper">
										<div class="image">
											<img class="image-info" src="" alt="">
										</div>
										<div class="content">
											<div class="icon">
												<i class="fas fa-cloud-upload-alt"></i>
											</div>
											<div class="text-info">
												썸네일을 등록해주세요!
												<p>
													※ 이미지는 가로 400px 세로 300px로 자동조절됩니다.<br> <br> ※
													이미지의 용량은 최대 10mb입니다.
												</p>
											</div>
										</div>
										<div id="cancel-btn">
											<i class="fas fa-times"></i>
										</div>
									</div>
									<button type="button" onclick="defaultBtnActive()" id="custom-btn">사진을
										선택해주세요</button>
									<input id="default-btn" multiple="multiple" name="uploadfile1" type="file" hidden>
								</div>
							</div>
						</div>
						<hr style="width: 1000px; opacity: 0.5" />
						<!-- 프로젝트 요약 -->
						<div class="summary-info5">
							<div class="summary-leftbox">
								<span class="summary-text-info">프로젝트 요약</span>
							</div>
							<div class="summary-rightbox">
								<textarea class="text-summary" name="summary"
									placeholder="요약에 대한 내용을 적어주세요" autocomplete="off"></textarea>
								<div style="margin-left: 520px;">
									<span class="lengthchk3">0</span>/100
								</div>
							</div>
						</div>
						<hr style="width: 1000px; opacity: 0.5" />
						<!-- 프로젝트 카테고리 -->
						<div class="summary-info6">
							<div class="summary-leftbox">
								<span class="summary-category-info">프로젝트 카테고리</span>
							</div>
							<div class="summary-rightbox">
								<select class="summary-category" name="projectCategoryId">
									<option value="">프로젝트 카테고리를 정해주세요</option>
									<option value="1">게임</option>
									<option value="2">공연</option>
									<option value="3">디자인</option>
									<option value="4">만화</option>
									<option value="5">예술</option>
									<option value="6">공예</option>
									<option value="7">사진</option>
									<option value="8">영화·비디오</option>
									<option value="9">푸드</option>
									<option value="10">음악</option>
									<option value="11">패션</option>
								</select>
							</div>
						</div>
						<hr style="width: 1000px; opacity: 0.5" />
						<!-- 해시 태그 -->
						<div class="summary-info7">
							<div class="summary-leftbox">
								<span class="summary-hashtag-info">해시태그</span>
								<p class="pform">해시태그는 10개까지 가능합니다.</p>
								<p class="pform">해시태그는 ,로 구분됩니다</p>
							</div>
							<div class="summary-rightbox">
								<div class="hash-form">
									<input class="summary-hashtag" id="hashtag" name="hashtag"
										value="해시태그는, 다음과같이, 적어주세요" autocomplete="off">
								</div>
								<div class="hash-edit" id="hash-info"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 아티스트 영역 -->
				<div id="menu2work">
					<div class="artist">
						<span class="header-info">창작자 정보</span>
					</div>
					<div class="artistForm">
						<div class="artist-info1">
							<div class="artist-leftbox">
								<span class="artist-profile-info">아티스트 프로필 이미지</span>
								<p class="pform">사람 아이콘 클릭! 클릭!</p>
							</div>
							<div class="artist-rightbox">
								<div id="artist-image-box">
									<div id="noimage">
										<i class="material-icons" name="WRITER_PROFILE_IMG"
											id="ArtimgUpload">person</i>
										<p class="artist-font">프로필을 등록해주세요!</p>
									</div>
									<div id="okimage"
										style="padding: 20px; height: 100%; width: 100%;">
										<img src=""
											style="width: 100%; height: 100%; border-radius: 50%; border: 1px solid black;"
											id="artistimg">
									</div>
								</div>
								<div id="artimgdelete"
									style="margin-top: 24px; display: inline-block;">
									<a href="javascript:void(0)"><i
										class="material-icons person2">person</i></a> <span
										class="artimage-font-change"> 프로필 변경은 왼쪽 아이콘을 클릭하세요</span>
								</div>
								<input type="file" name="uploadfile2" id="artfile"
									multiple="multiple" onchange="loadAImg(this);"
									style="display: none;">
							</div>
						</div>
						<hr style="width: 1000px; opacity: 0.5" />
						<div class="artist-info2">
							<div class="artist-leftbox">
								<span class="artist-name-info">아티스트 이름</span>
							</div>
							<div class="artist-rightbox">
								<input class="artist-name" name="writerName" type="text"
									maxlength="10" autocomplete="off">
							</div>
						</div>
						<hr style="width: 1000px; opacity: 0.5" />
						<!-- <div class="artist-info3">
							<div class="artist-leftbox">
								<span class="artist-intro-info">아티스트 소개</span>
								<p class="pform">자신을 소개해주세요</p>
							</div>
							<div class="artist-rightbox">
								<textarea class="artist-intro" name="writer_intro" rows="3"
									placeholder="자신을 소개해주세요"></textarea>
								<span class="lengthchk4">0</span>/120
							</div>
						</div> -->
						<hr style="width: 1000px; opacity: 0.5" />
						<div class="artist-info4">
							<div class="artist-leftbox">
								<span class="artist-sns-info">아티스트 SNS</span>
							</div>
							<div class="artist-rightbox">
								<div class="buttons">
									<label class="font-label sns1">https://www.facebook.com/</label>
									<input class="artistFacebook" type="text"
										onkeyup="facebook(this.value);" autocomplete="off"> <input
										type="hidden" id="sns-facebook" name="writerSnsFacebook">
									<div class="row">
										<button class="facebook">
											<span><i class="fab fa-facebook-f"></i></span> Facebook
										</button>
									</div>

								</div>
								<div class="buttons">
									<label class="font-label sns2">https://www.instagram.com/</label>
									<input class="artistinstagram" type="text"
										onkeyup="instagram(this.value);" autocomplete="off"> <input
										type="hidden" id="sns-instagram" name="writerSnsInstargram">
									<div class="row">
										<button class="instagram">
											<span><i class="fab fa-instagram"></i></span> Instagram
										</button>
									</div>
								</div>
							</div>
						</div>
						<hr style="width: 1000px; opacity: 0.5" />
						<div class="artist-info5">
							<div class="artist-leftbox">
								<span class="artist-phone-info">아티스트 전화번호</span>
							</div>
							<div class="artist-rightbox">
								<div class="artistphone">
									<div style="margin-top: 15px;">
										<span class="material-icons phone">phone</span> <span
											class="phone-info">전화번호를 적어주세요</span>
									</div>
									<input class="artist-phone" name="writerPhone" type="text"
										value="" autocomplete="off">
								</div>
							</div>
						</div>
						<hr style="width: 1000px; opacity: 0.5" />
						<div class="artist-info6">
							<div class="artist-leftbox">
								<span class="artist-email-info">아티스트 이메일</span>
							</div>
							<div class="artist-rightbox">
								<div class="artistemail">
									<div style="margin-top: 15px;">
										<span class="material-icons email">email</span> <span
											class="email-info1">이메일을 적어주세요</span>
									</div>
									<input class="artist-email" name="writerEmail" type="text"
										value="" autocomplete="off">
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 리워드-->
				<div id="menu3work">
					<div class="reward-info">
						<span class="header-info">선물 구성</span>
					</div>
					<div id="reward">
						<div>
							<span class="reward-add-textinfo1">선물구성 Tip</span>
							<p class="text-pinfo">후원자분들에게 드릴 선물을 입력하세요</p>
						</div>
						<hr style="width: 1160px; opacity: 0.3" />
						<div>
							<span class="reward-add-textinfo2">최소 후원금액</span>
							<p class="text-pinfo" style="line-height: 1.8;">
								1만원대 선물부터 특별한 의미를 담은 10만원 이상 선물까지, 다양한 금액대로 구성하면 성공률이 더욱 높아집니다.
								<br />배송이 필요한 선물의 경우, <span style="color: black">배송비 포함</span>된
								금액으로 작성해주세요.
							</p>

						</div>
						<hr style="width: 1160px; opacity: 0.3" />
						<div>
							<span class="reward-add-textinfo2">선물에 포함된 아이템</span>
							<p class="text-pinfo" style="line-height: 1.8;">
								아이템은 선물에 <span style="color: black">선물에 포함되는 구성 품목</span>을 말합니다.
								이 금액대의 선물을 선택한 후원자에게 어떤 아이템들을 얼마나 전달하실건가요?
							</p>
						</div>
						<!-- 여기가 리워드 추가하는 부분 작성하는 곳 -->
						<div class="itembox-add" id="item-add0">
							<div class="itembox-countinfo">
								<span class="reward-sapn">리워드 #1</span>
							</div>
							<div class="itembox-add-info1">
								<input type="hidden" class="rewarddong" name="itemList[0].Save"
									id="itemisSave0" value="false"> <span
									class="itembox-add-span-design">상품명</span> <input
									class="itembox-add-name" id="item-name0"
									name="itemList[0].Name" type="text">
							</div>
							<div class="itembox-add-info2">
								<span class="itembox-add-span-design" style="margin-left: 15px;">금액</span>
								<input class="itembox-add-price0" id="item-price0"
									name="itemList[0].Price" type="text" value="0"
									onkeyup="pricecomma(0)"> <span
									class="itembox-add-span-design" style="color: black;">원</span>
							</div>
							<div class="itembox-add-info3">
								<div class="itembox-leftbox">
									<span class="itembox-add-span-design"
										style="margin-left: 11px;">상품명 설명</span>
								</div>
								<div class="itembox-rightbox">
									<textarea id="item-ex0" name="itemList[0].Ex"
										class="itembox-add-desc"></textarea>
								</div>
							</div>
							<div class="itembox-add-info4">
								<div class="itembox-leftbox">
									<span class="itembox-add-span-design">옵션</span>
								</div>
								<div class="itembox-rightbox" style="line-height: 40px;">
									<div>
										<input class="optioncheck" name="itemList[0].Option"
											id="itembox-option0-1" type="radio" value="1" checked>
										<label class="itembox-label" for="itembox-option0-1">
											옵션 입력이 필요 없는 리워드입니다. </label>
									</div>
									<div>
										<input class="optioncheck" name="itemList[0].Option"
											id="itembox-option0-2" type="radio" value="2"> <label
											class="itembox-label" for="itembox-option0-2"> 주관식
											옵션이 필요한 리워드입니다.<span
											style="margin-left: 10px; font-size: 13px; opacity: 0.8;">(각인,
												메시지 등)</span>
										</label>
									</div>
									<div class="option-tarea" style="display: none">
										<textarea name="itemList[0]-optarea"
											class="option0-2-desc tarea"></textarea>
									</div>
									<div>
										<input class="optioncheck" name="itemList[0].Option"
											id="itembox-option0-3" type="radio" value="3"> <label
											class="itembox-label" for="itembox-option0-3"> 객관식
											옵션이 필요한 리워드입니다.<span
											style="margin-left: 10px; font-size: 13px; opacity: 0.8;">(사이즈,
												색상 등)</span>
										</label>
									</div>
									<div class="option-multarea"
										style="width: 780px; display: none;">
										<div class="itembox-leftbox"
											style="margin-left: 10px; margin-top: 37px;">
											<textarea id="itemonkey0" name="itemList[0]-opmultarea"
												class="item-option" onkeyup="mulpriview(0)"></textarea>
										</div>
										<div class="itembox-rightbox" style="margin-left: 0px;">
											<span class="option-mul-span" style="margin-left: 20px;">옵션
												미리보기</span>
											<div class="item-option-priview0 privew-design"
												style="margin-bottom: 10px; margin-right: 10px; line-height: 23px;"
												readonly>
												※ Enter를 통해 줄바꿈이 됩니다.<br> ex) 사이즈 또는 색상을 적어주세요<br>
												ex.1)<br> 블랙 - 240mm 5개<br> 화이트 - 240mm 5개
											</div>
										</div>
									</div>

								</div>
							</div>
							<div class="itembox-add-info5">
								<div class="itembox-leftbox">
									<span class="itembox-add-span-design">배송 조건</span>
								</div>
								<div class="itembox-rightbox">
									<input type="checkbox" id="delivery-check0"
										name="itemList[0].delichk" style="margin-left: 7px;">
									<label class="itembox-label" for="delivery-check0">배송을
										위한 주소지가 필요하면 체크해주세요!</label>
								</div>
							</div>
							<!-- 상품 수량 -->
							<div class="itembox-add-info6">
								<div class="itembox-leftbox">
									<span class="itembox-add-span-design">수량</span>
								</div>
								<div class="itembox-rightbox">
									<div class="count-number">
										<span class="count-span">상품의 수량은</span> <input type="number"
											class="reward-count" name="itemList[0].count" min="1"
											value="1"> <span class="count-span">개 입니다.</span>
									</div>
								</div>
							</div>
							<!-- 제한 수량 -->
							<div class="itembox-add-info7">
								<div class="itembox-leftbox">
									<span class="itembox-add-span-design">제한 수량</span>
								</div>
								<div class="itembox-rightbox">
									<div class="limit-number">
										<span class="limit-span">리워드를</span> <input type="number"
											class="countlimit0 countform" name="itemList[0].limit"
											min="1" value="1"> <span class="limit-span">개로
											제한합니다.</span>
									</div>
									<div style="margin-top: 5px;">
										<input class="limitCheck0" name="itemList[0].limitcheck"
											type="checkbox" id="limit-check0" style="margin-left: 7px;"
											onchange="limitnumber(0)"> <label
											class="itembox-label" for="limit-check0">수량에 제한이 없으면
											체크해주세요!</label>
									</div>
								</div>
							</div>
							<!-- 발송시작일 -->
							<div class="itembox-add-info8">
								<div class="itembox-leftbox">
									<span class="itembox-add-span-design">발송 시작일</span>
								</div>
								<div class="itembox-rightbox">
									<select class="year-design cal" name="itemList[0].Year">
										<option value="2021" selected>2021년</option>
										<option value="2022">2022년</option>
										<option value="2023">2023년</option>
									</select> <select class="month-design cal" name="itemList[0].Month"
										style="margin-left: 10px;">
										<option value="01">1월</option>
										<option value="02">2월</option>
										<option value="03">3월</option>
										<option value="04">4월</option>
										<option value="05">5월</option>
										<option value="06">6월</option>
										<option value="07">7월</option>
										<option value="08">8월</option>
										<option value="09">9월</option>
										<option value="10">10월</option>
										<option value="11">11월</option>
										<option value="12">12월</option>
									</select> <select class="day-design cal" name="itemList[0].day"
										style="margin-left: 10px;">
										<option value="05">초(1일 ~ 10일)</option>
										<option value="15">중순(11일 ~ 20일)</option>
										<option value="25">말(21~말일)</option>
									</select> <input type="hidden" name="itemList[0].deliveryDate"
										value="2021-01-01">
								</div>
							</div>
							<!-- 취소하기와 저장버튼 -->
							<div class="itembox-add-info9">
								<div class="itembox-leftbox" style="margin-left: 30px;">
									<button type="button" class="del-design" id="reward-deletebtn0">리워드
										삭제</button>
									<button type="button" class="modify-design" id="reward-modifybtn0">리워드
										수정</button>
								</div>
								<div class="itembox-rightbox">
									<span class="itembox-label" style="font-size: 24px;">※
										작성이 완료되면 반드시 <span style="color: red;">저장</span>해주세요!
										<button type="button" class="savebtn-design" id="reward-savebtn"
											onclick="itemSave(0)">리워드 저장</button>
								</div>
							</div>
						</div>

						<div class="addbtn-design">
							<button type="button" class="items-add-button">
								<i class="material-icons-outlined add-circle"
									style="font-size: 150px;"> add_circle_outline </i>
							</button>
						</div>

						<div
							style="margin-left: auto; margin-right: auto; text-align: center; margin-bottom: 30px; margin-top: 30px;">
							<span class="itembox-label" style="font-size: 24px;"> ※ 위에
								버튼을 클릭하시면 추가로 <span style="color: red;">리워드 상품</span>을 작성할 수
								있습니다.
							</span>
						</div>
					</div>
				</div>
				<!-- 프로젝트 -->
				<div id="menu4work">
					<div class="projectstory">
						<span class="header-info">프로젝트</span>
					</div>
					<div class="stroyForm">
						<div>
							<span class="project-text-info1">프로젝트 Tip</span>
							<p class="text-pinfo">
								1. <span style="color: black;">심사 승인 후</span> , 설정하신 공개일시에 <span
									style="color: black;">프로젝트가 자동 공개되니 신중하게 정해주세요.</span>
							</p>
							<p class="text-pinfo">
								2. 프로젝트 종료일시는 모든 일정을 고려하여 <span style="color: black;">종료
									되는 날짜</span><span style="color: red;">(시작일로부터 최대 100일까지 가능)</span>를
								설정해주세요.
							</p>
							<p class="text-pinfo">3. 프로젝트를 소개하는 영상을 만든다면 더욱 효과적으로 홍보할 수
								있습니다.</p>
							<p class="text-pinfo">
								&nbsp; &nbsp; <span style="color: black;">2~3분 이내의 짧은 영상</span>이
								가장 효과가 좋으며, 배경음악은 저작권에 유의해주세요.
							</p>
							<p class="text-pinfo">4. 스토리를 작성하실 때에는 본문 텍스트와 이미지는 분리해서
								작성해주세요. (통 이미지 사용은 불가합니다.)</p>
							<p class="text-pinfo">5. 프로젝트에 관련되어 확실한 정보를 바탕으로 스토리를 쓰시면,
								신뢰성이 더욱 더 향상됩니다.</p>
						</div>
						<hr style="width: 1050px; opacity: 0.5" />
						<div class="story-info1">
							<div class="story-leftbox">
								<span class="project-date-info">프로젝트 공개 / 종료일</span>
							</div>
							<div class="story-rightbox">
								<div class="story-opendate">
									<div class="startForm">
										<sapn class="start-text">공개일 : &nbsp; </sapn>
										<select id="startyear" class="story-yeardesign">
										</select> <select id="startmonth" class="story-monthdesign"
											style="margin-left: 10px;">
										</select> <select id="startday" class="story-daydesign"
											style="margin-left: 10px;">
										</select>
									</div>
									<div class="endForm">
										<sapn class="end-text">종료일 : &nbsp; </sapn>
										<input type="number" id="endday" min="10" max="100" value="10">
									</div>
									<hr style="width: 450px; opacity: 0.5" />
									<div
										style="text-align: center; margin-top: 15px; line-height: 1.8;">
										<input type="hidden" id="calopenday" value=""
											name="dateProjectStarted"> <span class="day-text">오픈일
											: </span> <span class="openday-text"></span> <br> <input
											type="hidden" id="calendday" value=""
											name="dateProjectClosed"> <span class="day-text">종료일
											: </span> <span class="endday-text"></span>
									</div>
								</div>
							</div>
						</div>
						<hr style="width: 1050px; opacity: 0.5" />
						<div class="story-info2">
							<div class="story-leftbox">
								<span class="project-main-info">프로젝트 썸네일 / 영상</span>
							</div>
							<div class="vimg-rightbox">
								<div class="edit-box">
									<div class="box-img-area story">
										<input type="hidden" id="isIMGorURL" value="0">
										<div id="noImage">
											<i class="material-icons info">info</i> <span
												class="icon-info">등록된 이미지 또는 영상이 없습니다.</span>
										</div>
										<div id="onImage">
											<img src="" id="pmainimg" alt='이미지를 다시 등록해주세요'>
										</div>
										<div id="video-url">
											<div class=video-container>
												<object type="text/html" width="100%" height="100%" data=""
													id="img-url"> </object>
											</div>
										</div>
									</div>
									<input type="file" name="uploadfile3" id="mainfile"
										multiple="multiple" onchange="loadPImg(this);"
										style="display: none;"> <input type="hidden"
										name="mainImg" id="videoURL" value=""> <a
										href="javascript:void(0)" id="pmainimgdelete"
										style="display: inline-block; vertical-align: top; margin-top: 60px;">
										<i class="material-icons">highlight_off</i>
									</a>
									<div class="regibtn">
										<button type="button" class="btn-custom" id="pMainImageUpload"
											style="display: block;">등록하기</button>
									</div>

								</div>

							</div>
						</div>
						<hr style="width: 1050px; opacity: 0.5" />
						<div class="story-info3">
							<div class="story-leftbox">
								<span class="project-story-info">프로젝트 공개 / 종료일</span>
							</div>
							<div class="story-rightbox">
								<div class="storyForm">
									<textarea class="story-custom" name="project_story"></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>

			</form>

		</div>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
		<script type="text/javascript">
			// show hide

			$(function() {
				$("#menu1work").show();
				$("#menu2work").hide();
				$("#menu3work").hide();
				$("#menu4work").hide();

				$("#menu1").click(function() {
					// var scroll = $("#menu1").offset().top + 50;
					// $("html").animate({
					//     scrollTop: 100
					// }, 700);
					$("#menu1work").show(700);
					$("#menu2work").hide();
					$("#menu3work").hide();
					$("#menu4work").hide();

				});

				$("#menu2").click(function() {
					$("#menu1work").hide();
					$("#menu2work").show(700);
					$("#menu3work").hide();
					$("#menu4work").hide();
				})

				$("#menu3").click(function() {
					$("#menu1work").hide();
					$("#menu2work").hide();
					$("#menu3work").show(700);
					$("#menu4work").hide();
				})

				$("#menu4").click(function() {
					$("#menu1work").hide();
					$("#menu2work").hide();
					$("#menu3work").hide();
					$("#menu4work").show(700);
				})
			});
			//글자수 체크 코드
			$(function() {
				$(".summary-title").keyup(function() {
					titlehandle(this);
				});
				$(".summary-subtitle").keyup(function() {
					subtitlehandle(this);
				});
				$(".text-summary").keyup(function() {
					summaryhandle(this);
				});
				$(".artist-intro").keyup(function() {
					introhandle(this);
				});

				//글자수 체크
				function getTextLength(str) {
					var len = 0;

					for (var i = 0; i < str.length; i++) {
						if (escape(str.charAt(i)).length == 6) {
							len += 1;
						} else {
							len += 1;
						}
					}
					return len;
				}
				//title 글자수 체크
				function titlehandle(object) {
					var text = $(object).val();
					var len = text.length;
					if (getTextLength($(".summary-title").val()) > 50) {
						alert("제목은 50자 이하로 적어 주세요.");

						while (getTextLength(text) > 50) {
							len--;
							text = text.substring(0, len);
						}
					}
					$(object).val(text);
					$(".lengthchk").text(getTextLength(text));
				}
				//sub_title 글자수 체크
				function subtitlehandle(object) {
					var text = $(object).val();
					var len = text.length;
					if (getTextLength($(".summary-subtitle").val()) > 50) {
						alert("부제목은 100자 이하로 적어 주세요.");

						while (getTextLength(text) > 50) {
							len--;
							text = text.substring(0, len);
						}
					}
					$(object).val(text);
					$(".lengthchk2").text(getTextLength(text));
				}

				//text-summary 글자수 체크
				function summaryhandle(object) {
					var text = $(object).val();
					var len = text.length;
					if (getTextLength($(".text-summary").val()) > 100) {
						alert("내용은 400자 이하로 적어 주세요.");

						while (getTextLength(text) > 100) {
							len--;
							text = text.substring(0, len);
						}
					}
					$(object).val(text);
					$(".lengthchk3").text(getTextLength(text));
				}

				function introhandle(object) {
					var text = $(object).val();
					var len = text.length;
					if (getTextLength($(".artist-intro").val()) > 120) {
						alert("소개는 120자 이하로 적어 주세요");

						while (getTextLength(text) > 120) {
							len--;
							text = text.substring(0, len);
						}
					}
					$(object).val(text);
					$(".lengthchk4").text(getTextLength(text));
				}

			});
			//목표금액
			function pricecomma2(number) {
				var price = $(".summary-mount").val();
				price = price.replace(/[^0-9]/g, '');
				price = price.replace(/,/g, '');
				$(".summary-mount").val(
						price.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			};
			//해시태그
			$(function() {
				var check = 0;

				//해시태그가 10개가 넘어가면 무효화
				function hashinvaild() {
					var index = $("#hashtag").val().length;
					var input = $("#hashtag").val().substring(0, index - 1);
					$("#hashtag").val(input);
				}
				;

				//해시태그 생성
				function createhash() {
					var input = $("#hashtag").val().split(',');
					var len = input.length;

					if (len > 10) {
						hashinvaild();
						return false;
					}

					$("#hash-info").empty();

					for (var i = 0; i < len; i++) {
						$("#hash-info").append(
								"<span>#" + input[i].trim() + " </span>");
					}

				}
				;

				$("#hashtag").on("input", function() {
					createhash();
				});

				$(function() {
					createhash();
				});

				$("#hashtag").on("click", function() {
					if (check == 0) {
						$("#hashtag").val("");
						check = 1;
					}
				});

			});
			//아티스트 이미지
			$(function() {
				ArtImgUpload();

				$("#ArtimgUpload, #artimgdelete a")
						.on(
								"click",
								function() {
									var input = "";
									input += '<div id="ArtImageArea"><div id="aimageinputarea"><div id="aimagecontentarea"><p>· JPG, JPEG, PNG, GIF, BMP만 업로드가능합니다.</p><p>· 이미지 용량은 10mb 이하로 첨부해주세요.</p><p>· 이미지의 가로 세로 사이즈는<br> 60px로 자동조정됩니다.</p><p>· 이미지의 사이즈를 고려하여 올려주세요.</p></div>';
									input += '<div id="ArtImageShow"><div id="art-noimage" style="margin-top: 20px;"><a href="javascript:ArtImageClick();"><i class="material-icons upgrade">upgrade</i></a><span>프로필을 등록해주세요.</span></div><div id="art-image" style="display: none; width: 100%; height: 100%;"><a href="javascript:ArtImageClick();"><img src="" style="width: 100%; height: 100%;" id="aimg"></a></div></div><div style="clear: both; padding: 0; border: none; margin: 0;"></div></div></div>';
									Swal
											.fire({
												title : '아티스트 프로필 등록',
												html : input,
												confirmButtonText : '닫기',
												willClose : function() {
													if ($("#aimg").attr("src") != "") {
														$("#artistimg")
																.attr(
																		"src",
																		$(
																				"#aimg")
																				.attr(
																						"src"));
													}
													ArtImgUpload();
												}
											});
								});
			});

			function ArtImageClick() {
				var input = $("#artfile");
				input.click();
			}

			function loadAImg(value) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#art-noimage").hide();
					$("#art-image").show();
					$("#aimg").attr("src", e.target.result);
				}

				reader.readAsDataURL(value.files[0]);
			}

			function ArtImgUpload() {
				var image = $("#artfile").val();
				if (image != "") {
					$("#noimage").hide();
					$("#okimage").show();
					$("#artimgdelete").show();
				} else {
					$("#okimage").hide();
					$("#noimage").show();
					$("#artimgdelete").hide();
				}
			}
			//페이스북 + 인스타그램

			$(function() {

				$(".instagram").on("click", function(e) {
					//나중에 input값 받아올 예정
					e.preventDefault(); //form 전송 방지
					var input = $(".artistinstagram").val();
					var instragmOpen = "https://www.instagram.com/" + input;
					window.open(instragmOpen);

				});

				$(".facebook").on("click", function(e) {
					e.preventDefault(e); //form 전송 방지
					var input = $(".artistFacebook").val();
					var facebookOpen = "https://www.facebook.com/" + input;
					window.open(facebookOpen);
				});
			});
			function facebook() {
				var getText = $(".sns1").text();
				var getid = $(".artistFacebook").val();

				$("#sns-facebook").val(getText + getid);
			}
			function instagram() {
				var getText = $(".sns2").text();
				var getid = $(".artistinstagram").val();

				$("#sns-instagram").val(getText + getid);
			}
			//휴대전화 검사식
			$(function() {

				$(".artist-phone")
						.on(
								'keydown',
								function(e) {

									var phone_number = $(this).val().replace(
											/-/gi, '');

									if (phone_number.length >= 11) {
										e.preventDefault();
									}
								})
						.on(
								'blur',
								function() {
									if ($(this).val() == '')
										return;

									var phone_number = $(this).val().replace(
											/-/gi, '');

									if (phone_number != null
											&& phone_number != '') {

										if (phone_number.length == 11
												|| phone_number.length == 10) {

											var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
											if (regExp_ctn.test(phone_number)) {

												phone_number = phone_number
														.replace(
																/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/,
																"$1-$2-$3");
												$(this).val(phone_number);
											} else {
												Swal.fire({
													text : "유효하지 않은 전화번호입니다.",
													position : "center",
													confirmButtonText : "닫기"
												})
												$(this).val("");
												$(this).focus();
											}
										} else {
											Swal.fire({
												text : "유효하지 않은 전화번호입니다.",
												position : "center",
												confirmButtonText : "닫기"
											})
											$(this).val("");
											$(this).focus();
										}
									}
								});
			});
		</script>
		<script>
		//제출버튼 클릭시
		$(function () {
			$("#submitbtn").on("click", function () {
				$("#statusNum").val(2);
				
				var formDate = new FormDate(document.getElementById("insertfrm"));
				
				
			});
		});
		</script>
		<script>
			const wrapper = document.querySelector(".wrapper");
			const defaultBtn = document.querySelector("#default-btn");
			const customBtn = document.querySelector("#custom-btn");
			const cancelBtn = document.querySelector("#cancel-btn i");
			const img = document.querySelector("img");

			function defaultBtnActive() {
				defaultBtn.click();
			}
			defaultBtn.addEventListener("change", function() {
				const file = this.files[0];
				if (file) {
					const reader = new FileReader();
					reader.onload = function() {
						const result = reader.result;
						img.src = result;
						wrapper.classList.add("active");
					}
					cancelBtn.addEventListener("click", function() {
						img.src = "";
						wrapper.classList.remove("active");
					})
					reader.readAsDataURL(file);
				}

			});
		</script>
		<script>
			//리워드 버튼에 관련된 메소드
			var index = 1;
			var count = 1;

			$(".items-add-button")
					.click(
							function() {
								var additembox = '<div class="itembox-add" id="item-add' + index + '"><div class="itembox-countinfo"><span class="reward-sapn">리워드 #'
										+ (index + 1)
										+ '</span></div><div class="itembox-add-info1"><span class="itembox-add-span-design">상품명</span><input class="itembox-add-name" id="item-name' + index + '" name="itembox[ ' + index + '].Name" type="text"></div><div class="itembox-add-info2"><span class="itembox-add-span-design" style="margin-left: 15px;">금액</span><input class="itembox-add-price'
										+ index
										+ '" id="item-price'
										+ index
										+ '" name="itembox['
										+ index
										+ '].Price" type="text" value="0" onkeyup="pricecomma('
										+ index
										+ ')"><span class="itembox-add-span-design" style="color: black;">원</span></div><div class="itembox-add-info3"><div class="itembox-leftbox"><span class="itembox-add-span-design" style="margin-left: 11px;">상품명 설명</span></div><div class="itembox-rightbox"><textarea id="item-ex' + index + '" name="itembox[' + index + '].Ex" class="itembox-add-desc"></textarea></div></div><div class="itembox-add-info4"><div class="itembox-leftbox"><span class="itembox-add-span-design">옵션</span></div><div class="itembox-rightbox" style="line-height: 40px;"><div><input class="optioncheck" name="itemList[' + index + '].Option" id="itembox-option' + index + '-1" type="radio" value="1" checked><label class="itembox-label" for="itembox-option' + index + '-1">옵션 입력이 필요 없는 리워드입니다.</label></div><div><input class="optioncheck"name="itemList[' + index + '].Option" id="itembox-option' + index + '-2" type="radio" value="2"><label class="itembox-label" for="itembox-option' + index + '-2">주관식 옵션이 필요한 리워드입니다.<span style="margin-left: 10px; font-size: 13px; opacity: 0.8; ">(각인, 메시지 등)</span></label></div><div class="option-tarea" style="display:none"><textarea name="item-optarea[' + index + ']" class="option' + index + '-2-desc tarea"></textarea></div><div><input class="optioncheck" name="itemList[' + index + '].Option" id="itembox-option' + index + '-3" type="radio" value="3"><label class="itembox-label" for="itembox-option' + index + '-3">객관식 옵션이 필요한 리워드입니다.<span style="margin-left: 10px; font-size: 13px; opacity: 0.8; ">(사이즈, 색상 등)</span></label></div><div class="option-multarea" style="width: 780px; display:none"><div class="itembox-leftbox" style="margin-left: 10px; margin-top: 37px;"><textarea id="itemonkey'
										+ index
										+ '" name="item-opmultarea['
										+ index
										+ ']" class="item-option" onkeyup="mulpriview('
										+ index
										+ ')"></textarea></div><div class="itembox-rightbox" style="margin-left: 0px;"><span class="option-mul-span" style="margin-left: 20px;">옵션 미리보기</span><div class="item-option-priview' + index + ' privew-design" style="margin-bottom: 10px; margin-right: 10px; line-height: 23px;"readonly>※ Enter를 통해 줄바꿈이 됩니다.<br>ex)사이즈 또는 색상을 적어주세요<br>ex.1)<br>블랙 - 240mm 5개<br>화이트 - 240mm 5개</div></div></div></div></div><div class="itembox-add-info5"><div class="itembox-leftbox"><span class="itembox-add-span-design">배송 조건</span></div><div class="itembox-rightbox"><input type="checkbox" id="delivery-check' + index + '" name="itemList[' + index + '].delichk" style="margin-left: 7px;"><label class="itembox-label" for="delivery-check' + index + '">배송을 위한 주소지가 필요하면 체크해주세요!</label></div></div><div class="itembox-add-info6"><div class="itembox-leftbox"><span class="itembox-add-span-design">수량</span></div><div class="itembox-rightbox"><div class="limit-number"><span class="count-span">상품의 수량은</span><input type="number" class="reward-count" name="itemList[' + index + '].count" min="1" value="1"><span class="count-span">개입니다.</span></div></div></div><div class="itembox-add-info7"><div class="itembox-leftbox"><span class="itembox-add-span-design">제한 수량</span></div><div class="itembox-rightbox"><div class="limit-number"><span class="limit-span">리워드를</span><input type="number" class="countlimit' + index + ' countform" name="itemList[' + index + '].limit" min="1" value="1"><span class="limit-span">개로 제한합니다.</span></div><div style="margin-top: 5px;"><input class="limitCheck'
										+ index
										+ '" type="checkbox" id="limit-check'
										+ index
										+ '" style="margin-left: 7px;" onchange="limitnumber('
										+ index
										+ ')"><label class="itembox-label" for="limit-check' + index + '">수량에 제한이 없으면 체크해주세요!</label></div></div></div><div class="itembox-add-info8"><div class="itembox-leftbox"><span class="itembox-add-span-design">발송시작일</span></div><div class="itembox-rightbox"><select class="year-design cal" name="itemList[' + index + '].Year"><option value="2021" selected>2021년</option><option value="2022">2022년</option><option value="2023">2023년</option></select><select class="month-design cal" name="itemList[' + index + '].Month" style="margin-left: 10px;"><option value="01">1월</option><option value="02">2월</option><option value="03">3월</option><option value="04">4월</option><option value="05">5월</option><option value="06">6월</option><option value="07">7월</option><option value="08">8월</option><option value="09">9월</option><option value="10">10월</option><option value="11">11월</option><option value="12">12월</option></select><select class="day-design cal" name="itemList[' + index + '].day" style="margin-left: 10px;"><option value="05">초(1일~10일)</option><option value="15">중순(11일~20일)</option><option value="25">3월</option></select><input type="hidden" name="itemList[' + index + '].deliveryDate" value="2021-01-01"></div></div><div class="itembox-add-info9"><div class="itembox-leftbox" style="margin-left: 30px;"><button class="del-design" id="reward-deletebtn' + index + '">리워드 삭제</button><button class="modify-design" id="reward-modifybtn' + index + '">리워드 수정</button></div><div class="itembox-rightbox"><span class="itembox-label" style="font-size: 24px;">※ 작성이 완료되면 반드시<span style="color: red;">저장</span>해주세요!<button class="savebtn-design" id="reward-savebtn" onclick="itemSave('
										+ index
										+ ')">리워드 저장</button></div></div></div>';

								$(".addbtn-design").before(additembox);

								var scroll = $(".items-add-button").offset().top - 800;
								$("html").animate({
									scrollTop : scroll
								}, 700);

								index = index + 1;
								count = count + 1;
								
								if (count == 10) {
									$(".items-add-button").css(
											"pointer-events", "none");
									Swal.fire({
										text : "상품 추가는 10개까지만 가능합니다.",
										position : "center",
										confirmButtonText : "닫기"
									});
								}

								//삭제 버튼 후 index와 count 값 1 감소
								$("#reward-deletebtn" + (index - 1)).click(
										function() {

											if (index > 0) {
												$target = $("#item-add"
														+ (index - 1));

												$target.slideUp("normal",
														function() {
															$target.remove();

														})
												index = index - 1;
												count = count - 1;
											}
											if (count < 10) {
												$(".items-add-button").css(
														"pointer-events",
														"auto");
											}
										});

							});
		</script>
		<script>
			//멀티프리뷰 
			function mulpriview(num) {
				var getText = $("#itemonkey" + num).val();
				getText = getText.replace(/(?:\r\n|\r|\n)/g, '<br/>');
				
				if (getText == "") {
					$(".item-option-priview" + num).text(getText) = "";
				} else {
					$(".item-option-priview" + num).html(getText);
				}
			};
			//숫자 천단위로 콤마
			function pricecomma(number) {
				var price = $(".itembox-add-price" + number).val();
				price = price.replace(/[^0-9]/g, '');
				price = price.replace(/,/g, '');
				$(".itembox-add-price" + number).val(
						price.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			};

			//리워드 (상품명, 가격, 설명, 수량) 체크
			function itemdate(index) {

				var date1 = $("#item-name" + index).val();
				var date2 = $("#item-price" + index).val();
				var date3 = $("#item-ex" + index).val();
				var date4 = $("input[name='itemList[" + index + "].count']")
						.val();
				var date5 = $(
						"input[name='itemList[" + index + "].deliveryDate']")
						.val();

				var calCheck = new Date();

				var currentYear = calCheck.getFullYear();
				var currentMonth = calCheck.getMonth() + 1;
				var currentDay = calCheck.getDate();

				if (currentMonth < 10) {
					currentMonth = "0" + currentMonth;
				}
				if (currentDay < 10) {
					currentDay = "0" + currentDay;
				}
				var currentDate = currentYear + "" + currentMonth + ""
						+ currentDay;
				var checkDate = Number(currentDate - date5.replace(/-/gi, ""));
				
				//날짜 체크
				if (checkDate > 0) {
					Swal.fire({
						text : "유효한 발송일이 아닙니다.",
						position : "center",
						confirmButtonText : "닫기",
					})
					return false;
				}

				if (date1 <= 0) {
					Swal.fire({
						text : "상품명을 적어주세요",
						position : "center",
						confirmButtonText : "닫기",
						didClose : function() {
							$("#item-name" + index).focus();
						}
					})
					return false;
				}
				if (date2 <= 0) {
					Swal.fire({
						text : "상품의 가격을 적어주세요",
						position : "center",
						confirmButtonText : "닫기",
						didClose : function() {
							$("#item-price" + index).focus();
						}
					})
					return false;
				}
				if (date3 <= 0) {
					Swal.fire({
						text : "상품 설명을 적어주세요",
						position : "center",
						confirmButtonText : "닫기",
						didClose : function() {
							$("#item-ex" + index).focus();
						}
					})
					return false;
				}
				if (date4 <= 0) {
					Swal.fire({
						text : "상품의 수량을 적어주세요",
						position : "center",
						confirmButtonText : "닫기",
						didClose : function() {
							$("input[name='itemList[" + index + "].count")
									.focus();
						}
					})
					return false;
				}
				return true;
			}

			function itemSave(index) {
				
				if (itemdate(index)) {
					Swal.fire({
						text : "리워드가 저장되었습니다.",
						position : "center",
						confirmButtonText : "닫기"
					})

					$("#item-add" + index).css("pointer-events", "none");
					$("#reward-modifybtn" + index)
							.css("pointer-events", "auto");
					$("#reward-deletebtn" + index)
							.css("pointer-events", "auto");

					$("#reward-modifybtn" + index).click(
							function() {
								$("#item-add" + index).css("pointer-events",
										"auto");
								$("#reward-modifybtn" + index).css(
										"pointer-events", "none");
								Swal.fire({
									text : "원하시는 리워드를 수정해주세요",
									position : "center",
									confirmButtonText : "닫기"
								})
							})

					var test = $("#itemisSave" + index).val("true");

				}
			}
		</script>
		<script>
			// 리워드에서 옵션 선택 시

			$(document).on(
					"change",
					".optioncheck",
					function() {
						var value = $(this).val();
						

						if (value == 2) {
							$(this).parent().next().show();
							$(this).parent().next().next().next().hide();
						} else if (value == 3) {
							$(this).parent().prev().hide();
							$(this).parent().next().show();
						} else {
							$(this).parent().next().next().css("display",
									"none");
							$(this).parent().next().next().next().next().css(
									"display", "none");
						}
					});

			//수량에 제한이 없을 때
			function limitnumber(index) {
				$(document).on("change", ".limitCheck" + index, function() {
					if ($(this).is(":checked")) {
						$(this).parent().prev().hide();
						$(".countlimit" + index).val(-1);
					} else {
						$(this).parent().prev().show();
						$(".countlimit" + index).val(1);
					}
				});
			}

			//배송일 조합
			$(document).on("input", ".cal", function() {

				var year = $(this).parent().children().val(); //년도
				var month = $(this).parent().children().next().val(); //월 
				var day = $(this).parent().children().next().next().val(); //일

				var calDate = year + "-" + month + "-" + day;

				$(this).parent().children().next().next().next().val(calDate);

			});
		</script>
		<script>
			$(function() {
				var startday = new Date();
				var year1 = startday.getFullYear();
				var year2 = startday.getFullYear() + 1;
				var year3 = startday.getFullYear() + 2;

				$("#startyear").append(
						"<option value='" + year1 + "'>" + year1 + "년</option");
				$("#startyear").append(
						"<option value=" + year2 + ">" + year2 + "년</option");
				$("#startyear").append(
						"<option value=" + year3 + ">" + year3 + "년</option");

				calmon();
				calday();
			});

			function calmon() {
				var date = new Date();
				var year = date.getFullYear();
				var month = date.getMonth() + 1;

				var currentyear = $("#startyear").val();
				var currentmonth = $("#startmonth").val();
				var index = 1;
				$("#startmonth").empty();
				if (year == currentyear) {

					while (index < month) {
						$("#startmonth").append(
								"<option value='" + index + "' disabled>"
										+ index + "월</option>");
						index++;
					}
					while (month <= 12) {
						$("#startmonth").append(
								"<option value='" + month + "'>" + month
										+ "월</option>");
						month++;
					}
				} else {
					$("#startmonth").append("<option value='1'>1월</option>");
					$("#startmonth").append("<option value='2'>2월</option>");
					$("#startmonth").append("<option value='3'>3월</option>");
					$("#startmonth").append("<option value='4'>4월</option>");
					$("#startmonth").append("<option value='5'>5월</option>");
					$("#startmonth").append("<option value='6'>6월</option>");
					$("#startmonth").append("<option value='7'>7월</option>");
					$("#startmonth").append("<option value='8'>8월</option>");
					$("#startmonth").append("<option value='9'>9월</option>");
					$("#startmonth").append("<option value='10'>10월</option>");
					$("#startmonth").append("<option value='11'>11월</option>");
					$("#startmonth").append("<option value='12'>12월</option>");
				}
			};
			function calday() {
				var startday = new Date();
				var calyear = startday.getFullYear();
				var calmonth = startday.getMonth() + 1;
				var calday = startday.getDate();

				var currentyear = $("#startyear").val();
				var currentmonth = $("#startmonth").val();

				if (currentyear == null) {
					currentyear = calyear;
				}
				if (currentmonth == null) {
					currentmonth = calmonth;
				}

				$("#startday").empty();

				if (calyear == currentyear && calmonth == currentmonth) {
					var index = 1;
					while (index < calday) {
						$("#startday").append(
								"<option value='" + index + "' disabled>"
										+ index + "일</option>");
						index++;
					}
					if (currentmonth == 1 || currentmonth == 3
							|| currentmonth == 5 || currentmonth == 7
							|| currentmonth == 8 || currentmonth == 10
							|| currentmonth == 12) {
						calday = 31;
					} else if (currentmonth == 4 || currentmonth == 6
							|| currentmonth == 9 || currentmonth == 11) {
						calday = 30;
					} else if (currentmonth == 2 && currentyear % 4 == 0) {
						calday = 29;
					} else {
						calday = 28;
					}
					while (index <= calday) {
						$("#startday").append(
								"<option value='" + index + "'>" + index
										+ "일</option>");
						index++;
					}
				} else {
					$("#startday").append("<option value='1'>1일</option>");
					$("#startday").append("<option value='2'>2일</option>");
					$("#startday").append("<option value='3'>3일</option>");
					$("#startday").append("<option value='4'>4일</option>");
					$("#startday").append("<option value='5'>5일</option>");
					$("#startday").append("<option value='6'>6일</option>");
					$("#startday").append("<option value='7'>7일</option>");
					$("#startday").append("<option value='8'>8일</option>");
					$("#startday").append("<option value='9'>9일</option>");
					$("#startday").append("<option value='10'>10일</option>");
					$("#startday").append("<option value='11'>11일</option>");
					$("#startday").append("<option value='12'>12일</option>");
					$("#startday").append("<option value='13'>13일</option>");
					$("#startday").append("<option value='14'>14일</option>");
					$("#startday").append("<option value='15'>15일</option>");
					$("#startday").append("<option value='16'>16일</option>");
					$("#startday").append("<option value='17'>17일</option>");
					$("#startday").append("<option value='18'>18일</option>");
					$("#startday").append("<option value='19'>19일</option>");
					$("#startday").append("<option value='20'>20일</option>");
					$("#startday").append("<option value='21'>21일</option>");
					$("#startday").append("<option value='22'>22일</option>");
					$("#startday").append("<option value='23'>23일</option>");
					$("#startday").append("<option value='24'>24일</option>");
					$("#startday").append("<option value='25'>25일</option>");
					$("#startday").append("<option value='26'>26일</option>");
					$("#startday").append("<option value='27'>27일</option>");
					$("#startday").append("<option value='28'>28일</option>");
					if (currentmonth == 1 || currentmonth == 3
							|| currentmonth == 5 || currentmonth == 7
							|| currentmonth == 8 || currentmonth == 10
							|| currentmonth == 12) {
						$("#startday")
								.append("<option value='29'>29일</option>");
						$("#startday")
								.append("<option value='30'>30일</option>");
						$("#startday")
								.append("<option value='31'>31일</option>");
					} else if (currentmonth == 4 || currentmonth == 6
							|| currentmonth == 9 || currentmonth == 11) {
						$("#startday")
								.append("<option value='29'>29일</option>");
						$("#startday")
								.append("<option value='30'>30일</option>");
					} else if (currentmonth == 2 && currentyear % 4 == 0) {
						$("#startday")
								.append("<option value='29'>29일</option>");
					}
				}
			};

			$("#startyear").on("input", function() {
				calmon();
			});
			$("#startmonth, #startyear").on("input", function() {
				calday();
			});
			$(function() {
				$("#startyear, #startmonth, #startday, #endday").on("input",
						function() {
							startdate();
							enddate();
						});

				function startdate() {
					var year = $("#startyear").val();
					var month = $("#startmonth").val();
					var day = $("#startday").val();

					var caldate = year + "-" + month + "-" + day;
					$("#calopenday").val(caldate);

					var spandate = year + "년 " + month + "월 " + day + "일";
					$(".openday-text").text(spandate);
				}
				;
				function enddate() {
					var year = $("#startyear").val();
					var month = $("#startmonth").val();
					var day = $("#startday").val();
					var endday = Number($("#endday").val());

					var calstartday = new Date(year, month - 1, day);
					var calendday = new Date(year, month - 1, day);

					calendday.setDate(calendday.getDate() + endday);
					inputendday = calendday.getFullYear() + "-"
							+ (calendday.getMonth() + 1) + "-"
							+ calendday.getDate();
					$("#calendday").val(inputendday);
					calendday = calendday.getFullYear() + "년 "
							+ (calendday.getMonth() + 1) + "월 "
							+ calendday.getDate() + "일";
					$(".endday-text").text(calendday);
				}
				;
			});
		</script>
		<script>
			$(function() {
				$("#pMainImageUpload")
						.on(
								"click",
								function() {
									var input = "";
									input += '<div id="mimagearea"><div id="mimageinputarea"><div id="mimagetabarea"><ul><li class="ontab"><button type="button" class="img-regist-btn">이미지 등록</button></li><li><button type="button" class="url-regist-btn">동영상 URL 등록</button></li></ul></div><div id="mimageimagearea"><div id="mimageimagecontent"><div id="mimageimageshowbox"><input type="hidden" id="isIMG" value="1"><div id="mimagenoimage"><a href="javascript:pmainimgclick();"><i class="material-icons outbox">outbox</i></a></div><div id="mimageimgcontent"><a href="javascript:pmainimgclick();"><img src="" id="mimg" style="width: 100%; height: 100%;"></a></div></div><div id="mimageimagedescbox"><p>사진을 등록해 주세요.</p><p>· 사이즈는 가로: 450px,<br> 세로:350px로 조정됩니다.</p><p>· 최대 10MB 이하의 파일만 업로드해주세요!</p></div></div></div>';
									input += '<div id="mimageurlarea"><div id="mimageurlcontent"><div id="mimageurldescbox"><input type="hidden" id="isURL" value="0"><p>· YouTube 혹은 Vimeo에 등록된 영상의 URL주소를 입력해주세요.</p><p>· URL 입력후 창을 닫으시면 등록된 영상을 확인하실 수 있습니다.</p><p>· 영상은 원본이 삭제되면 재생되지 않을 수 있습니다.</p></div><div id="mimageurlinputbox"><input type="text" class="url-design" id="imgURLinput"><button class="btn-custom2" id="mimageurlbtn">등록하기</button></div></div></div></div></div>';
									Swal
											.fire({
												title : '메인이미지 등록',
												html : input,
												customClass : 'swal-form',
												confirmButtonText : '닫기',
												willClose : function() {
													if ($("#isIMG").val() == 1) {
														if ($("#mimg").attr(
																"src") != "") {
															$("#pmainimg")
																	.attr(
																			"src",
																			$(
																					"#mimg")
																					.attr(
																							"src"));
														}
														$("#isIMGorURL").val(1);
														$("#videoURL").val("");
														$("#img-url").attr(
																"data", "");
														pmainimgload();
													} else {
														if ($("#imgURLinput")
																.val() != "") {
															var url = $(
																	"#imgURLinput")
																	.val()
																	.split("/");
															url = url[url.length - 1];
															$("#img-url")
																	.attr(
																			"data",
																			"//www.youtube.com/embed/"
																					+ url);
															$("#videoURL").val(
																	url);
														}
														$("#mainfile").val("");
														$("#pmainimg").attr(
																"src", "");
														$("#isIMGorURL").val(2);
														pmainimgload();
													}

												}
											});
									$("#mimageimagearea").show();
									$("#mimageurlarea").hide();
									$("#mimageimgcontent").hide();
								});
				//삭제버튼
				$("#pmainimgdelete").on("click", function() {
					$("#mainfile").val("");
					$("#videoURL").val("");
					$("#isIMGorURL").val(0);
					pmainimgload();
				});
				// 프로젝트 메인 썸네일 사진&동영상 등록 메소드입니다.
				$(document).on(
						"click",
						"#mimagetabarea ul li button",
						function() {
							$(".ontab").removeClass("ontab");
							$(this).parent().addClass("ontab");
							if ($("#mimagetabarea ul li:nth-child(1)").is(
									".ontab")) { // 사진등록탭
								$("#mimageurlarea").hide();
								$("#mimageimagearea").show();
								$("#isIMG").val(1);
								$("#isURL").val(0);
							} else { // 동영상 URL 탭
								$("#mimageimagearea").hide();
								$("#mimageurlarea").show();
								$("#isIMG").val(0);
								$("#isURL").val(1);
							}
						});
				$(document).on("click", "#mimageurlbtn", function() {
					alert("등록되었습니다.");
				});
			});
			function pmainimgload() {
				var pvalue = $("#isIMGorURL").val();
				if (pvalue > 0) {
					$("#noImage").hide();
					$("#onImage").hide();
					$("#video-url").hide();
					if (pvalue == 1) { //이미지가 등록되었다면
						$("#onImage").show();
					} else if (pvalue == 2) { //동영상이 등록되었다면
						$("#video-url").show();
					}
					$("#pmainimgdelete").show();
				} else { //삭제버튼을 클릭했을시 작동
					$("#onImage").hide();
					$("#video-url").hide();
					$("#noImage").show();
					$("#pmainimgdelete").hide();
				}
			}
			pmainimgload();
			function pmainimgclick() {
				var input = $("#mainfile");
				input.click();
			};

			function loadPImg(value) { //이미지 읽어오는 곳
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#mimagenoimage").hide();
					$("#mimageimgcontent").show();
					$("#mimg").attr("src", e.target.result);
				}
				reader.readAsDataURL(value.files[0]);
			}

			$(function() {
				var pMainImg = '${project.mainImg}';
				if (pMainImg != "") {
					$("#noImage").hide();
					$("#onImage").hide();
					$("#video-url").hide();
					if (pMainImg.includes('main')) { // 사진부분
						$("#onImage").show();
						$("#pmainimg").attr(
								"src",
								"resources/images/projectImg/mainImg/"
										+ pMainImg);
					} else { // 영상부분
						$("#video-url").show();
						$("#img-url").attr("data",
								"//www.youtube.com/embed/" + pMainImg);
					}
					$("#pmainimgdelete").show();
				}
				;
			});
		</script>
</body>
</html>