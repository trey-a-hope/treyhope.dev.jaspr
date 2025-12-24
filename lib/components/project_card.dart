import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/dtos/project_data.dart';

class ProjectCard extends StatelessComponent {
  final ProjectData data;

  const ProjectCard({required this.data, super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'card', [
      // Large hero image at the top
      div(classes: 'card-image', [
        figure(classes: 'image', [
          img(
            src: data.imageUrl,
            alt: data.title,
          ),
        ]),
      ]),

      // Content section
      div(classes: 'card-content', [
        // Project title and description
        div(classes: 'content', [
          p(classes: 'title is-4', [.text(data.title)]),
          p([.text(data.description)]),
        ]),

        // Technology badges
        div(classes: 'tags', [
          for (var tech in data.technologies) span(classes: 'tag is-link', [.text(tech)]),
        ]),
      ]),

      // Footer with buttons (styled like your original)
      footer(classes: 'card-footer', [
        div(classes: 'card-footer-item', [
          div(classes: 'buttons', [
            a(
              classes: 'button is-dark',
              href: data.githubUrl,

              [
                span(classes: 'icon', [i(classes: 'fab fa-github', [])]),
                span([.text('GitHub')]),
              ],
            ),
            a(
              classes: 'button is-link',
              href: data.demoUrl,

              [
                span(classes: 'icon', [i(classes: 'fas fa-external-link-alt', [])]),
                span([.text('Demo')]),
              ],
            ),
          ]),
        ]),
      ]),
    ]);
  }
}
