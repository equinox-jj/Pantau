package com.project.pantau.mapper;

import com.project.pantau.dto.auth.UserResponse;
import com.project.pantau.entity.User;
import org.mapstruct.Mapper;

@Mapper(config = MapStructConfig.class)
public interface UserMapper {
    UserResponse toResponse(User user);
}
