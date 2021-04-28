<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>텁블업</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	var IMP = window.IMP;
	IMP.init("imp20432485");

	function inNumber(){
	  if(event.keyCode<48 || event.keyCode>57){
	     event.returnValue=false;
	  }
	}
	
	function moveFocus(num,here,next){
		 var str = here.value.length;
		 if(str == num)
		    next.focus();
		 }
</script>
<jsp:include page="/WEB-INF/views/user/common/head.jsp"></jsp:include>
<style>
	#reserveInfo input[type=text]{
		width:255px;
		font-size: 19px;
		margin-right:24px;
		margin-top:5px;
	}
	#reserveInfo input[type=text]:focus {
	    outline: none;
	}
	#reserveInfo label{
		font-size: 22px;
		padding-top:10px;
	}
	#cardNum input[type=text]{
		width:80px;
		height:34px;
		margin:0px;
		padding-left:10px;
	}
	#cardNum input[type=password]{
		width:80px;
		height:34px;
		margin:0px;
		padding-left:20px;
		padding-top:4px;
	}
	#receiverAddress1 input[type=text]{
		width:540px;
	}
	#requestForDelivery input[type=text]{
		width:540px;
	}
	#cardRest input[type=text]{
		width:178px;
		margin:0px;
	}
	#cardRest input[type=password]{
		width:178px;
		margin:0px;
	}
	#divH1{
		margin-top:15px;
		margin-bottom:5px;
		text-align:center;
	}
	#divH2{
		margin-top:25px;
		margin-bottom:10px;
	}
	#reserveDiv{
		padding-left:20%;
	}
	#finishBtn {
		border:none;
	    width: 130px;
	    height: 40px;
	    background-color:#F39C12;
	    font-color:black;
	}
	#payingTable td:nth-child(2) {
    	text-align: right
	}
	#payingTable td{
		height:50px;
	}
	#payingTable input[type=text] {
	    border: none;
	    padding-right: 5px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"></jsp:include>
	<section id="reserveInfo">
		<h1 id="divH1">프로젝트 후원하기</h1>
		<div class="container" id="reserveDiv">
			<form>
				<table class="table" id="payingTable" Style="width:550px;">
					<tbody>
						<tr>
							<td colspan="2">
								<h2 id="divH2">리워드 구성</h2>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="text" style="font-size: 25px; width: 100%;" id="rewardName" name="rewardName" value=<%= request.getAttribute("rewardName") %> readonly>
							</td>
						</tr>
						<tr>
							<td>
								<label style="font-size: 15px;">리워드 금액</label>
							</td>
							<td>
								<input type="text" style="font-size: 15px; text-align:right;" id="rewardPrice" name="rewardPrice" value=<%= request.getAttribute("rewardPrice") %>원 readonly>
							</td>
						</tr>
						<tr>
							<td>
								<label style="font-size: 15px;">추가 후원금</label>
							</td>
							<td>
								<input type="text" style="font-size: 15px; text-align:right;" id="additionalBillings" name="additionalBillings" value=<%= request.getAttribute("additionalBillings") %>원 readonly>
							</td>
						</tr>
						<tr>
							<td>
								<label style="font-size: 15px;">최종 결제 금액</label>
							</td>
							<td>
								<input type="text" style="font-size: 15px; text-align:right;" id="reservePrice" name="reservePrice" readonly>
							</td>
						</tr>
					</tbody>
				</table>
				<div>
					<h2 id="divH2">리워드 배송지</h2>
				</div>
				<div>
					<label style="width:280px;">수령인 이름</label>
					<label>수령인 연락처</label>
				</div>
				<div>
					<input type="text" id="receiverName" name="receiverName">
					<input type="text" id="receiverPhone" name="receiverPhone" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				</div>
		  		<div>
					<label>배송지</label>
				</div>
		  		<div id="receiverAddress1">
					<input type="text" id="receiverAddress1" name="receiverAddress1" placeholder="주소">
				</div>
		  		<div>
					<input type="text" style="width:310px;" id="receiverAddress2" name="receiverAddress2" placeholder="상세주소">
					<input type="text" style="width:200px;" id="receiverAddress3" name="receiverAddress3" placeholder="우편번호" >
				</div>
		  		<div>
					<label>배송시 요청사항(선택)</label>
				</div>
		  		<div id="requestForDelivery">
					<input type="text" id="requestForDelivery" name="requestForDelivery">
				</div>
				<div>
					<h2 id="divH2">결제 정보</h2>
				</div>
				<div>
					<label>카드 번호</label>
				</div>
				<div id="cardNum">
					<input id="card_number1" type="text" name="card_number1" maxlength="4" onkeypress="inNumber();" onKeyUp="moveFocus(4,this,this.form.card_number2);">
					<input id="card_number2" type="password" name="card_number2" maxlength="4" onkeypress="inNumber();" onKeyUp="moveFocus(4,this,this.form.card_number3);">
					<input id="card_number3" type="password" name="card_number3" maxlength="4" onkeypress="inNumber();" onKeyUp="moveFocus(4,this,this.form.card_number4);">
					<input id="card_number4" type="text" name="card_number4" maxlength="4" onkeypress="inNumber();" onKeyUp="moveFocus(4,this,this.form.expiry);">
				</div>
				<div>
					<label style="width:178px;">유효기간</label>
					<label style="width:178px;">비밀번호</label>
					<label>생년월일</label>
				</div>
				<div id="cardRest">
					<input id="expiry" type="text" name="expiry" maxlength="4" placeholder="YY/MM(숫자만)" onKeyUp="moveFocus(4,this,this.form.pwd_2digit);" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					<input id="pwd_2digit" type="password" name="pwd_2digit" maxlength="2" placeholder="앞 두자리" onKeyUp="moveFocus(2,this,this.form.birth);" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					<input id="birth" type="text" name="birth" maxlength="6" placeholder="주민등록 앞자리" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				</div>
				<div>
					<br>
					<br>
					<br>
					<h5>약관 동의</h5>
				</div>
				<div>
					<input type="checkbox" name='selectall' onclick='selectAll(this)'><label Style="font-size:15px;">전체 동의하기</label>
					<hr>
					<input type="checkbox" name="ck" onclick='checkSelectAll()'><label Style="font-size:15px;">제 3자에 대한 개인정보 제공 동의</label>
					<br>
					<input type="checkbox" name="ck" onclick='checkSelectAll()'><label Style="font-size:15px;">책임 규정에 대한 동의</label>
				</div>
				<div style="padding-left:20%; padding-top:35px;">
					<input onclick="toComplete();" id="finishBtn" type="button" value="결제 예약하기">
				</div>
			</form>
		</div>
	</section>
	<script>
	$(function(){
		calcPrice();
	});
	
	function toComplete() {
		var billing;
		var regExp = /^\d{2,3}\d{3,4}\d{4}$/;
        // 전화번호 정규식
		if ( $("#receiverName").val() == "" ) {
			alert("수령인 이름을 입력해 주세요");
		}else if ( $("#receiverPhone").val() == "" || !regExp.test($("#receiverPhone").val()) ) {
			alert("수령인 연락처를 정확하게 입력 해주세요");
		}else if ( $("#receiverAddress1").val() == "" && $("#receiverAddress2").val() == "" &&$("#receiverAddress3").val() == "" ) {
			alert("주소를 정확하게 입력 해주세요");
		}else if ( $("#card_number1").val().length+$("#card_number2").val().length+$("#card_number3").val().length+$("#card_number4").val().length != 16 ) {
			alert("카드번호를 정확하게 입력 해주세요");
		}else if( $("#expiry").val().length != 4 ) {
			alert("카드 유효기간을 정확하게 입력 해주세요");
		}else if( $("#birth").val().length != 6 ) {
			alert("생년월일을 정확하게 입력 해주세요");
		}else if ( $("#pwd_2digit").val().length != 2 ) {
			alert("카드 비밀번호를 정확하게 입력 해주세요");
		}else if(!$("input:checked[name=selectall]").is(":checked")){
			alert("약관에 동의해 주세요");
		}else{ // 모든 과정이 만족되었을 경우
			billing = ajaxBilling();
			if(billing){
				ajaxReserve();
				console.log(billing);
				alert("결제가 완료되었습니다");
				window.location.replace("http://www.localhost:9090/");
			} else {
				alert("결제 정보를 정확하게 입력 해주세요");
			}
		}
	}
	
	  function ajaxBilling() {
		  	var result_var;
			var card_number1 = $("#card_number1").val();
			var card_number2 = $("#card_number2").val();
			var card_number3 = $("#card_number3").val();
			var card_number4 = $("#card_number4").val();
			var expiry = $("#expiry").val();
			var birth = $("#birth").val();
			var pwd_2digit = $("#pwd_2digit").val();
			var merchant_uid = <%= request.getAttribute("projectId") %>;
			var customer_uid = <%= request.getAttribute("projectId") %> + "_" + <%= request.getAttribute("projectId") %> + "_"+ $("#cardNo4").val();
			$.ajax({
				url: "/api/billing/token",
				type: "GET",
				data: { card_number1: card_number1,
						card_number2: card_number2,
						card_number3: card_number3,
						card_number4: card_number4,
						expiry: expiry,
						birth: birth,
						pwd_2digit: pwd_2digit,
						customer_uid: customer_uid,
						merchant_uid: merchant_uid
						},
				dataType: "JSON",
				async:false,
				error: function(e){ console.log(e) },
				success: function( result ){
					console.log(result);
					result_var = result;
				}
			});
			return result_var;
		}
		
	  function ajaxReserve() {
			var billingkey = <%= request.getAttribute("projectId") %> + "_" + <%= request.getAttribute("projectId") %> + "_"+ $("#cardNo4").val();
			var additionalBillings = <%= request.getAttribute("additionalBillings") %>;
			var receiverName = $("#receiverName").val();
			var receiverPhone = $("#receiverPhone").val();
			var receiverAddress = $("#receiverAddress1").val()+ "," +$("#receiverAddress2").val()+ "," +$("#receiverAddress3").val();
			var requestForDelivery = $("#requestForDelivery").val();
			var memberId = <%= request.getAttribute("memberId") %>;
			var projectId =<%= request.getAttribute("projectId") %>;
			$.ajax({
				url: "/project/reserve/reserve",
				type: "POST",
				data: { billingkey: billingkey,
						additionalBillings: additionalBillings,
						receiverName: receiverName,
						receiverPhone: receiverPhone,
						receiverAddress: receiverAddress,
						requestForDelivery: requestForDelivery,
						memberId: memberId,
						projectId: projectId
						},
				dataType: "JSON",
				async:false,
				error: function(e){ console.log(e) },
				success: function( result ){
					console.log(result);
				}
			});
		}
		
	  function checkSelectAll()  {
		  // 전체 체크박스
		  const checkboxes 
		    = document.querySelectorAll('input[name="ck"]');
		  // 선택된 체크박스
		  const checked 
		    = document.querySelectorAll('input[name="ck"]:checked');
		  // select all 체크박스
		  const selectAll 
		    = document.querySelector('input[name="selectall"]');
		  
		  if(checkboxes.length === checked.length)  {
		    selectAll.checked = true;
		  }else {
		    selectAll.checked = false;
		  }

		}
		function selectAll(selectAll)  {
		  const checkboxes 
		     = document.getElementsByName('ck');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
		  })
		}
		function calcPrice() {
			var rewardPrice = <%= request.getAttribute("rewardPrice") %>;
			var additionalBillings = <%= request.getAttribute("additionalBillings") %>;
			var result = Number(rewardPrice) + Number(additionalBillings) +"원";
			$("#reservePrice").val(result);
		}
	</script>
	  <jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>
</body>
</html>