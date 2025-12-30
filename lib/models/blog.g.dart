// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Blog _$BlogFromJson(Map<String, dynamic> json) => _Blog(
  author: json['author'] as String,
  category: json['category'] as String,
  content: json['content'] as String,
  coverImage: json['coverImage'] as String,
  date: DateTime.parse(json['date'] as String),
  description: json['description'] as String,
  slug: json['slug'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  title: json['title'] as String,
);

Map<String, dynamic> _$BlogToJson(_Blog instance) => <String, dynamic>{
  'author': instance.author,
  'category': instance.category,
  'content': instance.content,
  'coverImage': instance.coverImage,
  'date': instance.date.toIso8601String(),
  'description': instance.description,
  'slug': instance.slug,
  'tags': instance.tags,
  'title': instance.title,
};
