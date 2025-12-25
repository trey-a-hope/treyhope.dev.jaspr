import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:treyhope_dev/constants/globals.dart';
import 'package:treyhope_dev/dtos/blog.dart';

/// State model for the blog list, tracking current page and blogs
class BlogListState extends Equatable {
  final int currentIndex;
  final List<Blog> blogs;

  BlogListState({
    this.currentIndex = 0,
    this.blogs = const [],
  });

  @override
  List<Object?> get props => [currentIndex, blogs];
}

/// Notifier for managing blog list state and pagination
class BlogListNotifier extends AsyncNotifier<BlogListState> {
  @override
  FutureOr<BlogListState> build() async => BlogListState(
    blogs: await _fetch(),
  );

  /// Fetches a paginated list of blogs based on current index
  Future<List<Blog>> _fetch({int currentIndex = 0}) async {
    print('currentIndex: $currentIndex');
    final List<Blog> blogs = [];

    final indexInList = currentIndex * Globals.blogPaginationCount;

    for (int i = indexInList; i < indexInList + Globals.blogPaginationCount && i < Globals.totalBlogCount; i++) {
      // TODO (Trey) - Fetch blog at position i.
      blogs.add(Blog(title: 'This is blog number ${i + 1}'));
    }

    return blogs;
  }

  /// Navigate to the next page of blogs
  void nextBatch() async {
    state = AsyncValue.loading();

    print('nextBatch called');
    final currentIndex = state.value!.currentIndex;
    final blogs = await _fetch(currentIndex: currentIndex + 1);

    state = AsyncValue.data(
      BlogListState(
        currentIndex: currentIndex + 1,
        blogs: blogs,
      ),
    );
  }

  /// Navigate to the previous page of blogs
  void prevBatch() async {
    state = AsyncValue.loading();

    print('prevBatch called');
    final currentIndex = state.value!.currentIndex;
    final blogs = await _fetch(currentIndex: currentIndex - 1);

    state = AsyncValue.data(
      BlogListState(
        currentIndex: currentIndex - 1,
        blogs: blogs,
      ),
    );
  }

  /// Jump to a specific page of blogs
  void goToPage(int page) async {
    state = AsyncValue.loading();

    print('goToPage called');
    final currentIndex = page;

    state = AsyncValue.data(
      BlogListState(
        currentIndex: currentIndex,
        blogs: await _fetch(currentIndex: currentIndex),
      ),
    );
  }
}
