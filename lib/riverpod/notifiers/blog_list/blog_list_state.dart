/// State model for the blog list, tracking current page and blogs
part of 'blog_list_notifier.dart';

class BlogListState extends Equatable {
  final int currentIndex;
  final List<Blog> paginatedBlogs;
  final int totalBlogCount;

  BlogListState({
    this.currentIndex = 0,
    this.paginatedBlogs = const [],
    this.totalBlogCount = 0,
  });

  BlogListState copyWith({
    int? currentIndex,
    List<Blog>? paginatedBlogs,
    int? totalBlogCount,
  }) {
    return BlogListState(
      currentIndex: currentIndex ?? this.currentIndex,
      paginatedBlogs: paginatedBlogs ?? this.paginatedBlogs,
      totalBlogCount: totalBlogCount ?? this.totalBlogCount,
    );
  }

  @override
  List<Object?> get props => [currentIndex, paginatedBlogs];
}
