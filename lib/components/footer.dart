import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

part 'social_button.dart';
part 'footer_sentence.dart';

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'footer', [
      FooterSentence(),
      div(classes: 'center-container button-row', [
        SocialButton(url: 'https://github.com/trey-a-hope/', icon: 'github'),
        SocialButton(url: 'https://x.com/trey_codes', icon: 'x-twitter'),
        SocialButton(url: 'https://www.linkedin.com/in/trey-hope-69a3a774/', icon: 'linkedin'),
        SocialButton(url: 'https://www.youtube.com/@TreyHope', icon: 'youtube'),
        SocialButton(url: 'https://www.tiktok.com/@trey_codes', icon: 'tiktok'),
      ]),
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
