package com.project.pantau.enums;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

public enum UserRole {
    CITIZEN,
    RESOLVER;

    public GrantedAuthority toAuthority() {
        return new SimpleGrantedAuthority(this.name());
    }
}
