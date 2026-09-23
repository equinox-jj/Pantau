// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resolver_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueueModel {

@JsonKey(name: "items") List<QueueReportDataModel>? get items;@JsonKey(name: "counts") QueueCountsModel? get counts;
/// Create a copy of QueueModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueModelCopyWith<QueueModel> get copyWith => _$QueueModelCopyWithImpl<QueueModel>(this as QueueModel, _$identity);

  /// Serializes this QueueModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QueueModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueModel&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.counts, _this.counts) || other.counts == _this.counts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QueueModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.items),_this.counts);
}

@override
String toString() {
  final _this = this as QueueModel;
  return 'QueueModel(items: ${_this.items}, counts: ${_this.counts})';
}


}

/// @nodoc
abstract mixin class $QueueModelCopyWith<$Res>  {
  factory $QueueModelCopyWith(QueueModel value, $Res Function(QueueModel) _then) = _$QueueModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "items") List<QueueReportDataModel>? items,@JsonKey(name: "counts") QueueCountsModel? counts
});


$QueueCountsModelCopyWith<$Res>? get counts;

}
/// @nodoc
class _$QueueModelCopyWithImpl<$Res>
    implements $QueueModelCopyWith<$Res> {
  _$QueueModelCopyWithImpl(this._self, this._then);

  final QueueModel _self;
  final $Res Function(QueueModel) _then;

/// Create a copy of QueueModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = freezed,Object? counts = freezed,}) {
  return _then(QueueModel(
items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<QueueReportDataModel>?,counts: freezed == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as QueueCountsModel?,
  ));
}
/// Create a copy of QueueModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueCountsModelCopyWith<$Res>? get counts {
    if (_self.counts == null) {
    return null;
  }

  return $QueueCountsModelCopyWith<$Res>(_self.counts!, (value) {
    return _then(_self.copyWith(counts: value));
  });
}
}


/// Adds pattern-matching-related methods to [QueueModel].
extension QueueModelPatterns on QueueModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueueModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueueModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueueModel value)  $default,){
final _that = this;
switch (_that) {
case _QueueModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueueModel value)?  $default,){
final _that = this;
switch (_that) {
case _QueueModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "items")  List<QueueReportDataModel>? items, @JsonKey(name: "counts")  QueueCountsModel? counts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueModel() when $default != null:
return $default(_that.items,_that.counts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "items")  List<QueueReportDataModel>? items, @JsonKey(name: "counts")  QueueCountsModel? counts)  $default,) {final _that = this;
switch (_that) {
case _QueueModel():
return $default(_that.items,_that.counts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "items")  List<QueueReportDataModel>? items, @JsonKey(name: "counts")  QueueCountsModel? counts)?  $default,) {final _that = this;
switch (_that) {
case _QueueModel() when $default != null:
return $default(_that.items,_that.counts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueueModel implements QueueModel {
  const _QueueModel({@JsonKey(name: "items")  List<QueueReportDataModel>? items, @JsonKey(name: "counts") this.counts}): _items = items;
  factory _QueueModel.fromJson(Map<String, dynamic> json) => _$QueueModelFromJson(json);

 final  List<QueueReportDataModel>? _items;
@override@JsonKey(name: "items") List<QueueReportDataModel>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "counts") final  QueueCountsModel? counts;

/// Create a copy of QueueModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueueModelCopyWith<_QueueModel> get copyWith => __$QueueModelCopyWithImpl<_QueueModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueueModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueModel&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.counts, counts) || other.counts == counts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),counts);
}

@override
String toString() {
    return 'QueueModel(items: $items, counts: $counts)';
}


}

/// @nodoc
abstract mixin class _$QueueModelCopyWith<$Res> implements $QueueModelCopyWith<$Res> {
  factory _$QueueModelCopyWith(_QueueModel value, $Res Function(_QueueModel) _then) = __$QueueModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "items") List<QueueReportDataModel>? items,@JsonKey(name: "counts") QueueCountsModel? counts
});


@override $QueueCountsModelCopyWith<$Res>? get counts;

}
/// @nodoc
class __$QueueModelCopyWithImpl<$Res>
    implements _$QueueModelCopyWith<$Res> {
  __$QueueModelCopyWithImpl(this._self, this._then);

  final _QueueModel _self;
  final $Res Function(_QueueModel) _then;

/// Create a copy of QueueModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = freezed,Object? counts = freezed,}) {
  return _then(_QueueModel(
items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<QueueReportDataModel>?,counts: freezed == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as QueueCountsModel?,
  ));
}

/// Create a copy of QueueModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueCountsModelCopyWith<$Res>? get counts {
    if (_self.counts == null) {
    return null;
  }

  return $QueueCountsModelCopyWith<$Res>(_self.counts!, (value) {
    return _then(_self.copyWith(counts: value));
  });
}
}


/// @nodoc
mixin _$QueueReportDataModel {

@JsonKey(name: "id") String? get id;@JsonKey(name: "category") QueueCategoryModel? get category;@JsonKey(name: "description") String? get description;@JsonKey(name: "photo_url") String? get photoUrl;@JsonKey(name: "status") String? get status;@JsonKey(name: "latitude") double? get latitude;@JsonKey(name: "longitude") double? get longitude;@JsonKey(name: "distance_meter") double? get distanceMeter;@JsonKey(name: "created_at") String? get createdAt;
/// Create a copy of QueueReportDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueReportDataModelCopyWith<QueueReportDataModel> get copyWith => _$QueueReportDataModelCopyWithImpl<QueueReportDataModel>(this as QueueReportDataModel, _$identity);

  /// Serializes this QueueReportDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QueueReportDataModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueReportDataModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.photoUrl, _this.photoUrl) || other.photoUrl == _this.photoUrl)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.distanceMeter, _this.distanceMeter) || other.distanceMeter == _this.distanceMeter)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QueueReportDataModel;
  return Object.hash(runtimeType,_this.id,_this.category,_this.description,_this.photoUrl,_this.status,_this.latitude,_this.longitude,_this.distanceMeter,_this.createdAt);
}

@override
String toString() {
  final _this = this as QueueReportDataModel;
  return 'QueueReportDataModel(id: ${_this.id}, category: ${_this.category}, description: ${_this.description}, photoUrl: ${_this.photoUrl}, status: ${_this.status}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, distanceMeter: ${_this.distanceMeter}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $QueueReportDataModelCopyWith<$Res>  {
  factory $QueueReportDataModelCopyWith(QueueReportDataModel value, $Res Function(QueueReportDataModel) _then) = _$QueueReportDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "category") QueueCategoryModel? category,@JsonKey(name: "description") String? description,@JsonKey(name: "photo_url") String? photoUrl,@JsonKey(name: "status") String? status,@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude,@JsonKey(name: "distance_meter") double? distanceMeter,@JsonKey(name: "created_at") String? createdAt
});


$QueueCategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class _$QueueReportDataModelCopyWithImpl<$Res>
    implements $QueueReportDataModelCopyWith<$Res> {
  _$QueueReportDataModelCopyWithImpl(this._self, this._then);

  final QueueReportDataModel _self;
  final $Res Function(QueueReportDataModel) _then;

/// Create a copy of QueueReportDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? category = freezed,Object? description = freezed,Object? photoUrl = freezed,Object? status = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceMeter = freezed,Object? createdAt = freezed,}) {
  return _then(QueueReportDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as QueueCategoryModel?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceMeter: freezed == distanceMeter ? _self.distanceMeter : distanceMeter // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of QueueReportDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueCategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $QueueCategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [QueueReportDataModel].
extension QueueReportDataModelPatterns on QueueReportDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueueReportDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueueReportDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueueReportDataModel value)  $default,){
final _that = this;
switch (_that) {
case _QueueReportDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueueReportDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _QueueReportDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "category")  QueueCategoryModel? category, @JsonKey(name: "description")  String? description, @JsonKey(name: "photo_url")  String? photoUrl, @JsonKey(name: "status")  String? status, @JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "distance_meter")  double? distanceMeter, @JsonKey(name: "created_at")  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueReportDataModel() when $default != null:
return $default(_that.id,_that.category,_that.description,_that.photoUrl,_that.status,_that.latitude,_that.longitude,_that.distanceMeter,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "category")  QueueCategoryModel? category, @JsonKey(name: "description")  String? description, @JsonKey(name: "photo_url")  String? photoUrl, @JsonKey(name: "status")  String? status, @JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "distance_meter")  double? distanceMeter, @JsonKey(name: "created_at")  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _QueueReportDataModel():
return $default(_that.id,_that.category,_that.description,_that.photoUrl,_that.status,_that.latitude,_that.longitude,_that.distanceMeter,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "category")  QueueCategoryModel? category, @JsonKey(name: "description")  String? description, @JsonKey(name: "photo_url")  String? photoUrl, @JsonKey(name: "status")  String? status, @JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "distance_meter")  double? distanceMeter, @JsonKey(name: "created_at")  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _QueueReportDataModel() when $default != null:
return $default(_that.id,_that.category,_that.description,_that.photoUrl,_that.status,_that.latitude,_that.longitude,_that.distanceMeter,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueueReportDataModel implements QueueReportDataModel {
  const _QueueReportDataModel({@JsonKey(name: "id") this.id, @JsonKey(name: "category") this.category, @JsonKey(name: "description") this.description, @JsonKey(name: "photo_url") this.photoUrl, @JsonKey(name: "status") this.status, @JsonKey(name: "latitude") this.latitude, @JsonKey(name: "longitude") this.longitude, @JsonKey(name: "distance_meter") this.distanceMeter, @JsonKey(name: "created_at") this.createdAt});
  factory _QueueReportDataModel.fromJson(Map<String, dynamic> json) => _$QueueReportDataModelFromJson(json);

@override@JsonKey(name: "id") final  String? id;
@override@JsonKey(name: "category") final  QueueCategoryModel? category;
@override@JsonKey(name: "description") final  String? description;
@override@JsonKey(name: "photo_url") final  String? photoUrl;
@override@JsonKey(name: "status") final  String? status;
@override@JsonKey(name: "latitude") final  double? latitude;
@override@JsonKey(name: "longitude") final  double? longitude;
@override@JsonKey(name: "distance_meter") final  double? distanceMeter;
@override@JsonKey(name: "created_at") final  String? createdAt;

/// Create a copy of QueueReportDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueueReportDataModelCopyWith<_QueueReportDataModel> get copyWith => __$QueueReportDataModelCopyWithImpl<_QueueReportDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueueReportDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueReportDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceMeter, distanceMeter) || other.distanceMeter == distanceMeter)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,category,description,photoUrl,status,latitude,longitude,distanceMeter,createdAt);
}

@override
String toString() {
    return 'QueueReportDataModel(id: $id, category: $category, description: $description, photoUrl: $photoUrl, status: $status, latitude: $latitude, longitude: $longitude, distanceMeter: $distanceMeter, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$QueueReportDataModelCopyWith<$Res> implements $QueueReportDataModelCopyWith<$Res> {
  factory _$QueueReportDataModelCopyWith(_QueueReportDataModel value, $Res Function(_QueueReportDataModel) _then) = __$QueueReportDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "category") QueueCategoryModel? category,@JsonKey(name: "description") String? description,@JsonKey(name: "photo_url") String? photoUrl,@JsonKey(name: "status") String? status,@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude,@JsonKey(name: "distance_meter") double? distanceMeter,@JsonKey(name: "created_at") String? createdAt
});


@override $QueueCategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class __$QueueReportDataModelCopyWithImpl<$Res>
    implements _$QueueReportDataModelCopyWith<$Res> {
  __$QueueReportDataModelCopyWithImpl(this._self, this._then);

  final _QueueReportDataModel _self;
  final $Res Function(_QueueReportDataModel) _then;

/// Create a copy of QueueReportDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? category = freezed,Object? description = freezed,Object? photoUrl = freezed,Object? status = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceMeter = freezed,Object? createdAt = freezed,}) {
  return _then(_QueueReportDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as QueueCategoryModel?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceMeter: freezed == distanceMeter ? _self.distanceMeter : distanceMeter // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of QueueReportDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueCategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $QueueCategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc
mixin _$QueueCategoryModel {

@JsonKey(name: "id") int? get id;@JsonKey(name: "name") String? get name;@JsonKey(name: "slug") String? get slug;@JsonKey(name: "is_active") bool? get isActive;
/// Create a copy of QueueCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueCategoryModelCopyWith<QueueCategoryModel> get copyWith => _$QueueCategoryModelCopyWithImpl<QueueCategoryModel>(this as QueueCategoryModel, _$identity);

  /// Serializes this QueueCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QueueCategoryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueCategoryModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QueueCategoryModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.slug,_this.isActive);
}

@override
String toString() {
  final _this = this as QueueCategoryModel;
  return 'QueueCategoryModel(id: ${_this.id}, name: ${_this.name}, slug: ${_this.slug}, isActive: ${_this.isActive})';
}


}

/// @nodoc
abstract mixin class $QueueCategoryModelCopyWith<$Res>  {
  factory $QueueCategoryModelCopyWith(QueueCategoryModel value, $Res Function(QueueCategoryModel) _then) = _$QueueCategoryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "slug") String? slug,@JsonKey(name: "is_active") bool? isActive
});




}
/// @nodoc
class _$QueueCategoryModelCopyWithImpl<$Res>
    implements $QueueCategoryModelCopyWith<$Res> {
  _$QueueCategoryModelCopyWithImpl(this._self, this._then);

  final QueueCategoryModel _self;
  final $Res Function(QueueCategoryModel) _then;

/// Create a copy of QueueCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? slug = freezed,Object? isActive = freezed,}) {
  return _then(QueueCategoryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [QueueCategoryModel].
extension QueueCategoryModelPatterns on QueueCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueueCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueueCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueueCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _QueueCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueueCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _QueueCategoryModel() when $default != null:
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
case _QueueCategoryModel() when $default != null:
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
case _QueueCategoryModel():
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
case _QueueCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueueCategoryModel implements QueueCategoryModel {
  const _QueueCategoryModel({@JsonKey(name: "id") this.id, @JsonKey(name: "name") this.name, @JsonKey(name: "slug") this.slug, @JsonKey(name: "is_active") this.isActive});
  factory _QueueCategoryModel.fromJson(Map<String, dynamic> json) => _$QueueCategoryModelFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "name") final  String? name;
@override@JsonKey(name: "slug") final  String? slug;
@override@JsonKey(name: "is_active") final  bool? isActive;

/// Create a copy of QueueCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueueCategoryModelCopyWith<_QueueCategoryModel> get copyWith => __$QueueCategoryModelCopyWithImpl<_QueueCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueueCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,slug,isActive);
}

@override
String toString() {
    return 'QueueCategoryModel(id: $id, name: $name, slug: $slug, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$QueueCategoryModelCopyWith<$Res> implements $QueueCategoryModelCopyWith<$Res> {
  factory _$QueueCategoryModelCopyWith(_QueueCategoryModel value, $Res Function(_QueueCategoryModel) _then) = __$QueueCategoryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "slug") String? slug,@JsonKey(name: "is_active") bool? isActive
});




}
/// @nodoc
class __$QueueCategoryModelCopyWithImpl<$Res>
    implements _$QueueCategoryModelCopyWith<$Res> {
  __$QueueCategoryModelCopyWithImpl(this._self, this._then);

  final _QueueCategoryModel _self;
  final $Res Function(_QueueCategoryModel) _then;

/// Create a copy of QueueCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? slug = freezed,Object? isActive = freezed,}) {
  return _then(_QueueCategoryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$QueueCountsModel {

@JsonKey(name: "open") int? get open;@JsonKey(name: "in_progress") int? get inProgress;@JsonKey(name: "resolved") int? get resolved;
/// Create a copy of QueueCountsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueCountsModelCopyWith<QueueCountsModel> get copyWith => _$QueueCountsModelCopyWithImpl<QueueCountsModel>(this as QueueCountsModel, _$identity);

  /// Serializes this QueueCountsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QueueCountsModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueCountsModel&&(identical(other.open, _this.open) || other.open == _this.open)&&(identical(other.inProgress, _this.inProgress) || other.inProgress == _this.inProgress)&&(identical(other.resolved, _this.resolved) || other.resolved == _this.resolved));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QueueCountsModel;
  return Object.hash(runtimeType,_this.open,_this.inProgress,_this.resolved);
}

@override
String toString() {
  final _this = this as QueueCountsModel;
  return 'QueueCountsModel(open: ${_this.open}, inProgress: ${_this.inProgress}, resolved: ${_this.resolved})';
}


}

/// @nodoc
abstract mixin class $QueueCountsModelCopyWith<$Res>  {
  factory $QueueCountsModelCopyWith(QueueCountsModel value, $Res Function(QueueCountsModel) _then) = _$QueueCountsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "open") int? open,@JsonKey(name: "in_progress") int? inProgress,@JsonKey(name: "resolved") int? resolved
});




}
/// @nodoc
class _$QueueCountsModelCopyWithImpl<$Res>
    implements $QueueCountsModelCopyWith<$Res> {
  _$QueueCountsModelCopyWithImpl(this._self, this._then);

  final QueueCountsModel _self;
  final $Res Function(QueueCountsModel) _then;

/// Create a copy of QueueCountsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? open = freezed,Object? inProgress = freezed,Object? resolved = freezed,}) {
  return _then(QueueCountsModel(
open: freezed == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as int?,inProgress: freezed == inProgress ? _self.inProgress : inProgress // ignore: cast_nullable_to_non_nullable
as int?,resolved: freezed == resolved ? _self.resolved : resolved // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [QueueCountsModel].
extension QueueCountsModelPatterns on QueueCountsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueueCountsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueueCountsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueueCountsModel value)  $default,){
final _that = this;
switch (_that) {
case _QueueCountsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueueCountsModel value)?  $default,){
final _that = this;
switch (_that) {
case _QueueCountsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "open")  int? open, @JsonKey(name: "in_progress")  int? inProgress, @JsonKey(name: "resolved")  int? resolved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueCountsModel() when $default != null:
return $default(_that.open,_that.inProgress,_that.resolved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "open")  int? open, @JsonKey(name: "in_progress")  int? inProgress, @JsonKey(name: "resolved")  int? resolved)  $default,) {final _that = this;
switch (_that) {
case _QueueCountsModel():
return $default(_that.open,_that.inProgress,_that.resolved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "open")  int? open, @JsonKey(name: "in_progress")  int? inProgress, @JsonKey(name: "resolved")  int? resolved)?  $default,) {final _that = this;
switch (_that) {
case _QueueCountsModel() when $default != null:
return $default(_that.open,_that.inProgress,_that.resolved);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueueCountsModel implements QueueCountsModel {
  const _QueueCountsModel({@JsonKey(name: "open") this.open, @JsonKey(name: "in_progress") this.inProgress, @JsonKey(name: "resolved") this.resolved});
  factory _QueueCountsModel.fromJson(Map<String, dynamic> json) => _$QueueCountsModelFromJson(json);

@override@JsonKey(name: "open") final  int? open;
@override@JsonKey(name: "in_progress") final  int? inProgress;
@override@JsonKey(name: "resolved") final  int? resolved;

/// Create a copy of QueueCountsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueueCountsModelCopyWith<_QueueCountsModel> get copyWith => __$QueueCountsModelCopyWithImpl<_QueueCountsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueueCountsModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueCountsModel&&(identical(other.open, open) || other.open == open)&&(identical(other.inProgress, inProgress) || other.inProgress == inProgress)&&(identical(other.resolved, resolved) || other.resolved == resolved));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,open,inProgress,resolved);
}

@override
String toString() {
    return 'QueueCountsModel(open: $open, inProgress: $inProgress, resolved: $resolved)';
}


}

/// @nodoc
abstract mixin class _$QueueCountsModelCopyWith<$Res> implements $QueueCountsModelCopyWith<$Res> {
  factory _$QueueCountsModelCopyWith(_QueueCountsModel value, $Res Function(_QueueCountsModel) _then) = __$QueueCountsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "open") int? open,@JsonKey(name: "in_progress") int? inProgress,@JsonKey(name: "resolved") int? resolved
});




}
/// @nodoc
class __$QueueCountsModelCopyWithImpl<$Res>
    implements _$QueueCountsModelCopyWith<$Res> {
  __$QueueCountsModelCopyWithImpl(this._self, this._then);

  final _QueueCountsModel _self;
  final $Res Function(_QueueCountsModel) _then;

/// Create a copy of QueueCountsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? open = freezed,Object? inProgress = freezed,Object? resolved = freezed,}) {
  return _then(_QueueCountsModel(
open: freezed == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as int?,inProgress: freezed == inProgress ? _self.inProgress : inProgress // ignore: cast_nullable_to_non_nullable
as int?,resolved: freezed == resolved ? _self.resolved : resolved // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
