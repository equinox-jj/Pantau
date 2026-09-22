// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queue_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QueueListState {

 List<QueueReport> get items; QueueCounts get counts; bool get hasNext; bool get isLoadingMore;/// Set when the most recent [QueueNotifier.loadMore] page failed. Cleared
/// as soon as another [QueueNotifier.loadMore] attempt starts.
 bool get loadMoreFailed;
/// Create a copy of QueueListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueListStateCopyWith<QueueListState> get copyWith => _$QueueListStateCopyWithImpl<QueueListState>(this as QueueListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueListState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.counts, counts) || other.counts == counts)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.loadMoreFailed, loadMoreFailed) || other.loadMoreFailed == loadMoreFailed));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),counts,hasNext,isLoadingMore,loadMoreFailed);

@override
String toString() {
  return 'QueueListState(items: $items, counts: $counts, hasNext: $hasNext, isLoadingMore: $isLoadingMore, loadMoreFailed: $loadMoreFailed)';
}


}

/// @nodoc
abstract mixin class $QueueListStateCopyWith<$Res>  {
  factory $QueueListStateCopyWith(QueueListState value, $Res Function(QueueListState) _then) = _$QueueListStateCopyWithImpl;
@useResult
$Res call({
 List<QueueReport> items, QueueCounts counts, bool hasNext, bool isLoadingMore, bool loadMoreFailed
});




}
/// @nodoc
class _$QueueListStateCopyWithImpl<$Res>
    implements $QueueListStateCopyWith<$Res> {
  _$QueueListStateCopyWithImpl(this._self, this._then);

  final QueueListState _self;
  final $Res Function(QueueListState) _then;

/// Create a copy of QueueListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? counts = null,Object? hasNext = null,Object? isLoadingMore = null,Object? loadMoreFailed = null,}) {
  return _then(QueueListState(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<QueueReport>,counts: null == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as QueueCounts,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,loadMoreFailed: null == loadMoreFailed ? _self.loadMoreFailed : loadMoreFailed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [QueueListState].
extension QueueListStatePatterns on QueueListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueueListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueueListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueueListState value)  $default,){
final _that = this;
switch (_that) {
case _QueueListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueueListState value)?  $default,){
final _that = this;
switch (_that) {
case _QueueListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<QueueReport> items,  QueueCounts counts,  bool hasNext,  bool isLoadingMore,  bool loadMoreFailed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueListState() when $default != null:
return $default(_that.items,_that.counts,_that.hasNext,_that.isLoadingMore,_that.loadMoreFailed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<QueueReport> items,  QueueCounts counts,  bool hasNext,  bool isLoadingMore,  bool loadMoreFailed)  $default,) {final _that = this;
switch (_that) {
case _QueueListState():
return $default(_that.items,_that.counts,_that.hasNext,_that.isLoadingMore,_that.loadMoreFailed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<QueueReport> items,  QueueCounts counts,  bool hasNext,  bool isLoadingMore,  bool loadMoreFailed)?  $default,) {final _that = this;
switch (_that) {
case _QueueListState() when $default != null:
return $default(_that.items,_that.counts,_that.hasNext,_that.isLoadingMore,_that.loadMoreFailed);case _:
  return null;

}
}

}

/// @nodoc


class _QueueListState implements QueueListState {
  const _QueueListState({required  List<QueueReport> items, required this.counts, required this.hasNext, this.isLoadingMore = false, this.loadMoreFailed = false}): _items = items;
  

 final  List<QueueReport> _items;
@override List<QueueReport> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  QueueCounts counts;
@override final  bool hasNext;
@override@JsonKey() final  bool isLoadingMore;
/// Set when the most recent [QueueNotifier.loadMore] page failed. Cleared
/// as soon as another [QueueNotifier.loadMore] attempt starts.
@override@JsonKey() final  bool loadMoreFailed;

/// Create a copy of QueueListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueueListStateCopyWith<_QueueListState> get copyWith => __$QueueListStateCopyWithImpl<_QueueListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueListState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.counts, counts) || other.counts == counts)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.loadMoreFailed, loadMoreFailed) || other.loadMoreFailed == loadMoreFailed));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),counts,hasNext,isLoadingMore,loadMoreFailed);

@override
String toString() {
  return 'QueueListState(items: $items, counts: $counts, hasNext: $hasNext, isLoadingMore: $isLoadingMore, loadMoreFailed: $loadMoreFailed)';
}


}

/// @nodoc
abstract mixin class _$QueueListStateCopyWith<$Res> implements $QueueListStateCopyWith<$Res> {
  factory _$QueueListStateCopyWith(_QueueListState value, $Res Function(_QueueListState) _then) = __$QueueListStateCopyWithImpl;
@override @useResult
$Res call({
 List<QueueReport> items, QueueCounts counts, bool hasNext, bool isLoadingMore, bool loadMoreFailed
});




}
/// @nodoc
class __$QueueListStateCopyWithImpl<$Res>
    implements _$QueueListStateCopyWith<$Res> {
  __$QueueListStateCopyWithImpl(this._self, this._then);

  final _QueueListState _self;
  final $Res Function(_QueueListState) _then;

/// Create a copy of QueueListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? counts = null,Object? hasNext = null,Object? isLoadingMore = null,Object? loadMoreFailed = null,}) {
  return _then(_QueueListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<QueueReport>,counts: null == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as QueueCounts,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,loadMoreFailed: null == loadMoreFailed ? _self.loadMoreFailed : loadMoreFailed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$QueuePageState {

 QueueTab get tab;/// Starts loading rather than empty: the page locates on mount, so an
/// empty list before the first response would render as "nothing here".
 AsyncValue<QueueListState> get queue;
/// Create a copy of QueuePageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueuePageStateCopyWith<QueuePageState> get copyWith => _$QueuePageStateCopyWithImpl<QueuePageState>(this as QueuePageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueuePageState&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.queue, queue) || other.queue == queue));
}


@override
int get hashCode => Object.hash(runtimeType,tab,queue);

@override
String toString() {
  return 'QueuePageState(tab: $tab, queue: $queue)';
}


}

/// @nodoc
abstract mixin class $QueuePageStateCopyWith<$Res>  {
  factory $QueuePageStateCopyWith(QueuePageState value, $Res Function(QueuePageState) _then) = _$QueuePageStateCopyWithImpl;
@useResult
$Res call({
 QueueTab tab, AsyncValue<QueueListState> queue
});




}
/// @nodoc
class _$QueuePageStateCopyWithImpl<$Res>
    implements $QueuePageStateCopyWith<$Res> {
  _$QueuePageStateCopyWithImpl(this._self, this._then);

  final QueuePageState _self;
  final $Res Function(QueuePageState) _then;

/// Create a copy of QueuePageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tab = null,Object? queue = null,}) {
  return _then(QueuePageState(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as QueueTab,queue: null == queue ? _self.queue : queue // ignore: cast_nullable_to_non_nullable
as AsyncValue<QueueListState>,
  ));
}

}


/// Adds pattern-matching-related methods to [QueuePageState].
extension QueuePageStatePatterns on QueuePageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueuePageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueuePageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueuePageState value)  $default,){
final _that = this;
switch (_that) {
case _QueuePageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueuePageState value)?  $default,){
final _that = this;
switch (_that) {
case _QueuePageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( QueueTab tab,  AsyncValue<QueueListState> queue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueuePageState() when $default != null:
return $default(_that.tab,_that.queue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( QueueTab tab,  AsyncValue<QueueListState> queue)  $default,) {final _that = this;
switch (_that) {
case _QueuePageState():
return $default(_that.tab,_that.queue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( QueueTab tab,  AsyncValue<QueueListState> queue)?  $default,) {final _that = this;
switch (_that) {
case _QueuePageState() when $default != null:
return $default(_that.tab,_that.queue);case _:
  return null;

}
}

}

/// @nodoc


class _QueuePageState implements QueuePageState {
  const _QueuePageState({this.tab = QueueTab.open, this.queue = const AsyncLoading()});
  

@override@JsonKey() final  QueueTab tab;
/// Starts loading rather than empty: the page locates on mount, so an
/// empty list before the first response would render as "nothing here".
@override@JsonKey() final  AsyncValue<QueueListState> queue;

/// Create a copy of QueuePageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueuePageStateCopyWith<_QueuePageState> get copyWith => __$QueuePageStateCopyWithImpl<_QueuePageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueuePageState&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.queue, queue) || other.queue == queue));
}


@override
int get hashCode => Object.hash(runtimeType,tab,queue);

@override
String toString() {
  return 'QueuePageState(tab: $tab, queue: $queue)';
}


}

/// @nodoc
abstract mixin class _$QueuePageStateCopyWith<$Res> implements $QueuePageStateCopyWith<$Res> {
  factory _$QueuePageStateCopyWith(_QueuePageState value, $Res Function(_QueuePageState) _then) = __$QueuePageStateCopyWithImpl;
@override @useResult
$Res call({
 QueueTab tab, AsyncValue<QueueListState> queue
});




}
/// @nodoc
class __$QueuePageStateCopyWithImpl<$Res>
    implements _$QueuePageStateCopyWith<$Res> {
  __$QueuePageStateCopyWithImpl(this._self, this._then);

  final _QueuePageState _self;
  final $Res Function(_QueuePageState) _then;

/// Create a copy of QueuePageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tab = null,Object? queue = null,}) {
  return _then(_QueuePageState(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as QueueTab,queue: null == queue ? _self.queue : queue // ignore: cast_nullable_to_non_nullable
as AsyncValue<QueueListState>,
  ));
}


}

// dart format on
