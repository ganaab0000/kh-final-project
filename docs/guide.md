# 데이터베이스 구성
* db_user.sql
* ddl.sql
* default_data.sql

# 개발 툴 설정 참고
* lombok eclipse 설정 방법
    * https://countryxide.tistory.com/16


# 세션 처리
* JSP
```jsp
<p>${member.id}</p>
<p>${member.nickname}</p>
<p>${member.email}</p>
```
* Controller
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
