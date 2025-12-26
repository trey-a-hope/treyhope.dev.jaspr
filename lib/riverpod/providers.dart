import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:treyhope_dev/riverpod/notifiers/blog_list/blog_list_notifier.dart';

final blogListProvider = NotifierProvider.autoDispose<BlogListNotifier, BlogListState>(
  BlogListNotifier.new,
);
