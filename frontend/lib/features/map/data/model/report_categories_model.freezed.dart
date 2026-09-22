// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_categories_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportCategoriesModel {

@JsonKey(name: "status") bool? get status;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") List<ReportCategoriesDataModel>? get data;
/// Create a copy of ReportCategoriesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportCategoriesModelCopyWith<ReportCategoriesModel> get copyWith => _$ReportCategoriesModelCopyWithImpl<ReportCategoriesModel>(this as ReportCategoriesModel, _$identity);

  /// Serializes this ReportCategoriesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportCategoriesModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ReportCategoriesModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ReportCategoriesModelCopyWith<$Res>  {
  factory $ReportCategoriesModelCopyWith(ReportCategoriesModel value, $Res Function(ReportCategoriesModel) _then) = _$ReportCategoriesModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "message") String? message,@JsonKey(name: "data") List<ReportCategoriesDataModel>? data
});




}
/// @nodoc
class _$ReportCategoriesModelCopyWithImpl<$Res>
    implements $ReportCategoriesModelCopyWith<$Res> {
  _$ReportCategoriesModelCopyWithImpl(this._self, this._then);

  final ReportCategoriesModel _self;
  final $Res Function(ReportCategoriesModel) _then;

/// Create a copy of ReportCategoriesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(ReportCategoriesModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ReportCategoriesDataModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportCategoriesModel].
extension ReportCategoriesModelPatterns on ReportCategoriesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportCategoriesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportCategoriesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportCategoriesModel value)  $default,){
final _that = this;
switch (_that) {
case _ReportCategoriesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportCategoriesModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReportCategoriesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  List<ReportCategoriesDataModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportCategoriesModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  List<ReportCategoriesDataModel>? data)  $default,) {final _that = this;
switch (_that) {
case _ReportCategoriesModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  List<ReportCategoriesDataModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _ReportCategoriesModel() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportCategoriesModel implements ReportCategoriesModel {
  const _ReportCategoriesModel({@JsonKey(name: "status") this.status, @JsonKey(name: "message") this.message, @JsonKey(name: "data")  List<ReportCategoriesDataModel>? data}): _data = data;
  factory _ReportCategoriesModel.fromJson(Map<String, dynamic> json) => _$ReportCategoriesModelFromJson(json);

@override@JsonKey(name: "status") final  bool? status;
@override@JsonKey(name: "message") final  String? message;
 final  List<ReportCategoriesDataModel>? _data;
@override@JsonKey(name: "data") List<ReportCategoriesDataModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ReportCategoriesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportCategoriesModelCopyWith<_ReportCategoriesModel> get copyWith => __$ReportCategoriesModelCopyWithImpl<_ReportCategoriesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportCategoriesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportCategoriesModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ReportCategoriesModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ReportCategoriesModelCopyWith<$Res> implements $ReportCategoriesModelCopyWith<$Res> {
  factory _$ReportCategoriesModelCopyWith(_ReportCategoriesModel value, $Res Function(_ReportCategoriesModel) _then) = __$ReportCategoriesModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "message") String? message,@JsonKey(name: "data") List<ReportCategoriesDataModel>? data
});




}
/// @nodoc
class __$ReportCategoriesModelCopyWithImpl<$Res>
    implements _$ReportCategoriesModelCopyWith<$Res> {
  __$ReportCategoriesModelCopyWithImpl(this._self, this._then);

  final _ReportCategoriesModel _self;
  final $Res Function(_ReportCategoriesModel) _then;

/// Create a copy of ReportCategoriesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_ReportCategoriesModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ReportCategoriesDataModel>?,
  ));
}


}


/// @nodoc
mixin _$ReportCategoriesDataModel {

@JsonKey(name: "id") int? get id;@JsonKey(name: "name") String? get name;@JsonKey(name: "slug") String? get slug;@JsonKey(name: "is_active") bool? get isActive;
/// Create a copy of ReportCategoriesDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportCategoriesDataModelCopyWith<ReportCategoriesDataModel> get copyWith => _$ReportCategoriesDataModelCopyWithImpl<ReportCategoriesDataModel>(this as ReportCategoriesDataModel, _$identity);

  /// Serializes this ReportCategoriesDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportCategoriesDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,isActive);

@override
String toString() {
  return 'ReportCategoriesDataModel(id: $id, name: $name, slug: $slug, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $ReportCategoriesDataModelCopyWith<$Res>  {
  factory $ReportCategoriesDataModelCopyWith(ReportCategoriesDataModel value, $Res Function(ReportCategoriesDataModel) _then) = _$ReportCategoriesDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "slug") String? slug,@JsonKey(name: "is_active") bool? isActive
});




}
/// @nodoc
class _$ReportCategoriesDataModelCopyWithImpl<$Res>
    implements $ReportCategoriesDataModelCopyWith<$Res> {
  _$ReportCategoriesDataModelCopyWithImpl(this._self, this._then);

  final ReportCategoriesDataModel _self;
  final $Res Function(ReportCategoriesDataModel) _then;

/// Create a copy of ReportCategoriesDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? slug = freezed,Object? isActive = freezed,}) {
  return _then(ReportCategoriesDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportCategoriesDataModel].
extension ReportCategoriesDataModelPatterns on ReportCategoriesDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportCategoriesDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportCategoriesDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportCategoriesDataModel value)  $default,){
final _that = this;
switch (_that) {
case _ReportCategoriesDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportCategoriesDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReportCategoriesDataModel() when $default != null:
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
case _ReportCategoriesDataModel() when $default != null:
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
case _ReportCategoriesDataModel():
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
case _ReportCategoriesDataModel() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportCategoriesDataModel implements ReportCategoriesDataModel {
  const _ReportCategoriesDataModel({@JsonKey(name: "id") this.id, @JsonKey(name: "name") this.name, @JsonKey(name: "slug") this.slug, @JsonKey(name: "is_active") this.isActive});
  factory _ReportCategoriesDataModel.fromJson(Map<String, dynamic> json) => _$ReportCategoriesDataModelFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "name") final  String? name;
@override@JsonKey(name: "slug") final  String? slug;
@override@JsonKey(name: "is_active") final  bool? isActive;

/// Create a copy of ReportCategoriesDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportCategoriesDataModelCopyWith<_ReportCategoriesDataModel> get copyWith => __$ReportCategoriesDataModelCopyWithImpl<_ReportCategoriesDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportCategoriesDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportCategoriesDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,isActive);

@override
String toString() {
  return 'ReportCategoriesDataModel(id: $id, name: $name, slug: $slug, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$ReportCategoriesDataModelCopyWith<$Res> implements $ReportCategoriesDataModelCopyWith<$Res> {
  factory _$ReportCategoriesDataModelCopyWith(_ReportCategoriesDataModel value, $Res Function(_ReportCategoriesDataModel) _then) = __$ReportCategoriesDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "slug") String? slug,@JsonKey(name: "is_active") bool? isActive
});




}
/// @nodoc
class __$ReportCategoriesDataModelCopyWithImpl<$Res>
    implements _$ReportCategoriesDataModelCopyWith<$Res> {
  __$ReportCategoriesDataModelCopyWithImpl(this._self, this._then);

  final _ReportCategoriesDataModel _self;
  final $Res Function(_ReportCategoriesDataModel) _then;

/// Create a copy of ReportCategoriesDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? slug = freezed,Object? isActive = freezed,}) {
  return _then(_ReportCategoriesDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
