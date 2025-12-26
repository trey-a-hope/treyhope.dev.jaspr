/// State model for the blog list, tracking current page and blogs
part of 'blog_list_notifier.dart';

class BlogListState extends Equatable {
  final int currentIndex;
  final List<Blog> blogs;

  BlogListState({
    this.currentIndex = 0,
    this.blogs = const [],
  });

  @override
  List<Object?> get props => [currentIndex, blogs];

  // Add JSON serialization
  Map<String, dynamic> toJson() => {
    'currentIndex': currentIndex,
    'blogs': blogs.map((b) => b.toJson()).toList(),
  };

  factory BlogListState.fromJson(Map<String, dynamic> json) => BlogListState(
    currentIndex: json['currentIndex'] as int,
    blogs: (json['blogs'] as List).map((b) => Blog.fromJson(b as Map<String, dynamic>)).toList(),
  );
}
