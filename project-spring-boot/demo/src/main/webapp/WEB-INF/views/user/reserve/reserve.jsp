<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Ӻ��</title>
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
		<h1 id="divH1">������Ʈ �Ŀ��ϱ�</h1>
		<div class="container" id="reserveDiv">
			<form>
				<table class="table" id="payingTable" Style="width:550px;">
					<tbody>
						<tr>
							<td colspan="2">
								<h2 id="divH2">������ ����</h2>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="text" style="font-size: 25px; width: 100%;" id="rewardName" name="rewardName" value=<%= request.getAttribute("rewardName") %> readonly>
							</td>
						</tr>
						<tr>
							<td>
								<label style="font-size: 15px;">������ �ݾ�</label>
							</td>
							<td>
								<input type="text" style="font-size: 15px; text-align:right;" id="rewardPrice" name="rewardPrice" value=<%= request.getAttribute("rewardPrice") %>�� readonly>
							</td>
						</tr>
						<tr>
							<td>
								<label style="font-size: 15px;">�߰� �Ŀ���</label>
							</td>
							<td>
								<input type="text" style="font-size: 15px; text-align:right;" id="additionalBillings" name="additionalBillings" value=<%= request.getAttribute("additionalBillings") %>�� readonly>
							</td>
						</tr>
						<tr>
							<td>
								<label style="font-size: 15px;">���� ���� �ݾ�</label>
							</td>
							<td>
								<input type="text" style="font-size: 15px; text-align:right;" id="reservePrice" name="reservePrice" readonly>
							</td>
						</tr>
					</tbody>
				</table>
				<div>
					<h2 id="divH2">������ �����</h2>
				</div>
				<div>
					<label style="width:280px;">������ �̸�</label>
					<label>������ ����ó</label>
				</div>
				<div>
					<input type="text" id="receiverName" name="receiverName">
					<input type="text" id="receiverPhone" name="receiverPhone" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				</div>
		  		<div>
					<label>�����</label>
				</div>
		  		<div id="receiverAddress1">
					<input type="text" id="receiverAddress1" name="receiverAddress1" placeholder="�ּ�">
				</div>
		  		<div>
					<input type="text" style="width:310px;" id="receiverAddress2" name="receiverAddress2" placeholder="���ּ�">
					<input type="text" style="width:200px;" id="receiverAddress3" name="receiverAddress3" placeholder="�����ȣ" >
				</div>
		  		<div>
					<label>��۽� ��û����(����)</label>
				</div>
		  		<div id="requestForDelivery">
					<input type="text" id="requestForDelivery" name="requestForDelivery">
				</div>
				<div>
					<h2 id="divH2">���� ����</h2>
				</div>
				<div>
					<label>ī�� ��ȣ</label>
				</div>
				<div id="cardNum">
					<input id="card_number1" type="text" name="card_number1" maxlength="4" onkeypress="inNumber();" onKeyUp="moveFocus(4,this,this.form.card_number2);">
					<input id="card_number2" type="password" name="card_number2" maxlength="4" onkeypress="inNumber();" onKeyUp="moveFocus(4,this,this.form.card_number3);">
					<input id="card_number3" type="password" name="card_number3" maxlength="4" onkeypress="inNumber();" onKeyUp="moveFocus(4,this,this.form.card_number4);">
					<input id="card_number4" type="text" name="card_number4" maxlength="4" onkeypress="inNumber();" onKeyUp="moveFocus(4,this,this.form.expiry);">
				</div>
				<div>
					<label style="width:178px;">��ȿ�Ⱓ</label>
					<label style="width:178px;">��й�ȣ</label>
					<label>�������</label>
				</div>
				<div id="cardRest">
					<input id="expiry" type="text" name="expiry" maxlength="4" placeholder="YY/MM(���ڸ�)" onKeyUp="moveFocus(4,this,this.form.pwd_2digit);" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					<input id="pwd_2digit" type="password" name="pwd_2digit" maxlength="2" placeholder="�� ���ڸ�" onKeyUp="moveFocus(2,this,this.form.birth);" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					<input id="birth" type="text" name="birth" maxlength="6" placeholder="�ֹε�� ���ڸ�" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				</div>
				<div>
					<br>
					<br>
					<br>
					<h5>��� ����</h5>
				</div>
				<div>
					<input type="checkbox" name='selectall' onclick='selectAll(this)'><label Style="font-size:15px;">��ü �����ϱ�</label>
					<hr>
					<input type="checkbox" name="ck" onclick='checkSelectAll()'><label Style="font-size:15px;">�� 3�ڿ� ���� �������� ���� ����</label>
					<br>
					<input type="checkbox" name="ck" onclick='checkSelectAll()'><label Style="font-size:15px;">å�� ������ ���� ����</label>
				</div>
				<div style="padding-left:20%; padding-top:35px;">
					<input onclick="toComplete();" id="finishBtn" type="button" value="���� �����ϱ�">
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
        // ��ȭ��ȣ ���Խ�
		if ( $("#receiverName").val() == "" ) {
			alert("������ �̸��� �Է��� �ּ���");
		}else if ( $("#receiverPhone").val() == "" || !regExp.test($("#receiverPhone").val()) ) {
			alert("������ ����ó�� ��Ȯ�ϰ� �Է� ���ּ���");
		}else if ( $("#receiverAddress1").val() == "" && $("#receiverAddress2").val() == "" &&$("#receiverAddress3").val() == "" ) {
			alert("�ּҸ� ��Ȯ�ϰ� �Է� ���ּ���");
		}else if ( $("#card_number1").val().length+$("#card_number2").val().length+$("#card_number3").val().length+$("#card_number4").val().length != 16 ) {
			alert("ī���ȣ�� ��Ȯ�ϰ� �Է� ���ּ���");
		}else if( $("#expiry").val().length != 4 ) {
			alert("ī�� ��ȿ�Ⱓ�� ��Ȯ�ϰ� �Է� ���ּ���");
		}else if( $("#birth").val().length != 6 ) {
			alert("��������� ��Ȯ�ϰ� �Է� ���ּ���");
		}else if ( $("#pwd_2digit").val().length != 2 ) {
			alert("ī�� ��й�ȣ�� ��Ȯ�ϰ� �Է� ���ּ���");
		}else if(!$("input:checked[name=selectall]").is(":checked")){
			alert("����� ������ �ּ���");
		}else{ // ��� ������ �����Ǿ��� ���
			billing = ajaxBilling();
			if(billing){
				ajaxReserve();
				console.log(billing);
				alert("������ �Ϸ�Ǿ����ϴ�");
				window.location.replace("http://www.localhost:9090/");
			} else {
				alert("���� ������ ��Ȯ�ϰ� �Է� ���ּ���");
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
		  // ��ü üũ�ڽ�
		  const checkboxes 
		    = document.querySelectorAll('input[name="ck"]');
		  // ���õ� üũ�ڽ�
		  const checked 
		    = document.querySelectorAll('input[name="ck"]:checked');
		  // select all üũ�ڽ�
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
			var result = Number(rewardPrice) + Number(additionalBillings) +"��";
			$("#reservePrice").val(result);
		}
	</script>
	  <jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>
</body>
</html>