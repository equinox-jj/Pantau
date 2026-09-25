package geo

import (
	"math"

	"pantau/pkg/errs"
)

// ValidateCoordinates checks that latitude and longitude are finite and within
// their inclusive degree ranges, returning a wrapped ErrValidation on failure.
func ValidateCoordinates(latitude, longitude float64) error {
	if math.IsNaN(latitude) || math.IsInf(latitude, 0) || latitude < -90 || latitude > 90 {
		return errs.Validation("Latitude must be between -90 and 90")
	}
	if math.IsNaN(longitude) || math.IsInf(longitude, 0) || longitude < -180 || longitude > 180 {
		return errs.Validation("Longitude must be between -180 and 180")
	}
	return nil
}

// HaversineMeters approximates the distance between valid geographic coordinates
// in degrees using a spherical Earth with a radius of 6,371,000 meters.
func HaversineMeters(from, to GeoPoint) float64 {
	const radians = math.Pi / 180
	dLat, dLng := (to.Lat-from.Lat)*radians, (to.Lng-from.Lng)*radians
	a := math.Pow(math.Sin(dLat/2), 2) + math.Cos(from.Lat*radians)*math.Cos(to.Lat*radians)*math.Pow(math.Sin(dLng/2), 2)
	a = math.Max(0, math.Min(1, a))
	return 6_371_000 * 2 * math.Atan2(math.Sqrt(a), math.Sqrt(1-a))
}
