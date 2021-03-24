package com.example.demo.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum Role {
    MEMBER("ROLE_MEMBER"),
    MEMBER_AUTH("ROLE_MEMBER_AUTH"),
    MEMBER_BLACK("ROLE_MEMBER_BLACK"),
    ADMIN("ROLE_ADMIN"),
    ADMIN_ALL("ROLE_ADMIN_ALL"),
    ADMIN_MEMBER("ROLE_ADMIN_MEMBER"),
    ADMIN_PROJECT("ROLE_ADMIN_PROJECT"),
    ADMIN_FAQ("ROLE_ADMIN_FAQ"),
    ADMIN_NOTICE("ROLE_ADMIN_NOTICE");

    private String value;
}