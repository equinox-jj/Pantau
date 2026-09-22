// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportDetailModel {

@JsonKey(name: "status") bool? get status;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") ReportDetailDataModel? get data;
/// Create a copy of ReportDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportDetailModelCopyWith<ReportDetailModel> get copyWith => _$ReportDetailModelCopyWithImpl<ReportDetailModel>(this as ReportDetailModel, _$identity);

  /// Serializes this ReportDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportDetailModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'ReportDetailModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ReportDetailModelCopyWith<$Res>  {
  factory $ReportDetailModelCopyWith(ReportDetailModel value, $Res Function(ReportDetailModel) _then) = _$ReportDetailModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "message") String? message,@JsonKey(name: "data") ReportDetailDataModel? data
});


$ReportDetailDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$ReportDetailModelCopyWithImpl<$Res>
    implements $ReportDetailModelCopyWith<$Res> {
  _$ReportDetailModelCopyWithImpl(this._self, this._then);

  final ReportDetailModel _self;
  final $Res Function(ReportDetailModel) _then;

/// Create a copy of ReportDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(ReportDetailModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ReportDetailDataModel?,
  ));
}
/// Create a copy of ReportDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportDetailDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ReportDetailDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReportDetailModel].
extension ReportDetailModelPatterns on ReportDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _ReportDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReportDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  ReportDetailDataModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportDetailModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  ReportDetailDataModel? data)  $default,) {final _that = this;
switch (_that) {
case _ReportDetailModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  ReportDetailDataModel? data)?  $default,) {final _that = this;
switch (_that) {
case _ReportDetailModel() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportDetailModel implements ReportDetailModel {
  const _ReportDetailModel({@JsonKey(name: "status") this.status, @JsonKey(name: "message") this.message, @JsonKey(name: "data") this.data});
  factory _ReportDetailModel.fromJson(Map<String, dynamic> json) => _$ReportDetailModelFromJson(json);

@override@JsonKey(name: "status") final  bool? status;
@override@JsonKey(name: "message") final  String? message;
@override@JsonKey(name: "data") final  ReportDetailDataModel? data;

/// Create a copy of ReportDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportDetailModelCopyWith<_ReportDetailModel> get copyWith => __$ReportDetailModelCopyWithImpl<_ReportDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportDetailModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'ReportDetailModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ReportDetailModelCopyWith<$Res> implements $ReportDetailModelCopyWith<$Res> {
  factory _$ReportDetailModelCopyWith(_ReportDetailModel value, $Res Function(_ReportDetailModel) _then) = __$ReportDetailModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "message") String? message,@JsonKey(name: "data") ReportDetailDataModel? data
});


@override $ReportDetailDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$ReportDetailModelCopyWithImpl<$Res>
    implements _$ReportDetailModelCopyWith<$Res> {
  __$ReportDetailModelCopyWithImpl(this._self, this._then);

  final _ReportDetailModel _self;
  final $Res Function(_ReportDetailModel) _then;

/// Create a copy of ReportDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_ReportDetailModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ReportDetailDataModel?,
  ));
}

/// Create a copy of ReportDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportDetailDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ReportDetailDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ReportDetailDataModel {

@JsonKey(name: "id") String? get id;@JsonKey(name: "category") ReportDetailCategoryModel? get category;@JsonKey(name: "description") String? get description;@JsonKey(name: "photo_urls") List<String>? get photoUrls;@JsonKey(name: "latitude") double? get latitude;@JsonKey(name: "longitude") double? get longitude;@JsonKey(name: "status") String? get status;@JsonKey(name: "created_at") String? get createdAt;@JsonKey(name: "updated_at") String? get updatedAt;
/// Create a copy of ReportDetailDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportDetailDataModelCopyWith<ReportDetailDataModel> get copyWith => _$ReportDetailDataModelCopyWithImpl<ReportDetailDataModel>(this as ReportDetailDataModel, _$identity);

  /// Serializes this ReportDetailDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportDetailDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.photoUrls, photoUrls)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,description,const DeepCollectionEquality().hash(photoUrls),latitude,longitude,status,createdAt,updatedAt);

@override
String toString() {
  return 'ReportDetailDataModel(id: $id, category: $category, description: $description, photoUrls: $photoUrls, latitude: $latitude, longitude: $longitude, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ReportDetailDataModelCopyWith<$Res>  {
  factory $ReportDetailDataModelCopyWith(ReportDetailDataModel value, $Res Function(ReportDetailDataModel) _then) = _$ReportDetailDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "category") ReportDetailCategoryModel? category,@JsonKey(name: "description") String? description,@JsonKey(name: "photo_urls") List<String>? photoUrls,@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude,@JsonKey(name: "status") String? status,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "updated_at") String? updatedAt
});


$ReportDetailCategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class _$ReportDetailDataModelCopyWithImpl<$Res>
    implements $ReportDetailDataModelCopyWith<$Res> {
  _$ReportDetailDataModelCopyWithImpl(this._self, this._then);

  final ReportDetailDataModel _self;
  final $Res Function(ReportDetailDataModel) _then;

/// Create a copy of ReportDetailDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? category = freezed,Object? description = freezed,Object? photoUrls = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(ReportDetailDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ReportDetailCategoryModel?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photoUrls: freezed == photoUrls ? _self.photoUrls : photoUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ReportDetailDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportDetailCategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $ReportDetailCategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReportDetailDataModel].
extension ReportDetailDataModelPatterns on ReportDetailDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportDetailDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportDetailDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportDetailDataModel value)  $default,){
final _that = this;
switch (_that) {
case _ReportDetailDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportDetailDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReportDetailDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "category")  ReportDetailCategoryModel? category, @JsonKey(name: "description")  String? description, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "status")  String? status, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportDetailDataModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "category")  ReportDetailCategoryModel? category, @JsonKey(name: "description")  String? description, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "status")  String? status, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ReportDetailDataModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "category")  ReportDetailCategoryModel? category, @JsonKey(name: "description")  String? description, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "status")  String? status, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ReportDetailDataModel() when $default != null:
return $default(_that.id,_that.category,_that.description,_that.photoUrls,_that.latitude,_that.longitude,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportDetailDataModel implements ReportDetailDataModel {
  const _ReportDetailDataModel({@JsonKey(name: "id") this.id, @JsonKey(name: "category") this.category, @JsonKey(name: "description") this.description, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "latitude") this.latitude, @JsonKey(name: "longitude") this.longitude, @JsonKey(name: "status") this.status, @JsonKey(name: "created_at") this.createdAt, @JsonKey(name: "updated_at") this.updatedAt}): _photoUrls = photoUrls;
  factory _ReportDetailDataModel.fromJson(Map<String, dynamic> json) => _$ReportDetailDataModelFromJson(json);

@override@JsonKey(name: "id") final  String? id;
@override@JsonKey(name: "category") final  ReportDetailCategoryModel? category;
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

/// Create a copy of ReportDetailDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportDetailDataModelCopyWith<_ReportDetailDataModel> get copyWith => __$ReportDetailDataModelCopyWithImpl<_ReportDetailDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportDetailDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportDetailDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._photoUrls, _photoUrls)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,description,const DeepCollectionEquality().hash(_photoUrls),latitude,longitude,status,createdAt,updatedAt);

@override
String toString() {
  return 'ReportDetailDataModel(id: $id, category: $category, description: $description, photoUrls: $photoUrls, latitude: $latitude, longitude: $longitude, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ReportDetailDataModelCopyWith<$Res> implements $ReportDetailDataModelCopyWith<$Res> {
  factory _$ReportDetailDataModelCopyWith(_ReportDetailDataModel value, $Res Function(_ReportDetailDataModel) _then) = __$ReportDetailDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "category") ReportDetailCategoryModel? category,@JsonKey(name: "description") String? description,@JsonKey(name: "photo_urls") List<String>? photoUrls,@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude,@JsonKey(name: "status") String? status,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "updated_at") String? updatedAt
});


@override $ReportDetailCategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class __$ReportDetailDataModelCopyWithImpl<$Res>
    implements _$ReportDetailDataModelCopyWith<$Res> {
  __$ReportDetailDataModelCopyWithImpl(this._self, this._then);

  final _ReportDetailDataModel _self;
  final $Res Function(_ReportDetailDataModel) _then;

/// Create a copy of ReportDetailDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? category = freezed,Object? description = freezed,Object? photoUrls = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ReportDetailDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ReportDetailCategoryModel?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photoUrls: freezed == photoUrls ? _self._photoUrls : photoUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ReportDetailDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportDetailCategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $ReportDetailCategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc
mixin _$ReportDetailCategoryModel {

@JsonKey(name: "id") int? get id;@JsonKey(name: "name") String? get name;@JsonKey(name: "slug") String? get slug;@JsonKey(name: "is_active") bool? get isActive;
/// Create a copy of ReportDetailCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportDetailCategoryModelCopyWith<ReportDetailCategoryModel> get copyWith => _$ReportDetailCategoryModelCopyWithImpl<ReportDetailCategoryModel>(this as ReportDetailCategoryModel, _$identity);

  /// Serializes this ReportDetailCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportDetailCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,isActive);

@override
String toString() {
  return 'ReportDetailCategoryModel(id: $id, name: $name, slug: $slug, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $ReportDetailCategoryModelCopyWith<$Res>  {
  factory $ReportDetailCategoryModelCopyWith(ReportDetailCategoryModel value, $Res Function(ReportDetailCategoryModel) _then) = _$ReportDetailCategoryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "slug") String? slug,@JsonKey(name: "is_active") bool? isActive
});




}
/// @nodoc
class _$ReportDetailCategoryModelCopyWithImpl<$Res>
    implements $ReportDetailCategoryModelCopyWith<$Res> {
  _$ReportDetailCategoryModelCopyWithImpl(this._self, this._then);

  final ReportDetailCategoryModel _self;
  final $Res Function(ReportDetailCategoryModel) _then;

/// Create a copy of ReportDetailCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? slug = freezed,Object? isActive = freezed,}) {
  return _then(ReportDetailCategoryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportDetailCategoryModel].
extension ReportDetailCategoryModelPatterns on ReportDetailCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportDetailCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportDetailCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportDetailCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _ReportDetailCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportDetailCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReportDetailCategoryModel() when $default != null:
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
case _ReportDetailCategoryModel() when $default != null:
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
case _ReportDetailCategoryModel():
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
case _ReportDetailCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportDetailCategoryModel implements ReportDetailCategoryModel {
  const _ReportDetailCategoryModel({@JsonKey(name: "id") this.id, @JsonKey(name: "name") this.name, @JsonKey(name: "slug") this.slug, @JsonKey(name: "is_active") this.isActive});
  factory _ReportDetailCategoryModel.fromJson(Map<String, dynamic> json) => _$ReportDetailCategoryModelFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "name") final  String? name;
@override@JsonKey(name: "slug") final  String? slug;
@override@JsonKey(name: "is_active") final  bool? isActive;

/// Create a copy of ReportDetailCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportDetailCategoryModelCopyWith<_ReportDetailCategoryModel> get copyWith => __$ReportDetailCategoryModelCopyWithImpl<_ReportDetailCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportDetailCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportDetailCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,isActive);

@override
String toString() {
  return 'ReportDetailCategoryModel(id: $id, name: $name, slug: $slug, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$ReportDetailCategoryModelCopyWith<$Res> implements $ReportDetailCategoryModelCopyWith<$Res> {
  factory _$ReportDetailCategoryModelCopyWith(_ReportDetailCategoryModel value, $Res Function(_ReportDetailCategoryModel) _then) = __$ReportDetailCategoryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "slug") String? slug,@JsonKey(name: "is_active") bool? isActive
});




}
/// @nodoc
class __$ReportDetailCategoryModelCopyWithImpl<$Res>
    implements _$ReportDetailCategoryModelCopyWith<$Res> {
  __$ReportDetailCategoryModelCopyWithImpl(this._self, this._then);

  final _ReportDetailCategoryModel _self;
  final $Res Function(_ReportDetailCategoryModel) _then;

/// Create a copy of ReportDetailCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? slug = freezed,Object? isActive = freezed,}) {
  return _then(_ReportDetailCategoryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
