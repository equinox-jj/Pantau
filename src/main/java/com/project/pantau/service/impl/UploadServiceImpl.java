package com.project.pantau.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.project.pantau.common.exception.BadRequestException;
import com.project.pantau.common.exception.ValidationException;
import com.project.pantau.dto.upload.UploadResponse;
import com.project.pantau.service.UploadService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Objects;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class UploadServiceImpl implements UploadService {
    private final Cloudinary cloudinary;

    @Override
    public UploadResponse upload(MultipartFile file) {
        validate(file);

        try {
            var result = cloudinary.uploader()
                    .upload(
                            file.getBytes(),
                            ObjectUtils.asMap(
                                    "folder", "temp",
                                    "public_id", UUID.randomUUID().toString(),
                                    "resource_type", "image",
                                    "overwrite", false
                            )
                    );

            return UploadResponse.builder()
                    .id((String) result.get("public_id"))
                    .url((String) result.get("secure_url"))
                    .createdAt(LocalDateTime.now())
                    .build();

        } catch (IOException e) {
            throw new BadRequestException("Failed to upload image.");
        }
    }

    @Override
    public void delete(String id) {
        if (id == null) {
            throw new ValidationException("ID cannot be null");
        }

        try {
            var result = cloudinary.uploader()
                    .destroy(
                            id,
                            ObjectUtils.emptyMap()
                    );

            String status = (String) result.get("result");
            if (!"ok".equals(status) && !"not_found".equals(status)) {
                throw new RuntimeException("Cloudinary deletion failed with status: " + status);
            }
        } catch (IOException e) {
            throw new BadRequestException("Failed to delete image.");
        }
    }

    private void validate(MultipartFile file) {
        var maxFileSize = 5 * 1024 * 1024;

        if (file == null || file.isEmpty()) {
            throw new ValidationException("Image is required.");
        }

        if (file.getSize() > maxFileSize) {
            throw new ValidationException("Maximum image size is 5MB.");
        }

        if (!Objects.requireNonNull(file.getContentType()).startsWith("image/")) {
            throw new ValidationException("Only image files are allowed.");
        }
    }
}
