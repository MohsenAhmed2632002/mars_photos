import 'package:flutter/material.dart';
import 'package:mars_photos/One/Presentation/Screens/Main_Screen.dart';
import 'package:mars_photos/splash_screen.dart';

class Routes {
  static const String onBordingRoute = "/onBording";

  static const String MainScreen = "/MainScreen";

  static const String registerRoute = "/register";

  static const String forgetpassRoute = "/forgetpass";

  static const String mainRoute = "/main";

  static const String storDetailsRoute = "/storDetails";
}

class RoutesGenerator {
  static MaterialPageRoute? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
        );
      // case Routes.onBordingRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => OnBording(),
      //   );
      case Routes.MainScreen:
        return MaterialPageRoute(
          builder: (context) => MainScreen(),
        );

      // case Routes.storDetailsRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => storDetailsRoute(),
      //   );
      // case Routes.forgetpassRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => storDetailsRoute(),
      //   );
      // case Routes.registerRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => storDetailsRoute(),
      //   );

      default:
        return null;
       
        // MaterialPageRoute(
        //   builder: (context) => ErorPage(),
        // );
    }
  }
}

class ErorPage extends StatelessWidget {
  const ErorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("erorr page"),
      ),
    );
  }
}
