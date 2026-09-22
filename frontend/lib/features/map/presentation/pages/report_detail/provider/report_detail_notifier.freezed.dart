// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_detail_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReportDetailPageState {

 AsyncValue<ReportDetail> get detail; AsyncValue<List<StatusHistoryEntry>> get history;/// [history] merged with [_statusLadder]. Kept as its own field rather
/// than a getter so a detail-only refetch (or an unrelated field change)
/// does not recompute or re-identity this list — see `MapPageState`'s
/// `filteredReports` for the same reasoning.
 AsyncValue<List<TimelineStep>> get timeline;/// Whether the signed-in user is a resolver, read from the locally
/// cached role — the same lookup `Splash` uses to decide which shell to
/// land in. Gates [ReportStatusActionPanel]: a citizen viewing this same
/// shared detail page never sees the status-change action.
 AsyncValue<bool> get isResolver;/// Same one-shot shape as `CreateReport` — one in-flight submission per
/// detail-page visit, reset the moment the page is left (this notifier
/// is autodispose, no `keepAlive`).
 AsyncValue<ReportDetail?> get updateStatus;
/// Create a copy of ReportDetailPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportDetailPageStateCopyWith<ReportDetailPageState> get copyWith => _$ReportDetailPageStateCopyWithImpl<ReportDetailPageState>(this as ReportDetailPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportDetailPageState&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.history, history) || other.history == history)&&(identical(other.timeline, timeline) || other.timeline == timeline)&&(identical(other.isResolver, isResolver) || other.isResolver == isResolver)&&(identical(other.updateStatus, updateStatus) || other.updateStatus == updateStatus));
}


@override
int get hashCode => Object.hash(runtimeType,detail,history,timeline,isResolver,updateStatus);

@override
String toString() {
  return 'ReportDetailPageState(detail: $detail, history: $history, timeline: $timeline, isResolver: $isResolver, updateStatus: $updateStatus)';
}


}

/// @nodoc
abstract mixin class $ReportDetailPageStateCopyWith<$Res>  {
  factory $ReportDetailPageStateCopyWith(ReportDetailPageState value, $Res Function(ReportDetailPageState) _then) = _$ReportDetailPageStateCopyWithImpl;
@useResult
$Res call({
 AsyncValue<ReportDetail> detail, AsyncValue<List<StatusHistoryEntry>> history, AsyncValue<List<TimelineStep>> timeline, AsyncValue<bool> isResolver, AsyncValue<ReportDetail?> updateStatus
});




}
/// @nodoc
class _$ReportDetailPageStateCopyWithImpl<$Res>
    implements $ReportDetailPageStateCopyWith<$Res> {
  _$ReportDetailPageStateCopyWithImpl(this._self, this._then);

  final ReportDetailPageState _self;
  final $Res Function(ReportDetailPageState) _then;

/// Create a copy of ReportDetailPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? detail = null,Object? history = null,Object? timeline = null,Object? isResolver = null,Object? updateStatus = null,}) {
  return _then(ReportDetailPageState(
detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as AsyncValue<ReportDetail>,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<StatusHistoryEntry>>,timeline: null == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<TimelineStep>>,isResolver: null == isResolver ? _self.isResolver : isResolver // ignore: cast_nullable_to_non_nullable
as AsyncValue<bool>,updateStatus: null == updateStatus ? _self.updateStatus : updateStatus // ignore: cast_nullable_to_non_nullable
as AsyncValue<ReportDetail?>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportDetailPageState].
extension ReportDetailPageStatePatterns on ReportDetailPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportDetailPageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportDetailPageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportDetailPageState value)  $default,){
final _that = this;
switch (_that) {
case _ReportDetailPageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportDetailPageState value)?  $default,){
final _that = this;
switch (_that) {
case _ReportDetailPageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncValue<ReportDetail> detail,  AsyncValue<List<StatusHistoryEntry>> history,  AsyncValue<List<TimelineStep>> timeline,  AsyncValue<bool> isResolver,  AsyncValue<ReportDetail?> updateStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportDetailPageState() when $default != null:
return $default(_that.detail,_that.history,_that.timeline,_that.isResolver,_that.updateStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncValue<ReportDetail> detail,  AsyncValue<List<StatusHistoryEntry>> history,  AsyncValue<List<TimelineStep>> timeline,  AsyncValue<bool> isResolver,  AsyncValue<ReportDetail?> updateStatus)  $default,) {final _that = this;
switch (_that) {
case _ReportDetailPageState():
return $default(_that.detail,_that.history,_that.timeline,_that.isResolver,_that.updateStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncValue<ReportDetail> detail,  AsyncValue<List<StatusHistoryEntry>> history,  AsyncValue<List<TimelineStep>> timeline,  AsyncValue<bool> isResolver,  AsyncValue<ReportDetail?> updateStatus)?  $default,) {final _that = this;
switch (_that) {
case _ReportDetailPageState() when $default != null:
return $default(_that.detail,_that.history,_that.timeline,_that.isResolver,_that.updateStatus);case _:
  return null;

}
}

}

/// @nodoc


class _ReportDetailPageState implements ReportDetailPageState {
  const _ReportDetailPageState({this.detail = const AsyncLoading(), this.history = const AsyncLoading(), this.timeline = const AsyncLoading(), this.isResolver = const AsyncLoading(), this.updateStatus = const AsyncData(null)});
  

@override@JsonKey() final  AsyncValue<ReportDetail> detail;
@override@JsonKey() final  AsyncValue<List<StatusHistoryEntry>> history;
/// [history] merged with [_statusLadder]. Kept as its own field rather
/// than a getter so a detail-only refetch (or an unrelated field change)
/// does not recompute or re-identity this list — see `MapPageState`'s
/// `filteredReports` for the same reasoning.
@override@JsonKey() final  AsyncValue<List<TimelineStep>> timeline;
/// Whether the signed-in user is a resolver, read from the locally
/// cached role — the same lookup `Splash` uses to decide which shell to
/// land in. Gates [ReportStatusActionPanel]: a citizen viewing this same
/// shared detail page never sees the status-change action.
@override@JsonKey() final  AsyncValue<bool> isResolver;
/// Same one-shot shape as `CreateReport` — one in-flight submission per
/// detail-page visit, reset the moment the page is left (this notifier
/// is autodispose, no `keepAlive`).
@override@JsonKey() final  AsyncValue<ReportDetail?> updateStatus;

/// Create a copy of ReportDetailPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportDetailPageStateCopyWith<_ReportDetailPageState> get copyWith => __$ReportDetailPageStateCopyWithImpl<_ReportDetailPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportDetailPageState&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.history, history) || other.history == history)&&(identical(other.timeline, timeline) || other.timeline == timeline)&&(identical(other.isResolver, isResolver) || other.isResolver == isResolver)&&(identical(other.updateStatus, updateStatus) || other.updateStatus == updateStatus));
}


@override
int get hashCode => Object.hash(runtimeType,detail,history,timeline,isResolver,updateStatus);

@override
String toString() {
  return 'ReportDetailPageState(detail: $detail, history: $history, timeline: $timeline, isResolver: $isResolver, updateStatus: $updateStatus)';
}


}

/// @nodoc
abstract mixin class _$ReportDetailPageStateCopyWith<$Res> implements $ReportDetailPageStateCopyWith<$Res> {
  factory _$ReportDetailPageStateCopyWith(_ReportDetailPageState value, $Res Function(_ReportDetailPageState) _then) = __$ReportDetailPageStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncValue<ReportDetail> detail, AsyncValue<List<StatusHistoryEntry>> history, AsyncValue<List<TimelineStep>> timeline, AsyncValue<bool> isResolver, AsyncValue<ReportDetail?> updateStatus
});




}
/// @nodoc
class __$ReportDetailPageStateCopyWithImpl<$Res>
    implements _$ReportDetailPageStateCopyWith<$Res> {
  __$ReportDetailPageStateCopyWithImpl(this._self, this._then);

  final _ReportDetailPageState _self;
  final $Res Function(_ReportDetailPageState) _then;

/// Create a copy of ReportDetailPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? detail = null,Object? history = null,Object? timeline = null,Object? isResolver = null,Object? updateStatus = null,}) {
  return _then(_ReportDetailPageState(
detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as AsyncValue<ReportDetail>,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<StatusHistoryEntry>>,timeline: null == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<TimelineStep>>,isResolver: null == isResolver ? _self.isResolver : isResolver // ignore: cast_nullable_to_non_nullable
as AsyncValue<bool>,updateStatus: null == updateStatus ? _self.updateStatus : updateStatus // ignore: cast_nullable_to_non_nullable
as AsyncValue<ReportDetail?>,
  ));
}


}

// dart format on
