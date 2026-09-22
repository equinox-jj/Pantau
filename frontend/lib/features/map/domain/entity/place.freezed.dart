// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Place {

 String get id; String get name; String get address; double get latitude; double get longitude;
/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceCopyWith<Place> get copyWith => _$PlaceCopyWithImpl<Place>(this as Place, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Place&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,address,latitude,longitude);

@override
String toString() {
  return 'Place(id: $id, name: $name, address: $address, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $PlaceCopyWith<$Res>  {
  factory $PlaceCopyWith(Place value, $Res Function(Place) _then) = _$PlaceCopyWithImpl;
@useResult
$Res call({
 String id, String name, String address, double latitude, double longitude
});




}
/// @nodoc
class _$PlaceCopyWithImpl<$Res>
    implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._self, this._then);

  final Place _self;
  final $Res Function(Place) _then;

/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = null,Object? latitude = null,Object? longitude = null,}) {
  return _then(Place(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Place].
extension PlacePatterns on Place {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Place value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Place() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Place value)  $default,){
final _that = this;
switch (_that) {
case _Place():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Place value)?  $default,){
final _that = this;
switch (_that) {
case _Place() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String address,  double latitude,  double longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Place() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String address,  double latitude,  double longitude)  $default,) {final _that = this;
switch (_that) {
case _Place():
return $default(_that.id,_that.name,_that.address,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String address,  double latitude,  double longitude)?  $default,) {final _that = this;
switch (_that) {
case _Place() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc


class _Place implements Place {
  const _Place({required this.id, required this.name, required this.address, required this.latitude, required this.longitude});
  

@override final  String id;
@override final  String name;
@override final  String address;
@override final  double latitude;
@override final  double longitude;

/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceCopyWith<_Place> get copyWith => __$PlaceCopyWithImpl<_Place>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Place&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,address,latitude,longitude);

@override
String toString() {
  return 'Place(id: $id, name: $name, address: $address, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$PlaceCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$PlaceCopyWith(_Place value, $Res Function(_Place) _then) = __$PlaceCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String address, double latitude, double longitude
});




}
/// @nodoc
class __$PlaceCopyWithImpl<$Res>
    implements _$PlaceCopyWith<$Res> {
  __$PlaceCopyWithImpl(this._self, this._then);

  final _Place _self;
  final $Res Function(_Place) _then;

/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = null,Object? latitude = null,Object? longitude = null,}) {
  return _then(_Place(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$PlaceViewBox {

 double get minLatitude; double get minLongitude; double get maxLatitude; double get maxLongitude;
/// Create a copy of PlaceViewBox
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceViewBoxCopyWith<PlaceViewBox> get copyWith => _$PlaceViewBoxCopyWithImpl<PlaceViewBox>(this as PlaceViewBox, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceViewBox&&(identical(other.minLatitude, minLatitude) || other.minLatitude == minLatitude)&&(identical(other.minLongitude, minLongitude) || other.minLongitude == minLongitude)&&(identical(other.maxLatitude, maxLatitude) || other.maxLatitude == maxLatitude)&&(identical(other.maxLongitude, maxLongitude) || other.maxLongitude == maxLongitude));
}


@override
int get hashCode => Object.hash(runtimeType,minLatitude,minLongitude,maxLatitude,maxLongitude);

@override
String toString() {
  return 'PlaceViewBox(minLatitude: $minLatitude, minLongitude: $minLongitude, maxLatitude: $maxLatitude, maxLongitude: $maxLongitude)';
}


}

/// @nodoc
abstract mixin class $PlaceViewBoxCopyWith<$Res>  {
  factory $PlaceViewBoxCopyWith(PlaceViewBox value, $Res Function(PlaceViewBox) _then) = _$PlaceViewBoxCopyWithImpl;
@useResult
$Res call({
 double minLatitude, double minLongitude, double maxLatitude, double maxLongitude
});




}
/// @nodoc
class _$PlaceViewBoxCopyWithImpl<$Res>
    implements $PlaceViewBoxCopyWith<$Res> {
  _$PlaceViewBoxCopyWithImpl(this._self, this._then);

  final PlaceViewBox _self;
  final $Res Function(PlaceViewBox) _then;

/// Create a copy of PlaceViewBox
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minLatitude = null,Object? minLongitude = null,Object? maxLatitude = null,Object? maxLongitude = null,}) {
  return _then(PlaceViewBox(
minLatitude: null == minLatitude ? _self.minLatitude : minLatitude // ignore: cast_nullable_to_non_nullable
as double,minLongitude: null == minLongitude ? _self.minLongitude : minLongitude // ignore: cast_nullable_to_non_nullable
as double,maxLatitude: null == maxLatitude ? _self.maxLatitude : maxLatitude // ignore: cast_nullable_to_non_nullable
as double,maxLongitude: null == maxLongitude ? _self.maxLongitude : maxLongitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaceViewBox].
extension PlaceViewBoxPatterns on PlaceViewBox {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaceViewBox value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaceViewBox() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaceViewBox value)  $default,){
final _that = this;
switch (_that) {
case _PlaceViewBox():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaceViewBox value)?  $default,){
final _that = this;
switch (_that) {
case _PlaceViewBox() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double minLatitude,  double minLongitude,  double maxLatitude,  double maxLongitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaceViewBox() when $default != null:
return $default(_that.minLatitude,_that.minLongitude,_that.maxLatitude,_that.maxLongitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double minLatitude,  double minLongitude,  double maxLatitude,  double maxLongitude)  $default,) {final _that = this;
switch (_that) {
case _PlaceViewBox():
return $default(_that.minLatitude,_that.minLongitude,_that.maxLatitude,_that.maxLongitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double minLatitude,  double minLongitude,  double maxLatitude,  double maxLongitude)?  $default,) {final _that = this;
switch (_that) {
case _PlaceViewBox() when $default != null:
return $default(_that.minLatitude,_that.minLongitude,_that.maxLatitude,_that.maxLongitude);case _:
  return null;

}
}

}

/// @nodoc


class _PlaceViewBox implements PlaceViewBox {
  const _PlaceViewBox({required this.minLatitude, required this.minLongitude, required this.maxLatitude, required this.maxLongitude});
  

@override final  double minLatitude;
@override final  double minLongitude;
@override final  double maxLatitude;
@override final  double maxLongitude;

/// Create a copy of PlaceViewBox
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceViewBoxCopyWith<_PlaceViewBox> get copyWith => __$PlaceViewBoxCopyWithImpl<_PlaceViewBox>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceViewBox&&(identical(other.minLatitude, minLatitude) || other.minLatitude == minLatitude)&&(identical(other.minLongitude, minLongitude) || other.minLongitude == minLongitude)&&(identical(other.maxLatitude, maxLatitude) || other.maxLatitude == maxLatitude)&&(identical(other.maxLongitude, maxLongitude) || other.maxLongitude == maxLongitude));
}


@override
int get hashCode => Object.hash(runtimeType,minLatitude,minLongitude,maxLatitude,maxLongitude);

@override
String toString() {
  return 'PlaceViewBox(minLatitude: $minLatitude, minLongitude: $minLongitude, maxLatitude: $maxLatitude, maxLongitude: $maxLongitude)';
}


}

/// @nodoc
abstract mixin class _$PlaceViewBoxCopyWith<$Res> implements $PlaceViewBoxCopyWith<$Res> {
  factory _$PlaceViewBoxCopyWith(_PlaceViewBox value, $Res Function(_PlaceViewBox) _then) = __$PlaceViewBoxCopyWithImpl;
@override @useResult
$Res call({
 double minLatitude, double minLongitude, double maxLatitude, double maxLongitude
});




}
/// @nodoc
class __$PlaceViewBoxCopyWithImpl<$Res>
    implements _$PlaceViewBoxCopyWith<$Res> {
  __$PlaceViewBoxCopyWithImpl(this._self, this._then);

  final _PlaceViewBox _self;
  final $Res Function(_PlaceViewBox) _then;

/// Create a copy of PlaceViewBox
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minLatitude = null,Object? minLongitude = null,Object? maxLatitude = null,Object? maxLongitude = null,}) {
  return _then(_PlaceViewBox(
minLatitude: null == minLatitude ? _self.minLatitude : minLatitude // ignore: cast_nullable_to_non_nullable
as double,minLongitude: null == minLongitude ? _self.minLongitude : minLongitude // ignore: cast_nullable_to_non_nullable
as double,maxLatitude: null == maxLatitude ? _self.maxLatitude : maxLatitude // ignore: cast_nullable_to_non_nullable
as double,maxLongitude: null == maxLongitude ? _self.maxLongitude : maxLongitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
