import 'package:mars_photos/One/Presentation/Screens/Main_Screen.dart';
import 'package:go_router/go_router.dart';


GoRouter router() {
  return GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => MainScreen(),
      ),
      // GoRoute(
      //   path: "/MainScreen",
      //   builder: (context, state) => MainScreen(),
      // ),
    ],
  );
}
