import 'package:treyhope_dev/dtos/project_data.dart';
import 'package:treyhope_dev/dtos/work_history_data.dart';

class Globals {
  Globals._();

  static const desktopBreakpoint = 1024;

  static const workHistories = [
    WorkHistoryData(
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
    WorkHistoryData(
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
    WorkHistoryData(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReHRJ8VGH7RIRE7wSB68EWrUkORvNAjgfTyA&s',
      jobtTitle: 'ADP - Flutter Developer',
      tenure: 'Jul 2022 - Mar 2023',
      tasks: [
        'Implemented comprehensive widget tests for all newly '
            'developed components.',
        'Converted the login system from '
            'WebView to native Flutter implementation.',
      ],
      technologies: ['Widget Testing', 'Web Views', 'Pigeon'],
    ),
    WorkHistoryData(
      imageUrl:
          'https://play-lh.googleusercontent.com/LHG2-WpCWh_OOtEW803NRpCLg3vIXmxsZIKY7yZjvrvrYjS8jdNLyNj7vqpTtPywI78',

      jobtTitle: 'Float Me - Flutter Developer',
      tenure: 'Jan 2022 - Jul 2022',
      tasks: [
        'Implemented new features/bug fixes for the FloatMe mobile '
            'application using Flutter.',
        'Managed the admin website for the internal team using React '
            'and Typescript.',
      ],
      technologies: ['React', 'GetX', 'Plaid'],
    ),
    WorkHistoryData(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnRgB1-nS2HTSQ-_XeBmM7tXImWYWT2P-Ecg&s',

      jobtTitle: 'Best Version Media - Flutter Developer',
      tenure: 'Dec 2020 - Jan 2022',
      tasks: [
        'Worked on bug fixes/improvements using the Dart programming '
            'language in Flutter.',
        'Developed RESTful request methods via Javascript to interact '
            'with MySQL and MongoDB databases that contain client '
            'information for the mobile app.',
      ],
      technologies: ['MongoDB', 'Dio', 'Javascript'],
    ),
  ];

  static const projects = [
    ProjectData(
      imageUrl: 'assets/assets/images/screenshot_gift_grab.jpg',
      title: 'Gift Grab',
      description: 'Santa collects gifts in this festive Flutter Flame arcade game.',
      technologies: [
        'Bloc',
        'Nakama',
        'Fluo',
      ],
      githubUrl: 'https://github.com/trey-a-hope/gift_grab_client',
      demoUrl: 'https://giftgrab.codemagic.app',
      type: ProjectType.web,
    ),
    ProjectData(
      imageUrl: 'assets/assets/images/screenshot_my_cool_game.jpg',
      title: 'My Cool Game',
      description: 'A 2D side scrolling game that follows a Dwarf Warrior on this RPG style quest.',
      technologies: [
        'Riverpod',
        'Bonfire',
        'Sprite Fusion',
      ],
      githubUrl: 'https://github.com/trey-a-hope/my-cool-game',
      demoUrl: 'https://my-cool-game.codemagic.app/',
      type: ProjectType.web,
    ),
  ];
}
