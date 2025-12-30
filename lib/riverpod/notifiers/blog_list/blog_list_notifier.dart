import 'package:equatable/equatable.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:treyhope_dev/constants/blog_category.dart';
import 'package:treyhope_dev/constants/globals.dart';
import 'package:treyhope_dev/models/blog.dart';
import 'package:treyhope_dev/riverpod/providers.dart';

part 'blog_list_state.dart';

/// Notifier for managing blog list state and pagination
class BlogListNotifier extends Notifier<BlogListState> {
  BlogListNotifier(this.tag);
  final String tag;

  @override
  BlogListState build() {
    // Keep provider alive to preserve state when navigating away and back
    ref.keepAlive();

    // Watch category changes to trigger rebuild when filter changes
    ref.watch(blogCategoryProvider); // maybe need to remove this for the tag filter

    final blogs = _getBlogs();

    // Initialize with first page of blogs
    return BlogListState(
      currentIndex: 0,
      paginatedBlogs: _getPaginatedBlogs(
        pageIndex: 0,
        blogs: blogs,
      ),
      totalBlogCount: blogs.length,
    );
  }

  List<Blog> _getBlogs() {
    final blogCategory = ref.read(blogCategoryProvider);

    List<Blog> blogs = [];
    if (tag == 'default') {
      // Filter blogs by category or show all
      blogs = blogCategory == BlogCategory.all
          ? Globals.allBlogs
          : Globals.allBlogs.where((blog) => blog.category == blogCategory.label).toList();
    } else {
      blogs = Globals.allBlogs.where((blog) => blog.tags.contains(tag)).toList();
    }

    return blogs;
  }

  /// Retrieves a page of blogs filtered by the current category.
  List<Blog> _getPaginatedBlogs({required int pageIndex, required List<Blog> blogs}) {
    if (blogs.isEmpty) return [];

    // Calculate pagination range
    final start = pageIndex * Globals.blogPaginationCount;
    final end = (start + Globals.blogPaginationCount).clamp(0, blogs.length);

    return blogs.sublist(start, end);
  }

  /// Navigates to the next page of blogs.
  void nextBatch() {
    final blogs = _getBlogs();

    state = state.copyWith(
      currentIndex: state.currentIndex + 1,
      paginatedBlogs: _getPaginatedBlogs(
        pageIndex: state.currentIndex + 1,
        blogs: blogs,
      ),
    );
  }

  /// Navigates to the previous page of blogs.
  void prevBatch() {
    final blogs = _getBlogs();

    state = state.copyWith(
      currentIndex: state.currentIndex - 1,
      paginatedBlogs: _getPaginatedBlogs(
        pageIndex: state.currentIndex - 1,
        blogs: blogs,
      ),
    );
  }

  /// Navigates to a specific page of blogs.
  void goToPage(int page) {
    final blogs = _getBlogs();

    state = state.copyWith(
      currentIndex: page,
      paginatedBlogs: _getPaginatedBlogs(
        pageIndex: page,
        blogs: blogs,
      ),
    );
  }
}
