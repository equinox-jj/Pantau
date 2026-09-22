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

@JsonKey(name: "status") bool? get status;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") RegisterDataModel? get data;
/// Create a copy of RegisterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterModelCopyWith<RegisterModel> get copyWith => _$RegisterModelCopyWithImpl<RegisterModel>(this as RegisterModel, _$identity);

  /// Serializes this RegisterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'RegisterModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $RegisterModelCopyWith<$Res>  {
  factory $RegisterModelCopyWith(RegisterModel value, $Res Function(RegisterModel) _then) = _$RegisterModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "message") String? message,@JsonKey(name: "data") RegisterDataModel? data
});


$RegisterDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$RegisterModelCopyWithImpl<$Res>
    implements $RegisterModelCopyWith<$Res> {
  _$RegisterModelCopyWithImpl(this._self, this._then);

  final RegisterModel _self;
  final $Res Function(RegisterModel) _then;

/// Create a copy of RegisterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(RegisterModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RegisterDataModel?,
  ));
}
/// Create a copy of RegisterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RegisterDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  RegisterDataModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  RegisterDataModel? data)  $default,) {final _that = this;
switch (_that) {
case _RegisterModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  RegisterDataModel? data)?  $default,) {final _that = this;
switch (_that) {
case _RegisterModel() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterModel implements RegisterModel {
   _RegisterModel({@JsonKey(name: "status") this.status, @JsonKey(name: "message") this.message, @JsonKey(name: "data") this.data});
  factory _RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);

@override@JsonKey(name: "status") final  bool? status;
@override@JsonKey(name: "message") final  String? message;
@override@JsonKey(name: "data") final  RegisterDataModel? data;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'RegisterModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$RegisterModelCopyWith<$Res> implements $RegisterModelCopyWith<$Res> {
  factory _$RegisterModelCopyWith(_RegisterModel value, $Res Function(_RegisterModel) _then) = __$RegisterModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "message") String? message,@JsonKey(name: "data") RegisterDataModel? data
});


@override $RegisterDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$RegisterModelCopyWithImpl<$Res>
    implements _$RegisterModelCopyWith<$Res> {
  __$RegisterModelCopyWithImpl(this._self, this._then);

  final _RegisterModel _self;
  final $Res Function(_RegisterModel) _then;

/// Create a copy of RegisterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_RegisterModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RegisterDataModel?,
  ));
}

/// Create a copy of RegisterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RegisterDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$RegisterDataModel {

@JsonKey(name: "token") String? get token;@JsonKey(name: "expires_in") int? get expiresIn;@JsonKey(name: "user_response") RegisterUserModel? get userResponse;
/// Create a copy of RegisterDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterDataModelCopyWith<RegisterDataModel> get copyWith => _$RegisterDataModelCopyWithImpl<RegisterDataModel>(this as RegisterDataModel, _$identity);

  /// Serializes this RegisterDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterDataModel&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.userResponse, userResponse) || other.userResponse == userResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,expiresIn,userResponse);

@override
String toString() {
  return 'RegisterDataModel(token: $token, expiresIn: $expiresIn, userResponse: $userResponse)';
}


}

/// @nodoc
abstract mixin class $RegisterDataModelCopyWith<$Res>  {
  factory $RegisterDataModelCopyWith(RegisterDataModel value, $Res Function(RegisterDataModel) _then) = _$RegisterDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "token") String? token,@JsonKey(name: "expires_in") int? expiresIn,@JsonKey(name: "user_response") RegisterUserModel? userResponse
});


$RegisterUserModelCopyWith<$Res>? get userResponse;

}
/// @nodoc
class _$RegisterDataModelCopyWithImpl<$Res>
    implements $RegisterDataModelCopyWith<$Res> {
  _$RegisterDataModelCopyWithImpl(this._self, this._then);

  final RegisterDataModel _self;
  final $Res Function(RegisterDataModel) _then;

/// Create a copy of RegisterDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = freezed,Object? expiresIn = freezed,Object? userResponse = freezed,}) {
  return _then(RegisterDataModel(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,userResponse: freezed == userResponse ? _self.userResponse : userResponse // ignore: cast_nullable_to_non_nullable
as RegisterUserModel?,
  ));
}
/// Create a copy of RegisterDataModel
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


/// Adds pattern-matching-related methods to [RegisterDataModel].
extension RegisterDataModelPatterns on RegisterDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterDataModel value)  $default,){
final _that = this;
switch (_that) {
case _RegisterDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterDataModel() when $default != null:
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
case _RegisterDataModel() when $default != null:
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
case _RegisterDataModel():
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
case _RegisterDataModel() when $default != null:
return $default(_that.token,_that.expiresIn,_that.userResponse);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterDataModel implements RegisterDataModel {
  const _RegisterDataModel({@JsonKey(name: "token") this.token, @JsonKey(name: "expires_in") this.expiresIn, @JsonKey(name: "user_response") this.userResponse});
  factory _RegisterDataModel.fromJson(Map<String, dynamic> json) => _$RegisterDataModelFromJson(json);

@override@JsonKey(name: "token") final  String? token;
@override@JsonKey(name: "expires_in") final  int? expiresIn;
@override@JsonKey(name: "user_response") final  RegisterUserModel? userResponse;

/// Create a copy of RegisterDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterDataModelCopyWith<_RegisterDataModel> get copyWith => __$RegisterDataModelCopyWithImpl<_RegisterDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterDataModel&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.userResponse, userResponse) || other.userResponse == userResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,expiresIn,userResponse);

@override
String toString() {
  return 'RegisterDataModel(token: $token, expiresIn: $expiresIn, userResponse: $userResponse)';
}


}

/// @nodoc
abstract mixin class _$RegisterDataModelCopyWith<$Res> implements $RegisterDataModelCopyWith<$Res> {
  factory _$RegisterDataModelCopyWith(_RegisterDataModel value, $Res Function(_RegisterDataModel) _then) = __$RegisterDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "token") String? token,@JsonKey(name: "expires_in") int? expiresIn,@JsonKey(name: "user_response") RegisterUserModel? userResponse
});


@override $RegisterUserModelCopyWith<$Res>? get userResponse;

}
/// @nodoc
class __$RegisterDataModelCopyWithImpl<$Res>
    implements _$RegisterDataModelCopyWith<$Res> {
  __$RegisterDataModelCopyWithImpl(this._self, this._then);

  final _RegisterDataModel _self;
  final $Res Function(_RegisterDataModel) _then;

/// Create a copy of RegisterDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = freezed,Object? expiresIn = freezed,Object? userResponse = freezed,}) {
  return _then(_RegisterDataModel(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,userResponse: freezed == userResponse ? _self.userResponse : userResponse // ignore: cast_nullable_to_non_nullable
as RegisterUserModel?,
  ));
}

/// Create a copy of RegisterDataModel
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

@JsonKey(name: "uuid") String? get uuid;@JsonKey(name: "email") String? get email;@JsonKey(name: "username") String? get username;@JsonKey(name: "role") String? get role;@JsonKey(name: "created_at") dynamic get createdAt;@JsonKey(name: "updated_at") dynamic get updatedAt;
/// Create a copy of RegisterUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterUserModelCopyWith<RegisterUserModel> get copyWith => _$RegisterUserModelCopyWithImpl<RegisterUserModel>(this as RegisterUserModel, _$identity);

  /// Serializes this RegisterUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterUserModel&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,email,username,role,const DeepCollectionEquality().hash(createdAt),const DeepCollectionEquality().hash(updatedAt));

@override
String toString() {
  return 'RegisterUserModel(uuid: $uuid, email: $email, username: $username, role: $role, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RegisterUserModelCopyWith<$Res>  {
  factory $RegisterUserModelCopyWith(RegisterUserModel value, $Res Function(RegisterUserModel) _then) = _$RegisterUserModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "uuid") String? uuid,@JsonKey(name: "email") String? email,@JsonKey(name: "username") String? username,@JsonKey(name: "role") String? role,@JsonKey(name: "created_at") dynamic createdAt,@JsonKey(name: "updated_at") dynamic updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = freezed,Object? email = freezed,Object? username = freezed,Object? role = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(RegisterUserModel(
uuid: freezed == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "uuid")  String? uuid, @JsonKey(name: "email")  String? email, @JsonKey(name: "username")  String? username, @JsonKey(name: "role")  String? role, @JsonKey(name: "created_at")  dynamic createdAt, @JsonKey(name: "updated_at")  dynamic updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterUserModel() when $default != null:
return $default(_that.uuid,_that.email,_that.username,_that.role,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "uuid")  String? uuid, @JsonKey(name: "email")  String? email, @JsonKey(name: "username")  String? username, @JsonKey(name: "role")  String? role, @JsonKey(name: "created_at")  dynamic createdAt, @JsonKey(name: "updated_at")  dynamic updatedAt)  $default,) {final _that = this;
switch (_that) {
case _RegisterUserModel():
return $default(_that.uuid,_that.email,_that.username,_that.role,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "uuid")  String? uuid, @JsonKey(name: "email")  String? email, @JsonKey(name: "username")  String? username, @JsonKey(name: "role")  String? role, @JsonKey(name: "created_at")  dynamic createdAt, @JsonKey(name: "updated_at")  dynamic updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _RegisterUserModel() when $default != null:
return $default(_that.uuid,_that.email,_that.username,_that.role,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterUserModel implements RegisterUserModel {
  const _RegisterUserModel({@JsonKey(name: "uuid") this.uuid, @JsonKey(name: "email") this.email, @JsonKey(name: "username") this.username, @JsonKey(name: "role") this.role, @JsonKey(name: "created_at") this.createdAt, @JsonKey(name: "updated_at") this.updatedAt});
  factory _RegisterUserModel.fromJson(Map<String, dynamic> json) => _$RegisterUserModelFromJson(json);

@override@JsonKey(name: "uuid") final  String? uuid;
@override@JsonKey(name: "email") final  String? email;
@override@JsonKey(name: "username") final  String? username;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterUserModel&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,email,username,role,const DeepCollectionEquality().hash(createdAt),const DeepCollectionEquality().hash(updatedAt));

@override
String toString() {
  return 'RegisterUserModel(uuid: $uuid, email: $email, username: $username, role: $role, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RegisterUserModelCopyWith<$Res> implements $RegisterUserModelCopyWith<$Res> {
  factory _$RegisterUserModelCopyWith(_RegisterUserModel value, $Res Function(_RegisterUserModel) _then) = __$RegisterUserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "uuid") String? uuid,@JsonKey(name: "email") String? email,@JsonKey(name: "username") String? username,@JsonKey(name: "role") String? role,@JsonKey(name: "created_at") dynamic createdAt,@JsonKey(name: "updated_at") dynamic updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = freezed,Object? email = freezed,Object? username = freezed,Object? role = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_RegisterUserModel(
uuid: freezed == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
