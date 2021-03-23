package com.example.demo.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum Role {
    ADMIN("ROLE_ADMIN"),
    MEMBER("ROLE_MEMBER"),
    ADMIN_MEMBER("ROLE_ADMIN_MEMBER"),
    ADMIN_ALL("ROLE_ADMIN_ALL"),
    ADMIN_PROJECT("ROLE_ADMIN_PROJECT"),
    ADMIN_FAQ("ROLE_ADMIN_FAQ"),
    ADMIN_NOTICE("ROLE_ADMIN_NOTICE");

    private String value;
}