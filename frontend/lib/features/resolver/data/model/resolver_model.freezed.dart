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

@JsonKey(name: "status") bool? get status;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") QueueDataModel? get data;
/// Create a copy of QueueModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueModelCopyWith<QueueModel> get copyWith => _$QueueModelCopyWithImpl<QueueModel>(this as QueueModel, _$identity);

  /// Serializes this QueueModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'QueueModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $QueueModelCopyWith<$Res>  {
  factory $QueueModelCopyWith(QueueModel value, $Res Function(QueueModel) _then) = _$QueueModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "message") String? message,@JsonKey(name: "data") QueueDataModel? data
});


$QueueDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$QueueModelCopyWithImpl<$Res>
    implements $QueueModelCopyWith<$Res> {
  _$QueueModelCopyWithImpl(this._self, this._then);

  final QueueModel _self;
  final $Res Function(QueueModel) _then;

/// Create a copy of QueueModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(QueueModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as QueueDataModel?,
  ));
}
/// Create a copy of QueueModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $QueueDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  QueueDataModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  QueueDataModel? data)  $default,) {final _that = this;
switch (_that) {
case _QueueModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  QueueDataModel? data)?  $default,) {final _that = this;
switch (_that) {
case _QueueModel() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueueModel implements QueueModel {
  const _QueueModel({@JsonKey(name: "status") this.status, @JsonKey(name: "message") this.message, @JsonKey(name: "data") this.data});
  factory _QueueModel.fromJson(Map<String, dynamic> json) => _$QueueModelFromJson(json);

@override@JsonKey(name: "status") final  bool? status;
@override@JsonKey(name: "message") final  String? message;
@override@JsonKey(name: "data") final  QueueDataModel? data;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'QueueModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$QueueModelCopyWith<$Res> implements $QueueModelCopyWith<$Res> {
  factory _$QueueModelCopyWith(_QueueModel value, $Res Function(_QueueModel) _then) = __$QueueModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "message") String? message,@JsonKey(name: "data") QueueDataModel? data
});


@override $QueueDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$QueueModelCopyWithImpl<$Res>
    implements _$QueueModelCopyWith<$Res> {
  __$QueueModelCopyWithImpl(this._self, this._then);

  final _QueueModel _self;
  final $Res Function(_QueueModel) _then;

/// Create a copy of QueueModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_QueueModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as QueueDataModel?,
  ));
}

/// Create a copy of QueueModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $QueueDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$QueueDataModel {

@JsonKey(name: "items") List<QueueReportDataModel>? get items;@JsonKey(name: "meta") QueueMetaModel? get meta;@JsonKey(name: "counts") QueueCountsModel? get counts;
/// Create a copy of QueueDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueDataModelCopyWith<QueueDataModel> get copyWith => _$QueueDataModelCopyWithImpl<QueueDataModel>(this as QueueDataModel, _$identity);

  /// Serializes this QueueDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueDataModel&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.counts, counts) || other.counts == counts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),meta,counts);

@override
String toString() {
  return 'QueueDataModel(items: $items, meta: $meta, counts: $counts)';
}


}

/// @nodoc
abstract mixin class $QueueDataModelCopyWith<$Res>  {
  factory $QueueDataModelCopyWith(QueueDataModel value, $Res Function(QueueDataModel) _then) = _$QueueDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "items") List<QueueReportDataModel>? items,@JsonKey(name: "meta") QueueMetaModel? meta,@JsonKey(name: "counts") QueueCountsModel? counts
});


$QueueMetaModelCopyWith<$Res>? get meta;$QueueCountsModelCopyWith<$Res>? get counts;

}
/// @nodoc
class _$QueueDataModelCopyWithImpl<$Res>
    implements $QueueDataModelCopyWith<$Res> {
  _$QueueDataModelCopyWithImpl(this._self, this._then);

  final QueueDataModel _self;
  final $Res Function(QueueDataModel) _then;

/// Create a copy of QueueDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = freezed,Object? meta = freezed,Object? counts = freezed,}) {
  return _then(QueueDataModel(
items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<QueueReportDataModel>?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as QueueMetaModel?,counts: freezed == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as QueueCountsModel?,
  ));
}
/// Create a copy of QueueDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueMetaModelCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $QueueMetaModelCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}/// Create a copy of QueueDataModel
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


/// Adds pattern-matching-related methods to [QueueDataModel].
extension QueueDataModelPatterns on QueueDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueueDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueueDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueueDataModel value)  $default,){
final _that = this;
switch (_that) {
case _QueueDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueueDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _QueueDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "items")  List<QueueReportDataModel>? items, @JsonKey(name: "meta")  QueueMetaModel? meta, @JsonKey(name: "counts")  QueueCountsModel? counts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueDataModel() when $default != null:
return $default(_that.items,_that.meta,_that.counts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "items")  List<QueueReportDataModel>? items, @JsonKey(name: "meta")  QueueMetaModel? meta, @JsonKey(name: "counts")  QueueCountsModel? counts)  $default,) {final _that = this;
switch (_that) {
case _QueueDataModel():
return $default(_that.items,_that.meta,_that.counts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "items")  List<QueueReportDataModel>? items, @JsonKey(name: "meta")  QueueMetaModel? meta, @JsonKey(name: "counts")  QueueCountsModel? counts)?  $default,) {final _that = this;
switch (_that) {
case _QueueDataModel() when $default != null:
return $default(_that.items,_that.meta,_that.counts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueueDataModel implements QueueDataModel {
  const _QueueDataModel({@JsonKey(name: "items")  List<QueueReportDataModel>? items, @JsonKey(name: "meta") this.meta, @JsonKey(name: "counts") this.counts}): _items = items;
  factory _QueueDataModel.fromJson(Map<String, dynamic> json) => _$QueueDataModelFromJson(json);

 final  List<QueueReportDataModel>? _items;
@override@JsonKey(name: "items") List<QueueReportDataModel>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "meta") final  QueueMetaModel? meta;
@override@JsonKey(name: "counts") final  QueueCountsModel? counts;

/// Create a copy of QueueDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueueDataModelCopyWith<_QueueDataModel> get copyWith => __$QueueDataModelCopyWithImpl<_QueueDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueueDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueDataModel&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.counts, counts) || other.counts == counts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),meta,counts);

@override
String toString() {
  return 'QueueDataModel(items: $items, meta: $meta, counts: $counts)';
}


}

/// @nodoc
abstract mixin class _$QueueDataModelCopyWith<$Res> implements $QueueDataModelCopyWith<$Res> {
  factory _$QueueDataModelCopyWith(_QueueDataModel value, $Res Function(_QueueDataModel) _then) = __$QueueDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "items") List<QueueReportDataModel>? items,@JsonKey(name: "meta") QueueMetaModel? meta,@JsonKey(name: "counts") QueueCountsModel? counts
});


@override $QueueMetaModelCopyWith<$Res>? get meta;@override $QueueCountsModelCopyWith<$Res>? get counts;

}
/// @nodoc
class __$QueueDataModelCopyWithImpl<$Res>
    implements _$QueueDataModelCopyWith<$Res> {
  __$QueueDataModelCopyWithImpl(this._self, this._then);

  final _QueueDataModel _self;
  final $Res Function(_QueueDataModel) _then;

/// Create a copy of QueueDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = freezed,Object? meta = freezed,Object? counts = freezed,}) {
  return _then(_QueueDataModel(
items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<QueueReportDataModel>?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as QueueMetaModel?,counts: freezed == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as QueueCountsModel?,
  ));
}

/// Create a copy of QueueDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueMetaModelCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $QueueMetaModelCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}/// Create a copy of QueueDataModel
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

@JsonKey(name: "id") String? get id;@JsonKey(name: "category") QueueCategoryModel? get category;@JsonKey(name: "description") String? get description;@JsonKey(name: "photo_urls") List<String>? get photoUrls;@JsonKey(name: "status") String? get status;@JsonKey(name: "latitude") double? get latitude;@JsonKey(name: "longitude") double? get longitude;@JsonKey(name: "distance_meter") double? get distanceMeter;@JsonKey(name: "created_at") String? get createdAt;
/// Create a copy of QueueReportDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueReportDataModelCopyWith<QueueReportDataModel> get copyWith => _$QueueReportDataModelCopyWithImpl<QueueReportDataModel>(this as QueueReportDataModel, _$identity);

  /// Serializes this QueueReportDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueReportDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.photoUrls, photoUrls)&&(identical(other.status, status) || other.status == status)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceMeter, distanceMeter) || other.distanceMeter == distanceMeter)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,description,const DeepCollectionEquality().hash(photoUrls),status,latitude,longitude,distanceMeter,createdAt);

@override
String toString() {
  return 'QueueReportDataModel(id: $id, category: $category, description: $description, photoUrls: $photoUrls, status: $status, latitude: $latitude, longitude: $longitude, distanceMeter: $distanceMeter, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $QueueReportDataModelCopyWith<$Res>  {
  factory $QueueReportDataModelCopyWith(QueueReportDataModel value, $Res Function(QueueReportDataModel) _then) = _$QueueReportDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "category") QueueCategoryModel? category,@JsonKey(name: "description") String? description,@JsonKey(name: "photo_urls") List<String>? photoUrls,@JsonKey(name: "status") String? status,@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude,@JsonKey(name: "distance_meter") double? distanceMeter,@JsonKey(name: "created_at") String? createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? category = freezed,Object? description = freezed,Object? photoUrls = freezed,Object? status = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceMeter = freezed,Object? createdAt = freezed,}) {
  return _then(QueueReportDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as QueueCategoryModel?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photoUrls: freezed == photoUrls ? _self.photoUrls : photoUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "category")  QueueCategoryModel? category, @JsonKey(name: "description")  String? description, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "status")  String? status, @JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "distance_meter")  double? distanceMeter, @JsonKey(name: "created_at")  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueReportDataModel() when $default != null:
return $default(_that.id,_that.category,_that.description,_that.photoUrls,_that.status,_that.latitude,_that.longitude,_that.distanceMeter,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "category")  QueueCategoryModel? category, @JsonKey(name: "description")  String? description, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "status")  String? status, @JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "distance_meter")  double? distanceMeter, @JsonKey(name: "created_at")  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _QueueReportDataModel():
return $default(_that.id,_that.category,_that.description,_that.photoUrls,_that.status,_that.latitude,_that.longitude,_that.distanceMeter,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "category")  QueueCategoryModel? category, @JsonKey(name: "description")  String? description, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "status")  String? status, @JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "distance_meter")  double? distanceMeter, @JsonKey(name: "created_at")  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _QueueReportDataModel() when $default != null:
return $default(_that.id,_that.category,_that.description,_that.photoUrls,_that.status,_that.latitude,_that.longitude,_that.distanceMeter,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueueReportDataModel implements QueueReportDataModel {
  const _QueueReportDataModel({@JsonKey(name: "id") this.id, @JsonKey(name: "category") this.category, @JsonKey(name: "description") this.description, @JsonKey(name: "photo_urls")  List<String>? photoUrls, @JsonKey(name: "status") this.status, @JsonKey(name: "latitude") this.latitude, @JsonKey(name: "longitude") this.longitude, @JsonKey(name: "distance_meter") this.distanceMeter, @JsonKey(name: "created_at") this.createdAt}): _photoUrls = photoUrls;
  factory _QueueReportDataModel.fromJson(Map<String, dynamic> json) => _$QueueReportDataModelFromJson(json);

@override@JsonKey(name: "id") final  String? id;
@override@JsonKey(name: "category") final  QueueCategoryModel? category;
@override@JsonKey(name: "description") final  String? description;
 final  List<String>? _photoUrls;
@override@JsonKey(name: "photo_urls") List<String>? get photoUrls {
  final value = _photoUrls;
  if (value == null) return null;
  if (_photoUrls is EqualUnmodifiableListView) return _photoUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueReportDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._photoUrls, _photoUrls)&&(identical(other.status, status) || other.status == status)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceMeter, distanceMeter) || other.distanceMeter == distanceMeter)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,description,const DeepCollectionEquality().hash(_photoUrls),status,latitude,longitude,distanceMeter,createdAt);

@override
String toString() {
  return 'QueueReportDataModel(id: $id, category: $category, description: $description, photoUrls: $photoUrls, status: $status, latitude: $latitude, longitude: $longitude, distanceMeter: $distanceMeter, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$QueueReportDataModelCopyWith<$Res> implements $QueueReportDataModelCopyWith<$Res> {
  factory _$QueueReportDataModelCopyWith(_QueueReportDataModel value, $Res Function(_QueueReportDataModel) _then) = __$QueueReportDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "category") QueueCategoryModel? category,@JsonKey(name: "description") String? description,@JsonKey(name: "photo_urls") List<String>? photoUrls,@JsonKey(name: "status") String? status,@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude,@JsonKey(name: "distance_meter") double? distanceMeter,@JsonKey(name: "created_at") String? createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? category = freezed,Object? description = freezed,Object? photoUrls = freezed,Object? status = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceMeter = freezed,Object? createdAt = freezed,}) {
  return _then(_QueueReportDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as QueueCategoryModel?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photoUrls: freezed == photoUrls ? _self._photoUrls : photoUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,isActive);

@override
String toString() {
  return 'QueueCategoryModel(id: $id, name: $name, slug: $slug, isActive: $isActive)';
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
int get hashCode => Object.hash(runtimeType,id,name,slug,isActive);

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
mixin _$QueueMetaModel {

@JsonKey(name: "limit") int? get limit;@JsonKey(name: "offset") int? get offset;@JsonKey(name: "total") int? get total;@JsonKey(name: "has_next") bool? get hasNext;
/// Create a copy of QueueMetaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueMetaModelCopyWith<QueueMetaModel> get copyWith => _$QueueMetaModelCopyWithImpl<QueueMetaModel>(this as QueueMetaModel, _$identity);

  /// Serializes this QueueMetaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueMetaModel&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,offset,total,hasNext);

@override
String toString() {
  return 'QueueMetaModel(limit: $limit, offset: $offset, total: $total, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class $QueueMetaModelCopyWith<$Res>  {
  factory $QueueMetaModelCopyWith(QueueMetaModel value, $Res Function(QueueMetaModel) _then) = _$QueueMetaModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "limit") int? limit,@JsonKey(name: "offset") int? offset,@JsonKey(name: "total") int? total,@JsonKey(name: "has_next") bool? hasNext
});




}
/// @nodoc
class _$QueueMetaModelCopyWithImpl<$Res>
    implements $QueueMetaModelCopyWith<$Res> {
  _$QueueMetaModelCopyWithImpl(this._self, this._then);

  final QueueMetaModel _self;
  final $Res Function(QueueMetaModel) _then;

/// Create a copy of QueueMetaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = freezed,Object? offset = freezed,Object? total = freezed,Object? hasNext = freezed,}) {
  return _then(QueueMetaModel(
limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,hasNext: freezed == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [QueueMetaModel].
extension QueueMetaModelPatterns on QueueMetaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueueMetaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueueMetaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueueMetaModel value)  $default,){
final _that = this;
switch (_that) {
case _QueueMetaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueueMetaModel value)?  $default,){
final _that = this;
switch (_that) {
case _QueueMetaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "limit")  int? limit, @JsonKey(name: "offset")  int? offset, @JsonKey(name: "total")  int? total, @JsonKey(name: "has_next")  bool? hasNext)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueMetaModel() when $default != null:
return $default(_that.limit,_that.offset,_that.total,_that.hasNext);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "limit")  int? limit, @JsonKey(name: "offset")  int? offset, @JsonKey(name: "total")  int? total, @JsonKey(name: "has_next")  bool? hasNext)  $default,) {final _that = this;
switch (_that) {
case _QueueMetaModel():
return $default(_that.limit,_that.offset,_that.total,_that.hasNext);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "limit")  int? limit, @JsonKey(name: "offset")  int? offset, @JsonKey(name: "total")  int? total, @JsonKey(name: "has_next")  bool? hasNext)?  $default,) {final _that = this;
switch (_that) {
case _QueueMetaModel() when $default != null:
return $default(_that.limit,_that.offset,_that.total,_that.hasNext);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueueMetaModel implements QueueMetaModel {
  const _QueueMetaModel({@JsonKey(name: "limit") this.limit, @JsonKey(name: "offset") this.offset, @JsonKey(name: "total") this.total, @JsonKey(name: "has_next") this.hasNext});
  factory _QueueMetaModel.fromJson(Map<String, dynamic> json) => _$QueueMetaModelFromJson(json);

@override@JsonKey(name: "limit") final  int? limit;
@override@JsonKey(name: "offset") final  int? offset;
@override@JsonKey(name: "total") final  int? total;
@override@JsonKey(name: "has_next") final  bool? hasNext;

/// Create a copy of QueueMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueueMetaModelCopyWith<_QueueMetaModel> get copyWith => __$QueueMetaModelCopyWithImpl<_QueueMetaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueueMetaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueMetaModel&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,offset,total,hasNext);

@override
String toString() {
  return 'QueueMetaModel(limit: $limit, offset: $offset, total: $total, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class _$QueueMetaModelCopyWith<$Res> implements $QueueMetaModelCopyWith<$Res> {
  factory _$QueueMetaModelCopyWith(_QueueMetaModel value, $Res Function(_QueueMetaModel) _then) = __$QueueMetaModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "limit") int? limit,@JsonKey(name: "offset") int? offset,@JsonKey(name: "total") int? total,@JsonKey(name: "has_next") bool? hasNext
});




}
/// @nodoc
class __$QueueMetaModelCopyWithImpl<$Res>
    implements _$QueueMetaModelCopyWith<$Res> {
  __$QueueMetaModelCopyWithImpl(this._self, this._then);

  final _QueueMetaModel _self;
  final $Res Function(_QueueMetaModel) _then;

/// Create a copy of QueueMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = freezed,Object? offset = freezed,Object? total = freezed,Object? hasNext = freezed,}) {
  return _then(_QueueMetaModel(
limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,hasNext: freezed == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueCountsModel&&(identical(other.open, open) || other.open == open)&&(identical(other.inProgress, inProgress) || other.inProgress == inProgress)&&(identical(other.resolved, resolved) || other.resolved == resolved));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,open,inProgress,resolved);

@override
String toString() {
  return 'QueueCountsModel(open: $open, inProgress: $inProgress, resolved: $resolved)';
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
int get hashCode => Object.hash(runtimeType,open,inProgress,resolved);

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
