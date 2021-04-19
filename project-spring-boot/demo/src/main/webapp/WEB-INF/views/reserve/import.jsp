<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<script>
	var IMP = window.IMP; // 생략해도 괜찮습니다.
	  IMP.init("imp20432485"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
	// IMP.request_pay(param, callback) 호출
	  IMP.request_pay({
	pg : "html5_inicis.INIBillTst", // 실제 계약 후에는 실제 상점아이디로 변경
	pay_method : 'card', // 'card'만 지원됩니다.
	merchant_uid : 'merchant_' + new Date().getTime(),
	name : '최초인증결제',
	amount : 0, // 결제창에 표시될 금액. 실제 승인이 이뤄지지는 않습니다. (모바일에서는 가격이 표시되지 않음)
	customer_uid : 'your-customer-unique-id', //customer_uid 파라메터가 있어야 빌링키 발급을 시도합니다.
	buyer_email : 'iamport@siot.do',
	buyer_name : '아임포트',
	buyer_tel : '02-1234-1234'
	}, function (rsp) { // callback
	    if (rsp.success) {
	      // 빌링키 발급 성공
	    	jQuery.ajax({
	            url: "https://www.myservice.com/billings/", // 서비스 웹서버
	            method: "POST",
	            headers: { "Content-Type": "application/json" },
	            data: {
	              customer_uid: "gildong_0001_1234", // 카드(빌링키)와 1:1로 대응하는 값
	            }
	          });
	      
	    } else {
	      // 빌링키 발급 실패
	    }
	  });
	</script>
</body>
</html>