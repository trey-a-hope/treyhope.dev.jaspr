import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog.freezed.dart';
part 'blog.g.dart';

@freezed
sealed class Blog with _$Blog {
  const factory Blog({
    required String author,
    required String category,
    required String content,
    required DateTime date,
    required String description,
    required String slug,
    required List<String> tags,
    required String title,
  }) = _Blog;

  factory Blog.fromJson(Map<String, dynamic> data) => _$BlogFromJson(data);
}
