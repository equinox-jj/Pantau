package com.project.pantau.repository;

import com.project.pantau.entity.Upload;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface UploadRepository extends JpaRepository<Upload, UUID> {
}
