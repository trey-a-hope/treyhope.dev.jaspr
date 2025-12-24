import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/button_group.dart';
import 'package:treyhope_dev/components/project_card.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/constants/globals.dart';
import 'package:treyhope_dev/dtos/project_data.dart';

/// Projects page that displays a filterable portfolio of mobile, web, and desktop projects
@client
class Projects extends StatefulComponent {
  const Projects({super.key});

  @override
  State createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  /// Currently selected project type filter (defaults to mobile)
  var projectType = ProjectType.mobile;

  @override
  Component build(BuildContext context) {
    return section(classes: 'container is-max-desktop section', [
      div(classes: 'block', [
        h1(classes: 'title is-1', [.text('Projects')]),
      ]),
      // Filter buttons to switch between project types
      ButtonGroup(
        isAttached: true,
        children: [
          Button(
            child: IconLabel(icon: 'mobile', label: 'Mobile'),
            onPressed: () => setState(() => projectType = ProjectType.mobile),
          ),
          Button(
            child: IconLabel(icon: 'window-maximize', label: 'Web'),
            onPressed: () => setState(() => projectType = ProjectType.web),
          ),
          Button(
            child: IconLabel(icon: 'desktop', label: 'Desktop'),
            onPressed: () => setState(() => projectType = ProjectType.desktop),
          ),
        ],
      ),
      Spacer(.xl),
      _TitleWithSubtitle(projectType: projectType),
      _ProjectList(projectType: projectType),
    ]);
  }
}

/// Displays the title and subtitle for the currently selected project type
class _TitleWithSubtitle extends StatelessComponent {
  final ProjectType projectType;

  const _TitleWithSubtitle({required this.projectType});

  @override
  Component build(BuildContext context) {
    return switch (projectType) {
      ProjectType.mobile => div(classes: 'block', [
        h3(classes: 'title is-3 has-text-centered', [.text('Mobile')]),
        p(classes: 'has-text-centered', [.text('Native experiences in your pocket')]),
      ]),
      ProjectType.web => div(classes: 'block', [
        h3(classes: 'title is-3 has-text-centered', [.text('Web')]),
        p(classes: 'has-text-centered', [.text('Browser-based solutions, accessible anywhere')]),
      ]),
      ProjectType.desktop => div(classes: 'block', [
        h3(classes: 'title is-3 has-text-centered', [.text('Desktop')]),
        p(classes: 'has-text-centered', [.text('Powerful native applications for productivity')]),
      ]),
    };
  }
}

/// Renders a grid of project cards filtered by the selected project type
class _ProjectList extends StatelessComponent {
  final ProjectType projectType;
  final List<ProjectData> projects;

  _ProjectList({required this.projectType}) : projects = Globals.projects.where((p) => p.type == projectType).toList();

  @override
  Component build(BuildContext context) {
    return div(classes: 'columns is-multiline', [
      // Display project cards in a responsive grid
      for (final project in Globals.projects.where((p) => p.type == projectType))
        div(classes: 'column is-one-third', [
          ProjectCard(data: project),
        ]),

      // Show message when no projects match the filter
      if (projects.isEmpty)
        div(classes: 'block', [
          p(classes: 'has-text-centered', [.text('No projects found')]),
        ]),
    ]);
  }
}
