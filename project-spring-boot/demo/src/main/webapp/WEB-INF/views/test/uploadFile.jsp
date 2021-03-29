<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>파일 보내기 예제</title>
  </head>
  <body>
    <form name="form" method="post" action="/api/file" enctype="multipart/form-data">
      <input type="hidden"
             name="${_csrf.parameterName}"
             value="${_csrf.token}" />
      <input name="user" value="Pyo"/>
      <input name="content" value="Content"/>
      <input type="file" name="file" />
      <!-- multiple="multiple" -->
      <input type="submit" id="submit" value="전송"/>
    </form>
  </body>
</html>
