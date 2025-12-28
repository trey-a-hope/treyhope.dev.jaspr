import 'package:equatable/equatable.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:treyhope_dev/constants/blog_category.dart';
import 'package:treyhope_dev/constants/globals.dart';
import 'package:treyhope_dev/models/blog.dart';
import 'package:treyhope_dev/riverpod/providers.dart';

part 'blog_list_state.dart';

/// Notifier for managing blog list state and pagination
class BlogListNotifier extends Notifier<BlogListState> {
  @override
  BlogListState build() {
    // Keep state alive across page navigations
    ref.keepAlive();

    // Watch category changes to trigger rebuild when filter changes
    ref.watch(blogCategoryProvider);

    // Initialize with first page of blogs
    return BlogListState(
      currentIndex: 0,
      blogs: _getPage(0),
    );
  }

  /// Retrieves a page of blogs filtered by the current category.
  List<Blog> _getPage(int pageIndex) {
    final blogCategory = ref.read(blogCategoryProvider);

    // Filter blogs by category or show all
    final blogs = blogCategory == BlogCategory.all
        ? Globals.allBlogs
        : Globals.allBlogs.where((blog) => blog.category == blogCategory.label).toList();

    if (blogs.isEmpty) return [];

    // Calculate pagination range
    final start = pageIndex * Globals.blogPaginationCount;
    final end = (start + Globals.blogPaginationCount).clamp(0, blogs.length);

    return blogs.sublist(start, end);
  }

  /// Navigates to the next page of blogs.
  void nextBatch() {
    state = BlogListState(
      currentIndex: state.currentIndex + 1,
      blogs: _getPage(state.currentIndex + 1),
    );
  }

  /// Navigates to the previous page of blogs.
  void prevBatch() {
    state = BlogListState(
      currentIndex: state.currentIndex - 1,
      blogs: _getPage(state.currentIndex - 1),
    );
  }

  /// Navigates to a specific page of blogs.
  void goToPage(int page) {
    state = BlogListState(
      currentIndex: page,
      blogs: _getPage(page),
    );
  }
}
