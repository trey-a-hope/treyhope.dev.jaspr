import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:treyhope_dev/components/spacer.dart';

part 'social_button.dart';
part 'footer_sentence.dart';

class Footer extends StatelessComponent {
  static const String _jasprHref = 'https://jaspr.site/';

  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'footer has-text-centered', [
      FooterSentence(),
      SocialButtons(),
      Spacer(.lg),
      Link(target: Target.blank, to: _jasprHref, child: JasprBadge.lightTwoTone()),
    ]);
  }

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
