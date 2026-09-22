// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeedReport {

 String? get id; int? get categoryId; String? get categoryName; ReportStatus get status; String? get description; List<String> get photoUrls; double? get latitude; double? get longitude; DateTime? get createdAt;
/// Create a copy of FeedReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedReportCopyWith<FeedReport> get copyWith => _$FeedReportCopyWithImpl<FeedReport>(this as FeedReport, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedReport&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.photoUrls, photoUrls)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,categoryId,categoryName,status,description,const DeepCollectionEquality().hash(photoUrls),latitude,longitude,createdAt);

@override
String toString() {
  return 'FeedReport(id: $id, categoryId: $categoryId, categoryName: $categoryName, status: $status, description: $description, photoUrls: $photoUrls, latitude: $latitude, longitude: $longitude, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FeedReportCopyWith<$Res>  {
  factory $FeedReportCopyWith(FeedReport value, $Res Function(FeedReport) _then) = _$FeedReportCopyWithImpl;
@useResult
$Res call({
 String? id, int? categoryId, String? categoryName, ReportStatus status, String? description, List<String> photoUrls, double? latitude, double? longitude, DateTime? createdAt
});




}
/// @nodoc
class _$FeedReportCopyWithImpl<$Res>
    implements $FeedReportCopyWith<$Res> {
  _$FeedReportCopyWithImpl(this._self, this._then);

  final FeedReport _self;
  final $Res Function(FeedReport) _then;

/// Create a copy of FeedReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? categoryId = freezed,Object? categoryName = freezed,Object? status = null,Object? description = freezed,Object? photoUrls = null,Object? latitude = freezed,Object? longitude = freezed,Object? createdAt = freezed,}) {
  return _then(FeedReport(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReportStatus,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photoUrls: null == photoUrls ? _self.photoUrls : photoUrls // ignore: cast_nullable_to_non_nullable
as List<String>,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedReport].
extension FeedReportPatterns on FeedReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedReport value)  $default,){
final _that = this;
switch (_that) {
case _FeedReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedReport value)?  $default,){
final _that = this;
switch (_that) {
case _FeedReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  int? categoryId,  String? categoryName,  ReportStatus status,  String? description,  List<String> photoUrls,  double? latitude,  double? longitude,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedReport() when $default != null:
return $default(_that.id,_that.categoryId,_that.categoryName,_that.status,_that.description,_that.photoUrls,_that.latitude,_that.longitude,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  int? categoryId,  String? categoryName,  ReportStatus status,  String? description,  List<String> photoUrls,  double? latitude,  double? longitude,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _FeedReport():
return $default(_that.id,_that.categoryId,_that.categoryName,_that.status,_that.description,_that.photoUrls,_that.latitude,_that.longitude,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  int? categoryId,  String? categoryName,  ReportStatus status,  String? description,  List<String> photoUrls,  double? latitude,  double? longitude,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FeedReport() when $default != null:
return $default(_that.id,_that.categoryId,_that.categoryName,_that.status,_that.description,_that.photoUrls,_that.latitude,_that.longitude,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _FeedReport implements FeedReport {
  const _FeedReport({this.id, this.categoryId, this.categoryName, this.status = ReportStatus.unknown, this.description,  List<String> photoUrls = const <String>[], this.latitude, this.longitude, this.createdAt}): _photoUrls = photoUrls;
  

@override final  String? id;
@override final  int? categoryId;
@override final  String? categoryName;
@override@JsonKey() final  ReportStatus status;
@override final  String? description;
 final  List<String> _photoUrls;
@override@JsonKey() List<String> get photoUrls {
  if (_photoUrls is EqualUnmodifiableListView) return _photoUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photoUrls);
}

@override final  double? latitude;
@override final  double? longitude;
@override final  DateTime? createdAt;

/// Create a copy of FeedReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedReportCopyWith<_FeedReport> get copyWith => __$FeedReportCopyWithImpl<_FeedReport>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedReport&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._photoUrls, _photoUrls)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,categoryId,categoryName,status,description,const DeepCollectionEquality().hash(_photoUrls),latitude,longitude,createdAt);

@override
String toString() {
  return 'FeedReport(id: $id, categoryId: $categoryId, categoryName: $categoryName, status: $status, description: $description, photoUrls: $photoUrls, latitude: $latitude, longitude: $longitude, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FeedReportCopyWith<$Res> implements $FeedReportCopyWith<$Res> {
  factory _$FeedReportCopyWith(_FeedReport value, $Res Function(_FeedReport) _then) = __$FeedReportCopyWithImpl;
@override @useResult
$Res call({
 String? id, int? categoryId, String? categoryName, ReportStatus status, String? description, List<String> photoUrls, double? latitude, double? longitude, DateTime? createdAt
});




}
/// @nodoc
class __$FeedReportCopyWithImpl<$Res>
    implements _$FeedReportCopyWith<$Res> {
  __$FeedReportCopyWithImpl(this._self, this._then);

  final _FeedReport _self;
  final $Res Function(_FeedReport) _then;

/// Create a copy of FeedReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? categoryId = freezed,Object? categoryName = freezed,Object? status = null,Object? description = freezed,Object? photoUrls = null,Object? latitude = freezed,Object? longitude = freezed,Object? createdAt = freezed,}) {
  return _then(_FeedReport(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReportStatus,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photoUrls: null == photoUrls ? _self._photoUrls : photoUrls // ignore: cast_nullable_to_non_nullable
as List<String>,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
