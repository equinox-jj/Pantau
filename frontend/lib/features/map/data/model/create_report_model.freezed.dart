// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateReportModel {

@JsonKey(name: "status") bool? get status;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") CreateReportDataModel? get data;
/// Create a copy of CreateReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateReportModelCopyWith<CreateReportModel> get copyWith => _$CreateReportModelCopyWithImpl<CreateReportModel>(this as CreateReportModel, _$identity);

  /// Serializes this CreateReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateReportModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'CreateReportModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $CreateReportModelCopyWith<$Res>  {
  factory $CreateReportModelCopyWith(CreateReportModel value, $Res Function(CreateReportModel) _then) = _$CreateReportModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "message") String? message,@JsonKey(name: "data") CreateReportDataModel? data
});


$CreateReportDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$CreateReportModelCopyWithImpl<$Res>
    implements $CreateReportModelCopyWith<$Res> {
  _$CreateReportModelCopyWithImpl(this._self, this._then);

  final CreateReportModel _self;
  final $Res Function(CreateReportModel) _then;

/// Create a copy of CreateReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(CreateReportModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CreateReportDataModel?,
  ));
}
/// Create a copy of CreateReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateReportDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $CreateReportDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateReportModel].
extension CreateReportModelPatterns on CreateReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateReportModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  CreateReportDataModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateReportModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  CreateReportDataModel? data)  $default,) {final _that = this;
switch (_that) {
case _CreateReportModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  CreateReportDataModel? data)?  $default,) {final _that = this;
switch (_that) {
case _CreateReportModel() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateReportModel implements CreateReportModel {
  const _CreateReportModel({@JsonKey(name: "status") this.status, @JsonKey(name: "message") this.message, @JsonKey(name: "data") this.data});
  factory _CreateReportModel.fromJson(Map<String, dynamic> json) => _$CreateReportModelFromJson(json);

@override@JsonKey(name: "status") final  bool? status;
@override@JsonKey(name: "message") final  String? message;
@override@JsonKey(name: "data") final  CreateReportDataModel? data;

/// Create a copy of CreateReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateReportModelCopyWith<_CreateReportModel> get copyWith => __$CreateReportModelCopyWithImpl<_CreateReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateReportModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'CreateReportModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CreateReportModelCopyWith<$Res> implements $CreateReportModelCopyWith<$Res> {
  factory _$CreateReportModelCopyWith(_CreateReportModel value, $Res Function(_CreateReportModel) _then) = __$CreateReportModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "message") String? message,@JsonKey(name: "data") CreateReportDataModel? data
});


@override $CreateReportDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$CreateReportModelCopyWithImpl<$Res>
    implements _$CreateReportModelCopyWith<$Res> {
  __$CreateReportModelCopyWithImpl(this._self, this._then);

  final _CreateReportModel _self;
  final $Res Function(_CreateReportModel) _then;

/// Create a copy of CreateReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_CreateReportModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CreateReportDataModel?,
  ));
}

/// Create a copy of CreateReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateReportDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $CreateReportDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$CreateReportDataModel {

@JsonKey(name: "id") String? get id;@JsonKey(name: "category") CreateReportCategoryModel? get category;@JsonKey(name: "description") String? get description;@JsonKey(name: "photo_urls") List<String>? get photoUrls;@JsonKey(name: "latitude") double? get latitude;@JsonKey(name: "longitude") double? get longitude;@JsonKey(name: "status") String? get status;@JsonKey(name: "created_at") String? get createdAt;@JsonKey(name: "updated_at") String? get updatedAt;
/// Create a copy of CreateReportDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateReportDataModelCopyWith<CreateReportDataModel> get copyWith => _$CreateReportDataModelCopyWithImpl<CreateReportDataModel>(this as CreateReportDataModel, _$identity);

  /// Serializes this CreateReportDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateReportDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.photoUrls, photoUrls)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,description,const DeepCollectionEquality().hash(photoUrls),latitude,longitude,status,createdAt,updatedAt);

@override
String toString() {
  return 'CreateReportDataModel(id: $id, category: $category, description: $description, photoUrls: $photoUrls, latitude: $latitude, longitude: $longitude, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CreateReportDataModelCopyWith<$Res>  {
  factory $CreateReportDataModelCopyWith(CreateReportDataModel value, $Res Function(CreateReportDataModel) _then) = _$CreateReportDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "category") CreateReportCategoryModel? category,@JsonKey(name: "description") String? description,@JsonKey(name: "photo_urls") List<String>? photoUrls,@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude,@JsonKey(name: "status") String? status,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "updated_at") String? updatedAt
});


$CreateReportCategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class _$CreateReportDataModelCopyWithImpl<$Res>
    implements $CreateReportDataModelCopyWith<$Res> {
  _$CreateReportDataModelCopyWithImpl(this._self, this._then);

  final CreateReportDataModel _self;
  final $Res Function(CreateReportDataModel) _then;

/// Create a copy of CreateReportDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? category = freezed,Object? description = freezed,Object? photoUrls = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(CreateReportDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CreateReportCategoryModel?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photoUrls: freezed == photoUrls ? _self.photoUrls : photoUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CreateReportDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateReportCategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CreateReportCategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateReportDataModel].
extension CreateReportDataModelPatterns on CreateReportDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateReportDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateReportDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateReportDataModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateReportDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateReportDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateReportDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "category")  CreateReportCategoryModel? category, @JsonKey(name: "description")  String? description, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "status")  String? status, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateReportDataModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "category")  CreateReportCategoryModel? category, @JsonKey(name: "description")  String? description, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "status")  String? status, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CreateReportDataModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "category")  CreateReportCategoryModel? category, @JsonKey(name: "description")  String? description, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "status")  String? status, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CreateReportDataModel() when $default != null:
return $default(_that.id,_that.category,_that.description,_that.photoUrls,_that.latitude,_that.longitude,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateReportDataModel implements CreateReportDataModel {
  const _CreateReportDataModel({@JsonKey(name: "id") this.id, @JsonKey(name: "category") this.category, @JsonKey(name: "description") this.description, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "latitude") this.latitude, @JsonKey(name: "longitude") this.longitude, @JsonKey(name: "status") this.status, @JsonKey(name: "created_at") this.createdAt, @JsonKey(name: "updated_at") this.updatedAt}): _photoUrls = photoUrls;
  factory _CreateReportDataModel.fromJson(Map<String, dynamic> json) => _$CreateReportDataModelFromJson(json);

@override@JsonKey(name: "id") final  String? id;
@override@JsonKey(name: "category") final  CreateReportCategoryModel? category;
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
@override@JsonKey(name: "status") final  String? status;
@override@JsonKey(name: "created_at") final  String? createdAt;
@override@JsonKey(name: "updated_at") final  String? updatedAt;

/// Create a copy of CreateReportDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateReportDataModelCopyWith<_CreateReportDataModel> get copyWith => __$CreateReportDataModelCopyWithImpl<_CreateReportDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateReportDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateReportDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._photoUrls, _photoUrls)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,description,const DeepCollectionEquality().hash(_photoUrls),latitude,longitude,status,createdAt,updatedAt);

@override
String toString() {
  return 'CreateReportDataModel(id: $id, category: $category, description: $description, photoUrls: $photoUrls, latitude: $latitude, longitude: $longitude, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CreateReportDataModelCopyWith<$Res> implements $CreateReportDataModelCopyWith<$Res> {
  factory _$CreateReportDataModelCopyWith(_CreateReportDataModel value, $Res Function(_CreateReportDataModel) _then) = __$CreateReportDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "category") CreateReportCategoryModel? category,@JsonKey(name: "description") String? description,@JsonKey(name: "photo_urls") List<String>? photoUrls,@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude,@JsonKey(name: "status") String? status,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "updated_at") String? updatedAt
});


@override $CreateReportCategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class __$CreateReportDataModelCopyWithImpl<$Res>
    implements _$CreateReportDataModelCopyWith<$Res> {
  __$CreateReportDataModelCopyWithImpl(this._self, this._then);

  final _CreateReportDataModel _self;
  final $Res Function(_CreateReportDataModel) _then;

/// Create a copy of CreateReportDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? category = freezed,Object? description = freezed,Object? photoUrls = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_CreateReportDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CreateReportCategoryModel?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photoUrls: freezed == photoUrls ? _self._photoUrls : photoUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CreateReportDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateReportCategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CreateReportCategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc
mixin _$CreateReportCategoryModel {

@JsonKey(name: "id") int? get id;@JsonKey(name: "name") String? get name;@JsonKey(name: "slug") String? get slug;@JsonKey(name: "is_active") bool? get isActive;
/// Create a copy of CreateReportCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateReportCategoryModelCopyWith<CreateReportCategoryModel> get copyWith => _$CreateReportCategoryModelCopyWithImpl<CreateReportCategoryModel>(this as CreateReportCategoryModel, _$identity);

  /// Serializes this CreateReportCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateReportCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,isActive);

@override
String toString() {
  return 'CreateReportCategoryModel(id: $id, name: $name, slug: $slug, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $CreateReportCategoryModelCopyWith<$Res>  {
  factory $CreateReportCategoryModelCopyWith(CreateReportCategoryModel value, $Res Function(CreateReportCategoryModel) _then) = _$CreateReportCategoryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "slug") String? slug,@JsonKey(name: "is_active") bool? isActive
});




}
/// @nodoc
class _$CreateReportCategoryModelCopyWithImpl<$Res>
    implements $CreateReportCategoryModelCopyWith<$Res> {
  _$CreateReportCategoryModelCopyWithImpl(this._self, this._then);

  final CreateReportCategoryModel _self;
  final $Res Function(CreateReportCategoryModel) _then;

/// Create a copy of CreateReportCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? slug = freezed,Object? isActive = freezed,}) {
  return _then(CreateReportCategoryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateReportCategoryModel].
extension CreateReportCategoryModelPatterns on CreateReportCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateReportCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateReportCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateReportCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateReportCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateReportCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateReportCategoryModel() when $default != null:
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
case _CreateReportCategoryModel() when $default != null:
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
case _CreateReportCategoryModel():
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
case _CreateReportCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateReportCategoryModel implements CreateReportCategoryModel {
  const _CreateReportCategoryModel({@JsonKey(name: "id") this.id, @JsonKey(name: "name") this.name, @JsonKey(name: "slug") this.slug, @JsonKey(name: "is_active") this.isActive});
  factory _CreateReportCategoryModel.fromJson(Map<String, dynamic> json) => _$CreateReportCategoryModelFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "name") final  String? name;
@override@JsonKey(name: "slug") final  String? slug;
@override@JsonKey(name: "is_active") final  bool? isActive;

/// Create a copy of CreateReportCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateReportCategoryModelCopyWith<_CreateReportCategoryModel> get copyWith => __$CreateReportCategoryModelCopyWithImpl<_CreateReportCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateReportCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateReportCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,isActive);

@override
String toString() {
  return 'CreateReportCategoryModel(id: $id, name: $name, slug: $slug, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$CreateReportCategoryModelCopyWith<$Res> implements $CreateReportCategoryModelCopyWith<$Res> {
  factory _$CreateReportCategoryModelCopyWith(_CreateReportCategoryModel value, $Res Function(_CreateReportCategoryModel) _then) = __$CreateReportCategoryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "slug") String? slug,@JsonKey(name: "is_active") bool? isActive
});




}
/// @nodoc
class __$CreateReportCategoryModelCopyWithImpl<$Res>
    implements _$CreateReportCategoryModelCopyWith<$Res> {
  __$CreateReportCategoryModelCopyWithImpl(this._self, this._then);

  final _CreateReportCategoryModel _self;
  final $Res Function(_CreateReportCategoryModel) _then;

/// Create a copy of CreateReportCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? slug = freezed,Object? isActive = freezed,}) {
  return _then(_CreateReportCategoryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
