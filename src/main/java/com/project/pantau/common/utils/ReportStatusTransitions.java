package com.project.pantau.common.utils;

import com.project.pantau.enums.ReportStatus;

import java.util.EnumMap;
import java.util.EnumSet;
import java.util.Map;
import java.util.Set;

/**
 * The status lifecycle as data, not scattered if/else — mirrors the state
 * diagram in the PRD:
 * <p>
 * REPORTED -> ACKNOWLEDGED -> IN_PROGRESS -> RESOLVED -> CLOSED
 * |             |               |
 * +-------------+---------------+---------------------> REJECTED
 * <p>
 * REJECTED is reachable from any pre-RESOLVED state. CLOSED and REJECTED are
 * terminal. Kept as its own class so the rule set has one place to change,
 * and so ReportService reads as "ask the rules, then act" rather than
 * "contain the rules."
 */
public final class ReportStatusTransitions {

    private static final Map<ReportStatus, Set<ReportStatus>> ALLOWED = new EnumMap<>(ReportStatus.class);

    static {
        // FROM REPORTED TO -> ACKNOWLEDGED or REJECTED
        ALLOWED.put(ReportStatus.REPORTED, EnumSet.of(ReportStatus.ACKNOWLEDGED, ReportStatus.REJECTED));
        // FROM ACKNOWLEDGED TO -> IN_PROGRESS or REJECTED
        ALLOWED.put(ReportStatus.ACKNOWLEDGED, EnumSet.of(ReportStatus.IN_PROGRESS, ReportStatus.REJECTED));
        // FROM IN_PROGRESS TO -> RESOLVED or REJECTED
        ALLOWED.put(ReportStatus.IN_PROGRESS, EnumSet.of(ReportStatus.RESOLVED, ReportStatus.REJECTED));
        // FROM RESOLVED TO -> CLOSED
        ALLOWED.put(ReportStatus.RESOLVED, EnumSet.of(ReportStatus.CLOSED));
        ALLOWED.put(ReportStatus.CLOSED, EnumSet.noneOf(ReportStatus.class));
        ALLOWED.put(ReportStatus.REJECTED, EnumSet.noneOf(ReportStatus.class));
    }

    private ReportStatusTransitions() {
    }

    public static boolean isAllowed(ReportStatus from, ReportStatus to) {
        return ALLOWED.getOrDefault(from, Set.of()).contains(to);
    }

    public static boolean requiresNote(ReportStatus to) {
        return to == ReportStatus.REJECTED;
    }
}