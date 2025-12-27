part of 'footer.dart';

class SocialButtons extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return div(id: 'social-buttons', classes: 'buttons container is-centered is-max-desktop', [
      _SocialButton(url: 'https://github.com/trey-a-hope/', icon: 'github'),
      _SocialButton(url: 'https://x.com/trey_codes', icon: 'x-twitter'),
      _SocialButton(url: 'https://www.linkedin.com/in/trey-hope-69a3a774/', icon: 'linkedin'),
      _SocialButton(url: 'https://www.youtube.com/@TreyHope', icon: 'youtube'),
      _SocialButton(url: 'https://www.tiktok.com/@trey_codes', icon: 'tiktok'),
    ]);
  }
}

class _SocialButton extends StatelessComponent {
  const _SocialButton({required this.url, required this.icon});

  final String url;
  final String icon;

  @override
  Component build(BuildContext context) => SmartLink(
    href: url,
    classes: 'button is-dark',
    children: [
      span(classes: 'icon', [
        i(classes: 'fab fa-$icon', []),
      ]),
    ],
  );
}
