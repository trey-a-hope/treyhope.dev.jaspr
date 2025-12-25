class Blog {
  final String title;
  final String slug;
  final DateTime date;
  final String author;
  final List<String> tags;
  final String excerpt;
  final String content;

  Blog({
    required this.title,
    required this.slug,
    required this.date,
    this.author = '',
    this.tags = const [],
    this.excerpt = '',
    required this.content,
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'slug': slug,
    'date': date.toIso8601String(),
    'author': author,
    'tags': tags,
    'excerpt': excerpt,
    'content': content,
  };

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
    title: json['title'] as String,
    slug: json['slug'] as String,
    date: DateTime.parse(json['date'] as String),
    author: json['author'] as String,
    tags: List<String>.from(json['tags'] as List),
    excerpt: json['excerpt'] as String,
    content: json['content'] as String,
  );
}
