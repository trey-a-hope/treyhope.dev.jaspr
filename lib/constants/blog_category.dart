enum BlogCategory {
  all('All', label: 'all', description: 'Every blog post'),
  coffeeCode(
    'Coffee & Code',
    description:
        'Recent progress I\'ve made on various projects. Quick reads about Flutter, APIs,  and much more, all while enjoying a cup of Joe.',
    label: 'coffee-code',
  ),
  crashCourse(
    'Crash Courses',
    description:
        'Extensive tutorials curated by yours truly. Teaching you a wide variety of mobile/web development topics.',
    label: 'crash-course',
  )
  ;

  const BlogCategory(this.name, {required this.description, required this.label});

  final String name;
  final String description;
  final String label;
}
