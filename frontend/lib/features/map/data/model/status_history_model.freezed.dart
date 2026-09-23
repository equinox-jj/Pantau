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
  final _this = this as StatusHistoryEntryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusHistoryEntryModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.fromStatus, _this.fromStatus) || other.fromStatus == _this.fromStatus)&&(identical(other.toStatus, _this.toStatus) || other.toStatus == _this.toStatus)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.actorRole, _this.actorRole) || other.actorRole == _this.actorRole)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StatusHistoryEntryModel;
  return Object.hash(runtimeType,_this.id,_this.fromStatus,_this.toStatus,_this.note,_this.actorRole,_this.createdAt);
}

@override
String toString() {
  final _this = this as StatusHistoryEntryModel;
  return 'StatusHistoryEntryModel(id: ${_this.id}, fromStatus: ${_this.fromStatus}, toStatus: ${_this.toStatus}, note: ${_this.note}, actorRole: ${_this.actorRole}, createdAt: ${_this.createdAt})';
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
int get hashCode {
    return Object.hash(runtimeType,id,fromStatus,toStatus,note,actorRole,createdAt);
}

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
