// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NearbyReport {

 String? get id; ReportCategory? get category; ReportStatus get status; String? get photoUrl; double? get latitude; double? get longitude; DateTime? get createdAt;
/// Create a copy of NearbyReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyReportCopyWith<NearbyReport> get copyWith => _$NearbyReportCopyWithImpl<NearbyReport>(this as NearbyReport, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyReport&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.status, status) || other.status == status)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,category,status,photoUrl,latitude,longitude,createdAt);

@override
String toString() {
  return 'NearbyReport(id: $id, category: $category, status: $status, photoUrl: $photoUrl, latitude: $latitude, longitude: $longitude, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $NearbyReportCopyWith<$Res>  {
  factory $NearbyReportCopyWith(NearbyReport value, $Res Function(NearbyReport) _then) = _$NearbyReportCopyWithImpl;
@useResult
$Res call({
 String? id, ReportCategory? category, ReportStatus status, String? photoUrl, double? latitude, double? longitude, DateTime? createdAt
});


$ReportCategoryCopyWith<$Res>? get category;

}
/// @nodoc
class _$NearbyReportCopyWithImpl<$Res>
    implements $NearbyReportCopyWith<$Res> {
  _$NearbyReportCopyWithImpl(this._self, this._then);

  final NearbyReport _self;
  final $Res Function(NearbyReport) _then;

/// Create a copy of NearbyReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? category = freezed,Object? status = null,Object? photoUrl = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? createdAt = freezed,}) {
  return _then(NearbyReport(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ReportCategory?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReportStatus,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of NearbyReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportCategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $ReportCategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [NearbyReport].
extension NearbyReportPatterns on NearbyReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearbyReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearbyReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearbyReport value)  $default,){
final _that = this;
switch (_that) {
case _NearbyReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearbyReport value)?  $default,){
final _that = this;
switch (_that) {
case _NearbyReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  ReportCategory? category,  ReportStatus status,  String? photoUrl,  double? latitude,  double? longitude,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearbyReport() when $default != null:
return $default(_that.id,_that.category,_that.status,_that.photoUrl,_that.latitude,_that.longitude,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  ReportCategory? category,  ReportStatus status,  String? photoUrl,  double? latitude,  double? longitude,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _NearbyReport():
return $default(_that.id,_that.category,_that.status,_that.photoUrl,_that.latitude,_that.longitude,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  ReportCategory? category,  ReportStatus status,  String? photoUrl,  double? latitude,  double? longitude,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _NearbyReport() when $default != null:
return $default(_that.id,_that.category,_that.status,_that.photoUrl,_that.latitude,_that.longitude,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _NearbyReport implements NearbyReport {
  const _NearbyReport({this.id, this.category, this.status = ReportStatus.unknown, this.photoUrl, this.latitude, this.longitude, this.createdAt});
  

@override final  String? id;
@override final  ReportCategory? category;
@override@JsonKey() final  ReportStatus status;
@override final  String? photoUrl;
@override final  double? latitude;
@override final  double? longitude;
@override final  DateTime? createdAt;

/// Create a copy of NearbyReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyReportCopyWith<_NearbyReport> get copyWith => __$NearbyReportCopyWithImpl<_NearbyReport>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyReport&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.status, status) || other.status == status)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,category,status,photoUrl,latitude,longitude,createdAt);

@override
String toString() {
  return 'NearbyReport(id: $id, category: $category, status: $status, photoUrl: $photoUrl, latitude: $latitude, longitude: $longitude, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$NearbyReportCopyWith<$Res> implements $NearbyReportCopyWith<$Res> {
  factory _$NearbyReportCopyWith(_NearbyReport value, $Res Function(_NearbyReport) _then) = __$NearbyReportCopyWithImpl;
@override @useResult
$Res call({
 String? id, ReportCategory? category, ReportStatus status, String? photoUrl, double? latitude, double? longitude, DateTime? createdAt
});


@override $ReportCategoryCopyWith<$Res>? get category;

}
/// @nodoc
class __$NearbyReportCopyWithImpl<$Res>
    implements _$NearbyReportCopyWith<$Res> {
  __$NearbyReportCopyWithImpl(this._self, this._then);

  final _NearbyReport _self;
  final $Res Function(_NearbyReport) _then;

/// Create a copy of NearbyReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? category = freezed,Object? status = null,Object? photoUrl = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? createdAt = freezed,}) {
  return _then(_NearbyReport(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ReportCategory?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReportStatus,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of NearbyReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportCategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $ReportCategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
