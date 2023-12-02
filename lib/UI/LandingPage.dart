import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:mars_photos/Data/Models/RoverModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:mars_photos/core/Constans/AppStrings.dart';
import 'package:mars_photos/core/Constans/Font.dart';
import 'package:mars_photos/core/Constans/color_schemes.g.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Landing",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            tileColor: lightColorScheme.primary,
            title: Text(
              "${AppLocalizations.of(context)!.lastphoto}",
              style: getBoldTextStyle(color: lightColorScheme.onPrimary),
            ),
            onTap: () {
              context.push(
                "/MainScreen",
              );
            },
          ),
          ListTile(
            tileColor: lightColorScheme.primary,
            title: Text(
              "${AppLocalizations.of(context)!.date}",
              style: getBoldTextStyle(color: lightColorScheme.onPrimary),
            ),
            onTap: () async {
              var dateCh = await showDatePicker(
                context: context,
                initialDate: Hive.box<RoverModel>(AppStrings.myRoverDetails)
                        .values
                        .first
                        .maxDate??DateTime.now() ,
                firstDate: Hive.box<RoverModel>(AppStrings.myRoverDetails)
                    .values
                    .first
                    .landingDate??DateTime.now(),
                lastDate: Hive.box<RoverModel>(AppStrings.myRoverDetails)
                    .values
                    .first
                    .maxDate??DateTime.now(),
              )??DateTime.now();

              if (dateCh != null) {
                context.push(
                  "/MainScreen",
                  extra: dateCh,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
