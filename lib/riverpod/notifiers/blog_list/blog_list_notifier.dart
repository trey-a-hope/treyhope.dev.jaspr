import 'package:equatable/equatable.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:treyhope_dev/constants/globals.dart';
import 'package:treyhope_dev/models/blog.dart';

part 'blog_list_state.dart';

/// Notifier for managing blog list state and pagination
class BlogListNotifier extends Notifier<BlogListState> {
  @override
  BlogListState build() {
    ref.keepAlive();

    return BlogListState(
      blogs: _getPage(0),
    );
  }

  List<Blog> _getPage(int pageIndex) {
    if (Globals.allBlogs.isEmpty) return [];

    final start = pageIndex * Globals.blogPaginationCount;
    final end = (start + Globals.blogPaginationCount).clamp(0, Globals.allBlogs.length);

    return Globals.allBlogs.sublist(start, end);
  }

  void nextBatch() {
    state = BlogListState(
      currentIndex: state.currentIndex + 1,
      blogs: _getPage(state.currentIndex + 1),
    );
  }

  void prevBatch() {
    state = BlogListState(
      currentIndex: state.currentIndex - 1,
      blogs: _getPage(state.currentIndex - 1),
    );
  }

  void goToPage(int page) {
    state = BlogListState(
      currentIndex: page,
      blogs: _getPage(page),
    );
  }
}
