// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_reports_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyReportsModel {

@JsonKey(name: "status") bool? get status;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") MyReportsDataModel? get data;
/// Create a copy of MyReportsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyReportsModelCopyWith<MyReportsModel> get copyWith => _$MyReportsModelCopyWithImpl<MyReportsModel>(this as MyReportsModel, _$identity);

  /// Serializes this MyReportsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyReportsModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'MyReportsModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $MyReportsModelCopyWith<$Res>  {
  factory $MyReportsModelCopyWith(MyReportsModel value, $Res Function(MyReportsModel) _then) = _$MyReportsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "message") String? message,@JsonKey(name: "data") MyReportsDataModel? data
});


$MyReportsDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$MyReportsModelCopyWithImpl<$Res>
    implements $MyReportsModelCopyWith<$Res> {
  _$MyReportsModelCopyWithImpl(this._self, this._then);

  final MyReportsModel _self;
  final $Res Function(MyReportsModel) _then;

/// Create a copy of MyReportsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(MyReportsModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MyReportsDataModel?,
  ));
}
/// Create a copy of MyReportsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyReportsDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $MyReportsDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyReportsModel].
extension MyReportsModelPatterns on MyReportsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyReportsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyReportsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyReportsModel value)  $default,){
final _that = this;
switch (_that) {
case _MyReportsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyReportsModel value)?  $default,){
final _that = this;
switch (_that) {
case _MyReportsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  MyReportsDataModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyReportsModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  MyReportsDataModel? data)  $default,) {final _that = this;
switch (_that) {
case _MyReportsModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  MyReportsDataModel? data)?  $default,) {final _that = this;
switch (_that) {
case _MyReportsModel() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyReportsModel implements MyReportsModel {
  const _MyReportsModel({@JsonKey(name: "status") this.status, @JsonKey(name: "message") this.message, @JsonKey(name: "data") this.data});
  factory _MyReportsModel.fromJson(Map<String, dynamic> json) => _$MyReportsModelFromJson(json);

@override@JsonKey(name: "status") final  bool? status;
@override@JsonKey(name: "message") final  String? message;
@override@JsonKey(name: "data") final  MyReportsDataModel? data;

/// Create a copy of MyReportsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyReportsModelCopyWith<_MyReportsModel> get copyWith => __$MyReportsModelCopyWithImpl<_MyReportsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyReportsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyReportsModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'MyReportsModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$MyReportsModelCopyWith<$Res> implements $MyReportsModelCopyWith<$Res> {
  factory _$MyReportsModelCopyWith(_MyReportsModel value, $Res Function(_MyReportsModel) _then) = __$MyReportsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "message") String? message,@JsonKey(name: "data") MyReportsDataModel? data
});


@override $MyReportsDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$MyReportsModelCopyWithImpl<$Res>
    implements _$MyReportsModelCopyWith<$Res> {
  __$MyReportsModelCopyWithImpl(this._self, this._then);

  final _MyReportsModel _self;
  final $Res Function(_MyReportsModel) _then;

/// Create a copy of MyReportsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_MyReportsModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MyReportsDataModel?,
  ));
}

/// Create a copy of MyReportsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyReportsDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $MyReportsDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$MyReportsDataModel {

@JsonKey(name: "items") List<FeedReportsDataModel>? get items;@JsonKey(name: "meta") MyReportsMetaModel? get meta;
/// Create a copy of MyReportsDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyReportsDataModelCopyWith<MyReportsDataModel> get copyWith => _$MyReportsDataModelCopyWithImpl<MyReportsDataModel>(this as MyReportsDataModel, _$identity);

  /// Serializes this MyReportsDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyReportsDataModel&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),meta);

@override
String toString() {
  return 'MyReportsDataModel(items: $items, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $MyReportsDataModelCopyWith<$Res>  {
  factory $MyReportsDataModelCopyWith(MyReportsDataModel value, $Res Function(MyReportsDataModel) _then) = _$MyReportsDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "items") List<FeedReportsDataModel>? items,@JsonKey(name: "meta") MyReportsMetaModel? meta
});


$MyReportsMetaModelCopyWith<$Res>? get meta;

}
/// @nodoc
class _$MyReportsDataModelCopyWithImpl<$Res>
    implements $MyReportsDataModelCopyWith<$Res> {
  _$MyReportsDataModelCopyWithImpl(this._self, this._then);

  final MyReportsDataModel _self;
  final $Res Function(MyReportsDataModel) _then;

/// Create a copy of MyReportsDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = freezed,Object? meta = freezed,}) {
  return _then(MyReportsDataModel(
items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<FeedReportsDataModel>?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MyReportsMetaModel?,
  ));
}
/// Create a copy of MyReportsDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyReportsMetaModelCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $MyReportsMetaModelCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyReportsDataModel].
extension MyReportsDataModelPatterns on MyReportsDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyReportsDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyReportsDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyReportsDataModel value)  $default,){
final _that = this;
switch (_that) {
case _MyReportsDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyReportsDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _MyReportsDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "items")  List<FeedReportsDataModel>? items, @JsonKey(name: "meta")  MyReportsMetaModel? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyReportsDataModel() when $default != null:
return $default(_that.items,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "items")  List<FeedReportsDataModel>? items, @JsonKey(name: "meta")  MyReportsMetaModel? meta)  $default,) {final _that = this;
switch (_that) {
case _MyReportsDataModel():
return $default(_that.items,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "items")  List<FeedReportsDataModel>? items, @JsonKey(name: "meta")  MyReportsMetaModel? meta)?  $default,) {final _that = this;
switch (_that) {
case _MyReportsDataModel() when $default != null:
return $default(_that.items,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyReportsDataModel implements MyReportsDataModel {
  const _MyReportsDataModel({@JsonKey(name: "items")  List<FeedReportsDataModel>? items, @JsonKey(name: "meta") this.meta}): _items = items;
  factory _MyReportsDataModel.fromJson(Map<String, dynamic> json) => _$MyReportsDataModelFromJson(json);

 final  List<FeedReportsDataModel>? _items;
@override@JsonKey(name: "items") List<FeedReportsDataModel>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "meta") final  MyReportsMetaModel? meta;

/// Create a copy of MyReportsDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyReportsDataModelCopyWith<_MyReportsDataModel> get copyWith => __$MyReportsDataModelCopyWithImpl<_MyReportsDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyReportsDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyReportsDataModel&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),meta);

@override
String toString() {
  return 'MyReportsDataModel(items: $items, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$MyReportsDataModelCopyWith<$Res> implements $MyReportsDataModelCopyWith<$Res> {
  factory _$MyReportsDataModelCopyWith(_MyReportsDataModel value, $Res Function(_MyReportsDataModel) _then) = __$MyReportsDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "items") List<FeedReportsDataModel>? items,@JsonKey(name: "meta") MyReportsMetaModel? meta
});


@override $MyReportsMetaModelCopyWith<$Res>? get meta;

}
/// @nodoc
class __$MyReportsDataModelCopyWithImpl<$Res>
    implements _$MyReportsDataModelCopyWith<$Res> {
  __$MyReportsDataModelCopyWithImpl(this._self, this._then);

  final _MyReportsDataModel _self;
  final $Res Function(_MyReportsDataModel) _then;

/// Create a copy of MyReportsDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = freezed,Object? meta = freezed,}) {
  return _then(_MyReportsDataModel(
items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<FeedReportsDataModel>?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MyReportsMetaModel?,
  ));
}

/// Create a copy of MyReportsDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyReportsMetaModelCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $MyReportsMetaModelCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$MyReportsMetaModel {

@JsonKey(name: "limit") int? get limit;@JsonKey(name: "offset") int? get offset;@JsonKey(name: "total") int? get total;@JsonKey(name: "has_next") bool? get hasNext;
/// Create a copy of MyReportsMetaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyReportsMetaModelCopyWith<MyReportsMetaModel> get copyWith => _$MyReportsMetaModelCopyWithImpl<MyReportsMetaModel>(this as MyReportsMetaModel, _$identity);

  /// Serializes this MyReportsMetaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyReportsMetaModel&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,offset,total,hasNext);

@override
String toString() {
  return 'MyReportsMetaModel(limit: $limit, offset: $offset, total: $total, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class $MyReportsMetaModelCopyWith<$Res>  {
  factory $MyReportsMetaModelCopyWith(MyReportsMetaModel value, $Res Function(MyReportsMetaModel) _then) = _$MyReportsMetaModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "limit") int? limit,@JsonKey(name: "offset") int? offset,@JsonKey(name: "total") int? total,@JsonKey(name: "has_next") bool? hasNext
});




}
/// @nodoc
class _$MyReportsMetaModelCopyWithImpl<$Res>
    implements $MyReportsMetaModelCopyWith<$Res> {
  _$MyReportsMetaModelCopyWithImpl(this._self, this._then);

  final MyReportsMetaModel _self;
  final $Res Function(MyReportsMetaModel) _then;

/// Create a copy of MyReportsMetaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = freezed,Object? offset = freezed,Object? total = freezed,Object? hasNext = freezed,}) {
  return _then(MyReportsMetaModel(
limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,hasNext: freezed == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [MyReportsMetaModel].
extension MyReportsMetaModelPatterns on MyReportsMetaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyReportsMetaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyReportsMetaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyReportsMetaModel value)  $default,){
final _that = this;
switch (_that) {
case _MyReportsMetaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyReportsMetaModel value)?  $default,){
final _that = this;
switch (_that) {
case _MyReportsMetaModel() when $default != null:
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
case _MyReportsMetaModel() when $default != null:
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
case _MyReportsMetaModel():
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
case _MyReportsMetaModel() when $default != null:
return $default(_that.limit,_that.offset,_that.total,_that.hasNext);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyReportsMetaModel implements MyReportsMetaModel {
  const _MyReportsMetaModel({@JsonKey(name: "limit") this.limit, @JsonKey(name: "offset") this.offset, @JsonKey(name: "total") this.total, @JsonKey(name: "has_next") this.hasNext});
  factory _MyReportsMetaModel.fromJson(Map<String, dynamic> json) => _$MyReportsMetaModelFromJson(json);

@override@JsonKey(name: "limit") final  int? limit;
@override@JsonKey(name: "offset") final  int? offset;
@override@JsonKey(name: "total") final  int? total;
@override@JsonKey(name: "has_next") final  bool? hasNext;

/// Create a copy of MyReportsMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyReportsMetaModelCopyWith<_MyReportsMetaModel> get copyWith => __$MyReportsMetaModelCopyWithImpl<_MyReportsMetaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyReportsMetaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyReportsMetaModel&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,offset,total,hasNext);

@override
String toString() {
  return 'MyReportsMetaModel(limit: $limit, offset: $offset, total: $total, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class _$MyReportsMetaModelCopyWith<$Res> implements $MyReportsMetaModelCopyWith<$Res> {
  factory _$MyReportsMetaModelCopyWith(_MyReportsMetaModel value, $Res Function(_MyReportsMetaModel) _then) = __$MyReportsMetaModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "limit") int? limit,@JsonKey(name: "offset") int? offset,@JsonKey(name: "total") int? total,@JsonKey(name: "has_next") bool? hasNext
});




}
/// @nodoc
class __$MyReportsMetaModelCopyWithImpl<$Res>
    implements _$MyReportsMetaModelCopyWith<$Res> {
  __$MyReportsMetaModelCopyWithImpl(this._self, this._then);

  final _MyReportsMetaModel _self;
  final $Res Function(_MyReportsMetaModel) _then;

/// Create a copy of MyReportsMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = freezed,Object? offset = freezed,Object? total = freezed,Object? hasNext = freezed,}) {
  return _then(_MyReportsMetaModel(
limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,hasNext: freezed == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
