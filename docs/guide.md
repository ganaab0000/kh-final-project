# 데이터베이스 구성
* db_user.sql
* ddl.sql
* default_data.sql

# 개발 툴 설정 참고
* lombok eclipse 설정 방법
    * https://countryxide.tistory.com/16


# 회원 관련 세션 처리
* JSP
```jsp
<p>${member.id}</p>
<p>${member.nickname}</p>
<p>${member.email}</p>
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
```java
@GetMapping("/member/confirm/mail")
public String dispComfirmMail(@AuthenticationPrincipal User user) {
	log.info("/member/confirm/mail");
	if (user != null) {
		String email = user.getUsername();
		log.info(email); //email
		//find member by email
		//...
	}
	return "user/member/index";
}

```
