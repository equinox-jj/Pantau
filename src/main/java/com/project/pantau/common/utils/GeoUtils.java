package com.project.pantau.common.utils;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.GeometryFactory;
import org.locationtech.jts.geom.Point;
import org.locationtech.jts.geom.PrecisionModel;

public class GeoUtils {
    private static final int SRID_WGS84 = 4326;
    private static final GeometryFactory GEOMETRY_FACTORY =
            new GeometryFactory(new PrecisionModel(), SRID_WGS84);

    private GeoUtils() {
    }

    public static Point point(double latitude, double longitude) {
        var point = GEOMETRY_FACTORY.createPoint(new Coordinate(longitude, latitude));
        point.setSRID(SRID_WGS84);
        return point;
    }

    public static double latitude(Point point) {
        return point.getY();
    }

    public static double longitude(Point point) {
        return point.getX();
    }
}
