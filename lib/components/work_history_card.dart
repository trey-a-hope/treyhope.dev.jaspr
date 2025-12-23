import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/spacer.dart';

class WorkHistoryCard extends StatelessComponent {
  final String imageUrl; // Add this
  final String jobtTitle;
  final String tenure;
  final List<String> tasks;
  final List<String> technologies;

  const WorkHistoryCard({
    required this.imageUrl, // Add this
    required this.jobtTitle,
    required this.tenure,
    required this.tasks,
    required this.technologies,
    super.key,
  });

  @override
  Component build(BuildContext context) {
    return div(classes: 'card', [
      div(classes: 'card-content', [
        div(classes: 'content', [
          div(classes: 'media', [
            div(classes: 'media-left', [
              figure(classes: 'image is-48x48', [
                img(
                  src: imageUrl,
                  alt: jobtTitle,
                ),
              ]),
            ]),
            div(classes: 'media-content', [
              p(classes: 'title is-4', [
                .text(jobtTitle),
              ]),
              p(classes: 'subtitle is-6', [
                .text(tenure),
              ]),
            ]),
          ]),
          hr(),
          ul([
            for (final task in tasks)
              li([
                .text(task),
              ]),
          ]),
          Spacer(.md),
          div(classes: 'work-history-card-technologies', [
            for (final technology in technologies)
              span(classes: 'tag is-link is-normal', [
                .text(technology),
              ]),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.work-history-card-technologies').styles(
      display: Display.flex,
      gap: Gap(column: 1.rem),
    ),
  ];
}
