import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mars_photos/core/Constans/Colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mars_photos/core/Constans/media_query_values.dart';
import 'package:mars_photos/core/Constans/Font.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.darkPrimary,
        title: Text("${AppLocalizations.of(context)!.appTitle}"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("${AppLocalizations.of(context)!.changeTheme}"),
              trailing: ValueListenableBuilder(
                valueListenable: Hive.box("Settings").listenable(),
                builder: (BuildContext context, value, Widget? child) {
                  return Switch(
                      value: Hive.box("Settings")
                          .get("isDark", defaultValue: false),
                      onChanged: (v) {
                        Hive.box("Settings").put("isDark", v);
                      },
                      activeColor: ColorManager.primary);
                },
              ),
            ),
            ListTile(
              title: Text("${AppLocalizations.of(context)!.changelanguage}"),
              trailing: ValueListenableBuilder(
                valueListenable: Hive.box("Settings").listenable(),
                builder: (BuildContext context, value, Widget? child) {
                  return Switch(
                      value:
                          Hive.box("Settings").get("lang", defaultValue: "en")=="en",
                      onChanged: (v) {
                        Hive.box("Settings").put("lang", v ? "en" : "ar");
                      },
                      activeColor: ColorManager.primary);
                },
              ),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQueryValues(context).mywidth,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: ColorManager.darkGrey,
                  offset: Offset(1, 5),
                  blurRadius: 5,
                )
              ],
              color: ColorManager.primary,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  12,
                ),
              ),
            ),
            child: Text(
              "${AppLocalizations.of(context)!.theMess}",
              style: getMediumTextStyle(color: ColorManager.white),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.primary,
            ),
            child: Icon(
              Icons.refresh_outlined,
              color: ColorManager.white,
              size: 22,
            ),
          )
        ],
      ),
    );
  }
}
