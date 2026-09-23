// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginModel {

@JsonKey(name: "token") String? get token;@JsonKey(name: "expires_in") int? get expiresIn;@JsonKey(name: "user_response") LoginUserModel? get userResponse;
/// Create a copy of LoginModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginModelCopyWith<LoginModel> get copyWith => _$LoginModelCopyWithImpl<LoginModel>(this as LoginModel, _$identity);

  /// Serializes this LoginModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LoginModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginModel&&(identical(other.token, _this.token) || other.token == _this.token)&&(identical(other.expiresIn, _this.expiresIn) || other.expiresIn == _this.expiresIn)&&(identical(other.userResponse, _this.userResponse) || other.userResponse == _this.userResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LoginModel;
  return Object.hash(runtimeType,_this.token,_this.expiresIn,_this.userResponse);
}

@override
String toString() {
  final _this = this as LoginModel;
  return 'LoginModel(token: ${_this.token}, expiresIn: ${_this.expiresIn}, userResponse: ${_this.userResponse})';
}


}

/// @nodoc
abstract mixin class $LoginModelCopyWith<$Res>  {
  factory $LoginModelCopyWith(LoginModel value, $Res Function(LoginModel) _then) = _$LoginModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "token") String? token,@JsonKey(name: "expires_in") int? expiresIn,@JsonKey(name: "user_response") LoginUserModel? userResponse
});


$LoginUserModelCopyWith<$Res>? get userResponse;

}
/// @nodoc
class _$LoginModelCopyWithImpl<$Res>
    implements $LoginModelCopyWith<$Res> {
  _$LoginModelCopyWithImpl(this._self, this._then);

  final LoginModel _self;
  final $Res Function(LoginModel) _then;

/// Create a copy of LoginModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = freezed,Object? expiresIn = freezed,Object? userResponse = freezed,}) {
  return _then(LoginModel(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,userResponse: freezed == userResponse ? _self.userResponse : userResponse // ignore: cast_nullable_to_non_nullable
as LoginUserModel?,
  ));
}
/// Create a copy of LoginModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginUserModelCopyWith<$Res>? get userResponse {
    if (_self.userResponse == null) {
    return null;
  }

  return $LoginUserModelCopyWith<$Res>(_self.userResponse!, (value) {
    return _then(_self.copyWith(userResponse: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginModel].
extension LoginModelPatterns on LoginModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginModel value)  $default,){
final _that = this;
switch (_that) {
case _LoginModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginModel value)?  $default,){
final _that = this;
switch (_that) {
case _LoginModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "token")  String? token, @JsonKey(name: "expires_in")  int? expiresIn, @JsonKey(name: "user_response")  LoginUserModel? userResponse)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "token")  String? token, @JsonKey(name: "expires_in")  int? expiresIn, @JsonKey(name: "user_response")  LoginUserModel? userResponse)  $default,) {final _that = this;
switch (_that) {
case _LoginModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "token")  String? token, @JsonKey(name: "expires_in")  int? expiresIn, @JsonKey(name: "user_response")  LoginUserModel? userResponse)?  $default,) {final _that = this;
switch (_that) {
case _LoginModel() when $default != null:
return $default(_that.token,_that.expiresIn,_that.userResponse);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginModel implements LoginModel {
  const _LoginModel({@JsonKey(name: "token") this.token, @JsonKey(name: "expires_in") this.expiresIn, @JsonKey(name: "user_response") this.userResponse});
  factory _LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

@override@JsonKey(name: "token") final  String? token;
@override@JsonKey(name: "expires_in") final  int? expiresIn;
@override@JsonKey(name: "user_response") final  LoginUserModel? userResponse;

/// Create a copy of LoginModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginModelCopyWith<_LoginModel> get copyWith => __$LoginModelCopyWithImpl<_LoginModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginModel&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.userResponse, userResponse) || other.userResponse == userResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,token,expiresIn,userResponse);
}

@override
String toString() {
    return 'LoginModel(token: $token, expiresIn: $expiresIn, userResponse: $userResponse)';
}


}

/// @nodoc
abstract mixin class _$LoginModelCopyWith<$Res> implements $LoginModelCopyWith<$Res> {
  factory _$LoginModelCopyWith(_LoginModel value, $Res Function(_LoginModel) _then) = __$LoginModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "token") String? token,@JsonKey(name: "expires_in") int? expiresIn,@JsonKey(name: "user_response") LoginUserModel? userResponse
});


@override $LoginUserModelCopyWith<$Res>? get userResponse;

}
/// @nodoc
class __$LoginModelCopyWithImpl<$Res>
    implements _$LoginModelCopyWith<$Res> {
  __$LoginModelCopyWithImpl(this._self, this._then);

  final _LoginModel _self;
  final $Res Function(_LoginModel) _then;

/// Create a copy of LoginModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = freezed,Object? expiresIn = freezed,Object? userResponse = freezed,}) {
  return _then(_LoginModel(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,userResponse: freezed == userResponse ? _self.userResponse : userResponse // ignore: cast_nullable_to_non_nullable
as LoginUserModel?,
  ));
}

/// Create a copy of LoginModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginUserModelCopyWith<$Res>? get userResponse {
    if (_self.userResponse == null) {
    return null;
  }

  return $LoginUserModelCopyWith<$Res>(_self.userResponse!, (value) {
    return _then(_self.copyWith(userResponse: value));
  });
}
}


/// @nodoc
mixin _$LoginUserModel {

@JsonKey(name: "id") String? get id;@JsonKey(name: "email") String? get email;@JsonKey(name: "display_name") String? get displayName;@JsonKey(name: "role") String? get role;@JsonKey(name: "created_at") dynamic get createdAt;@JsonKey(name: "updated_at") dynamic get updatedAt;
/// Create a copy of LoginUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginUserModelCopyWith<LoginUserModel> get copyWith => _$LoginUserModelCopyWithImpl<LoginUserModel>(this as LoginUserModel, _$identity);

  /// Serializes this LoginUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LoginUserModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginUserModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName)&&(identical(other.role, _this.role) || other.role == _this.role)&&const DeepCollectionEquality().equals(other.createdAt, _this.createdAt)&&const DeepCollectionEquality().equals(other.updatedAt, _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LoginUserModel;
  return Object.hash(runtimeType,_this.id,_this.email,_this.displayName,_this.role,const DeepCollectionEquality().hash(_this.createdAt),const DeepCollectionEquality().hash(_this.updatedAt));
}

@override
String toString() {
  final _this = this as LoginUserModel;
  return 'LoginUserModel(id: ${_this.id}, email: ${_this.email}, displayName: ${_this.displayName}, role: ${_this.role}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $LoginUserModelCopyWith<$Res>  {
  factory $LoginUserModelCopyWith(LoginUserModel value, $Res Function(LoginUserModel) _then) = _$LoginUserModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "email") String? email,@JsonKey(name: "display_name") String? displayName,@JsonKey(name: "role") String? role,@JsonKey(name: "created_at") dynamic createdAt,@JsonKey(name: "updated_at") dynamic updatedAt
});




}
/// @nodoc
class _$LoginUserModelCopyWithImpl<$Res>
    implements $LoginUserModelCopyWith<$Res> {
  _$LoginUserModelCopyWithImpl(this._self, this._then);

  final LoginUserModel _self;
  final $Res Function(LoginUserModel) _then;

/// Create a copy of LoginUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? email = freezed,Object? displayName = freezed,Object? role = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(LoginUserModel(
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


/// Adds pattern-matching-related methods to [LoginUserModel].
extension LoginUserModelPatterns on LoginUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginUserModel value)  $default,){
final _that = this;
switch (_that) {
case _LoginUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _LoginUserModel() when $default != null:
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
case _LoginUserModel() when $default != null:
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
case _LoginUserModel():
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
case _LoginUserModel() when $default != null:
return $default(_that.id,_that.email,_that.displayName,_that.role,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginUserModel implements LoginUserModel {
  const _LoginUserModel({@JsonKey(name: "id") this.id, @JsonKey(name: "email") this.email, @JsonKey(name: "display_name") this.displayName, @JsonKey(name: "role") this.role, @JsonKey(name: "created_at") this.createdAt, @JsonKey(name: "updated_at") this.updatedAt});
  factory _LoginUserModel.fromJson(Map<String, dynamic> json) => _$LoginUserModelFromJson(json);

@override@JsonKey(name: "id") final  String? id;
@override@JsonKey(name: "email") final  String? email;
@override@JsonKey(name: "display_name") final  String? displayName;
@override@JsonKey(name: "role") final  String? role;
@override@JsonKey(name: "created_at") final  dynamic createdAt;
@override@JsonKey(name: "updated_at") final  dynamic updatedAt;

/// Create a copy of LoginUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginUserModelCopyWith<_LoginUserModel> get copyWith => __$LoginUserModelCopyWithImpl<_LoginUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,email,displayName,role,const DeepCollectionEquality().hash(createdAt),const DeepCollectionEquality().hash(updatedAt));
}

@override
String toString() {
    return 'LoginUserModel(id: $id, email: $email, displayName: $displayName, role: $role, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$LoginUserModelCopyWith<$Res> implements $LoginUserModelCopyWith<$Res> {
  factory _$LoginUserModelCopyWith(_LoginUserModel value, $Res Function(_LoginUserModel) _then) = __$LoginUserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "email") String? email,@JsonKey(name: "display_name") String? displayName,@JsonKey(name: "role") String? role,@JsonKey(name: "created_at") dynamic createdAt,@JsonKey(name: "updated_at") dynamic updatedAt
});




}
/// @nodoc
class __$LoginUserModelCopyWithImpl<$Res>
    implements _$LoginUserModelCopyWith<$Res> {
  __$LoginUserModelCopyWithImpl(this._self, this._then);

  final _LoginUserModel _self;
  final $Res Function(_LoginUserModel) _then;

/// Create a copy of LoginUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? email = freezed,Object? displayName = freezed,Object? role = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_LoginUserModel(
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
