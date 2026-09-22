// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Register {

 bool? get status; String? get message; RegisterData? get data;
/// Create a copy of Register
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterCopyWith<Register> get copyWith => _$RegisterCopyWithImpl<Register>(this as Register, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Register&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'Register(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $RegisterCopyWith<$Res>  {
  factory $RegisterCopyWith(Register value, $Res Function(Register) _then) = _$RegisterCopyWithImpl;
@useResult
$Res call({
 bool? status, String? message, RegisterData? data
});


$RegisterDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$RegisterCopyWithImpl<$Res>
    implements $RegisterCopyWith<$Res> {
  _$RegisterCopyWithImpl(this._self, this._then);

  final Register _self;
  final $Res Function(Register) _then;

/// Create a copy of Register
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(Register(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RegisterData?,
  ));
}
/// Create a copy of Register
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RegisterDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [Register].
extension RegisterPatterns on Register {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Register value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Register() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Register value)  $default,){
final _that = this;
switch (_that) {
case _Register():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Register value)?  $default,){
final _that = this;
switch (_that) {
case _Register() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? status,  String? message,  RegisterData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Register() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? status,  String? message,  RegisterData? data)  $default,) {final _that = this;
switch (_that) {
case _Register():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? status,  String? message,  RegisterData? data)?  $default,) {final _that = this;
switch (_that) {
case _Register() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _Register implements Register {
   _Register({this.status, this.message, this.data});
  

@override final  bool? status;
@override final  String? message;
@override final  RegisterData? data;

/// Create a copy of Register
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterCopyWith<_Register> get copyWith => __$RegisterCopyWithImpl<_Register>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Register&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'Register(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$RegisterCopyWith<$Res> implements $RegisterCopyWith<$Res> {
  factory _$RegisterCopyWith(_Register value, $Res Function(_Register) _then) = __$RegisterCopyWithImpl;
@override @useResult
$Res call({
 bool? status, String? message, RegisterData? data
});


@override $RegisterDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$RegisterCopyWithImpl<$Res>
    implements _$RegisterCopyWith<$Res> {
  __$RegisterCopyWithImpl(this._self, this._then);

  final _Register _self;
  final $Res Function(_Register) _then;

/// Create a copy of Register
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_Register(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RegisterData?,
  ));
}

/// Create a copy of Register
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RegisterDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc
mixin _$RegisterData {

 String? get token; int? get expiresIn; RegisterUser? get user;
/// Create a copy of RegisterData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterDataCopyWith<RegisterData> get copyWith => _$RegisterDataCopyWithImpl<RegisterData>(this as RegisterData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterData&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,token,expiresIn,user);

@override
String toString() {
  return 'RegisterData(token: $token, expiresIn: $expiresIn, user: $user)';
}


}

/// @nodoc
abstract mixin class $RegisterDataCopyWith<$Res>  {
  factory $RegisterDataCopyWith(RegisterData value, $Res Function(RegisterData) _then) = _$RegisterDataCopyWithImpl;
@useResult
$Res call({
 String? token, int? expiresIn, RegisterUser? user
});


$RegisterUserCopyWith<$Res>? get user;

}
/// @nodoc
class _$RegisterDataCopyWithImpl<$Res>
    implements $RegisterDataCopyWith<$Res> {
  _$RegisterDataCopyWithImpl(this._self, this._then);

  final RegisterData _self;
  final $Res Function(RegisterData) _then;

/// Create a copy of RegisterData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = freezed,Object? expiresIn = freezed,Object? user = freezed,}) {
  return _then(RegisterData(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as RegisterUser?,
  ));
}
/// Create a copy of RegisterData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $RegisterUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterData].
extension RegisterDataPatterns on RegisterData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterData value)  $default,){
final _that = this;
switch (_that) {
case _RegisterData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterData value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? token,  int? expiresIn,  RegisterUser? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterData() when $default != null:
return $default(_that.token,_that.expiresIn,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? token,  int? expiresIn,  RegisterUser? user)  $default,) {final _that = this;
switch (_that) {
case _RegisterData():
return $default(_that.token,_that.expiresIn,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? token,  int? expiresIn,  RegisterUser? user)?  $default,) {final _that = this;
switch (_that) {
case _RegisterData() when $default != null:
return $default(_that.token,_that.expiresIn,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _RegisterData implements RegisterData {
  const _RegisterData({this.token, this.expiresIn, this.user});
  

@override final  String? token;
@override final  int? expiresIn;
@override final  RegisterUser? user;

/// Create a copy of RegisterData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterDataCopyWith<_RegisterData> get copyWith => __$RegisterDataCopyWithImpl<_RegisterData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterData&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,token,expiresIn,user);

@override
String toString() {
  return 'RegisterData(token: $token, expiresIn: $expiresIn, user: $user)';
}


}

/// @nodoc
abstract mixin class _$RegisterDataCopyWith<$Res> implements $RegisterDataCopyWith<$Res> {
  factory _$RegisterDataCopyWith(_RegisterData value, $Res Function(_RegisterData) _then) = __$RegisterDataCopyWithImpl;
@override @useResult
$Res call({
 String? token, int? expiresIn, RegisterUser? user
});


@override $RegisterUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$RegisterDataCopyWithImpl<$Res>
    implements _$RegisterDataCopyWith<$Res> {
  __$RegisterDataCopyWithImpl(this._self, this._then);

  final _RegisterData _self;
  final $Res Function(_RegisterData) _then;

/// Create a copy of RegisterData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = freezed,Object? expiresIn = freezed,Object? user = freezed,}) {
  return _then(_RegisterData(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as RegisterUser?,
  ));
}

/// Create a copy of RegisterData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $RegisterUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc
mixin _$RegisterUser {

 String? get uuid; String? get email; String? get username; String? get role; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of RegisterUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterUserCopyWith<RegisterUser> get copyWith => _$RegisterUserCopyWithImpl<RegisterUser>(this as RegisterUser, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterUser&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.role, role) || other.role == role)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,uuid,email,username,role,createdAt,updatedAt);

@override
String toString() {
  return 'RegisterUser(uuid: $uuid, email: $email, username: $username, role: $role, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RegisterUserCopyWith<$Res>  {
  factory $RegisterUserCopyWith(RegisterUser value, $Res Function(RegisterUser) _then) = _$RegisterUserCopyWithImpl;
@useResult
$Res call({
 String? uuid, String? email, String? username, String? role, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$RegisterUserCopyWithImpl<$Res>
    implements $RegisterUserCopyWith<$Res> {
  _$RegisterUserCopyWithImpl(this._self, this._then);

  final RegisterUser _self;
  final $Res Function(RegisterUser) _then;

/// Create a copy of RegisterUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = freezed,Object? email = freezed,Object? username = freezed,Object? role = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(RegisterUser(
uuid: freezed == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterUser].
extension RegisterUserPatterns on RegisterUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterUser value)  $default,){
final _that = this;
switch (_that) {
case _RegisterUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterUser value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? uuid,  String? email,  String? username,  String? role,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterUser() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? uuid,  String? email,  String? username,  String? role,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _RegisterUser():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? uuid,  String? email,  String? username,  String? role,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _RegisterUser() when $default != null:
return $default(_that.uuid,_that.email,_that.username,_that.role,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _RegisterUser implements RegisterUser {
  const _RegisterUser({this.uuid, this.email, this.username, this.role, this.createdAt, this.updatedAt});
  

@override final  String? uuid;
@override final  String? email;
@override final  String? username;
@override final  String? role;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of RegisterUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterUserCopyWith<_RegisterUser> get copyWith => __$RegisterUserCopyWithImpl<_RegisterUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterUser&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.role, role) || other.role == role)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,uuid,email,username,role,createdAt,updatedAt);

@override
String toString() {
  return 'RegisterUser(uuid: $uuid, email: $email, username: $username, role: $role, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RegisterUserCopyWith<$Res> implements $RegisterUserCopyWith<$Res> {
  factory _$RegisterUserCopyWith(_RegisterUser value, $Res Function(_RegisterUser) _then) = __$RegisterUserCopyWithImpl;
@override @useResult
$Res call({
 String? uuid, String? email, String? username, String? role, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$RegisterUserCopyWithImpl<$Res>
    implements _$RegisterUserCopyWith<$Res> {
  __$RegisterUserCopyWithImpl(this._self, this._then);

  final _RegisterUser _self;
  final $Res Function(_RegisterUser) _then;

/// Create a copy of RegisterUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = freezed,Object? email = freezed,Object? username = freezed,Object? role = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_RegisterUser(
uuid: freezed == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
