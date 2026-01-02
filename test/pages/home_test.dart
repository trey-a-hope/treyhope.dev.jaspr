import 'package:jaspr/jaspr.dart';
import 'package:jaspr_test/jaspr_test.dart';
import 'package:treyhope_dev/pages/home.dart';

void main() {
  group('Home Tests', () {
    testComponents('renders scaffold', (tester) async {
      tester.pumpComponent(Home());
      expect(find.byKey(Key('home_scaffold')), findsOneComponent);
    });
  });
}
