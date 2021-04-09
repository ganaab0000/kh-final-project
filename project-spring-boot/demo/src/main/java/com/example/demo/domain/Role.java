package com.example.demo.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum Role {
	//로그인된 모든 멤버
    MEMBER("ROLE_MEMBER"),
	//메일 인증 멤버
    MEMBER_MAIL("ROLE_MEMBER_MAIL"),
	//탈퇴한 멤버
    MEMBER_DEL("ROLE_MEMBER_DEL"),
	//차단된 멤버
    MEMBER_BLOCK("ROLE_MEMBER_BLOCK"),
	//OAUTH로 로그인된 멤버 //패스워드 변경 등 일부 기능 불가.
    MEMBER_OAUTH("ROLE_MEMBER_OAUTH"),
    //하나 이상의 ADMIN ROLE 소유. //ADMIN 페이지 접근 여부.
    ADMIN("ROLE_ADMIN"),
    //모든 ADMIN ROLE 소유.
    ADMIN_ALL("ROLE_ADMIN_ALL"),
    //MEMBER 관리 ADMIN
    ADMIN_MEMBER("ROLE_ADMIN_MEMBER"),
    //PROJECT 관리 ADMIN
    ADMIN_PROJECT("ROLE_ADMIN_PROJECT"),
    //FAQ 관리 ADMIN
    ADMIN_FAQ("ROLE_ADMIN_FAQ"),
    //NOTICE 관리 ADMIN
    ADMIN_NOTICE("ROLE_ADMIN_NOTICE");

    private String value;
}