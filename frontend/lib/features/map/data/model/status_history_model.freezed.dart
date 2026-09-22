// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatusHistoryModel {

@JsonKey(name: "status") bool? get status;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") List<StatusHistoryEntryModel>? get data;
/// Create a copy of StatusHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusHistoryModelCopyWith<StatusHistoryModel> get copyWith => _$StatusHistoryModelCopyWithImpl<StatusHistoryModel>(this as StatusHistoryModel, _$identity);

  /// Serializes this StatusHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusHistoryModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'StatusHistoryModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $StatusHistoryModelCopyWith<$Res>  {
  factory $StatusHistoryModelCopyWith(StatusHistoryModel value, $Res Function(StatusHistoryModel) _then) = _$StatusHistoryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "message") String? message,@JsonKey(name: "data") List<StatusHistoryEntryModel>? data
});




}
/// @nodoc
class _$StatusHistoryModelCopyWithImpl<$Res>
    implements $StatusHistoryModelCopyWith<$Res> {
  _$StatusHistoryModelCopyWithImpl(this._self, this._then);

  final StatusHistoryModel _self;
  final $Res Function(StatusHistoryModel) _then;

/// Create a copy of StatusHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(StatusHistoryModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<StatusHistoryEntryModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [StatusHistoryModel].
extension StatusHistoryModelPatterns on StatusHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatusHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatusHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatusHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _StatusHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatusHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _StatusHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  List<StatusHistoryEntryModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatusHistoryModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  List<StatusHistoryEntryModel>? data)  $default,) {final _that = this;
switch (_that) {
case _StatusHistoryModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  List<StatusHistoryEntryModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _StatusHistoryModel() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatusHistoryModel implements StatusHistoryModel {
  const _StatusHistoryModel({@JsonKey(name: "status") this.status, @JsonKey(name: "message") this.message, @JsonKey(name: "data")  List<StatusHistoryEntryModel>? data}): _data = data;
  factory _StatusHistoryModel.fromJson(Map<String, dynamic> json) => _$StatusHistoryModelFromJson(json);

@override@JsonKey(name: "status") final  bool? status;
@override@JsonKey(name: "message") final  String? message;
 final  List<StatusHistoryEntryModel>? _data;
@override@JsonKey(name: "data") List<StatusHistoryEntryModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of StatusHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusHistoryModelCopyWith<_StatusHistoryModel> get copyWith => __$StatusHistoryModelCopyWithImpl<_StatusHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatusHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusHistoryModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'StatusHistoryModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$StatusHistoryModelCopyWith<$Res> implements $StatusHistoryModelCopyWith<$Res> {
  factory _$StatusHistoryModelCopyWith(_StatusHistoryModel value, $Res Function(_StatusHistoryModel) _then) = __$StatusHistoryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "message") String? message,@JsonKey(name: "data") List<StatusHistoryEntryModel>? data
});




}
/// @nodoc
class __$StatusHistoryModelCopyWithImpl<$Res>
    implements _$StatusHistoryModelCopyWith<$Res> {
  __$StatusHistoryModelCopyWithImpl(this._self, this._then);

  final _StatusHistoryModel _self;
  final $Res Function(_StatusHistoryModel) _then;

/// Create a copy of StatusHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_StatusHistoryModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<StatusHistoryEntryModel>?,
  ));
}


}


/// @nodoc
mixin _$StatusHistoryEntryModel {

@JsonKey(name: "id") String? get id;@JsonKey(name: "from_status") String? get fromStatus;@JsonKey(name: "to_status") String? get toStatus;@JsonKey(name: "note") String? get note;@JsonKey(name: "actor_role") String? get actorRole;@JsonKey(name: "created_at") String? get createdAt;
/// Create a copy of StatusHistoryEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusHistoryEntryModelCopyWith<StatusHistoryEntryModel> get copyWith => _$StatusHistoryEntryModelCopyWithImpl<StatusHistoryEntryModel>(this as StatusHistoryEntryModel, _$identity);

  /// Serializes this StatusHistoryEntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusHistoryEntryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fromStatus, fromStatus) || other.fromStatus == fromStatus)&&(identical(other.toStatus, toStatus) || other.toStatus == toStatus)&&(identical(other.note, note) || other.note == note)&&(identical(other.actorRole, actorRole) || other.actorRole == actorRole)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fromStatus,toStatus,note,actorRole,createdAt);

@override
String toString() {
  return 'StatusHistoryEntryModel(id: $id, fromStatus: $fromStatus, toStatus: $toStatus, note: $note, actorRole: $actorRole, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $StatusHistoryEntryModelCopyWith<$Res>  {
  factory $StatusHistoryEntryModelCopyWith(StatusHistoryEntryModel value, $Res Function(StatusHistoryEntryModel) _then) = _$StatusHistoryEntryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "from_status") String? fromStatus,@JsonKey(name: "to_status") String? toStatus,@JsonKey(name: "note") String? note,@JsonKey(name: "actor_role") String? actorRole,@JsonKey(name: "created_at") String? createdAt
});




}
/// @nodoc
class _$StatusHistoryEntryModelCopyWithImpl<$Res>
    implements $StatusHistoryEntryModelCopyWith<$Res> {
  _$StatusHistoryEntryModelCopyWithImpl(this._self, this._then);

  final StatusHistoryEntryModel _self;
  final $Res Function(StatusHistoryEntryModel) _then;

/// Create a copy of StatusHistoryEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? fromStatus = freezed,Object? toStatus = freezed,Object? note = freezed,Object? actorRole = freezed,Object? createdAt = freezed,}) {
  return _then(StatusHistoryEntryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,fromStatus: freezed == fromStatus ? _self.fromStatus : fromStatus // ignore: cast_nullable_to_non_nullable
as String?,toStatus: freezed == toStatus ? _self.toStatus : toStatus // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,actorRole: freezed == actorRole ? _self.actorRole : actorRole // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StatusHistoryEntryModel].
extension StatusHistoryEntryModelPatterns on StatusHistoryEntryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatusHistoryEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatusHistoryEntryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatusHistoryEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _StatusHistoryEntryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatusHistoryEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _StatusHistoryEntryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "from_status")  String? fromStatus, @JsonKey(name: "to_status")  String? toStatus, @JsonKey(name: "note")  String? note, @JsonKey(name: "actor_role")  String? actorRole, @JsonKey(name: "created_at")  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatusHistoryEntryModel() when $default != null:
return $default(_that.id,_that.fromStatus,_that.toStatus,_that.note,_that.actorRole,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "from_status")  String? fromStatus, @JsonKey(name: "to_status")  String? toStatus, @JsonKey(name: "note")  String? note, @JsonKey(name: "actor_role")  String? actorRole, @JsonKey(name: "created_at")  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _StatusHistoryEntryModel():
return $default(_that.id,_that.fromStatus,_that.toStatus,_that.note,_that.actorRole,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "from_status")  String? fromStatus, @JsonKey(name: "to_status")  String? toStatus, @JsonKey(name: "note")  String? note, @JsonKey(name: "actor_role")  String? actorRole, @JsonKey(name: "created_at")  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _StatusHistoryEntryModel() when $default != null:
return $default(_that.id,_that.fromStatus,_that.toStatus,_that.note,_that.actorRole,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatusHistoryEntryModel implements StatusHistoryEntryModel {
  const _StatusHistoryEntryModel({@JsonKey(name: "id") this.id, @JsonKey(name: "from_status") this.fromStatus, @JsonKey(name: "to_status") this.toStatus, @JsonKey(name: "note") this.note, @JsonKey(name: "actor_role") this.actorRole, @JsonKey(name: "created_at") this.createdAt});
  factory _StatusHistoryEntryModel.fromJson(Map<String, dynamic> json) => _$StatusHistoryEntryModelFromJson(json);

@override@JsonKey(name: "id") final  String? id;
@override@JsonKey(name: "from_status") final  String? fromStatus;
@override@JsonKey(name: "to_status") final  String? toStatus;
@override@JsonKey(name: "note") final  String? note;
@override@JsonKey(name: "actor_role") final  String? actorRole;
@override@JsonKey(name: "created_at") final  String? createdAt;

/// Create a copy of StatusHistoryEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusHistoryEntryModelCopyWith<_StatusHistoryEntryModel> get copyWith => __$StatusHistoryEntryModelCopyWithImpl<_StatusHistoryEntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatusHistoryEntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusHistoryEntryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fromStatus, fromStatus) || other.fromStatus == fromStatus)&&(identical(other.toStatus, toStatus) || other.toStatus == toStatus)&&(identical(other.note, note) || other.note == note)&&(identical(other.actorRole, actorRole) || other.actorRole == actorRole)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fromStatus,toStatus,note,actorRole,createdAt);

@override
String toString() {
  return 'StatusHistoryEntryModel(id: $id, fromStatus: $fromStatus, toStatus: $toStatus, note: $note, actorRole: $actorRole, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$StatusHistoryEntryModelCopyWith<$Res> implements $StatusHistoryEntryModelCopyWith<$Res> {
  factory _$StatusHistoryEntryModelCopyWith(_StatusHistoryEntryModel value, $Res Function(_StatusHistoryEntryModel) _then) = __$StatusHistoryEntryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "from_status") String? fromStatus,@JsonKey(name: "to_status") String? toStatus,@JsonKey(name: "note") String? note,@JsonKey(name: "actor_role") String? actorRole,@JsonKey(name: "created_at") String? createdAt
});




}
/// @nodoc
class __$StatusHistoryEntryModelCopyWithImpl<$Res>
    implements _$StatusHistoryEntryModelCopyWith<$Res> {
  __$StatusHistoryEntryModelCopyWithImpl(this._self, this._then);

  final _StatusHistoryEntryModel _self;
  final $Res Function(_StatusHistoryEntryModel) _then;

/// Create a copy of StatusHistoryEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? fromStatus = freezed,Object? toStatus = freezed,Object? note = freezed,Object? actorRole = freezed,Object? createdAt = freezed,}) {
  return _then(_StatusHistoryEntryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,fromStatus: freezed == fromStatus ? _self.fromStatus : fromStatus // ignore: cast_nullable_to_non_nullable
as String?,toStatus: freezed == toStatus ? _self.toStatus : toStatus // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,actorRole: freezed == actorRole ? _self.actorRole : actorRole // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
