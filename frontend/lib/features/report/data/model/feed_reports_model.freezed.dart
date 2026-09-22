// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_reports_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedReportsModel {

@JsonKey(name: "status") bool? get status;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") List<FeedReportsDataModel>? get data;
/// Create a copy of FeedReportsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedReportsModelCopyWith<FeedReportsModel> get copyWith => _$FeedReportsModelCopyWithImpl<FeedReportsModel>(this as FeedReportsModel, _$identity);

  /// Serializes this FeedReportsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedReportsModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'FeedReportsModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $FeedReportsModelCopyWith<$Res>  {
  factory $FeedReportsModelCopyWith(FeedReportsModel value, $Res Function(FeedReportsModel) _then) = _$FeedReportsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "message") String? message,@JsonKey(name: "data") List<FeedReportsDataModel>? data
});




}
/// @nodoc
class _$FeedReportsModelCopyWithImpl<$Res>
    implements $FeedReportsModelCopyWith<$Res> {
  _$FeedReportsModelCopyWithImpl(this._self, this._then);

  final FeedReportsModel _self;
  final $Res Function(FeedReportsModel) _then;

/// Create a copy of FeedReportsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(FeedReportsModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<FeedReportsDataModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedReportsModel].
extension FeedReportsModelPatterns on FeedReportsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedReportsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedReportsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedReportsModel value)  $default,){
final _that = this;
switch (_that) {
case _FeedReportsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedReportsModel value)?  $default,){
final _that = this;
switch (_that) {
case _FeedReportsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  List<FeedReportsDataModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedReportsModel() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  List<FeedReportsDataModel>? data)  $default,) {final _that = this;
switch (_that) {
case _FeedReportsModel():
return $default(_that.status,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  List<FeedReportsDataModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _FeedReportsModel() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedReportsModel implements FeedReportsModel {
  const _FeedReportsModel({@JsonKey(name: "status") this.status, @JsonKey(name: "message") this.message, @JsonKey(name: "data")  List<FeedReportsDataModel>? data}): _data = data;
  factory _FeedReportsModel.fromJson(Map<String, dynamic> json) => _$FeedReportsModelFromJson(json);

@override@JsonKey(name: "status") final  bool? status;
@override@JsonKey(name: "message") final  String? message;
 final  List<FeedReportsDataModel>? _data;
@override@JsonKey(name: "data") List<FeedReportsDataModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of FeedReportsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedReportsModelCopyWith<_FeedReportsModel> get copyWith => __$FeedReportsModelCopyWithImpl<_FeedReportsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedReportsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedReportsModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'FeedReportsModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$FeedReportsModelCopyWith<$Res> implements $FeedReportsModelCopyWith<$Res> {
  factory _$FeedReportsModelCopyWith(_FeedReportsModel value, $Res Function(_FeedReportsModel) _then) = __$FeedReportsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "message") String? message,@JsonKey(name: "data") List<FeedReportsDataModel>? data
});




}
/// @nodoc
class __$FeedReportsModelCopyWithImpl<$Res>
    implements _$FeedReportsModelCopyWith<$Res> {
  __$FeedReportsModelCopyWithImpl(this._self, this._then);

  final _FeedReportsModel _self;
  final $Res Function(_FeedReportsModel) _then;

/// Create a copy of FeedReportsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_FeedReportsModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<FeedReportsDataModel>?,
  ));
}


}


/// @nodoc
mixin _$FeedReportsDataModel {

@JsonKey(name: "id") String? get id;@JsonKey(name: "category") FeedReportsCategoryModel? get category;@JsonKey(name: "status") String? get status;@JsonKey(name: "description") String? get description;@JsonKey(name: "photo_urls") List<String>? get photoUrls;@JsonKey(name: "latitude") double? get latitude;@JsonKey(name: "longitude") double? get longitude;@JsonKey(name: "created_at") String? get createdAt;
/// Create a copy of FeedReportsDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedReportsDataModelCopyWith<FeedReportsDataModel> get copyWith => _$FeedReportsDataModelCopyWithImpl<FeedReportsDataModel>(this as FeedReportsDataModel, _$identity);

  /// Serializes this FeedReportsDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedReportsDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.photoUrls, photoUrls)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,status,description,const DeepCollectionEquality().hash(photoUrls),latitude,longitude,createdAt);

@override
String toString() {
  return 'FeedReportsDataModel(id: $id, category: $category, status: $status, description: $description, photoUrls: $photoUrls, latitude: $latitude, longitude: $longitude, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FeedReportsDataModelCopyWith<$Res>  {
  factory $FeedReportsDataModelCopyWith(FeedReportsDataModel value, $Res Function(FeedReportsDataModel) _then) = _$FeedReportsDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "category") FeedReportsCategoryModel? category,@JsonKey(name: "status") String? status,@JsonKey(name: "description") String? description,@JsonKey(name: "photo_urls") List<String>? photoUrls,@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude,@JsonKey(name: "created_at") String? createdAt
});


$FeedReportsCategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class _$FeedReportsDataModelCopyWithImpl<$Res>
    implements $FeedReportsDataModelCopyWith<$Res> {
  _$FeedReportsDataModelCopyWithImpl(this._self, this._then);

  final FeedReportsDataModel _self;
  final $Res Function(FeedReportsDataModel) _then;

/// Create a copy of FeedReportsDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? category = freezed,Object? status = freezed,Object? description = freezed,Object? photoUrls = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? createdAt = freezed,}) {
  return _then(FeedReportsDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as FeedReportsCategoryModel?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photoUrls: freezed == photoUrls ? _self.photoUrls : photoUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of FeedReportsDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeedReportsCategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $FeedReportsCategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [FeedReportsDataModel].
extension FeedReportsDataModelPatterns on FeedReportsDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedReportsDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedReportsDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedReportsDataModel value)  $default,){
final _that = this;
switch (_that) {
case _FeedReportsDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedReportsDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _FeedReportsDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "category")  FeedReportsCategoryModel? category, @JsonKey(name: "status")  String? status, @JsonKey(name: "description")  String? description, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "created_at")  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedReportsDataModel() when $default != null:
return $default(_that.id,_that.category,_that.status,_that.description,_that.photoUrls,_that.latitude,_that.longitude,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "category")  FeedReportsCategoryModel? category, @JsonKey(name: "status")  String? status, @JsonKey(name: "description")  String? description, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "created_at")  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _FeedReportsDataModel():
return $default(_that.id,_that.category,_that.status,_that.description,_that.photoUrls,_that.latitude,_that.longitude,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "category")  FeedReportsCategoryModel? category, @JsonKey(name: "status")  String? status, @JsonKey(name: "description")  String? description, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "created_at")  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FeedReportsDataModel() when $default != null:
return $default(_that.id,_that.category,_that.status,_that.description,_that.photoUrls,_that.latitude,_that.longitude,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedReportsDataModel implements FeedReportsDataModel {
  const _FeedReportsDataModel({@JsonKey(name: "id") this.id, @JsonKey(name: "category") this.category, @JsonKey(name: "status") this.status, @JsonKey(name: "description") this.description, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "latitude") this.latitude, @JsonKey(name: "longitude") this.longitude, @JsonKey(name: "created_at") this.createdAt}): _photoUrls = photoUrls;
  factory _FeedReportsDataModel.fromJson(Map<String, dynamic> json) => _$FeedReportsDataModelFromJson(json);

@override@JsonKey(name: "id") final  String? id;
@override@JsonKey(name: "category") final  FeedReportsCategoryModel? category;
@override@JsonKey(name: "status") final  String? status;
@override@JsonKey(name: "description") final  String? description;
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

/// Create a copy of FeedReportsDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedReportsDataModelCopyWith<_FeedReportsDataModel> get copyWith => __$FeedReportsDataModelCopyWithImpl<_FeedReportsDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedReportsDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedReportsDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._photoUrls, _photoUrls)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,status,description,const DeepCollectionEquality().hash(_photoUrls),latitude,longitude,createdAt);

@override
String toString() {
  return 'FeedReportsDataModel(id: $id, category: $category, status: $status, description: $description, photoUrls: $photoUrls, latitude: $latitude, longitude: $longitude, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FeedReportsDataModelCopyWith<$Res> implements $FeedReportsDataModelCopyWith<$Res> {
  factory _$FeedReportsDataModelCopyWith(_FeedReportsDataModel value, $Res Function(_FeedReportsDataModel) _then) = __$FeedReportsDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "category") FeedReportsCategoryModel? category,@JsonKey(name: "status") String? status,@JsonKey(name: "description") String? description,@JsonKey(name: "photo_urls") List<String>? photoUrls,@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude,@JsonKey(name: "created_at") String? createdAt
});


@override $FeedReportsCategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class __$FeedReportsDataModelCopyWithImpl<$Res>
    implements _$FeedReportsDataModelCopyWith<$Res> {
  __$FeedReportsDataModelCopyWithImpl(this._self, this._then);

  final _FeedReportsDataModel _self;
  final $Res Function(_FeedReportsDataModel) _then;

/// Create a copy of FeedReportsDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? category = freezed,Object? status = freezed,Object? description = freezed,Object? photoUrls = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? createdAt = freezed,}) {
  return _then(_FeedReportsDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as FeedReportsCategoryModel?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photoUrls: freezed == photoUrls ? _self._photoUrls : photoUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of FeedReportsDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeedReportsCategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $FeedReportsCategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc
mixin _$FeedReportsCategoryModel {

@JsonKey(name: "id") int? get id;@JsonKey(name: "name") String? get name;@JsonKey(name: "slug") String? get slug;@JsonKey(name: "is_active") bool? get isActive;
/// Create a copy of FeedReportsCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedReportsCategoryModelCopyWith<FeedReportsCategoryModel> get copyWith => _$FeedReportsCategoryModelCopyWithImpl<FeedReportsCategoryModel>(this as FeedReportsCategoryModel, _$identity);

  /// Serializes this FeedReportsCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedReportsCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,isActive);

@override
String toString() {
  return 'FeedReportsCategoryModel(id: $id, name: $name, slug: $slug, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $FeedReportsCategoryModelCopyWith<$Res>  {
  factory $FeedReportsCategoryModelCopyWith(FeedReportsCategoryModel value, $Res Function(FeedReportsCategoryModel) _then) = _$FeedReportsCategoryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "slug") String? slug,@JsonKey(name: "is_active") bool? isActive
});




}
/// @nodoc
class _$FeedReportsCategoryModelCopyWithImpl<$Res>
    implements $FeedReportsCategoryModelCopyWith<$Res> {
  _$FeedReportsCategoryModelCopyWithImpl(this._self, this._then);

  final FeedReportsCategoryModel _self;
  final $Res Function(FeedReportsCategoryModel) _then;

/// Create a copy of FeedReportsCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? slug = freezed,Object? isActive = freezed,}) {
  return _then(FeedReportsCategoryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedReportsCategoryModel].
extension FeedReportsCategoryModelPatterns on FeedReportsCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedReportsCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedReportsCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedReportsCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _FeedReportsCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedReportsCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _FeedReportsCategoryModel() when $default != null:
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
case _FeedReportsCategoryModel() when $default != null:
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
case _FeedReportsCategoryModel():
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
case _FeedReportsCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedReportsCategoryModel implements FeedReportsCategoryModel {
  const _FeedReportsCategoryModel({@JsonKey(name: "id") this.id, @JsonKey(name: "name") this.name, @JsonKey(name: "slug") this.slug, @JsonKey(name: "is_active") this.isActive});
  factory _FeedReportsCategoryModel.fromJson(Map<String, dynamic> json) => _$FeedReportsCategoryModelFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "name") final  String? name;
@override@JsonKey(name: "slug") final  String? slug;
@override@JsonKey(name: "is_active") final  bool? isActive;

/// Create a copy of FeedReportsCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedReportsCategoryModelCopyWith<_FeedReportsCategoryModel> get copyWith => __$FeedReportsCategoryModelCopyWithImpl<_FeedReportsCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedReportsCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedReportsCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,isActive);

@override
String toString() {
  return 'FeedReportsCategoryModel(id: $id, name: $name, slug: $slug, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$FeedReportsCategoryModelCopyWith<$Res> implements $FeedReportsCategoryModelCopyWith<$Res> {
  factory _$FeedReportsCategoryModelCopyWith(_FeedReportsCategoryModel value, $Res Function(_FeedReportsCategoryModel) _then) = __$FeedReportsCategoryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "slug") String? slug,@JsonKey(name: "is_active") bool? isActive
});




}
/// @nodoc
class __$FeedReportsCategoryModelCopyWithImpl<$Res>
    implements _$FeedReportsCategoryModelCopyWith<$Res> {
  __$FeedReportsCategoryModelCopyWithImpl(this._self, this._then);

  final _FeedReportsCategoryModel _self;
  final $Res Function(_FeedReportsCategoryModel) _then;

/// Create a copy of FeedReportsCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? slug = freezed,Object? isActive = freezed,}) {
  return _then(_FeedReportsCategoryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
