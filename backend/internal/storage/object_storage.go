// Package storage stores uploaded files in an S3-compatible bucket (MinIO).
package storage

import (
	"context"
	"fmt"
	"io"
	"log/slog"
	"strings"
	"time"

	"pantau/internal/config"

	"github.com/minio/minio-go/v7"
	"github.com/minio/minio-go/v7/pkg/credentials"
	"go.uber.org/fx"
)

// ObjectStorage writes and removes objects addressed by key.
type ObjectStorage interface {
	Put(ctx context.Context, key string, r io.Reader, size int64, contentType string) error
	Remove(ctx context.Context, key string) error
	PublicURL(key string) string
}

type minioStorage struct {
	client    *minio.Client
	bucket    string
	publicURL string
}

// NewMinioStorage creates a MinIO client. On application start it creates the
// bucket if missing and makes its objects publicly readable, so stored URLs
// can be loaded directly by clients. Start fails when MinIO is unreachable.
func NewMinioStorage(lc fx.Lifecycle, cfg *config.Config) (ObjectStorage, error) {
	client, err := minio.New(cfg.MinIO.Endpoint, &minio.Options{
		Creds:  credentials.NewStaticV4(cfg.MinIO.AccessKey, cfg.MinIO.SecretKey, ""),
		Secure: cfg.MinIO.UseSSL,
	})
	if err != nil {
		slog.Error("[MinIO] Failed to create client", "endpoint", cfg.MinIO.Endpoint, "error", err)
		return nil, err
	}

	store := &minioStorage{
		client:    client,
		bucket:    cfg.MinIO.Bucket,
		publicURL: cfg.MinIO.PublicURL,
	}

	lc.Append(fx.Hook{
		OnStart: func(ctx context.Context) error {
			ctx, cancel := context.WithTimeout(ctx, 10*time.Second)
			defer cancel()
			return store.ensureBucket(ctx)
		},
	})

	return store, nil
}

func (s *minioStorage) ensureBucket(ctx context.Context) error {
	exists, err := s.client.BucketExists(ctx, s.bucket)
	if err != nil {
		slog.Error("[MinIO] Failed to check bucket", "bucket", s.bucket, "error", err)
		return fmt.Errorf("check bucket %q: %w", s.bucket, err)
	}
	if !exists {
		if err := s.client.MakeBucket(ctx, s.bucket, minio.MakeBucketOptions{}); err != nil {
			slog.Error("[MinIO] Failed to create bucket", "bucket", s.bucket, "error", err)
			return fmt.Errorf("create bucket %q: %w", s.bucket, err)
		}
	}
	if err := s.client.SetBucketPolicy(ctx, s.bucket, publicReadPolicy(s.bucket)); err != nil {
		slog.Error("[MinIO] Failed to set bucket policy", "bucket", s.bucket, "error", err)
		return fmt.Errorf("set bucket policy %q: %w", s.bucket, err)
	}

	return nil
}

func (s *minioStorage) Put(ctx context.Context, key string, r io.Reader, size int64, contentType string) error {
	_, err := s.client.PutObject(ctx, s.bucket, key, r, size, minio.PutObjectOptions{ContentType: contentType})
	return err
}

// Remove deletes the object. Removing a missing key is not an error.
func (s *minioStorage) Remove(ctx context.Context, key string) error {
	return s.client.RemoveObject(ctx, s.bucket, key, minio.RemoveObjectOptions{})
}

func (s *minioStorage) PublicURL(key string) string {
	return buildPublicURL(s.publicURL, s.bucket, key)
}

func buildPublicURL(publicBase, bucket, key string) string {
	return strings.TrimRight(publicBase, "/") + "/" + bucket + "/" + key
}

// publicReadPolicy allows anonymous GetObject on every object in bucket.
func publicReadPolicy(bucket string) string {
	return fmt.Sprintf(`{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"AWS":["*"]},"Action":["s3:GetObject"],"Resource":["arn:aws:s3:::%s/*"]}]}`, bucket)
}
