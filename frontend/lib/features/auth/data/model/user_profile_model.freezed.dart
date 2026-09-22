// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfileModel {

@JsonKey(name: "status") bool? get status;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") UserProfileDataModel? get data;
/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileModelCopyWith<UserProfileModel> get copyWith => _$UserProfileModelCopyWithImpl<UserProfileModel>(this as UserProfileModel, _$identity);

  /// Serializes this UserProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'UserProfileModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $UserProfileModelCopyWith<$Res>  {
  factory $UserProfileModelCopyWith(UserProfileModel value, $Res Function(UserProfileModel) _then) = _$UserProfileModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "message") String? message,@JsonKey(name: "data") UserProfileDataModel? data
});


$UserProfileDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._self, this._then);

  final UserProfileModel _self;
  final $Res Function(UserProfileModel) _then;

/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(UserProfileModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserProfileDataModel?,
  ));
}
/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $UserProfileDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserProfileModel].
extension UserProfileModelPatterns on UserProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  UserProfileDataModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  UserProfileDataModel? data)  $default,) {final _that = this;
switch (_that) {
case _UserProfileModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  UserProfileDataModel? data)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfileModel implements UserProfileModel {
   _UserProfileModel({@JsonKey(name: "status") this.status, @JsonKey(name: "message") this.message, @JsonKey(name: "data") this.data});
  factory _UserProfileModel.fromJson(Map<String, dynamic> json) => _$UserProfileModelFromJson(json);

@override@JsonKey(name: "status") final  bool? status;
@override@JsonKey(name: "message") final  String? message;
@override@JsonKey(name: "data") final  UserProfileDataModel? data;

/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileModelCopyWith<_UserProfileModel> get copyWith => __$UserProfileModelCopyWithImpl<_UserProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'UserProfileModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$UserProfileModelCopyWith<$Res> implements $UserProfileModelCopyWith<$Res> {
  factory _$UserProfileModelCopyWith(_UserProfileModel value, $Res Function(_UserProfileModel) _then) = __$UserProfileModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "message") String? message,@JsonKey(name: "data") UserProfileDataModel? data
});


@override $UserProfileDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$UserProfileModelCopyWithImpl<$Res>
    implements _$UserProfileModelCopyWith<$Res> {
  __$UserProfileModelCopyWithImpl(this._self, this._then);

  final _UserProfileModel _self;
  final $Res Function(_UserProfileModel) _then;

/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_UserProfileModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserProfileDataModel?,
  ));
}

/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $UserProfileDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$UserProfileDataModel {

@JsonKey(name: "id") String? get id;@JsonKey(name: "display_name") String? get displayName;@JsonKey(name: "joined_at") dynamic get joinedAt;@JsonKey(name: "reports_count") int? get reportsCount;@JsonKey(name: "resolved_count") int? get resolvedCount;
/// Create a copy of UserProfileDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileDataModelCopyWith<UserProfileDataModel> get copyWith => _$UserProfileDataModelCopyWithImpl<UserProfileDataModel>(this as UserProfileDataModel, _$identity);

  /// Serializes this UserProfileDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&const DeepCollectionEquality().equals(other.joinedAt, joinedAt)&&(identical(other.reportsCount, reportsCount) || other.reportsCount == reportsCount)&&(identical(other.resolvedCount, resolvedCount) || other.resolvedCount == resolvedCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,const DeepCollectionEquality().hash(joinedAt),reportsCount,resolvedCount);

@override
String toString() {
  return 'UserProfileDataModel(id: $id, displayName: $displayName, joinedAt: $joinedAt, reportsCount: $reportsCount, resolvedCount: $resolvedCount)';
}


}

/// @nodoc
abstract mixin class $UserProfileDataModelCopyWith<$Res>  {
  factory $UserProfileDataModelCopyWith(UserProfileDataModel value, $Res Function(UserProfileDataModel) _then) = _$UserProfileDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "display_name") String? displayName,@JsonKey(name: "joined_at") dynamic joinedAt,@JsonKey(name: "reports_count") int? reportsCount,@JsonKey(name: "resolved_count") int? resolvedCount
});




}
/// @nodoc
class _$UserProfileDataModelCopyWithImpl<$Res>
    implements $UserProfileDataModelCopyWith<$Res> {
  _$UserProfileDataModelCopyWithImpl(this._self, this._then);

  final UserProfileDataModel _self;
  final $Res Function(UserProfileDataModel) _then;

/// Create a copy of UserProfileDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? displayName = freezed,Object? joinedAt = freezed,Object? reportsCount = freezed,Object? resolvedCount = freezed,}) {
  return _then(UserProfileDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,joinedAt: freezed == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as dynamic,reportsCount: freezed == reportsCount ? _self.reportsCount : reportsCount // ignore: cast_nullable_to_non_nullable
as int?,resolvedCount: freezed == resolvedCount ? _self.resolvedCount : resolvedCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfileDataModel].
extension UserProfileDataModelPatterns on UserProfileDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileDataModel value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "display_name")  String? displayName, @JsonKey(name: "joined_at")  dynamic joinedAt, @JsonKey(name: "reports_count")  int? reportsCount, @JsonKey(name: "resolved_count")  int? resolvedCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileDataModel() when $default != null:
return $default(_that.id,_that.displayName,_that.joinedAt,_that.reportsCount,_that.resolvedCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "display_name")  String? displayName, @JsonKey(name: "joined_at")  dynamic joinedAt, @JsonKey(name: "reports_count")  int? reportsCount, @JsonKey(name: "resolved_count")  int? resolvedCount)  $default,) {final _that = this;
switch (_that) {
case _UserProfileDataModel():
return $default(_that.id,_that.displayName,_that.joinedAt,_that.reportsCount,_that.resolvedCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "display_name")  String? displayName, @JsonKey(name: "joined_at")  dynamic joinedAt, @JsonKey(name: "reports_count")  int? reportsCount, @JsonKey(name: "resolved_count")  int? resolvedCount)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileDataModel() when $default != null:
return $default(_that.id,_that.displayName,_that.joinedAt,_that.reportsCount,_that.resolvedCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfileDataModel implements UserProfileDataModel {
  const _UserProfileDataModel({@JsonKey(name: "id") this.id, @JsonKey(name: "display_name") this.displayName, @JsonKey(name: "joined_at") this.joinedAt, @JsonKey(name: "reports_count") this.reportsCount, @JsonKey(name: "resolved_count") this.resolvedCount});
  factory _UserProfileDataModel.fromJson(Map<String, dynamic> json) => _$UserProfileDataModelFromJson(json);

@override@JsonKey(name: "id") final  String? id;
@override@JsonKey(name: "display_name") final  String? displayName;
@override@JsonKey(name: "joined_at") final  dynamic joinedAt;
@override@JsonKey(name: "reports_count") final  int? reportsCount;
@override@JsonKey(name: "resolved_count") final  int? resolvedCount;

/// Create a copy of UserProfileDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileDataModelCopyWith<_UserProfileDataModel> get copyWith => __$UserProfileDataModelCopyWithImpl<_UserProfileDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&const DeepCollectionEquality().equals(other.joinedAt, joinedAt)&&(identical(other.reportsCount, reportsCount) || other.reportsCount == reportsCount)&&(identical(other.resolvedCount, resolvedCount) || other.resolvedCount == resolvedCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,const DeepCollectionEquality().hash(joinedAt),reportsCount,resolvedCount);

@override
String toString() {
  return 'UserProfileDataModel(id: $id, displayName: $displayName, joinedAt: $joinedAt, reportsCount: $reportsCount, resolvedCount: $resolvedCount)';
}


}

/// @nodoc
abstract mixin class _$UserProfileDataModelCopyWith<$Res> implements $UserProfileDataModelCopyWith<$Res> {
  factory _$UserProfileDataModelCopyWith(_UserProfileDataModel value, $Res Function(_UserProfileDataModel) _then) = __$UserProfileDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "display_name") String? displayName,@JsonKey(name: "joined_at") dynamic joinedAt,@JsonKey(name: "reports_count") int? reportsCount,@JsonKey(name: "resolved_count") int? resolvedCount
});




}
/// @nodoc
class __$UserProfileDataModelCopyWithImpl<$Res>
    implements _$UserProfileDataModelCopyWith<$Res> {
  __$UserProfileDataModelCopyWithImpl(this._self, this._then);

  final _UserProfileDataModel _self;
  final $Res Function(_UserProfileDataModel) _then;

/// Create a copy of UserProfileDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? displayName = freezed,Object? joinedAt = freezed,Object? reportsCount = freezed,Object? resolvedCount = freezed,}) {
  return _then(_UserProfileDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,joinedAt: freezed == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as dynamic,reportsCount: freezed == reportsCount ? _self.reportsCount : reportsCount // ignore: cast_nullable_to_non_nullable
as int?,resolvedCount: freezed == resolvedCount ? _self.resolvedCount : resolvedCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
