<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>redirect</title>
<script type="text/javascript">
	var message = "${message}";
	var url = "${url}";
	if (message.length > 0)
		alert(message);
	if (url.length > 0){
		if(url == "-1") window.history.back();
		location.href = url;
	}
</script>
</head>
<body>
</body>
</html>