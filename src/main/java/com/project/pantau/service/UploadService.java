package com.project.pantau.service;

import com.project.pantau.dto.upload.UploadResponse;
import org.springframework.web.multipart.MultipartFile;

public interface UploadService {
    UploadResponse upload(MultipartFile file);

    void delete(String id);
}
