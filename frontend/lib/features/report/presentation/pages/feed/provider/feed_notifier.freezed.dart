// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeedPageState {

 FeedTab get tab; AsyncValue<LocationResult?> get location;/// Starts loading rather than empty: the page locates on mount, so an
/// empty list before the first response would render as "nothing
/// nearby".
 AsyncValue<List<FeedItem>> get nearbyReports;
/// Create a copy of FeedPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedPageStateCopyWith<FeedPageState> get copyWith => _$FeedPageStateCopyWithImpl<FeedPageState>(this as FeedPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedPageState&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.location, location) || other.location == location)&&(identical(other.nearbyReports, nearbyReports) || other.nearbyReports == nearbyReports));
}


@override
int get hashCode => Object.hash(runtimeType,tab,location,nearbyReports);

@override
String toString() {
  return 'FeedPageState(tab: $tab, location: $location, nearbyReports: $nearbyReports)';
}


}

/// @nodoc
abstract mixin class $FeedPageStateCopyWith<$Res>  {
  factory $FeedPageStateCopyWith(FeedPageState value, $Res Function(FeedPageState) _then) = _$FeedPageStateCopyWithImpl;
@useResult
$Res call({
 FeedTab tab, AsyncValue<LocationResult?> location, AsyncValue<List<FeedItem>> nearbyReports
});




}
/// @nodoc
class _$FeedPageStateCopyWithImpl<$Res>
    implements $FeedPageStateCopyWith<$Res> {
  _$FeedPageStateCopyWithImpl(this._self, this._then);

  final FeedPageState _self;
  final $Res Function(FeedPageState) _then;

/// Create a copy of FeedPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tab = null,Object? location = null,Object? nearbyReports = null,}) {
  return _then(FeedPageState(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as FeedTab,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as AsyncValue<LocationResult?>,nearbyReports: null == nearbyReports ? _self.nearbyReports : nearbyReports // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<FeedItem>>,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedPageState].
extension FeedPageStatePatterns on FeedPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedPageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedPageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedPageState value)  $default,){
final _that = this;
switch (_that) {
case _FeedPageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedPageState value)?  $default,){
final _that = this;
switch (_that) {
case _FeedPageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FeedTab tab,  AsyncValue<LocationResult?> location,  AsyncValue<List<FeedItem>> nearbyReports)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedPageState() when $default != null:
return $default(_that.tab,_that.location,_that.nearbyReports);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FeedTab tab,  AsyncValue<LocationResult?> location,  AsyncValue<List<FeedItem>> nearbyReports)  $default,) {final _that = this;
switch (_that) {
case _FeedPageState():
return $default(_that.tab,_that.location,_that.nearbyReports);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FeedTab tab,  AsyncValue<LocationResult?> location,  AsyncValue<List<FeedItem>> nearbyReports)?  $default,) {final _that = this;
switch (_that) {
case _FeedPageState() when $default != null:
return $default(_that.tab,_that.location,_that.nearbyReports);case _:
  return null;

}
}

}

/// @nodoc


class _FeedPageState implements FeedPageState {
  const _FeedPageState({this.tab = FeedTab.nearby, this.location = const AsyncData(null), this.nearbyReports = const AsyncLoading()});
  

@override@JsonKey() final  FeedTab tab;
@override@JsonKey() final  AsyncValue<LocationResult?> location;
/// Starts loading rather than empty: the page locates on mount, so an
/// empty list before the first response would render as "nothing
/// nearby".
@override@JsonKey() final  AsyncValue<List<FeedItem>> nearbyReports;

/// Create a copy of FeedPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedPageStateCopyWith<_FeedPageState> get copyWith => __$FeedPageStateCopyWithImpl<_FeedPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedPageState&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.location, location) || other.location == location)&&(identical(other.nearbyReports, nearbyReports) || other.nearbyReports == nearbyReports));
}


@override
int get hashCode => Object.hash(runtimeType,tab,location,nearbyReports);

@override
String toString() {
  return 'FeedPageState(tab: $tab, location: $location, nearbyReports: $nearbyReports)';
}


}

/// @nodoc
abstract mixin class _$FeedPageStateCopyWith<$Res> implements $FeedPageStateCopyWith<$Res> {
  factory _$FeedPageStateCopyWith(_FeedPageState value, $Res Function(_FeedPageState) _then) = __$FeedPageStateCopyWithImpl;
@override @useResult
$Res call({
 FeedTab tab, AsyncValue<LocationResult?> location, AsyncValue<List<FeedItem>> nearbyReports
});




}
/// @nodoc
class __$FeedPageStateCopyWithImpl<$Res>
    implements _$FeedPageStateCopyWith<$Res> {
  __$FeedPageStateCopyWithImpl(this._self, this._then);

  final _FeedPageState _self;
  final $Res Function(_FeedPageState) _then;

/// Create a copy of FeedPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tab = null,Object? location = null,Object? nearbyReports = null,}) {
  return _then(_FeedPageState(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as FeedTab,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as AsyncValue<LocationResult?>,nearbyReports: null == nearbyReports ? _self.nearbyReports : nearbyReports // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<FeedItem>>,
  ));
}


}

// dart format on
