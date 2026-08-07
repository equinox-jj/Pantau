package com.project.pantau.service;

import com.project.pantau.dto.user.ProfileResponse;
import com.project.pantau.entity.User;

public interface UserService {
    ProfileResponse getProfile(User user);
}
