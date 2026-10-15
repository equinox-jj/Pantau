package storage

import (
	"encoding/json"
	"slices"
	"testing"
)

func TestBuildPublicURL(t *testing.T) {
	tests := []struct {
		name, base, bucket, key, want string
	}{
		{"plain base", "http://localhost:9000", "pantau", "reports/a.jpg", "http://localhost:9000/pantau/reports/a.jpg"},
		{"trailing slash", "http://10.0.2.2:9000/", "pantau", "avatars/u/b.png", "http://10.0.2.2:9000/pantau/avatars/u/b.png"},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := buildPublicURL(tt.base, tt.bucket, tt.key); got != tt.want {
				t.Errorf("buildPublicURL() = %q, want %q", got, tt.want)
			}
		})
	}
}

func TestPublicReadPolicy(t *testing.T) {
	var policy struct {
		Statement []struct {
			Effect    string
			Principal struct{ AWS []string }
			Action    []string
			Resource  []string
		}
	}
	if err := json.Unmarshal([]byte(publicReadPolicy("pantau")), &policy); err != nil {
		t.Fatalf("policy is not valid JSON: %v", err)
	}
	if len(policy.Statement) != 1 {
		t.Fatalf("want 1 statement, got %d", len(policy.Statement))
	}
	st := policy.Statement[0]
	if st.Effect != "Allow" {
		t.Errorf("Effect = %q, want Allow", st.Effect)
	}
	if !slices.Equal(st.Principal.AWS, []string{"*"}) {
		t.Errorf("Principal.AWS = %v, want [*]", st.Principal.AWS)
	}
	if !slices.Equal(st.Action, []string{"s3:GetObject"}) {
		t.Errorf("Action = %v, want [s3:GetObject]", st.Action)
	}
	if !slices.Equal(st.Resource, []string{"arn:aws:s3:::pantau/*"}) {
		t.Errorf("Resource = %v, want [arn:aws:s3:::pantau/*]", st.Resource)
	}
}
