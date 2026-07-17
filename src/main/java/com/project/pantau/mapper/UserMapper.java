package com.project.pantau.mapper;

import com.project.pantau.dto.auth.UserResponse;
import com.project.pantau.entity.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(config = MapStructConfig.class)
public interface UserMapper {
    @Mapping(target = "uuid", source = "id")
    UserResponse toResponse(User user);
}
