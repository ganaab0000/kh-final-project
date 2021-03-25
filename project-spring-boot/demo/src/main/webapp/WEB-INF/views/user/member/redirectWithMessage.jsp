<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>redirect</title>
<script type="text/javascript">
	var message = "${message}";
	if (message.length > 0)
		alert("${message}");
	var url = "${url}";
	if (url.length > 0)
		location.href = "${url}";
</script>
</head>
<body>
</body>
</html>