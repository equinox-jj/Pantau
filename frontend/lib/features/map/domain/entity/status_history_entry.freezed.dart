// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_history_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatusHistoryEntry {

 String? get id;/// Null on the initial entry.
 ReportStatus? get fromStatus; ReportStatus get toStatus; String? get note; String? get actorRole; DateTime? get createdAt;
/// Create a copy of StatusHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusHistoryEntryCopyWith<StatusHistoryEntry> get copyWith => _$StatusHistoryEntryCopyWithImpl<StatusHistoryEntry>(this as StatusHistoryEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusHistoryEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.fromStatus, fromStatus) || other.fromStatus == fromStatus)&&(identical(other.toStatus, toStatus) || other.toStatus == toStatus)&&(identical(other.note, note) || other.note == note)&&(identical(other.actorRole, actorRole) || other.actorRole == actorRole)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,fromStatus,toStatus,note,actorRole,createdAt);

@override
String toString() {
  return 'StatusHistoryEntry(id: $id, fromStatus: $fromStatus, toStatus: $toStatus, note: $note, actorRole: $actorRole, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $StatusHistoryEntryCopyWith<$Res>  {
  factory $StatusHistoryEntryCopyWith(StatusHistoryEntry value, $Res Function(StatusHistoryEntry) _then) = _$StatusHistoryEntryCopyWithImpl;
@useResult
$Res call({
 String? id, ReportStatus? fromStatus, ReportStatus toStatus, String? note, String? actorRole, DateTime? createdAt
});




}
/// @nodoc
class _$StatusHistoryEntryCopyWithImpl<$Res>
    implements $StatusHistoryEntryCopyWith<$Res> {
  _$StatusHistoryEntryCopyWithImpl(this._self, this._then);

  final StatusHistoryEntry _self;
  final $Res Function(StatusHistoryEntry) _then;

/// Create a copy of StatusHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? fromStatus = freezed,Object? toStatus = null,Object? note = freezed,Object? actorRole = freezed,Object? createdAt = freezed,}) {
  return _then(StatusHistoryEntry(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,fromStatus: freezed == fromStatus ? _self.fromStatus : fromStatus // ignore: cast_nullable_to_non_nullable
as ReportStatus?,toStatus: null == toStatus ? _self.toStatus : toStatus // ignore: cast_nullable_to_non_nullable
as ReportStatus,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,actorRole: freezed == actorRole ? _self.actorRole : actorRole // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [StatusHistoryEntry].
extension StatusHistoryEntryPatterns on StatusHistoryEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatusHistoryEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatusHistoryEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatusHistoryEntry value)  $default,){
final _that = this;
switch (_that) {
case _StatusHistoryEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatusHistoryEntry value)?  $default,){
final _that = this;
switch (_that) {
case _StatusHistoryEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  ReportStatus? fromStatus,  ReportStatus toStatus,  String? note,  String? actorRole,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatusHistoryEntry() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  ReportStatus? fromStatus,  ReportStatus toStatus,  String? note,  String? actorRole,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _StatusHistoryEntry():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  ReportStatus? fromStatus,  ReportStatus toStatus,  String? note,  String? actorRole,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _StatusHistoryEntry() when $default != null:
return $default(_that.id,_that.fromStatus,_that.toStatus,_that.note,_that.actorRole,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _StatusHistoryEntry implements StatusHistoryEntry {
  const _StatusHistoryEntry({this.id, this.fromStatus, this.toStatus = ReportStatus.unknown, this.note, this.actorRole, this.createdAt});
  

@override final  String? id;
/// Null on the initial entry.
@override final  ReportStatus? fromStatus;
@override@JsonKey() final  ReportStatus toStatus;
@override final  String? note;
@override final  String? actorRole;
@override final  DateTime? createdAt;

/// Create a copy of StatusHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusHistoryEntryCopyWith<_StatusHistoryEntry> get copyWith => __$StatusHistoryEntryCopyWithImpl<_StatusHistoryEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusHistoryEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.fromStatus, fromStatus) || other.fromStatus == fromStatus)&&(identical(other.toStatus, toStatus) || other.toStatus == toStatus)&&(identical(other.note, note) || other.note == note)&&(identical(other.actorRole, actorRole) || other.actorRole == actorRole)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,fromStatus,toStatus,note,actorRole,createdAt);

@override
String toString() {
  return 'StatusHistoryEntry(id: $id, fromStatus: $fromStatus, toStatus: $toStatus, note: $note, actorRole: $actorRole, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$StatusHistoryEntryCopyWith<$Res> implements $StatusHistoryEntryCopyWith<$Res> {
  factory _$StatusHistoryEntryCopyWith(_StatusHistoryEntry value, $Res Function(_StatusHistoryEntry) _then) = __$StatusHistoryEntryCopyWithImpl;
@override @useResult
$Res call({
 String? id, ReportStatus? fromStatus, ReportStatus toStatus, String? note, String? actorRole, DateTime? createdAt
});




}
/// @nodoc
class __$StatusHistoryEntryCopyWithImpl<$Res>
    implements _$StatusHistoryEntryCopyWith<$Res> {
  __$StatusHistoryEntryCopyWithImpl(this._self, this._then);

  final _StatusHistoryEntry _self;
  final $Res Function(_StatusHistoryEntry) _then;

/// Create a copy of StatusHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? fromStatus = freezed,Object? toStatus = null,Object? note = freezed,Object? actorRole = freezed,Object? createdAt = freezed,}) {
  return _then(_StatusHistoryEntry(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,fromStatus: freezed == fromStatus ? _self.fromStatus : fromStatus // ignore: cast_nullable_to_non_nullable
as ReportStatus?,toStatus: null == toStatus ? _self.toStatus : toStatus // ignore: cast_nullable_to_non_nullable
as ReportStatus,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,actorRole: freezed == actorRole ? _self.actorRole : actorRole // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
