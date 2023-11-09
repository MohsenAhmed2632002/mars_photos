import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mars_photos/core/Constans/Font.dart';
import 'package:mars_photos/core/Constans/color_schemes.g.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${AppLocalizations.of(context)!.appTitle}"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("${AppLocalizations.of(context)!.changeTheme}"),
              trailing: Switch(
                value: Hive.box("Settings").get("isDark", defaultValue: false),
                onChanged: (v) {
                  Hive.box("Settings").put("isDark", v);
                },
              ),
            ),
            ListTile(
              title: Text("${AppLocalizations.of(context)!.changelanguage}"),
              trailing: Switch(
                value: Hive.box("Settings").get("lang", defaultValue: "en") ==
                    "en",
                onChanged: (v) {
                  Hive.box("Settings").put("lang", v ? "en" : "ar");
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
            width: 100.h,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blueAccent[400],
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 5),
                  blurRadius: 5,
                )
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(
                  12,
                ),
              ),
            ),
            child: Text(
              "${AppLocalizations.of(context)!.theMess}",
              style: getMediumTextStyle(
                color: lightColorScheme.primaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
