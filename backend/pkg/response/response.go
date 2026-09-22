package response

type ApiResponse[T any] struct {
	Success  bool            `json:"success"`
	Response ResponseData[T] `json:"response,omitzero"`
	Errors   []ErrorDetail   `json:"errors,omitempty"`
}

type ResponseData[T any] struct {
	Data       T          `json:"data,omitempty"`
	Pagination Pagination `json:"pagination,omitzero"`
}

type Pagination struct {
	Page       int  `json:"page,omitempty"`
	Limit      int  `json:"limit,omitempty"`
	Offset     int  `json:"offset"`
	Total      int  `json:"total,omitempty"`
	TotalPages int  `json:"total_pages,omitempty"`
	HasNext    bool `json:"has_next"`
}

type ErrorDetail struct {
	Code    int    `json:"code,omitempty"`
	Field   string `json:"field,omitempty"`
	Message string `json:"message,omitempty"`
}

func Success[T any](data T) ApiResponse[T] {
	return ApiResponse[T]{
		Success: true,
		Response: ResponseData[T]{
			Data:       data,
			Pagination: Pagination{},
		},
		Errors: []ErrorDetail{},
	}
}

func Error(
	code int,
	message string,
) ApiResponse[[]any] {
	return ApiResponse[[]any]{
		Success: false,
		Response: ResponseData[[]any]{
			Data:       []any{},
			Pagination: Pagination{},
		},
		Errors: []ErrorDetail{
			{
				Code:    code,
				Message: message,
			},
		},
	}
}

func Errors(errors []ErrorDetail) ApiResponse[[]any] {
	return ApiResponse[[]any]{
		Success: false,
		Response: ResponseData[[]any]{
			Data:       []any{},
			Pagination: Pagination{},
		},
		Errors: errors,
	}
}
