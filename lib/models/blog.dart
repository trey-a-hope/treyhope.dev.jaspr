import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog.freezed.dart';
part 'blog.g.dart';

@freezed
sealed class Blog with _$Blog {
  const factory Blog({
    required String title,
    required String slug,
    required DateTime date,
    required String author,
    required List<String> tags,
    required String excerpt,
    required String content,
  }) = _Blog;

  factory Blog.fromJson(Map<String, dynamic> data) => _$BlogFromJson(data);
}
