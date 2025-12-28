import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:treyhope_dev/constants/blog_category.dart';
import 'package:treyhope_dev/riverpod/providers.dart';

/// Dropdown selector for filtering blog posts by category.
class BlogCategorySelector extends StatelessComponent {
  const BlogCategorySelector({
    super.key,
  });

  @override
  Component build(BuildContext context) {
    return div(classes: 'has-text-centered', [
      div(classes: 'select', [
        select(
          onChange: (selections) => _onChange(
            context,
            selections: selections,
          ),
          [
            for (int i = 0; i < BlogCategory.values.length; i++)
              option(attributes: {'value': BlogCategory.values[i].label}, [.text(BlogCategory.values[i].name)]),
          ],
        ),
      ]),
    ]);
  }

  /// Handles dropdown selection change and updates the blog category filter.
  void _onChange(BuildContext context, {required List<String> selections}) {
    final selection = selections.first;
    print('Dropdown selected: $selection');

    // Find matching category enum from the selected label
    final blogCategoryNotifier = context.read(blogCategoryProvider.notifier);
    final matchedCategory = BlogCategory.values.firstWhere(
      (element) => element.label == selection,
      orElse: () => BlogCategory.all,
    );

    print('Setting category to: $matchedCategory');
    blogCategoryNotifier.setCategory(matchedCategory);

    print('Current category after set: ${context.read(blogCategoryProvider)}');
  }
}
