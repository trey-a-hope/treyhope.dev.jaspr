import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:treyhope_dev/constants/blog_category.dart';

/// Notifier that manages the currently selected blog category for filtering.
class BlogCategoryNotifier extends Notifier<BlogCategory> {
  @override
  BlogCategory build() {
    // Keep the state alive across page navigations
    ref.keepAlive();

    // Default to showing all blog posts
    return BlogCategory.all;
  }

  /// Updates the selected blog category.
  void setCategory(BlogCategory category) => state = category;
}
