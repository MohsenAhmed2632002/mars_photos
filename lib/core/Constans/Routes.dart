import 'package:mars_photos/UI/LandingPage.dart';
import 'package:mars_photos/UI/Main_Screen.dart';
import 'package:go_router/go_router.dart';

GoRouter router() {
  return GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => Landing(),
      ),
      GoRoute(
        path: "/MainScreen",
        builder: (context, state) => MainScreen(
          earthDate: state.extra as DateTime,
        ),
      ),
    ],
  );
}
