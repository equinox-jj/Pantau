package response

type ApiResponse[T any] struct {
	Success  bool            `json:"success"`
	Response ResponseData[T] `json:"response"`
	Errors   []ErrorDetail   `json:"errors"`
}

type ResponseData[T any] struct {
	Data       T          `json:"data"`
	Pagination Pagination `json:"pagination"`
}

type Pagination struct {
	Page       int `json:"page,omitempty"`
	Limit      int `json:"limit,omitempty"`
	Total      int `json:"total,omitempty"`
	TotalPages int `json:"total_pages,omitempty"`
}

type ErrorDetail struct {
	Code    int    `json:"code"`
	Message string `json:"message"`
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
