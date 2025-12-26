// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Blog {

 String get author; String get content; dynamic get coverImage; DateTime get date; String get excerpt; String get slug; List<String> get tags; String get title;
/// Create a copy of Blog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlogCopyWith<Blog> get copyWith => _$BlogCopyWithImpl<Blog>(this as Blog, _$identity);

  /// Serializes this Blog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Blog&&(identical(other.author, author) || other.author == author)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.coverImage, coverImage)&&(identical(other.date, date) || other.date == date)&&(identical(other.excerpt, excerpt) || other.excerpt == excerpt)&&(identical(other.slug, slug) || other.slug == slug)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,author,content,const DeepCollectionEquality().hash(coverImage),date,excerpt,slug,const DeepCollectionEquality().hash(tags),title);

@override
String toString() {
  return 'Blog(author: $author, content: $content, coverImage: $coverImage, date: $date, excerpt: $excerpt, slug: $slug, tags: $tags, title: $title)';
}


}

/// @nodoc
abstract mixin class $BlogCopyWith<$Res>  {
  factory $BlogCopyWith(Blog value, $Res Function(Blog) _then) = _$BlogCopyWithImpl;
@useResult
$Res call({
 String author, String content, dynamic coverImage, DateTime date, String excerpt, String slug, List<String> tags, String title
});




}
/// @nodoc
class _$BlogCopyWithImpl<$Res>
    implements $BlogCopyWith<$Res> {
  _$BlogCopyWithImpl(this._self, this._then);

  final Blog _self;
  final $Res Function(Blog) _then;

/// Create a copy of Blog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? author = null,Object? content = null,Object? coverImage = freezed,Object? date = null,Object? excerpt = null,Object? slug = null,Object? tags = null,Object? title = null,}) {
  return _then(_self.copyWith(
author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as dynamic,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,excerpt: null == excerpt ? _self.excerpt : excerpt // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Blog].
extension BlogPatterns on Blog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Blog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Blog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Blog value)  $default,){
final _that = this;
switch (_that) {
case _Blog():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Blog value)?  $default,){
final _that = this;
switch (_that) {
case _Blog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String author,  String content,  dynamic coverImage,  DateTime date,  String excerpt,  String slug,  List<String> tags,  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Blog() when $default != null:
return $default(_that.author,_that.content,_that.coverImage,_that.date,_that.excerpt,_that.slug,_that.tags,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String author,  String content,  dynamic coverImage,  DateTime date,  String excerpt,  String slug,  List<String> tags,  String title)  $default,) {final _that = this;
switch (_that) {
case _Blog():
return $default(_that.author,_that.content,_that.coverImage,_that.date,_that.excerpt,_that.slug,_that.tags,_that.title);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String author,  String content,  dynamic coverImage,  DateTime date,  String excerpt,  String slug,  List<String> tags,  String title)?  $default,) {final _that = this;
switch (_that) {
case _Blog() when $default != null:
return $default(_that.author,_that.content,_that.coverImage,_that.date,_that.excerpt,_that.slug,_that.tags,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Blog implements Blog {
  const _Blog({required this.author, required this.content, required this.coverImage, required this.date, required this.excerpt, required this.slug, required final  List<String> tags, required this.title}): _tags = tags;
  factory _Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);

@override final  String author;
@override final  String content;
@override final  dynamic coverImage;
@override final  DateTime date;
@override final  String excerpt;
@override final  String slug;
 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  String title;

/// Create a copy of Blog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlogCopyWith<_Blog> get copyWith => __$BlogCopyWithImpl<_Blog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BlogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Blog&&(identical(other.author, author) || other.author == author)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.coverImage, coverImage)&&(identical(other.date, date) || other.date == date)&&(identical(other.excerpt, excerpt) || other.excerpt == excerpt)&&(identical(other.slug, slug) || other.slug == slug)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,author,content,const DeepCollectionEquality().hash(coverImage),date,excerpt,slug,const DeepCollectionEquality().hash(_tags),title);

@override
String toString() {
  return 'Blog(author: $author, content: $content, coverImage: $coverImage, date: $date, excerpt: $excerpt, slug: $slug, tags: $tags, title: $title)';
}


}

/// @nodoc
abstract mixin class _$BlogCopyWith<$Res> implements $BlogCopyWith<$Res> {
  factory _$BlogCopyWith(_Blog value, $Res Function(_Blog) _then) = __$BlogCopyWithImpl;
@override @useResult
$Res call({
 String author, String content, dynamic coverImage, DateTime date, String excerpt, String slug, List<String> tags, String title
});




}
/// @nodoc
class __$BlogCopyWithImpl<$Res>
    implements _$BlogCopyWith<$Res> {
  __$BlogCopyWithImpl(this._self, this._then);

  final _Blog _self;
  final $Res Function(_Blog) _then;

/// Create a copy of Blog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? author = null,Object? content = null,Object? coverImage = freezed,Object? date = null,Object? excerpt = null,Object? slug = null,Object? tags = null,Object? title = null,}) {
  return _then(_Blog(
author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as dynamic,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,excerpt: null == excerpt ? _self.excerpt : excerpt // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
