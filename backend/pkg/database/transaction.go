package database

import (
	"context"

	"gorm.io/gorm"
)

// WithTransaction runs fn in a transaction using ctx. It commits on success and
// rolls back on an error or panic. All database operations in fn must use tx,
// including any repositories constructed inside the callback.
func WithTransaction(ctx context.Context, db *gorm.DB, fn func(tx *gorm.DB) error) error {
	return db.WithContext(ctx).Transaction(fn)
}
