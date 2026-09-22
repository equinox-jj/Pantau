// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReportDetail {

 String? get id; ReportCategory? get category; String? get description; List<String> get photoUrls; double? get latitude; double? get longitude; ReportStatus get status; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of ReportDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportDetailCopyWith<ReportDetail> get copyWith => _$ReportDetailCopyWithImpl<ReportDetail>(this as ReportDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.photoUrls, photoUrls)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,category,description,const DeepCollectionEquality().hash(photoUrls),latitude,longitude,status,createdAt,updatedAt);

@override
String toString() {
  return 'ReportDetail(id: $id, category: $category, description: $description, photoUrls: $photoUrls, latitude: $latitude, longitude: $longitude, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ReportDetailCopyWith<$Res>  {
  factory $ReportDetailCopyWith(ReportDetail value, $Res Function(ReportDetail) _then) = _$ReportDetailCopyWithImpl;
@useResult
$Res call({
 String? id, ReportCategory? category, String? description, List<String> photoUrls, double? latitude, double? longitude, ReportStatus status, DateTime? createdAt, DateTime? updatedAt
});


$ReportCategoryCopyWith<$Res>? get category;

}
/// @nodoc
class _$ReportDetailCopyWithImpl<$Res>
    implements $ReportDetailCopyWith<$Res> {
  _$ReportDetailCopyWithImpl(this._self, this._then);

  final ReportDetail _self;
  final $Res Function(ReportDetail) _then;

/// Create a copy of ReportDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? category = freezed,Object? description = freezed,Object? photoUrls = null,Object? latitude = freezed,Object? longitude = freezed,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(ReportDetail(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ReportCategory?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photoUrls: null == photoUrls ? _self.photoUrls : photoUrls // ignore: cast_nullable_to_non_nullable
as List<String>,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReportStatus,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ReportDetail
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


/// Adds pattern-matching-related methods to [ReportDetail].
extension ReportDetailPatterns on ReportDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportDetail value)  $default,){
final _that = this;
switch (_that) {
case _ReportDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportDetail value)?  $default,){
final _that = this;
switch (_that) {
case _ReportDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  ReportCategory? category,  String? description,  List<String> photoUrls,  double? latitude,  double? longitude,  ReportStatus status,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportDetail() when $default != null:
return $default(_that.id,_that.category,_that.description,_that.photoUrls,_that.latitude,_that.longitude,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  ReportCategory? category,  String? description,  List<String> photoUrls,  double? latitude,  double? longitude,  ReportStatus status,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ReportDetail():
return $default(_that.id,_that.category,_that.description,_that.photoUrls,_that.latitude,_that.longitude,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  ReportCategory? category,  String? description,  List<String> photoUrls,  double? latitude,  double? longitude,  ReportStatus status,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ReportDetail() when $default != null:
return $default(_that.id,_that.category,_that.description,_that.photoUrls,_that.latitude,_that.longitude,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ReportDetail implements ReportDetail {
  const _ReportDetail({this.id, this.category, this.description,  List<String> photoUrls = const <String>[], this.latitude, this.longitude, this.status = ReportStatus.unknown, this.createdAt, this.updatedAt}): _photoUrls = photoUrls;
  

@override final  String? id;
@override final  ReportCategory? category;
@override final  String? description;
 final  List<String> _photoUrls;
@override@JsonKey() List<String> get photoUrls {
  if (_photoUrls is EqualUnmodifiableListView) return _photoUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photoUrls);
}

@override final  double? latitude;
@override final  double? longitude;
@override@JsonKey() final  ReportStatus status;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of ReportDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportDetailCopyWith<_ReportDetail> get copyWith => __$ReportDetailCopyWithImpl<_ReportDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._photoUrls, _photoUrls)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,category,description,const DeepCollectionEquality().hash(_photoUrls),latitude,longitude,status,createdAt,updatedAt);

@override
String toString() {
  return 'ReportDetail(id: $id, category: $category, description: $description, photoUrls: $photoUrls, latitude: $latitude, longitude: $longitude, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ReportDetailCopyWith<$Res> implements $ReportDetailCopyWith<$Res> {
  factory _$ReportDetailCopyWith(_ReportDetail value, $Res Function(_ReportDetail) _then) = __$ReportDetailCopyWithImpl;
@override @useResult
$Res call({
 String? id, ReportCategory? category, String? description, List<String> photoUrls, double? latitude, double? longitude, ReportStatus status, DateTime? createdAt, DateTime? updatedAt
});


@override $ReportCategoryCopyWith<$Res>? get category;

}
/// @nodoc
class __$ReportDetailCopyWithImpl<$Res>
    implements _$ReportDetailCopyWith<$Res> {
  __$ReportDetailCopyWithImpl(this._self, this._then);

  final _ReportDetail _self;
  final $Res Function(_ReportDetail) _then;

/// Create a copy of ReportDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? category = freezed,Object? description = freezed,Object? photoUrls = null,Object? latitude = freezed,Object? longitude = freezed,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ReportDetail(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ReportCategory?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photoUrls: null == photoUrls ? _self._photoUrls : photoUrls // ignore: cast_nullable_to_non_nullable
as List<String>,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReportStatus,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ReportDetail
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
