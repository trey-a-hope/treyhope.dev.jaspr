import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:treyhope_dev/constants/blog_category.dart';
import 'package:treyhope_dev/riverpod/notifiers/blog_category.dart/blog_category_notifier.dart';
import 'package:treyhope_dev/riverpod/notifiers/blog_list/blog_list_notifier.dart';

/// Manages the blog list state including pagination and filtering.
final blogListProvider = NotifierProvider.autoDispose<BlogListNotifier, BlogListState>(
  BlogListNotifier.new,
);

/// Manages the currently selected blog category filter.
final blogCategoryProvider = NotifierProvider.autoDispose<BlogCategoryNotifier, BlogCategory>(
  BlogCategoryNotifier.new,
);
