package com.project.pantau.common.utils;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.GeometryFactory;
import org.locationtech.jts.geom.Point;
import org.locationtech.jts.geom.PrecisionModel;

public class GeoUtils {
    private static final int SRID_WGS84 = 4326;
    private static final double EARTH_RADIUS_METERS = 6_371_000;
    private static final GeometryFactory GEOMETRY_FACTORY =
            new GeometryFactory(new PrecisionModel(), SRID_WGS84);

    private GeoUtils() {
    }

    public static double distanceMeters(double lat1, double lng1, double lat2, double lng2) {
        var lat1Rad = Math.toRadians(lat1);
        var lat2Rad = Math.toRadians(lat2);
        var deltaLat = Math.toRadians(lat2 - lat1);
        var deltaLng = Math.toRadians(lng2 - lng1);

        var a = Math.sin(deltaLat / 2) * Math.sin(deltaLat / 2)
                + Math.cos(lat1Rad) * Math.cos(lat2Rad)
                * Math.sin(deltaLng / 2) * Math.sin(deltaLng / 2);
        var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

        return EARTH_RADIUS_METERS * c;
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
