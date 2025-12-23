import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/about_card.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/components/work_history_card.dart';

// By using the @client annotation this component will be automatically compiled to javascript and mounted
// on the client. Therefore:
// - this file and any imported file must be compilable for both server and client environments.
// - this component and any child components will be built once on the server during pre-rendering and then
//   again on the client during normal rendering.
@client
class About extends StatelessComponent {
  const About({super.key});

  @override
  Component build(BuildContext context) {
    return const section(classes: 'container is-max-desktop section', [
      div(classes: 'block', [
        h1(classes: 'title is-1', [.text('About')]),
      ]),
      AboutCard(),
      Spacer(.xl),
      h3(classes: 'title is-3', [.text('Hobbies')]),
      Spacer(.xl),
      h3(classes: 'title is-3', [.text('Employment History')]),
      WorkHistoryCard(
        imageUrl:
            'https://media.licdn.com/dms/image/v2/C4E0BAQHDjoZb9lfYSQ/company-logo_200_200/company-logo_200_200/0/1630565853140/centegix_logo?e=1767830400&v=beta&t=JY4r2iHUxdMKvka7RsqMGOdj-FslFW-6AVfi2Hw2WTU',

        jobtTitle: 'Centegix - Senior Software Engineer',
        tenure: 'Feb 2025 - Present',
        tasks: [
          'Implemented Shorebird for over-the-air Flutter app updates, enabling instant bug fixes and feature deployments without app store review delays.',
          'Migrated state management architecture from Riverpod to BLoC, improving code organization, testability, and team development workflow.',
        ],
        technologies: ['Flutter', 'BLoC', 'Shorebird'],
      ),
      WorkHistoryCard(
        imageUrl:
            'https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_nologo/5730547/5730547-1590173145033-8bf96f6a1f189.jpg',

        jobtTitle: 'KidStrong - Software Engineer',
        tenure: 'May 2023 - Sept 2024',
        tasks: [
          'Developed the mobile application using Flutter, creating '
              'intuitive and visually appealing user interfaces across '
              'both Android and iOS platforms.',
          'Implemented robust and efficient CI/CD pipelines using '
              'GitHub Actions and Codemagic to automate the software '
              'delivery process.',
        ],
        technologies: ['Riverpod', 'Github Actions', 'Codemagic'],
      ),
      WorkHistoryCard(
        imageUrl:
            'https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_nologo/5730547/5730547-1590173145033-8bf96f6a1f189.jpg',

        jobtTitle: 'KidStrong - Software Engineer',
        tenure: 'May 2023 - Sept 2024',
        tasks: [
          'Developed the mobile application using Flutter, creating '
              'intuitive and visually appealing user interfaces across '
              'both Android and iOS platforms.',
          'Implemented robust and efficient CI/CD pipelines using '
              'GitHub Actions and Codemagic to automate the software '
              'delivery process.',
        ],
        technologies: ['Riverpod', 'Github Actions', 'Codemagic'],
      ),
    ]);
  }

  @css
  static List<StyleRule> get styles => [];
}
