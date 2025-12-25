import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/bulma_card.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/dtos/work_history_data.dart';

class WorkHistoryCard extends StatelessComponent {
  final WorkHistoryData data;

  const WorkHistoryCard({
    required this.data,
    super.key,
  });

  @override
  Component build(BuildContext context) {
    return BulmaCard(
      children: [
        div(classes: 'card-content', [
          div(classes: 'content', [
            div(classes: 'media', [
              div(classes: 'media-left', [
                figure(classes: 'image is-48x48', [
                  img(
                    src: data.imageUrl,
                    alt: data.jobtTitle,
                    styles: Styles(radius: BorderRadius.circular(8.px)),
                  ),
                ]),
              ]),
              div(classes: 'media-content', [
                p(classes: 'title is-4', [
                  .text(data.jobtTitle),
                ]),
                p(classes: 'subtitle is-6', [
                  .text(data.tenure),
                ]),
              ]),
            ]),
            hr(),
            ul([
              for (final task in data.tasks)
                li([
                  .text(task),
                ]),
            ]),
            Spacer(.md),
            div(classes: 'work-history-card-technologies', [
              for (final technology in data.technologies)
                span(classes: 'tag is-link is-normal', [
                  .text(technology),
                ]),
            ]),
          ]),
        ]),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.work-history-card-technologies').styles(
      display: Display.flex,
      gap: Gap(column: 1.rem),
    ),
  ];
}
