import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/bulma_message_body.dart';
import 'package:treyhope_dev/components/bulma_hero.dart';
import 'package:treyhope_dev/components/button_group.dart';
import 'package:treyhope_dev/components/project_card.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/constants/globals.dart';
import 'package:treyhope_dev/dtos/project_data.dart';

/// Projects page that displays a filterable portfolio of mobile, web, and desktop projects
class Projects extends StatefulComponent {
  const Projects({super.key});

  @override
  State createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  var projectType = ProjectType.web;

  @override
  Component build(BuildContext context) {
    return div(classes: 'container is-max-desktop', [
      BulmaHero(title: 'Projects', subtitle: 'Where code meets creativity.'),

      section(classes: 'container is-max-desktop section', [
        div(classes: 'block', [
          p([
            .text(
              'Each project represents a unique challenge and an opportunity to push my skills further. From web applications to creative experiments, I focus on building solutions that are both functional and meaningful.',
            ),
          ]),
        ]),
        div(classes: 'block', [
          p([
            .text(
              'My work spans across various domains—full-stack development, mobile apps, educational tools, and creative experiments that blend technology with art. Every project teaches me something new and fuels my passion for creating impactful software.',
            ),
          ]),
        ]),

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
        BulmaMessageBody(
          body:
              'Want to collaborate or have a project idea? I\'m always open to connecting with fellow developers and creatives.',
          color: 'is-warning',
        ),
      ]),
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
        h4(classes: 'title is-4 has-text-centered', [.text('Mobile')]),
        p(classes: 'has-text-centered', [.text('Native experiences in your pocket')]),
      ]),
      ProjectType.web => div(classes: 'block', [
        h4(classes: 'title is-4 has-text-centered', [.text('Web')]),
        p(classes: 'has-text-centered', [.text('Browser-based solutions, accessible anywhere')]),
      ]),
      ProjectType.desktop => div(classes: 'block', [
        h4(classes: 'title is-4 has-text-centered', [.text('Desktop')]),
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
    return div(classes: 'columns is-multiline is-mobile', [
      // Add is-mobile
      // Display project cards in a responsive grid
      for (final project in Globals.projects.where((p) => p.type == projectType))
        div(classes: 'column is-12-mobile is-6-tablet is-4-desktop', [
          // Responsive columns
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
