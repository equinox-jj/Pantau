package com.project.pantau.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.time.OffsetDateTime;
import java.util.UUID;

@Entity
@Table(name = "uploads")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Upload {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id", nullable = false, updatable = false)
    private UUID id;

    @Column(name = "size")
    private Long size;

    @Column(name = "public_id")
    private String publicId;

    @Column(name = "secure_url", nullable = false)
    private String secureUrl;

    @Column(name = "resource_type")
    private String resourceType;

    @Column(name = "format", nullable = false)
    private String format;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private OffsetDateTime createdAt;
}
