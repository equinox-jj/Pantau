package com.project.pantau.common.exception;

import com.project.pantau.common.response.ApiResponse;
import jakarta.persistence.EntityNotFoundException;
import jakarta.validation.ConstraintViolationException;
import org.jspecify.annotations.NonNull;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.OptimisticLockingFailureException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.method.annotation.HandlerMethodValidationException;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.support.MissingServletRequestPartException;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;
import org.springframework.web.servlet.resource.NoResourceFoundException;

import java.util.List;
import java.util.NoSuchElementException;

@RestControllerAdvice
public class GlobalExceptionHandler extends ResponseEntityExceptionHandler {
    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<ApiResponse<Void>> handleResourceNotFound(ResourceNotFoundException ex) {
        return error(HttpStatus.NOT_FOUND, ex.getMessage());
    }

    @ExceptionHandler(EmailAlreadyExistsException.class)
    public ResponseEntity<ApiResponse<Void>> handleEmailExists(EmailAlreadyExistsException ex) {
        return error(HttpStatus.CONFLICT, ex.getMessage());
    }

    @ExceptionHandler(BadCredentialsException.class)
    public ResponseEntity<ApiResponse<Void>> handleBadCredentials(BadCredentialsException ex) {
        return error(HttpStatus.UNAUTHORIZED, "Invalid email or password");
    }

    @ExceptionHandler(ValidationException.class)
    public ResponseEntity<ApiResponse<Void>> handleValidationException(ValidationException ex) {
        return error(HttpStatus.UNPROCESSABLE_CONTENT, ex.getMessage());
    }

    @ExceptionHandler(IllegalTransitionException.class)
    public ResponseEntity<ApiResponse<Void>> handleIllegalTransition(IllegalTransitionException ex) {
        return error(HttpStatus.CONFLICT, ex.getMessage());
    }

    @ExceptionHandler(FileStorageException.class)
    public ResponseEntity<ApiResponse<Void>> handleFileStorage(FileStorageException ex) {
        return error(HttpStatus.INTERNAL_SERVER_ERROR, ex.getMessage());
    }

    @ExceptionHandler(BadRequestException.class)
    public ResponseEntity<ApiResponse<Void>> handleBadRequest(BadRequestException ex) {
        return error(HttpStatus.BAD_REQUEST, ex.getMessage());
    }

    @ExceptionHandler(ConstraintViolationException.class)
    public ResponseEntity<ApiResponse<List<FieldErrorItem>>> handleConstraintViolation(ConstraintViolationException ex) {
        var errors = ex.getConstraintViolations().stream()
                .map(v -> new FieldErrorItem(v.getPropertyPath().toString(), v.getMessage()))
                .toList();
        return ResponseEntity.status(HttpStatus.UNPROCESSABLE_CONTENT)
                .body(new ApiResponse<>(false, "Validation failed", errors));
    }

    @ExceptionHandler(EntityNotFoundException.class)
    public ResponseEntity<ApiResponse<Void>> handleEntityNotFound(EntityNotFoundException ex) {
        return error(HttpStatus.NOT_FOUND, ex.getMessage());
    }

    @ExceptionHandler(NoSuchElementException.class)
    public ResponseEntity<ApiResponse<Void>> handleNoSuchElement(NoSuchElementException ex) {
        return error(HttpStatus.NOT_FOUND, "The requested resource could not be found");
    }

    @ExceptionHandler(DataIntegrityViolationException.class)
    public ResponseEntity<ApiResponse<Void>> handleDataIntegrityViolation(DataIntegrityViolationException ex) {
        return error(HttpStatus.CONFLICT,
                "The request could not be completed due to a data conflict (e.g. duplicate or referenced record)");
    }

    @ExceptionHandler(OptimisticLockingFailureException.class)
    public ResponseEntity<ApiResponse<Void>> handleOptimisticLocking(OptimisticLockingFailureException ex) {
        return error(HttpStatus.CONFLICT, "The resource was modified by another request. Please retry.");
    }

    @ExceptionHandler(AccessDeniedException.class)
    public ResponseEntity<ApiResponse<Void>> handleAccessDenied(AccessDeniedException ex) {
        return error(HttpStatus.FORBIDDEN, "You do not have permission to perform this action");
    }

    @ExceptionHandler(AuthenticationException.class)
    public ResponseEntity<ApiResponse<Void>> handleAuthentication(AuthenticationException ex) {
        return error(HttpStatus.UNAUTHORIZED, "Authentication failed");
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<ApiResponse<Void>> handleIllegalArgument(IllegalArgumentException ex) {
        return error(HttpStatus.BAD_REQUEST, ex.getMessage());
    }

    @ExceptionHandler(IllegalStateException.class)
    public ResponseEntity<ApiResponse<Void>> handleIllegalState(IllegalStateException ex) {
        return error(HttpStatus.CONFLICT, ex.getMessage());
    }

    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    public ResponseEntity<ApiResponse<Void>> handleTypeMismatch(MethodArgumentTypeMismatchException ex) {
        var requiredType = ex.getRequiredType() != null ? ex.getRequiredType().getSimpleName() : "unknown";
        return error(HttpStatus.BAD_REQUEST,
                String.format("Parameter '%s' should be of type %s", ex.getName(), requiredType));
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ApiResponse<Void>> handleGenericException(Exception ex) {
        logger.error("Unhandled exception", ex);
        return error(HttpStatus.INTERNAL_SERVER_ERROR,
                "An unexpected error occurred. Please contact support if the problem persists.");
    }

    @Override
    protected ResponseEntity<Object> handleMethodArgumentNotValid(
            MethodArgumentNotValidException ex,
            @NonNull HttpHeaders headers,
            @NonNull HttpStatusCode status,
            @NonNull WebRequest request
    ) {
        var errors = ex.getBindingResult().getFieldErrors().stream()
                .map(fe -> new FieldErrorItem(fe.getField(), fe.getDefaultMessage()))
                .toList();
        return ResponseEntity.status(HttpStatus.UNPROCESSABLE_CONTENT)
                .body(new ApiResponse<>(false, "Validation failed", errors));
    }

    @Override
    protected ResponseEntity<Object> handleHttpMessageNotReadable(
            @NonNull HttpMessageNotReadableException ex,
            @NonNull HttpHeaders headers,
            @NonNull HttpStatusCode status,
            @NonNull WebRequest request
    ) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new ApiResponse<>(false, "The request body is missing or could not be parsed", null));
    }

    @Override
    protected ResponseEntity<Object> handleMissingServletRequestParameter(
            MissingServletRequestParameterException ex,
            @NonNull HttpHeaders headers,
            @NonNull HttpStatusCode status,
            @NonNull WebRequest request
    ) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new ApiResponse<>(false, "Required parameter '" + ex.getParameterName() + "' is missing", null));
    }

    @Override
    protected ResponseEntity<Object> handleMissingServletRequestPart(
            MissingServletRequestPartException ex,
            @NonNull HttpHeaders headers,
            @NonNull HttpStatusCode status,
            @NonNull WebRequest request
    ) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new ApiResponse<>(false, "Required part '" + ex.getRequestPartName() + "' is missing", null));
    }

    @Override
    protected ResponseEntity<Object> handleHttpRequestMethodNotSupported(
            HttpRequestMethodNotSupportedException ex,
            @NonNull HttpHeaders headers,
            @NonNull HttpStatusCode status,
            @NonNull WebRequest request
    ) {
        return ResponseEntity.status(HttpStatus.METHOD_NOT_ALLOWED)
                .body(new ApiResponse<>(false, ex.getMessage(), null));
    }

    @Override
    protected ResponseEntity<Object> handleHttpMediaTypeNotSupported(
            HttpMediaTypeNotSupportedException ex,
            @NonNull HttpHeaders headers,
            @NonNull HttpStatusCode status,
            @NonNull WebRequest request
    ) {
        return ResponseEntity.status(HttpStatus.UNSUPPORTED_MEDIA_TYPE)
                .body(new ApiResponse<>(false, ex.getMessage(), null));
    }

    @Override
    protected ResponseEntity<Object> handleNoResourceFoundException(
            @NonNull NoResourceFoundException ex,
            @NonNull HttpHeaders headers,
            @NonNull HttpStatusCode status,
            @NonNull WebRequest request
    ) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body(new ApiResponse<>(false, "No endpoint matches this request", null));
    }

    @Override
    protected ResponseEntity<Object> handleMaxUploadSizeExceededException(
            @NonNull MaxUploadSizeExceededException ex,
            @NonNull HttpHeaders headers,
            @NonNull HttpStatusCode status,
            @NonNull WebRequest request
    ) {
        return ResponseEntity.status(HttpStatus.CONTENT_TOO_LARGE)
                .body(new ApiResponse<>(false, "Uploaded file exceeds the maximum allowed size (5 MB).", null));
    }

    @Override
    protected ResponseEntity<Object> handleHandlerMethodValidationException(
            HandlerMethodValidationException ex,
            @NonNull HttpHeaders headers,
            @NonNull HttpStatusCode status,
            @NonNull WebRequest request) {

        var errors = ex.getAllErrors()
                .stream()
                .map(error -> new FieldErrorItem(
                        "param",
                        error.getDefaultMessage()))
                .toList();

        return ResponseEntity.status(HttpStatus.UNPROCESSABLE_CONTENT)
                .body(new ApiResponse<>(
                        false,
                        "Validation failed",
                        errors
                ));
    }

    private ResponseEntity<ApiResponse<Void>> error(HttpStatus status, String message) {
        return ResponseEntity.status(status).body(new ApiResponse<>(false, message, null));
    }
}
