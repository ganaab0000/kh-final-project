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
	//차단된 멤버
    MEMBER_BLACK("ROLE_MEMBER_BLACK"),
	//OAUTH로 로그인된 멤버
    MEMBER_OAUTH("ROLE_MEMBER_OAUTH"),
    //하나 이상의 ADMIN ROLE 소유.
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