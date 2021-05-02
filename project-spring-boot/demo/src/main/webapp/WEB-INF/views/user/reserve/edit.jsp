<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>텀블업 - 크리에이터를 위한 크라우드 펀딩</title>
	<jsp:include page="/WEB-INF/views/user/common/head.jsp"></jsp:include>
<style>
	#divH1{
		margin-top:15px;
		margin-bottom:5px;
	}
	#table{
		margin:2px;
	}
	table > tbody > tr > td{
		font-size:25px;
		min-width:300px;
		margin-top:10px;
		margin-bottom:10px;
	}
	#main{
		padding-left:25%;
		padding-right:25%;
		min-height:800px;
	}
	#tbNo{
		text-align:center;
	}
	#tbTitle{
		font-size:40px;
	}
	#editBtn {
		margin-left:200px;
		border:none;
	    width: 150px;
	    height: 40px;
	    background-color:#F39C12;
	    font-color:black;
	}
	#cancelBtn {
		margin-left:270px;
		border:none;
	    width: 150px;
	    height: 40px;
	    background-color:#F39C12;
	    font-color:black;
	}
	a{
		text-decoration:none;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"></jsp:include>
	<div id="main">
		<br>
		<h1 id="divH1">예약 상세</h1>
		<br>
		<br>
		<hr>
		<br>
		<br>
		<form method="post" action="/reserve/fix">
		<c:forEach items="${reserve}" var="reserve">
			<table>
				<tbody>
					<tr>
						<td id="tbTitle">리워드 정보</td>
						<td style="min-width:650px;"></td>
					</tr>
					<tr><td colspan="2"><hr></td><td></td></tr>
					<tr>
						<td rowspan="2">프로젝트 번호</td>
						<td>${reserve.projectId}</td>
					</tr>
					<tr><td></td></tr>
					<tr>
						<td rowspan="2">프로젝트 이름</td>
						<td>${reserve.projectName}</td>
					</tr>
					<tr><td></td></tr>
					<tr>
						<td rowspan="2">리워드 이름</td>
						<td>${reserve.rewardName}</td>
					</tr>
					<tr><td></td></tr>
					<tr>
						<td rowspan="2">리워드 금액</td>
						<td>${reserve.rewardPrice}<span>원</span></td>
					</tr>
					<tr><td></td></tr>
					<tr>
						<td rowspan="2">추가 후원금</td>
						<td>${reserve.additionalBillings}<span>원</span></td>
					</tr>
					<tr><td></td></tr>
					<tr>
						<td rowspan="2">총 금액</td>
						<td><input type="text" id="reservePrice" name="reservePrice" style="border: none;" readonly></td>
					</tr>
					<tr><td></td></tr>
					<tr>
						<td rowspan="2">예약 신청일</td>
						<td>${reserve.dateCreated}</td>
					</tr>
					<tr><td></td></tr>
					<tr>
						<td rowspan="2">결제 상태</td>
						<td>
						<%if("${reserve.reserveStatusCategoryId}".equals("6")){%>
							<span>환불 요청</span>
						<%}else if("${reserve.reserveStatusCategoryId}".equals("2")){%>
							<span>결제 완료</span>
						<%}else if("${reserve.reserveStatusCategoryId}".equals("3")){%>
							<span>결제 취소</span>
						<%}else if("${reserve.reserveStatusCategoryId}".equals("4")){%>
							<span>결제 실패</span>
						<%}else if("${reserve.reserveStatusCategoryId}".equals("5")){%>
							<span>교환 요청</span>
						<%}else{%>
							<span>결제 대기</span>
						<%}%></td>
					</tr>
					<tr><td></td></tr>
					<tr><td><br></td><td></td></tr>
					<tr>
						<td id="tbTitle">배송지 정보</td>
						<td></td>
					</tr>
					<tr><td colspan="2"><hr></td><td></td></tr>
						<td rowspan="2">수령인</td>
						<td><input type="text" name="receiverName"  style="min-width:650px;" value="${reserve.receiverName}"></td>
					</tr>
					<tr><td></td></tr>
					<tr>
						<td rowspan="2">연락처</td>
						<td><input type="text" name="receiverPhone" style="min-width:650px;" value="${reserve.receiverPhone}"></td>
					</tr>
					<tr><td></td></tr>
					<tr>
						<td rowspan="2">배송지</td>
						<td><input type="text" name="receiverAddress" style="min-width:650px;" value="${reserve.receiverAddress}"></td>
					</tr>
					<tr><td></td></tr>
					<tr>
						<td rowspan="2">배송시 요청사항</td>
						<td><input type="text" name="requestForDelivery" style="min-width:650px;" value="${reserve.requestForDelivery}"></td>
					</tr>
					<tr><td></td></tr>
					<tr><td><br></td><td><br></td></tr>
					<tr><td><br></td><td><br></td></tr>
					<tr><td><br></td><td><br></td></tr>
					<tr>
						<td rowspan="2">
							<input type="hidden" name="id" value="${reserve.id}">
							<input type="submit" id="editBtn" value="저장 하기">
						</td>
						<td rowspan="2">
							<a href="javascript:history.back()"><input type="submit" id="cancelBtn" value="변경 취소"></a>
						</td>
					</tr>
					<tr><td></td><td></td></tr>
				</tbody>
			</table>
		<br>
		<br>
		<br>
		<br>
		</c:forEach>
		</form>
	</div>
	<script>
		$(function(){
			calcPrice();
		});
		
		function calcPrice() {
			<c:forEach items="${reserve}" var="reserve">
			var rewardPrice = ${reserve.rewardPrice};
			console.log(${reserve.rewardPrice});
			var additionalBillings = ${reserve.additionalBillings};
			var result = Number(rewardPrice) + Number(additionalBillings) +"원";
			$("#reservePrice").val(result);
			</c:forEach>
		}
		</script>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>
</body>
</html>