part of 'footer.dart';

class SocialButton extends StatelessComponent {
  const SocialButton({required this.url, required this.icon});

  final String url;
  final String icon;

  @override
  Component build(BuildContext context) => Link(
    target: Target.blank,
    to: url,
    child: button(classes: 'button is-dark', [
      span(classes: 'icon', [
        i(classes: 'fab fa-$icon', []),
      ]),
    ]),
  );
}
