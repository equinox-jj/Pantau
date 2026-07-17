package com.project.pantau.mapper;

import com.project.pantau.dto.auth.AuthResponse;
import com.project.pantau.entity.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(
        config = MapStructConfig.class,
        uses = UserMapper.class
)
public interface AuthMapper {
    @Mapping(target = "userResponse", source = "user")
    AuthResponse toResponse(
            String token,
            Long expiresIn,
            User user
    );
}
