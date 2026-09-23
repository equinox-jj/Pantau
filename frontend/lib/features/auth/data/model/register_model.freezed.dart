// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterModel {

@JsonKey(name: "token") String? get token;@JsonKey(name: "expires_in") int? get expiresIn;@JsonKey(name: "user_response") RegisterUserModel? get userResponse;
/// Create a copy of RegisterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterModelCopyWith<RegisterModel> get copyWith => _$RegisterModelCopyWithImpl<RegisterModel>(this as RegisterModel, _$identity);

  /// Serializes this RegisterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RegisterModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterModel&&(identical(other.token, _this.token) || other.token == _this.token)&&(identical(other.expiresIn, _this.expiresIn) || other.expiresIn == _this.expiresIn)&&(identical(other.userResponse, _this.userResponse) || other.userResponse == _this.userResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RegisterModel;
  return Object.hash(runtimeType,_this.token,_this.expiresIn,_this.userResponse);
}

@override
String toString() {
  final _this = this as RegisterModel;
  return 'RegisterModel(token: ${_this.token}, expiresIn: ${_this.expiresIn}, userResponse: ${_this.userResponse})';
}


}

/// @nodoc
abstract mixin class $RegisterModelCopyWith<$Res>  {
  factory $RegisterModelCopyWith(RegisterModel value, $Res Function(RegisterModel) _then) = _$RegisterModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "token") String? token,@JsonKey(name: "expires_in") int? expiresIn,@JsonKey(name: "user_response") RegisterUserModel? userResponse
});


$RegisterUserModelCopyWith<$Res>? get userResponse;

}
/// @nodoc
class _$RegisterModelCopyWithImpl<$Res>
    implements $RegisterModelCopyWith<$Res> {
  _$RegisterModelCopyWithImpl(this._self, this._then);

  final RegisterModel _self;
  final $Res Function(RegisterModel) _then;

/// Create a copy of RegisterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = freezed,Object? expiresIn = freezed,Object? userResponse = freezed,}) {
  return _then(RegisterModel(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,userResponse: freezed == userResponse ? _self.userResponse : userResponse // ignore: cast_nullable_to_non_nullable
as RegisterUserModel?,
  ));
}
/// Create a copy of RegisterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterUserModelCopyWith<$Res>? get userResponse {
    if (_self.userResponse == null) {
    return null;
  }

  return $RegisterUserModelCopyWith<$Res>(_self.userResponse!, (value) {
    return _then(_self.copyWith(userResponse: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterModel].
extension RegisterModelPatterns on RegisterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterModel value)  $default,){
final _that = this;
switch (_that) {
case _RegisterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterModel value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "token")  String? token, @JsonKey(name: "expires_in")  int? expiresIn, @JsonKey(name: "user_response")  RegisterUserModel? userResponse)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterModel() when $default != null:
return $default(_that.token,_that.expiresIn,_that.userResponse);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "token")  String? token, @JsonKey(name: "expires_in")  int? expiresIn, @JsonKey(name: "user_response")  RegisterUserModel? userResponse)  $default,) {final _that = this;
switch (_that) {
case _RegisterModel():
return $default(_that.token,_that.expiresIn,_that.userResponse);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "token")  String? token, @JsonKey(name: "expires_in")  int? expiresIn, @JsonKey(name: "user_response")  RegisterUserModel? userResponse)?  $default,) {final _that = this;
switch (_that) {
case _RegisterModel() when $default != null:
return $default(_that.token,_that.expiresIn,_that.userResponse);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterModel implements RegisterModel {
  const _RegisterModel({@JsonKey(name: "token") this.token, @JsonKey(name: "expires_in") this.expiresIn, @JsonKey(name: "user_response") this.userResponse});
  factory _RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);

@override@JsonKey(name: "token") final  String? token;
@override@JsonKey(name: "expires_in") final  int? expiresIn;
@override@JsonKey(name: "user_response") final  RegisterUserModel? userResponse;

/// Create a copy of RegisterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterModelCopyWith<_RegisterModel> get copyWith => __$RegisterModelCopyWithImpl<_RegisterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterModel&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.userResponse, userResponse) || other.userResponse == userResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,token,expiresIn,userResponse);
}

@override
String toString() {
    return 'RegisterModel(token: $token, expiresIn: $expiresIn, userResponse: $userResponse)';
}


}

/// @nodoc
abstract mixin class _$RegisterModelCopyWith<$Res> implements $RegisterModelCopyWith<$Res> {
  factory _$RegisterModelCopyWith(_RegisterModel value, $Res Function(_RegisterModel) _then) = __$RegisterModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "token") String? token,@JsonKey(name: "expires_in") int? expiresIn,@JsonKey(name: "user_response") RegisterUserModel? userResponse
});


@override $RegisterUserModelCopyWith<$Res>? get userResponse;

}
/// @nodoc
class __$RegisterModelCopyWithImpl<$Res>
    implements _$RegisterModelCopyWith<$Res> {
  __$RegisterModelCopyWithImpl(this._self, this._then);

  final _RegisterModel _self;
  final $Res Function(_RegisterModel) _then;

/// Create a copy of RegisterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = freezed,Object? expiresIn = freezed,Object? userResponse = freezed,}) {
  return _then(_RegisterModel(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,userResponse: freezed == userResponse ? _self.userResponse : userResponse // ignore: cast_nullable_to_non_nullable
as RegisterUserModel?,
  ));
}

/// Create a copy of RegisterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterUserModelCopyWith<$Res>? get userResponse {
    if (_self.userResponse == null) {
    return null;
  }

  return $RegisterUserModelCopyWith<$Res>(_self.userResponse!, (value) {
    return _then(_self.copyWith(userResponse: value));
  });
}
}


/// @nodoc
mixin _$RegisterUserModel {

@JsonKey(name: "id") String? get id;@JsonKey(name: "email") String? get email;@JsonKey(name: "display_name") String? get displayName;@JsonKey(name: "role") String? get role;@JsonKey(name: "created_at") dynamic get createdAt;@JsonKey(name: "updated_at") dynamic get updatedAt;
/// Create a copy of RegisterUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterUserModelCopyWith<RegisterUserModel> get copyWith => _$RegisterUserModelCopyWithImpl<RegisterUserModel>(this as RegisterUserModel, _$identity);

  /// Serializes this RegisterUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RegisterUserModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterUserModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName)&&(identical(other.role, _this.role) || other.role == _this.role)&&const DeepCollectionEquality().equals(other.createdAt, _this.createdAt)&&const DeepCollectionEquality().equals(other.updatedAt, _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RegisterUserModel;
  return Object.hash(runtimeType,_this.id,_this.email,_this.displayName,_this.role,const DeepCollectionEquality().hash(_this.createdAt),const DeepCollectionEquality().hash(_this.updatedAt));
}

@override
String toString() {
  final _this = this as RegisterUserModel;
  return 'RegisterUserModel(id: ${_this.id}, email: ${_this.email}, displayName: ${_this.displayName}, role: ${_this.role}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $RegisterUserModelCopyWith<$Res>  {
  factory $RegisterUserModelCopyWith(RegisterUserModel value, $Res Function(RegisterUserModel) _then) = _$RegisterUserModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "email") String? email,@JsonKey(name: "display_name") String? displayName,@JsonKey(name: "role") String? role,@JsonKey(name: "created_at") dynamic createdAt,@JsonKey(name: "updated_at") dynamic updatedAt
});




}
/// @nodoc
class _$RegisterUserModelCopyWithImpl<$Res>
    implements $RegisterUserModelCopyWith<$Res> {
  _$RegisterUserModelCopyWithImpl(this._self, this._then);

  final RegisterUserModel _self;
  final $Res Function(RegisterUserModel) _then;

/// Create a copy of RegisterUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? email = freezed,Object? displayName = freezed,Object? role = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(RegisterUserModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterUserModel].
extension RegisterUserModelPatterns on RegisterUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterUserModel value)  $default,){
final _that = this;
switch (_that) {
case _RegisterUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "email")  String? email, @JsonKey(name: "display_name")  String? displayName, @JsonKey(name: "role")  String? role, @JsonKey(name: "created_at")  dynamic createdAt, @JsonKey(name: "updated_at")  dynamic updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterUserModel() when $default != null:
return $default(_that.id,_that.email,_that.displayName,_that.role,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "email")  String? email, @JsonKey(name: "display_name")  String? displayName, @JsonKey(name: "role")  String? role, @JsonKey(name: "created_at")  dynamic createdAt, @JsonKey(name: "updated_at")  dynamic updatedAt)  $default,) {final _that = this;
switch (_that) {
case _RegisterUserModel():
return $default(_that.id,_that.email,_that.displayName,_that.role,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "email")  String? email, @JsonKey(name: "display_name")  String? displayName, @JsonKey(name: "role")  String? role, @JsonKey(name: "created_at")  dynamic createdAt, @JsonKey(name: "updated_at")  dynamic updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _RegisterUserModel() when $default != null:
return $default(_that.id,_that.email,_that.displayName,_that.role,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterUserModel implements RegisterUserModel {
  const _RegisterUserModel({@JsonKey(name: "id") this.id, @JsonKey(name: "email") this.email, @JsonKey(name: "display_name") this.displayName, @JsonKey(name: "role") this.role, @JsonKey(name: "created_at") this.createdAt, @JsonKey(name: "updated_at") this.updatedAt});
  factory _RegisterUserModel.fromJson(Map<String, dynamic> json) => _$RegisterUserModelFromJson(json);

@override@JsonKey(name: "id") final  String? id;
@override@JsonKey(name: "email") final  String? email;
@override@JsonKey(name: "display_name") final  String? displayName;
@override@JsonKey(name: "role") final  String? role;
@override@JsonKey(name: "created_at") final  dynamic createdAt;
@override@JsonKey(name: "updated_at") final  dynamic updatedAt;

/// Create a copy of RegisterUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterUserModelCopyWith<_RegisterUserModel> get copyWith => __$RegisterUserModelCopyWithImpl<_RegisterUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,email,displayName,role,const DeepCollectionEquality().hash(createdAt),const DeepCollectionEquality().hash(updatedAt));
}

@override
String toString() {
    return 'RegisterUserModel(id: $id, email: $email, displayName: $displayName, role: $role, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RegisterUserModelCopyWith<$Res> implements $RegisterUserModelCopyWith<$Res> {
  factory _$RegisterUserModelCopyWith(_RegisterUserModel value, $Res Function(_RegisterUserModel) _then) = __$RegisterUserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "email") String? email,@JsonKey(name: "display_name") String? displayName,@JsonKey(name: "role") String? role,@JsonKey(name: "created_at") dynamic createdAt,@JsonKey(name: "updated_at") dynamic updatedAt
});




}
/// @nodoc
class __$RegisterUserModelCopyWithImpl<$Res>
    implements _$RegisterUserModelCopyWith<$Res> {
  __$RegisterUserModelCopyWithImpl(this._self, this._then);

  final _RegisterUserModel _self;
  final $Res Function(_RegisterUserModel) _then;

/// Create a copy of RegisterUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? email = freezed,Object? displayName = freezed,Object? role = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_RegisterUserModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
