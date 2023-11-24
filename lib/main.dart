import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mars_photos/Data/Models/Model.dart';
import 'package:mars_photos/Data/Models/RoverModel.dart';
import 'package:mars_photos/Data/Repos/Repo.dart';
import 'package:mars_photos/Logic/cubit/marsphotobloc_cubit.dart';
import 'package:mars_photos/Logic/cubit/marsphotosbloc_OBS.dart';
import 'package:mars_photos/core/Constans/Routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mars_photos/core/Constans/color_schemes.g.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();

  Hive.registerAdapter(RoverModelAdapter());
  Hive.registerAdapter(CameraAdapter());
  Hive.registerAdapter(RoverCamerasAdapter());
  Hive.registerAdapter(MarsphotoAdapter());
  await Hive.openBox("Settings");
  await Hive.openBox<Marsphoto>("MarsPhotos");
  await Hive.openBox<RoverModel>("RoverDe");

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MarsphotoblocCubit(
        repo: Repo(),
      ),
      child: ValueListenableBuilder(
          valueListenable: Hive.box("Settings").listenable(),
          builder: (_, box, __) {
            final bool isDark =
                Hive.box("Settings").get("isDark", defaultValue: false);
            final String lang =
                Hive.box("Settings").get("lang", defaultValue: "en");
            return Sizer(
              builder: (BuildContext context, Orientation orientation,
                  DeviceType deviceType) {
                return MaterialApp.router(
                  routerConfig: router(),
                  debugShowCheckedModeBanner: false,
                  themeMode: isDark ? ThemeMode.light : ThemeMode.dark,
                  theme: ThemeData(
                    colorScheme: lightColorScheme,
                    useMaterial3: true,
                  ),
                  darkTheme: ThemeData(
                    colorScheme: darkColorScheme,
                    useMaterial3: true,
                  ),
                  locale: Locale(lang),
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                );
              },
            );
          }),
    );
  }
}
