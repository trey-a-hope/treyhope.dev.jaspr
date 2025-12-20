import 'dart:developer';
import 'package:jaspr/jaspr.dart';

import 'package:jaspr/dom.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:treyhope_dev/components/embedded_counter_widget.dart';

// import '../components/counter.dart';

// By using the @client annotation this component will be automatically compiled to javascript and mounted
// on the client. Therefore:
// - this file and any imported file must be compilable for both server and client environments.
// - this component and any child components will be built once on the server during pre-rendering and then
//   again on the client during normal rendering.
@client
class Home extends StatefulComponent {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // Run code depending on the rendering environment.
    if (kIsWeb) {
      log("Hello client");
      // When using @client components there is no default `main()` function on the client where you would normally
      // run any client-side initialization logic. Instead you can put it here, considering this component is only
      // mounted once at the root of your client-side component tree.
    } else {
      log("Hello server");
    }
  }

  @override
  Component build(BuildContext context) {
    return section([
      img(src: 'images/logo.svg', width: 80),
      div(classes: 'block', [
        h1(classes: 'title', [.text('Hey, I\'m Trey')]),
      ]),
      h2(classes: 'subtitle', [.text('And I\'m a Flutter fanactic')]),
      div(classes: 'block', [
        EmbeddedCounterWidget(),
      ]),
      Link(
        to: '/about',
        child: button(
          classes: 'button',
          [.text('Learn more')],
        ),
      ),
    ]);
  }
}
