<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>redirect</title>
<script type="text/javascript">
	var message = "${message}";
	var trueUrl = "${trueUrl}";
	var falseUrl = "${falseUrl}";
	var isConfirm = false;
	if (message.length > 0){
		isConfirm = confirm(message);
	}
	if (isConfirm && trueUrl.length > 0){
		if(trueUrl == "-1") window.history.back();
		location.href = trueUrl;
	}
	if (!isConfirm && falseUrl.length > 0){
		if(falseUrl == "-1") window.history.back();
		location.href = falseUrl;
	}
</script>
</head>
<body>
</body>
</html>