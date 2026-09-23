// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_reports_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NearbyReportsDataModel {

@JsonKey(name: "id") String? get id;@JsonKey(name: "category") NearbyReportsCategoryModel? get category;@JsonKey(name: "status") String? get status;@JsonKey(name: "photo_urls") List<String>? get photoUrls;@JsonKey(name: "latitude") double? get latitude;@JsonKey(name: "longitude") double? get longitude;@JsonKey(name: "created_at") String? get createdAt;
/// Create a copy of NearbyReportsDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyReportsDataModelCopyWith<NearbyReportsDataModel> get copyWith => _$NearbyReportsDataModelCopyWithImpl<NearbyReportsDataModel>(this as NearbyReportsDataModel, _$identity);

  /// Serializes this NearbyReportsDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NearbyReportsDataModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyReportsDataModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.photoUrls, _this.photoUrls)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NearbyReportsDataModel;
  return Object.hash(runtimeType,_this.id,_this.category,_this.status,const DeepCollectionEquality().hash(_this.photoUrls),_this.latitude,_this.longitude,_this.createdAt);
}

@override
String toString() {
  final _this = this as NearbyReportsDataModel;
  return 'NearbyReportsDataModel(id: ${_this.id}, category: ${_this.category}, status: ${_this.status}, photoUrls: ${_this.photoUrls}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $NearbyReportsDataModelCopyWith<$Res>  {
  factory $NearbyReportsDataModelCopyWith(NearbyReportsDataModel value, $Res Function(NearbyReportsDataModel) _then) = _$NearbyReportsDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "category") NearbyReportsCategoryModel? category,@JsonKey(name: "status") String? status,@JsonKey(name: "photo_urls") List<String>? photoUrls,@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude,@JsonKey(name: "created_at") String? createdAt
});


$NearbyReportsCategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class _$NearbyReportsDataModelCopyWithImpl<$Res>
    implements $NearbyReportsDataModelCopyWith<$Res> {
  _$NearbyReportsDataModelCopyWithImpl(this._self, this._then);

  final NearbyReportsDataModel _self;
  final $Res Function(NearbyReportsDataModel) _then;

/// Create a copy of NearbyReportsDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? category = freezed,Object? status = freezed,Object? photoUrls = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? createdAt = freezed,}) {
  return _then(NearbyReportsDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as NearbyReportsCategoryModel?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,photoUrls: freezed == photoUrls ? _self.photoUrls : photoUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of NearbyReportsDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NearbyReportsCategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $NearbyReportsCategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [NearbyReportsDataModel].
extension NearbyReportsDataModelPatterns on NearbyReportsDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearbyReportsDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearbyReportsDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearbyReportsDataModel value)  $default,){
final _that = this;
switch (_that) {
case _NearbyReportsDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearbyReportsDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _NearbyReportsDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "category")  NearbyReportsCategoryModel? category, @JsonKey(name: "status")  String? status, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "created_at")  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearbyReportsDataModel() when $default != null:
return $default(_that.id,_that.category,_that.status,_that.photoUrls,_that.latitude,_that.longitude,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "category")  NearbyReportsCategoryModel? category, @JsonKey(name: "status")  String? status, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "created_at")  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _NearbyReportsDataModel():
return $default(_that.id,_that.category,_that.status,_that.photoUrls,_that.latitude,_that.longitude,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "category")  NearbyReportsCategoryModel? category, @JsonKey(name: "status")  String? status, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "created_at")  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _NearbyReportsDataModel() when $default != null:
return $default(_that.id,_that.category,_that.status,_that.photoUrls,_that.latitude,_that.longitude,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NearbyReportsDataModel implements NearbyReportsDataModel {
  const _NearbyReportsDataModel({@JsonKey(name: "id") this.id, @JsonKey(name: "category") this.category, @JsonKey(name: "status") this.status, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "latitude") this.latitude, @JsonKey(name: "longitude") this.longitude, @JsonKey(name: "created_at") this.createdAt}): _photoUrls = photoUrls;
  factory _NearbyReportsDataModel.fromJson(Map<String, dynamic> json) => _$NearbyReportsDataModelFromJson(json);

@override@JsonKey(name: "id") final  String? id;
@override@JsonKey(name: "category") final  NearbyReportsCategoryModel? category;
@override@JsonKey(name: "status") final  String? status;
 final  List<String>? _photoUrls;
@override@JsonKey(name: "photo_urls") List<String>? get photoUrls {
  final value = _photoUrls;
  if (value == null) return null;
  if (_photoUrls is EqualUnmodifiableListView) return _photoUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "latitude") final  double? latitude;
@override@JsonKey(name: "longitude") final  double? longitude;
@override@JsonKey(name: "created_at") final  String? createdAt;

/// Create a copy of NearbyReportsDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyReportsDataModelCopyWith<_NearbyReportsDataModel> get copyWith => __$NearbyReportsDataModelCopyWithImpl<_NearbyReportsDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NearbyReportsDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyReportsDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.photoUrls, _photoUrls)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,category,status,const DeepCollectionEquality().hash(_photoUrls),latitude,longitude,createdAt);
}

@override
String toString() {
    return 'NearbyReportsDataModel(id: $id, category: $category, status: $status, photoUrls: $photoUrls, latitude: $latitude, longitude: $longitude, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$NearbyReportsDataModelCopyWith<$Res> implements $NearbyReportsDataModelCopyWith<$Res> {
  factory _$NearbyReportsDataModelCopyWith(_NearbyReportsDataModel value, $Res Function(_NearbyReportsDataModel) _then) = __$NearbyReportsDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "category") NearbyReportsCategoryModel? category,@JsonKey(name: "status") String? status,@JsonKey(name: "photo_urls") List<String>? photoUrls,@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude,@JsonKey(name: "created_at") String? createdAt
});


@override $NearbyReportsCategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class __$NearbyReportsDataModelCopyWithImpl<$Res>
    implements _$NearbyReportsDataModelCopyWith<$Res> {
  __$NearbyReportsDataModelCopyWithImpl(this._self, this._then);

  final _NearbyReportsDataModel _self;
  final $Res Function(_NearbyReportsDataModel) _then;

/// Create a copy of NearbyReportsDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? category = freezed,Object? status = freezed,Object? photoUrls = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? createdAt = freezed,}) {
  return _then(_NearbyReportsDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as NearbyReportsCategoryModel?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,photoUrls: freezed == photoUrls ? _self._photoUrls : photoUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of NearbyReportsDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NearbyReportsCategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $NearbyReportsCategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc
mixin _$NearbyReportsCategoryModel {

@JsonKey(name: "id") int? get id;@JsonKey(name: "name") String? get name;@JsonKey(name: "slug") String? get slug;@JsonKey(name: "is_active") bool? get isActive;
/// Create a copy of NearbyReportsCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyReportsCategoryModelCopyWith<NearbyReportsCategoryModel> get copyWith => _$NearbyReportsCategoryModelCopyWithImpl<NearbyReportsCategoryModel>(this as NearbyReportsCategoryModel, _$identity);

  /// Serializes this NearbyReportsCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NearbyReportsCategoryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyReportsCategoryModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NearbyReportsCategoryModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.slug,_this.isActive);
}

@override
String toString() {
  final _this = this as NearbyReportsCategoryModel;
  return 'NearbyReportsCategoryModel(id: ${_this.id}, name: ${_this.name}, slug: ${_this.slug}, isActive: ${_this.isActive})';
}


}

/// @nodoc
abstract mixin class $NearbyReportsCategoryModelCopyWith<$Res>  {
  factory $NearbyReportsCategoryModelCopyWith(NearbyReportsCategoryModel value, $Res Function(NearbyReportsCategoryModel) _then) = _$NearbyReportsCategoryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "slug") String? slug,@JsonKey(name: "is_active") bool? isActive
});




}
/// @nodoc
class _$NearbyReportsCategoryModelCopyWithImpl<$Res>
    implements $NearbyReportsCategoryModelCopyWith<$Res> {
  _$NearbyReportsCategoryModelCopyWithImpl(this._self, this._then);

  final NearbyReportsCategoryModel _self;
  final $Res Function(NearbyReportsCategoryModel) _then;

/// Create a copy of NearbyReportsCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? slug = freezed,Object? isActive = freezed,}) {
  return _then(NearbyReportsCategoryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [NearbyReportsCategoryModel].
extension NearbyReportsCategoryModelPatterns on NearbyReportsCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearbyReportsCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearbyReportsCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearbyReportsCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _NearbyReportsCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearbyReportsCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _NearbyReportsCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name, @JsonKey(name: "slug")  String? slug, @JsonKey(name: "is_active")  bool? isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearbyReportsCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name, @JsonKey(name: "slug")  String? slug, @JsonKey(name: "is_active")  bool? isActive)  $default,) {final _that = this;
switch (_that) {
case _NearbyReportsCategoryModel():
return $default(_that.id,_that.name,_that.slug,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name, @JsonKey(name: "slug")  String? slug, @JsonKey(name: "is_active")  bool? isActive)?  $default,) {final _that = this;
switch (_that) {
case _NearbyReportsCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NearbyReportsCategoryModel implements NearbyReportsCategoryModel {
  const _NearbyReportsCategoryModel({@JsonKey(name: "id") this.id, @JsonKey(name: "name") this.name, @JsonKey(name: "slug") this.slug, @JsonKey(name: "is_active") this.isActive});
  factory _NearbyReportsCategoryModel.fromJson(Map<String, dynamic> json) => _$NearbyReportsCategoryModelFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "name") final  String? name;
@override@JsonKey(name: "slug") final  String? slug;
@override@JsonKey(name: "is_active") final  bool? isActive;

/// Create a copy of NearbyReportsCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyReportsCategoryModelCopyWith<_NearbyReportsCategoryModel> get copyWith => __$NearbyReportsCategoryModelCopyWithImpl<_NearbyReportsCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NearbyReportsCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyReportsCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,slug,isActive);
}

@override
String toString() {
    return 'NearbyReportsCategoryModel(id: $id, name: $name, slug: $slug, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$NearbyReportsCategoryModelCopyWith<$Res> implements $NearbyReportsCategoryModelCopyWith<$Res> {
  factory _$NearbyReportsCategoryModelCopyWith(_NearbyReportsCategoryModel value, $Res Function(_NearbyReportsCategoryModel) _then) = __$NearbyReportsCategoryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "slug") String? slug,@JsonKey(name: "is_active") bool? isActive
});




}
/// @nodoc
class __$NearbyReportsCategoryModelCopyWithImpl<$Res>
    implements _$NearbyReportsCategoryModelCopyWith<$Res> {
  __$NearbyReportsCategoryModelCopyWithImpl(this._self, this._then);

  final _NearbyReportsCategoryModel _self;
  final $Res Function(_NearbyReportsCategoryModel) _then;

/// Create a copy of NearbyReportsCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? slug = freezed,Object? isActive = freezed,}) {
  return _then(_NearbyReportsCategoryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
