package utils

import (
	"context"
	"encoding/hex"
	"fmt"
	"log/slog"
	"strings"

	"github.com/twpayne/go-geom"
	"github.com/twpayne/go-geom/encoding/ewkb"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
	"gorm.io/gorm/schema"
)

type GeoPoint struct {
	Lng float64
	Lat float64
}

func (GeoPoint) GormDataType() string {
	return "geography"
}

func (GeoPoint) GormDBDataType(
	db *gorm.DB,
	field *schema.Field,
) string {
	return "geography(geooint,4326)"
}

// Don't need pointer, just read the GeoPoint values
func (geo GeoPoint) GormValue(
	ctx context.Context,
	db *gorm.DB,
) clause.Expr {
	return clause.Expr{
		SQL: "ST_SetSRID(ST_MakePoint(?, ?), 4326)::geography",
		Vars: []any{
			geo.Lng,
			geo.Lat,
		},
	}
}

// Use pointer receiver because it modify the struct values,
// and if we don't use pointer receiver,
// it will create a copy of the struct and modify the copy instead of the original struct
func (geo *GeoPoint) Scan(value any) error {
	var data []byte

	switch v := value.(type) {
	case []byte:
		data = v
	case string:
		s := strings.TrimPrefix(v, "\\x")
		decoded, err := hex.DecodeString(s)
		if err != nil {
			slog.Error("[GEOPOINT] Failed to decode geography string", "error", err)
			return err
		}

		data = decoded
	default:
		err := fmt.Errorf("unsupported geography value: %T", value)
		slog.Error("[GEOPOINT] Unsupported geography value", "error", err)
		return err
	}

	if isHex(data) {
		decoded := make([]byte, hex.DecodedLen(len(data)))

		n, err := hex.Decode(decoded, data)
		if err == nil {
			data = decoded[:n]
		} else {
			slog.Error("[GEOPOINT] Failed to decode geography bytes", "error", err)
		}
	}

	g, err := ewkb.Unmarshal(data)
	if err != nil {
		slog.Error("[GEOPOINT] Failed to unmarshal geography", "error", err)
		return err
	}

	point, ok := g.(*geom.Point)
	if !ok {
		err := fmt.Errorf("expected Point, got %T", g)
		slog.Error("[GEOPOINT] Unexpected geometry type", "error", err)
		return err
	}

	geo.Lng = point.X()
	geo.Lat = point.Y()

	return nil
}

func isHex(b []byte) bool {
	if len(b)%2 != 0 {
		return false
	}

	for _, c := range b {
		if !(c >= '0' && c <= '9' ||
			c >= 'a' && c <= 'f' ||
			c >= 'A' && c <= 'F') {
			return false
		}
	}

	return len(b) > 0
}
