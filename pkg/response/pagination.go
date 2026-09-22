package response

// NewPagination builds metadata from validated pagination and a nonnegative total.
// Callers must supply limit > 0 and offset >= 0. Page numbers are one-based;
// offsets do not have to align with page boundaries.
func NewPagination(limit, offset int, total int64) Pagination {
	totalPages := total / int64(limit)
	if total%int64(limit) != 0 {
		totalPages++
	}
	return Pagination{
		Page:       offset/limit + 1,
		Limit:      limit,
		Offset:     offset,
		Total:      int(total),
		TotalPages: int(totalPages),
		HasNext:    total > int64(offset) && total-int64(offset) > int64(limit),
	}
}
