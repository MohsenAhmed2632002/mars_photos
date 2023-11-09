import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mars_photos/core/Constans/Routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mars_photos/core/Constans/color_schemes.g.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("Settings");
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box("Settings").listenable(),
        builder: (_, box, __) {
          final bool isDark =
              Hive.box("Settings").get("isDark", defaultValue: false);
          final String lang =
              Hive.box("Settings").get("lang", defaultValue: "en");
          return Sizer(
            builder: (BuildContext context, Orientation orientation,
                DeviceType deviceType) {
              return MaterialApp(
                themeMode: isDark ? ThemeMode.light : ThemeMode.dark,
                theme: ThemeData(
                  //            brightness:
                  // isDark ? lightColorScheme.brightness : darkColorScheme.brightness,
                  colorScheme: lightColorScheme,
                  useMaterial3: true,
                ),
                darkTheme: ThemeData(
                  colorScheme: darkColorScheme,
                  useMaterial3: true,
                ),
                locale: Locale(lang),
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                onGenerateRoute: RoutesGenerator.getRoutes,
                initialRoute: Routes.mainRoute,
                debugShowCheckedModeBanner: false,
                // theme: getAppTheme(isDark),
              );
            },
          );
        });
  }
}
