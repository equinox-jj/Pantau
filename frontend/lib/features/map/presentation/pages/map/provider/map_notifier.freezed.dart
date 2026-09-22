// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapPageState {

/// The last device position that resolved, for the pin marking it on the
/// map.
///
/// Separate from [mapLocation], which goes loading on every locate tap
/// and carries the permission outcome; the pin must stay put across a
/// re-locate.
 LatLng? get currentLocation;/// Centre of the last nearby-reports fetch, for the ring drawn around it.
///
/// Not [currentLocation]: the fetch follows whatever the user last asked
/// to look at, and the ring must mark the ground actually loaded.
 LatLng? get loadedArea;/// The category the map is filtered to, or `null` for "All" (FR-10).
///
/// Holds an id rather than a `ReportCategory`: the taxonomy can be
/// refetched, so a selection stored as an entity would go stale.
 int? get categoryFilter;/// The device-location request for the map tab. Holds the raw
/// [LocationResult] so the listener can branch on permission outcomes.
 AsyncValue<LocationResult?> get mapLocation;/// Nearby reports for the current map camera.
 AsyncValue<List<NearbyReport>> get nearbyReports;/// The last successfully loaded page of [nearbyReports], held across its
/// loading and error states.
///
/// Markers would otherwise blink out on every pan refetch.
 List<NearbyReport> get visibleReports;/// [visibleReports] narrowed by [categoryFilter].
///
/// Filtered client-side rather than through `GET /reports/nearby`, so
/// chip switching is synchronous and costs no refetch. The trade is that
/// only the loaded page is filtered; see the design doc's "Known
/// constraint".
///
/// Stored rather than computed on read: a getter would allocate a new
/// list identity on every access, which would defeat `select()` and
/// repaint the marker layer on any unrelated state change (e.g. a
/// re-locate).
 List<NearbyReport> get filteredReports;/// Results of the place-search field above the map.
///
/// `null` means the panel is closed — distinct from `AsyncData([])`,
/// which means "searched, found nothing".
 AsyncValue<List<Place>>? get placeSearch;/// The place the user jumped to, marked with a pin on the map.
///
/// Separate from [placeSearch] for lifetime: the result list dies with
/// the panel, the pin stays until the search field is cleared.
 Place? get searchedPlace;
/// Create a copy of MapPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapPageStateCopyWith<MapPageState> get copyWith => _$MapPageStateCopyWithImpl<MapPageState>(this as MapPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapPageState&&(identical(other.currentLocation, currentLocation) || other.currentLocation == currentLocation)&&(identical(other.loadedArea, loadedArea) || other.loadedArea == loadedArea)&&(identical(other.categoryFilter, categoryFilter) || other.categoryFilter == categoryFilter)&&(identical(other.mapLocation, mapLocation) || other.mapLocation == mapLocation)&&(identical(other.nearbyReports, nearbyReports) || other.nearbyReports == nearbyReports)&&const DeepCollectionEquality().equals(other.visibleReports, visibleReports)&&const DeepCollectionEquality().equals(other.filteredReports, filteredReports)&&(identical(other.placeSearch, placeSearch) || other.placeSearch == placeSearch)&&(identical(other.searchedPlace, searchedPlace) || other.searchedPlace == searchedPlace));
}


@override
int get hashCode => Object.hash(runtimeType,currentLocation,loadedArea,categoryFilter,mapLocation,nearbyReports,const DeepCollectionEquality().hash(visibleReports),const DeepCollectionEquality().hash(filteredReports),placeSearch,searchedPlace);

@override
String toString() {
  return 'MapPageState(currentLocation: $currentLocation, loadedArea: $loadedArea, categoryFilter: $categoryFilter, mapLocation: $mapLocation, nearbyReports: $nearbyReports, visibleReports: $visibleReports, filteredReports: $filteredReports, placeSearch: $placeSearch, searchedPlace: $searchedPlace)';
}


}

/// @nodoc
abstract mixin class $MapPageStateCopyWith<$Res>  {
  factory $MapPageStateCopyWith(MapPageState value, $Res Function(MapPageState) _then) = _$MapPageStateCopyWithImpl;
@useResult
$Res call({
 LatLng? currentLocation, LatLng? loadedArea, int? categoryFilter, AsyncValue<LocationResult?> mapLocation, AsyncValue<List<NearbyReport>> nearbyReports, List<NearbyReport> visibleReports, List<NearbyReport> filteredReports, AsyncValue<List<Place>>? placeSearch, Place? searchedPlace
});


$PlaceCopyWith<$Res>? get searchedPlace;

}
/// @nodoc
class _$MapPageStateCopyWithImpl<$Res>
    implements $MapPageStateCopyWith<$Res> {
  _$MapPageStateCopyWithImpl(this._self, this._then);

  final MapPageState _self;
  final $Res Function(MapPageState) _then;

/// Create a copy of MapPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentLocation = freezed,Object? loadedArea = freezed,Object? categoryFilter = freezed,Object? mapLocation = null,Object? nearbyReports = null,Object? visibleReports = null,Object? filteredReports = null,Object? placeSearch = freezed,Object? searchedPlace = freezed,}) {
  return _then(MapPageState(
currentLocation: freezed == currentLocation ? _self.currentLocation : currentLocation // ignore: cast_nullable_to_non_nullable
as LatLng?,loadedArea: freezed == loadedArea ? _self.loadedArea : loadedArea // ignore: cast_nullable_to_non_nullable
as LatLng?,categoryFilter: freezed == categoryFilter ? _self.categoryFilter : categoryFilter // ignore: cast_nullable_to_non_nullable
as int?,mapLocation: null == mapLocation ? _self.mapLocation : mapLocation // ignore: cast_nullable_to_non_nullable
as AsyncValue<LocationResult?>,nearbyReports: null == nearbyReports ? _self.nearbyReports : nearbyReports // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<NearbyReport>>,visibleReports: null == visibleReports ? _self.visibleReports : visibleReports // ignore: cast_nullable_to_non_nullable
as List<NearbyReport>,filteredReports: null == filteredReports ? _self.filteredReports : filteredReports // ignore: cast_nullable_to_non_nullable
as List<NearbyReport>,placeSearch: freezed == placeSearch ? _self.placeSearch : placeSearch // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<Place>>?,searchedPlace: freezed == searchedPlace ? _self.searchedPlace : searchedPlace // ignore: cast_nullable_to_non_nullable
as Place?,
  ));
}
/// Create a copy of MapPageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaceCopyWith<$Res>? get searchedPlace {
    if (_self.searchedPlace == null) {
    return null;
  }

  return $PlaceCopyWith<$Res>(_self.searchedPlace!, (value) {
    return _then(_self.copyWith(searchedPlace: value));
  });
}
}


/// Adds pattern-matching-related methods to [MapPageState].
extension MapPageStatePatterns on MapPageState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapPageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapPageState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapPageState value)  $default,){
final _that = this;
switch (_that) {
case _MapPageState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapPageState value)?  $default,){
final _that = this;
switch (_that) {
case _MapPageState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LatLng? currentLocation,  LatLng? loadedArea,  int? categoryFilter,  AsyncValue<LocationResult?> mapLocation,  AsyncValue<List<NearbyReport>> nearbyReports,  List<NearbyReport> visibleReports,  List<NearbyReport> filteredReports,  AsyncValue<List<Place>>? placeSearch,  Place? searchedPlace)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapPageState() when $default != null:
return $default(_that.currentLocation,_that.loadedArea,_that.categoryFilter,_that.mapLocation,_that.nearbyReports,_that.visibleReports,_that.filteredReports,_that.placeSearch,_that.searchedPlace);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LatLng? currentLocation,  LatLng? loadedArea,  int? categoryFilter,  AsyncValue<LocationResult?> mapLocation,  AsyncValue<List<NearbyReport>> nearbyReports,  List<NearbyReport> visibleReports,  List<NearbyReport> filteredReports,  AsyncValue<List<Place>>? placeSearch,  Place? searchedPlace)  $default,) {final _that = this;
switch (_that) {
case _MapPageState():
return $default(_that.currentLocation,_that.loadedArea,_that.categoryFilter,_that.mapLocation,_that.nearbyReports,_that.visibleReports,_that.filteredReports,_that.placeSearch,_that.searchedPlace);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LatLng? currentLocation,  LatLng? loadedArea,  int? categoryFilter,  AsyncValue<LocationResult?> mapLocation,  AsyncValue<List<NearbyReport>> nearbyReports,  List<NearbyReport> visibleReports,  List<NearbyReport> filteredReports,  AsyncValue<List<Place>>? placeSearch,  Place? searchedPlace)?  $default,) {final _that = this;
switch (_that) {
case _MapPageState() when $default != null:
return $default(_that.currentLocation,_that.loadedArea,_that.categoryFilter,_that.mapLocation,_that.nearbyReports,_that.visibleReports,_that.filteredReports,_that.placeSearch,_that.searchedPlace);case _:
  return null;

}
}

}

/// @nodoc


class _MapPageState implements MapPageState {
  const _MapPageState({this.currentLocation, this.loadedArea, this.categoryFilter, this.mapLocation = const AsyncData(null), this.nearbyReports = const AsyncData([]),  List<NearbyReport> visibleReports = const [],  List<NearbyReport> filteredReports = const [], this.placeSearch, this.searchedPlace}): _visibleReports = visibleReports,_filteredReports = filteredReports;
  

/// The last device position that resolved, for the pin marking it on the
/// map.
///
/// Separate from [mapLocation], which goes loading on every locate tap
/// and carries the permission outcome; the pin must stay put across a
/// re-locate.
@override final  LatLng? currentLocation;
/// Centre of the last nearby-reports fetch, for the ring drawn around it.
///
/// Not [currentLocation]: the fetch follows whatever the user last asked
/// to look at, and the ring must mark the ground actually loaded.
@override final  LatLng? loadedArea;
/// The category the map is filtered to, or `null` for "All" (FR-10).
///
/// Holds an id rather than a `ReportCategory`: the taxonomy can be
/// refetched, so a selection stored as an entity would go stale.
@override final  int? categoryFilter;
/// The device-location request for the map tab. Holds the raw
/// [LocationResult] so the listener can branch on permission outcomes.
@override@JsonKey() final  AsyncValue<LocationResult?> mapLocation;
/// Nearby reports for the current map camera.
@override@JsonKey() final  AsyncValue<List<NearbyReport>> nearbyReports;
/// The last successfully loaded page of [nearbyReports], held across its
/// loading and error states.
///
/// Markers would otherwise blink out on every pan refetch.
 final  List<NearbyReport> _visibleReports;
/// The last successfully loaded page of [nearbyReports], held across its
/// loading and error states.
///
/// Markers would otherwise blink out on every pan refetch.
@override@JsonKey() List<NearbyReport> get visibleReports {
  if (_visibleReports is EqualUnmodifiableListView) return _visibleReports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_visibleReports);
}

/// [visibleReports] narrowed by [categoryFilter].
///
/// Filtered client-side rather than through `GET /reports/nearby`, so
/// chip switching is synchronous and costs no refetch. The trade is that
/// only the loaded page is filtered; see the design doc's "Known
/// constraint".
///
/// Stored rather than computed on read: a getter would allocate a new
/// list identity on every access, which would defeat `select()` and
/// repaint the marker layer on any unrelated state change (e.g. a
/// re-locate).
 final  List<NearbyReport> _filteredReports;
/// [visibleReports] narrowed by [categoryFilter].
///
/// Filtered client-side rather than through `GET /reports/nearby`, so
/// chip switching is synchronous and costs no refetch. The trade is that
/// only the loaded page is filtered; see the design doc's "Known
/// constraint".
///
/// Stored rather than computed on read: a getter would allocate a new
/// list identity on every access, which would defeat `select()` and
/// repaint the marker layer on any unrelated state change (e.g. a
/// re-locate).
@override@JsonKey() List<NearbyReport> get filteredReports {
  if (_filteredReports is EqualUnmodifiableListView) return _filteredReports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredReports);
}

/// Results of the place-search field above the map.
///
/// `null` means the panel is closed — distinct from `AsyncData([])`,
/// which means "searched, found nothing".
@override final  AsyncValue<List<Place>>? placeSearch;
/// The place the user jumped to, marked with a pin on the map.
///
/// Separate from [placeSearch] for lifetime: the result list dies with
/// the panel, the pin stays until the search field is cleared.
@override final  Place? searchedPlace;

/// Create a copy of MapPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapPageStateCopyWith<_MapPageState> get copyWith => __$MapPageStateCopyWithImpl<_MapPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapPageState&&(identical(other.currentLocation, currentLocation) || other.currentLocation == currentLocation)&&(identical(other.loadedArea, loadedArea) || other.loadedArea == loadedArea)&&(identical(other.categoryFilter, categoryFilter) || other.categoryFilter == categoryFilter)&&(identical(other.mapLocation, mapLocation) || other.mapLocation == mapLocation)&&(identical(other.nearbyReports, nearbyReports) || other.nearbyReports == nearbyReports)&&const DeepCollectionEquality().equals(other._visibleReports, _visibleReports)&&const DeepCollectionEquality().equals(other._filteredReports, _filteredReports)&&(identical(other.placeSearch, placeSearch) || other.placeSearch == placeSearch)&&(identical(other.searchedPlace, searchedPlace) || other.searchedPlace == searchedPlace));
}


@override
int get hashCode => Object.hash(runtimeType,currentLocation,loadedArea,categoryFilter,mapLocation,nearbyReports,const DeepCollectionEquality().hash(_visibleReports),const DeepCollectionEquality().hash(_filteredReports),placeSearch,searchedPlace);

@override
String toString() {
  return 'MapPageState(currentLocation: $currentLocation, loadedArea: $loadedArea, categoryFilter: $categoryFilter, mapLocation: $mapLocation, nearbyReports: $nearbyReports, visibleReports: $visibleReports, filteredReports: $filteredReports, placeSearch: $placeSearch, searchedPlace: $searchedPlace)';
}


}

/// @nodoc
abstract mixin class _$MapPageStateCopyWith<$Res> implements $MapPageStateCopyWith<$Res> {
  factory _$MapPageStateCopyWith(_MapPageState value, $Res Function(_MapPageState) _then) = __$MapPageStateCopyWithImpl;
@override @useResult
$Res call({
 LatLng? currentLocation, LatLng? loadedArea, int? categoryFilter, AsyncValue<LocationResult?> mapLocation, AsyncValue<List<NearbyReport>> nearbyReports, List<NearbyReport> visibleReports, List<NearbyReport> filteredReports, AsyncValue<List<Place>>? placeSearch, Place? searchedPlace
});


@override $PlaceCopyWith<$Res>? get searchedPlace;

}
/// @nodoc
class __$MapPageStateCopyWithImpl<$Res>
    implements _$MapPageStateCopyWith<$Res> {
  __$MapPageStateCopyWithImpl(this._self, this._then);

  final _MapPageState _self;
  final $Res Function(_MapPageState) _then;

/// Create a copy of MapPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentLocation = freezed,Object? loadedArea = freezed,Object? categoryFilter = freezed,Object? mapLocation = null,Object? nearbyReports = null,Object? visibleReports = null,Object? filteredReports = null,Object? placeSearch = freezed,Object? searchedPlace = freezed,}) {
  return _then(_MapPageState(
currentLocation: freezed == currentLocation ? _self.currentLocation : currentLocation // ignore: cast_nullable_to_non_nullable
as LatLng?,loadedArea: freezed == loadedArea ? _self.loadedArea : loadedArea // ignore: cast_nullable_to_non_nullable
as LatLng?,categoryFilter: freezed == categoryFilter ? _self.categoryFilter : categoryFilter // ignore: cast_nullable_to_non_nullable
as int?,mapLocation: null == mapLocation ? _self.mapLocation : mapLocation // ignore: cast_nullable_to_non_nullable
as AsyncValue<LocationResult?>,nearbyReports: null == nearbyReports ? _self.nearbyReports : nearbyReports // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<NearbyReport>>,visibleReports: null == visibleReports ? _self._visibleReports : visibleReports // ignore: cast_nullable_to_non_nullable
as List<NearbyReport>,filteredReports: null == filteredReports ? _self._filteredReports : filteredReports // ignore: cast_nullable_to_non_nullable
as List<NearbyReport>,placeSearch: freezed == placeSearch ? _self.placeSearch : placeSearch // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<Place>>?,searchedPlace: freezed == searchedPlace ? _self.searchedPlace : searchedPlace // ignore: cast_nullable_to_non_nullable
as Place?,
  ));
}

/// Create a copy of MapPageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaceCopyWith<$Res>? get searchedPlace {
    if (_self.searchedPlace == null) {
    return null;
  }

  return $PlaceCopyWith<$Res>(_self.searchedPlace!, (value) {
    return _then(_self.copyWith(searchedPlace: value));
  });
}
}

// dart format on
