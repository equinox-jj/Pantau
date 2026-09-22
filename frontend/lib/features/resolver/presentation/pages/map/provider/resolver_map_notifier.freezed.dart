// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resolver_map_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResolverMapPageState {

/// Independent of `QueueNotifier`'s tab — switching tabs on the map never
/// changes what the Queue page shows next, and vice versa. Defaults to
/// the actionable "open" bucket.
 QueueTab get tab;/// One-shot fetch, no pagination — re-locating or switching tabs is the
/// only refresh trigger.
 AsyncValue<QueueResult> get reports;/// The report whose preview card is showing, or null when none is
/// selected. Set by a marker tap, replaced by the next marker tap,
/// cleared when the active tab changes (the previous selection may not
/// even be in the new tab's result set).
 QueueReport? get selectedReport;/// Results of the place-search field above the map.
///
/// `null` means the panel is closed — distinct from `AsyncData([])`,
/// which means "searched, found nothing".
 AsyncValue<List<Place>>? get placeSearch;/// The place the resolver jumped to, marked with a pin on the map.
///
/// Separate from [placeSearch] for lifetime: the result list dies with
/// the panel, the pin stays until the search field is cleared.
 Place? get searchedPlace;
/// Create a copy of ResolverMapPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResolverMapPageStateCopyWith<ResolverMapPageState> get copyWith => _$ResolverMapPageStateCopyWithImpl<ResolverMapPageState>(this as ResolverMapPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResolverMapPageState&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.reports, reports) || other.reports == reports)&&(identical(other.selectedReport, selectedReport) || other.selectedReport == selectedReport)&&(identical(other.placeSearch, placeSearch) || other.placeSearch == placeSearch)&&(identical(other.searchedPlace, searchedPlace) || other.searchedPlace == searchedPlace));
}


@override
int get hashCode => Object.hash(runtimeType,tab,reports,selectedReport,placeSearch,searchedPlace);

@override
String toString() {
  return 'ResolverMapPageState(tab: $tab, reports: $reports, selectedReport: $selectedReport, placeSearch: $placeSearch, searchedPlace: $searchedPlace)';
}


}

/// @nodoc
abstract mixin class $ResolverMapPageStateCopyWith<$Res>  {
  factory $ResolverMapPageStateCopyWith(ResolverMapPageState value, $Res Function(ResolverMapPageState) _then) = _$ResolverMapPageStateCopyWithImpl;
@useResult
$Res call({
 QueueTab tab, AsyncValue<QueueResult> reports, QueueReport? selectedReport, AsyncValue<List<Place>>? placeSearch, Place? searchedPlace
});


$PlaceCopyWith<$Res>? get searchedPlace;

}
/// @nodoc
class _$ResolverMapPageStateCopyWithImpl<$Res>
    implements $ResolverMapPageStateCopyWith<$Res> {
  _$ResolverMapPageStateCopyWithImpl(this._self, this._then);

  final ResolverMapPageState _self;
  final $Res Function(ResolverMapPageState) _then;

/// Create a copy of ResolverMapPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tab = null,Object? reports = null,Object? selectedReport = freezed,Object? placeSearch = freezed,Object? searchedPlace = freezed,}) {
  return _then(ResolverMapPageState(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as QueueTab,reports: null == reports ? _self.reports : reports // ignore: cast_nullable_to_non_nullable
as AsyncValue<QueueResult>,selectedReport: freezed == selectedReport ? _self.selectedReport : selectedReport // ignore: cast_nullable_to_non_nullable
as QueueReport?,placeSearch: freezed == placeSearch ? _self.placeSearch : placeSearch // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<Place>>?,searchedPlace: freezed == searchedPlace ? _self.searchedPlace : searchedPlace // ignore: cast_nullable_to_non_nullable
as Place?,
  ));
}
/// Create a copy of ResolverMapPageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaceCopyWith<$Res>? get searchedPlace {
    if (_self.searchedPlace == null) {
    return null;
  }

  return $PlaceCopyWith<$Res>(_self.searchedPlace!, (value) {
    return _then(_self.copyWith(searchedPlace: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResolverMapPageState].
extension ResolverMapPageStatePatterns on ResolverMapPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResolverMapPageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResolverMapPageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResolverMapPageState value)  $default,){
final _that = this;
switch (_that) {
case _ResolverMapPageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResolverMapPageState value)?  $default,){
final _that = this;
switch (_that) {
case _ResolverMapPageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( QueueTab tab,  AsyncValue<QueueResult> reports,  QueueReport? selectedReport,  AsyncValue<List<Place>>? placeSearch,  Place? searchedPlace)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResolverMapPageState() when $default != null:
return $default(_that.tab,_that.reports,_that.selectedReport,_that.placeSearch,_that.searchedPlace);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( QueueTab tab,  AsyncValue<QueueResult> reports,  QueueReport? selectedReport,  AsyncValue<List<Place>>? placeSearch,  Place? searchedPlace)  $default,) {final _that = this;
switch (_that) {
case _ResolverMapPageState():
return $default(_that.tab,_that.reports,_that.selectedReport,_that.placeSearch,_that.searchedPlace);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( QueueTab tab,  AsyncValue<QueueResult> reports,  QueueReport? selectedReport,  AsyncValue<List<Place>>? placeSearch,  Place? searchedPlace)?  $default,) {final _that = this;
switch (_that) {
case _ResolverMapPageState() when $default != null:
return $default(_that.tab,_that.reports,_that.selectedReport,_that.placeSearch,_that.searchedPlace);case _:
  return null;

}
}

}

/// @nodoc


class _ResolverMapPageState implements ResolverMapPageState {
  const _ResolverMapPageState({this.tab = QueueTab.open, this.reports = const AsyncLoading(), this.selectedReport, this.placeSearch, this.searchedPlace});
  

/// Independent of `QueueNotifier`'s tab — switching tabs on the map never
/// changes what the Queue page shows next, and vice versa. Defaults to
/// the actionable "open" bucket.
@override@JsonKey() final  QueueTab tab;
/// One-shot fetch, no pagination — re-locating or switching tabs is the
/// only refresh trigger.
@override@JsonKey() final  AsyncValue<QueueResult> reports;
/// The report whose preview card is showing, or null when none is
/// selected. Set by a marker tap, replaced by the next marker tap,
/// cleared when the active tab changes (the previous selection may not
/// even be in the new tab's result set).
@override final  QueueReport? selectedReport;
/// Results of the place-search field above the map.
///
/// `null` means the panel is closed — distinct from `AsyncData([])`,
/// which means "searched, found nothing".
@override final  AsyncValue<List<Place>>? placeSearch;
/// The place the resolver jumped to, marked with a pin on the map.
///
/// Separate from [placeSearch] for lifetime: the result list dies with
/// the panel, the pin stays until the search field is cleared.
@override final  Place? searchedPlace;

/// Create a copy of ResolverMapPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResolverMapPageStateCopyWith<_ResolverMapPageState> get copyWith => __$ResolverMapPageStateCopyWithImpl<_ResolverMapPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResolverMapPageState&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.reports, reports) || other.reports == reports)&&(identical(other.selectedReport, selectedReport) || other.selectedReport == selectedReport)&&(identical(other.placeSearch, placeSearch) || other.placeSearch == placeSearch)&&(identical(other.searchedPlace, searchedPlace) || other.searchedPlace == searchedPlace));
}


@override
int get hashCode => Object.hash(runtimeType,tab,reports,selectedReport,placeSearch,searchedPlace);

@override
String toString() {
  return 'ResolverMapPageState(tab: $tab, reports: $reports, selectedReport: $selectedReport, placeSearch: $placeSearch, searchedPlace: $searchedPlace)';
}


}

/// @nodoc
abstract mixin class _$ResolverMapPageStateCopyWith<$Res> implements $ResolverMapPageStateCopyWith<$Res> {
  factory _$ResolverMapPageStateCopyWith(_ResolverMapPageState value, $Res Function(_ResolverMapPageState) _then) = __$ResolverMapPageStateCopyWithImpl;
@override @useResult
$Res call({
 QueueTab tab, AsyncValue<QueueResult> reports, QueueReport? selectedReport, AsyncValue<List<Place>>? placeSearch, Place? searchedPlace
});


@override $PlaceCopyWith<$Res>? get searchedPlace;

}
/// @nodoc
class __$ResolverMapPageStateCopyWithImpl<$Res>
    implements _$ResolverMapPageStateCopyWith<$Res> {
  __$ResolverMapPageStateCopyWithImpl(this._self, this._then);

  final _ResolverMapPageState _self;
  final $Res Function(_ResolverMapPageState) _then;

/// Create a copy of ResolverMapPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tab = null,Object? reports = null,Object? selectedReport = freezed,Object? placeSearch = freezed,Object? searchedPlace = freezed,}) {
  return _then(_ResolverMapPageState(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as QueueTab,reports: null == reports ? _self.reports : reports // ignore: cast_nullable_to_non_nullable
as AsyncValue<QueueResult>,selectedReport: freezed == selectedReport ? _self.selectedReport : selectedReport // ignore: cast_nullable_to_non_nullable
as QueueReport?,placeSearch: freezed == placeSearch ? _self.placeSearch : placeSearch // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<Place>>?,searchedPlace: freezed == searchedPlace ? _self.searchedPlace : searchedPlace // ignore: cast_nullable_to_non_nullable
as Place?,
  ));
}

/// Create a copy of ResolverMapPageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaceCopyWith<$Res>? get searchedPlace {
    if (_self.searchedPlace == null) {
    return null;
  }

  return $PlaceCopyWith<$Res>(_self.searchedPlace!, (value) {
    return _then(_self.copyWith(searchedPlace: value));
  });
}
}

// dart format on
