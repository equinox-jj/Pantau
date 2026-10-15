package errs

import (
	"fmt"
	"io"
	"net/http/httptest"
	"strings"
	"testing"

	"github.com/gofiber/fiber/v3"
)

func runHandler(t *testing.T, err error) (int, string) {
	t.Helper()
	app := fiber.New(fiber.Config{ErrorHandler: ErrorHandler})
	app.Get("/", func(fiber.Ctx) error { return err })

	resp, testErr := app.Test(httptest.NewRequest(fiber.MethodGet, "/", nil))
	if testErr != nil {
		t.Fatal(testErr)
	}
	body, _ := io.ReadAll(resp.Body)
	return resp.StatusCode, string(body)
}

func TestErrorHandler_InvalidCurrentPassword_Is400(t *testing.T) {
	status, body := runHandler(t, ErrInvalidCurrentPassword)
	// Not 401: the mobile client signs the user out on any 401.
	if status != fiber.StatusBadRequest {
		t.Errorf("status = %d, want 400", status)
	}
	if !strings.Contains(body, "Your current password is incorrect.") {
		t.Errorf("body = %s", body)
	}
}

func TestErrorHandler_Validation_ShowsMessageWithoutPrefix(t *testing.T) {
	status, body := runHandler(t, Validation("Please choose a category for this report."))
	if status != fiber.StatusBadRequest {
		t.Errorf("status = %d, want 400", status)
	}
	if !strings.Contains(body, `"message":"Please choose a category for this report."`) {
		t.Errorf("body = %s", body)
	}
}

func TestErrorHandler_WrappedSentinel_UsesFriendlyMessage(t *testing.T) {
	status, body := runHandler(t, fmt.Errorf("find report: %w", ErrReportNotFound))
	if status != fiber.StatusNotFound {
		t.Errorf("status = %d, want 404", status)
	}
	if !strings.Contains(body, "We couldn't find that report.") {
		t.Errorf("body = %s", body)
	}
}

func TestErrorHandler_Unknown_HidesInternalDetail(t *testing.T) {
	status, body := runHandler(t, fmt.Errorf("pq: connection refused"))
	if status != fiber.StatusInternalServerError {
		t.Errorf("status = %d, want 500", status)
	}
	if strings.Contains(body, "pq:") || !strings.Contains(body, MsgInternal) {
		t.Errorf("body = %s", body)
	}
}

func TestFieldLabel(t *testing.T) {
	cases := map[string]string{
		"display_name":     "Display name",
		"current_password": "Current password",
		"category_id":      "Category",
		"email":            "Email",
		"":                 "This field",
	}
	for in, want := range cases {
		if got := fieldLabel(in); got != want {
			t.Errorf("fieldLabel(%q) = %q, want %q", in, got, want)
		}
	}
}
