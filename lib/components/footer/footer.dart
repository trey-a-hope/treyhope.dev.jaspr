import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:treyhope_dev/components/spacer.dart';

part 'social_button.dart';
part 'footer_sentence.dart';

/// Footer component displaying social links and framework badges
class Footer extends StatelessComponent {
  static const String _jasprHref = 'https://jaspr.site/';
  static const String _bulmaHref = 'https://bulma.io';

  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'footer has-text-centered', [
      // Social media links
      SocialButtons(),
      Spacer(.md),
      // Framework badges row
      div(classes: 'button-row', [
        Link(
          target: Target.blank,
          to: _jasprHref,
          child: JasprBadge.lightTwoTone(),
        ),
        Spacer(.sm),
        Link(
          target: Target.blank,
          to: _bulmaHref,
          child: img(
            src: 'https://bulma.io/assets/images/made-with-bulma.png',
            alt: 'Made with Bulma',
            attributes: {'width': '150'},
          ),
        ),
      ]),
    ]);
  }

  /// Styles for footer layout and appearance
  static List<StyleRule> get styles => [
    css('.button-row', [
      css('&').styles(
        display: .flex,
        justifyContent: .center,
        gap: Gap.column(1.em),
      ),
    ]),
    css('footer', [
      css('&').styles(
        width: 100.percent,
        margin: .only(top: 2.rem),
        border: Border.only(
          top: BorderSide(color: const Color('#1a2942'), width: 1.px),
        ),
        backgroundColor: const Color('#0a1628'), // Push footer to bottom if using flexbox on body
      ),
      css('.footer-content', [
        css('&').styles(
          display: .flex,
          maxWidth: 1400.px,
          padding: .symmetric(horizontal: 3.em, vertical: 1.5.em),
          margin: .inherit,
          justifyContent: .spaceBetween,
          alignItems: .center,
        ),
      ]),
    ]),
  ];
}
