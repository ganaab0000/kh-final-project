# 데이터베이스 구성
* db_user.sql
* ddl.sql
* default_data.sql

# 개발 툴 설정 필수
* lombok eclipse 설정 방법
    * https://countryxide.tistory.com/16
# 개발 툴 설정 참고 (필요 여부에 따라 각자 판단 후 사용)
* spring dependency
    * spring boot dev tools (pom.xml에 이미 포함됨.)
        * 코드 변경 후 저장시, 스프링 자동 재시작.
* chrome extension
    * live reload
        * 코드 변경 후 저장시, 브라우저 자동 새로고침.
        * https://github.com/blaise-io/live-reload#readme
        * https://chrome.google.com/webstore/detail/live-reload/jcejoncdonagmfohjcdgohnmecaipidc
        * 설정 - Host URL, Source file URLs (http://localhost:9090/*)
* eclipse extension
    * anyedit-tools
        * snake case - camel case 단축키 변환(ctrl + alt + k), 대소문자 단축키 변환 등.
        * https://marketplace.eclipse.org/content/anyedit-tools

# 회원 관련 세션 처리 예제
* JSP
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>인덱스</h2>
	<!-- 아래 태그는 로그인시에만 출력 한다는 의미(상단에 taglib 설정) -->
	<security:authorize access="isAuthenticated()">
		<p>${member.id}</p>
		<p>${member.nickname}</p>
		<p>${member.email}</p>
	</security:authorize>
</body>
</html>
```
* Controller
```java
@GetMapping("/test/api/session")
public String getSession(HttpSession session) {
	log.info("/test/api/session");
	SessionMember member = (SessionMember) session.getAttribute("member");
	if(member == null) return "null";
	log.info(member.getId());
	log.info(member.getEmail());
	log.info(member.getNickname());
	return "true";
}
```
