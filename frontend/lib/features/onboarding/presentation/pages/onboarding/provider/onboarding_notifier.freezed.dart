// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingPageState {

 int get index;/// Best-effort persistence of "onboarding seen". Navigation proceeds even
/// on failure — worst case the user sees onboarding again.
 AsyncValue<bool> get completion;
/// Create a copy of OnboardingPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingPageStateCopyWith<OnboardingPageState> get copyWith => _$OnboardingPageStateCopyWithImpl<OnboardingPageState>(this as OnboardingPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingPageState&&(identical(other.index, index) || other.index == index)&&(identical(other.completion, completion) || other.completion == completion));
}


@override
int get hashCode => Object.hash(runtimeType,index,completion);

@override
String toString() {
  return 'OnboardingPageState(index: $index, completion: $completion)';
}


}

/// @nodoc
abstract mixin class $OnboardingPageStateCopyWith<$Res>  {
  factory $OnboardingPageStateCopyWith(OnboardingPageState value, $Res Function(OnboardingPageState) _then) = _$OnboardingPageStateCopyWithImpl;
@useResult
$Res call({
 int index, AsyncValue<bool> completion
});




}
/// @nodoc
class _$OnboardingPageStateCopyWithImpl<$Res>
    implements $OnboardingPageStateCopyWith<$Res> {
  _$OnboardingPageStateCopyWithImpl(this._self, this._then);

  final OnboardingPageState _self;
  final $Res Function(OnboardingPageState) _then;

/// Create a copy of OnboardingPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? completion = null,}) {
  return _then(OnboardingPageState(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,completion: null == completion ? _self.completion : completion // ignore: cast_nullable_to_non_nullable
as AsyncValue<bool>,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingPageState].
extension OnboardingPageStatePatterns on OnboardingPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingPageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingPageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingPageState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingPageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingPageState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingPageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int index,  AsyncValue<bool> completion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingPageState() when $default != null:
return $default(_that.index,_that.completion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int index,  AsyncValue<bool> completion)  $default,) {final _that = this;
switch (_that) {
case _OnboardingPageState():
return $default(_that.index,_that.completion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int index,  AsyncValue<bool> completion)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingPageState() when $default != null:
return $default(_that.index,_that.completion);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingPageState implements OnboardingPageState {
  const _OnboardingPageState({this.index = 0, this.completion = const AsyncData(false)});
  

@override@JsonKey() final  int index;
/// Best-effort persistence of "onboarding seen". Navigation proceeds even
/// on failure — worst case the user sees onboarding again.
@override@JsonKey() final  AsyncValue<bool> completion;

/// Create a copy of OnboardingPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingPageStateCopyWith<_OnboardingPageState> get copyWith => __$OnboardingPageStateCopyWithImpl<_OnboardingPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingPageState&&(identical(other.index, index) || other.index == index)&&(identical(other.completion, completion) || other.completion == completion));
}


@override
int get hashCode => Object.hash(runtimeType,index,completion);

@override
String toString() {
  return 'OnboardingPageState(index: $index, completion: $completion)';
}


}

/// @nodoc
abstract mixin class _$OnboardingPageStateCopyWith<$Res> implements $OnboardingPageStateCopyWith<$Res> {
  factory _$OnboardingPageStateCopyWith(_OnboardingPageState value, $Res Function(_OnboardingPageState) _then) = __$OnboardingPageStateCopyWithImpl;
@override @useResult
$Res call({
 int index, AsyncValue<bool> completion
});




}
/// @nodoc
class __$OnboardingPageStateCopyWithImpl<$Res>
    implements _$OnboardingPageStateCopyWith<$Res> {
  __$OnboardingPageStateCopyWithImpl(this._self, this._then);

  final _OnboardingPageState _self;
  final $Res Function(_OnboardingPageState) _then;

/// Create a copy of OnboardingPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? completion = null,}) {
  return _then(_OnboardingPageState(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,completion: null == completion ? _self.completion : completion // ignore: cast_nullable_to_non_nullable
as AsyncValue<bool>,
  ));
}


}

// dart format on
