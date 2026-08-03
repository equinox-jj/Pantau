package com.project.pantau.common.pagination;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

/**
 * Pageable that honours a raw row offset instead of a page index, so offsets
 * that are not a multiple of the limit still skip the exact number of rows.
 */
public record OffsetPageable(
        long offset,
        int limit,
        Sort sort
) implements Pageable {

    public OffsetPageable {
        if (offset < 0) {
            throw new IllegalArgumentException("Offset must not be negative");
        }
        if (limit < 1) {
            throw new IllegalArgumentException("Limit must be greater than 0");
        }
        if (sort == null) {
            sort = Sort.unsorted();
        }
    }

    public static OffsetPageable of(long offset, int limit, Sort sort) {
        return new OffsetPageable(offset, limit, sort);
    }

    @Override
    public int getPageNumber() {
        return (int) (offset / limit);
    }

    @Override
    public int getPageSize() {
        return limit;
    }

    @Override
    public long getOffset() {
        return offset;
    }

    @Override
    public Sort getSort() {
        return sort;
    }

    @Override
    public Pageable next() {
        return new OffsetPageable(offset + limit, limit, sort);
    }

    @Override
    public Pageable previousOrFirst() {
        return hasPrevious() ? new OffsetPageable(Math.max(0, offset - limit), limit, sort) : first();
    }

    @Override
    public Pageable first() {
        return new OffsetPageable(0, limit, sort);
    }

    @Override
    public Pageable withPage(int pageNumber) {
        return new OffsetPageable((long) pageNumber * limit, limit, sort);
    }

    @Override
    public boolean hasPrevious() {
        return offset > 0;
    }
}
