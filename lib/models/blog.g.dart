// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Blog _$BlogFromJson(Map<String, dynamic> json) => _Blog(
  title: json['title'] as String,
  slug: json['slug'] as String,
  date: DateTime.parse(json['date'] as String),
  author: json['author'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  excerpt: json['excerpt'] as String,
  content: json['content'] as String,
);

Map<String, dynamic> _$BlogToJson(_Blog instance) => <String, dynamic>{
  'title': instance.title,
  'slug': instance.slug,
  'date': instance.date.toIso8601String(),
  'author': instance.author,
  'tags': instance.tags,
  'excerpt': instance.excerpt,
  'content': instance.content,
};
