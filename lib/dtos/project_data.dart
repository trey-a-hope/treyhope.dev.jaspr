class ProjectData {
  final String imageUrl;
  final String title;
  final String description;
  final List<String> technologies;
  final String githubUrl;
  final String demoUrl;
  final ProjectType type;

  const ProjectData({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.technologies,
    required this.githubUrl,
    required this.demoUrl,
    required this.type,
  });
}

enum ProjectType { web, desktop, mobile }
