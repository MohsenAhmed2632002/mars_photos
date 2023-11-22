import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mars_photos/Data/Models/Model.dart';
import 'package:mars_photos/Data/Models/RoverModel.dart';
import 'package:mars_photos/Data/Repos/Repo.dart';
import 'package:mars_photos/core/Constans/Font.dart';
import 'package:mars_photos/core/Constans/color_schemes.g.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final advancedDrawerController = AdvancedDrawerController();
  bool curiosityDataReady = false;
  @override
  void initState() {
    Repo().fetchCuriosityData().then((bool value) {
      curiosityDataReady = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: advancedDrawerController,
      animationCurve: Curves.easeInToLinear,
      drawer: Drawer(
        backgroundColor: lightColorScheme.tertiary,
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
      child: Scaffold(
        appBar: AppBar(
          title: Text("${AppLocalizations.of(context)!.appTitle}"),
          leading: IconButton(
            onPressed: () {
              advancedDrawerController.showDrawer();
            },
            icon: Icon(
              Icons.keyboard_double_arrow_left_sharp,
            ),
          ),
          actions: [
            Container(
              width: 200,
              height: 70,
              child: ListTile(
                title: Text("${AppLocalizations.of(context)!.date}"),
                onTap: () async {
                  var dateCh = await showDatePicker(
                      context: context,
                      initialDate: Hive.box<RoverModel>("RoverDe")
                          .values
                          .first
                          .landingDate,
                      firstDate: Hive.box<RoverModel>("RoverDe")
                          .values
                          .first
                          .landingDate,
                      lastDate:
                          Hive.box<RoverModel>("RoverDe").values.first.maxDate);
                  Repo().fetchPhotoByEarthDate(
                    dateCh ?? DateTime.now(),
                  );
                },
              ),
            )
          ],
        ),
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blueAccent[400],
            boxShadow: [
              BoxShadow(
                color: Colors.white,
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
          child: FutureBuilder<List<Marsphoto>>(
              future: Repo().fetchPhotoByEarthDate(DateTime(2023, 10, 21)),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Marsphoto> list = snapshot.data!;
                  return Container(
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    child: ListView.separated(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: lightColorScheme.onPrimary,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    15,
                                  ),
                                ),
                              ),
                              height: MediaQuery.sizeOf(context).height * .2,
                              width: MediaQuery.sizeOf(context).width * .3,
                              child: Column(
                                children: [
                                  Text(
                                    "ID: \n${list[index].id}",
                                    style: getBoldTextStyle(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  Text(
                                    "EarthDate:\n ${list[index].earthDate.day}",
                                    style: getBoldTextStyle(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.sizeOf(context).height * .2,
                              width: MediaQuery.sizeOf(context).width * .5,
                              child: Image.network(
                                fit: BoxFit.contain,
                                list[index].imageSrc,
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, state) => SizedBox(
                        height: MediaQuery.sizeOf(context).height / 10,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                }
              }),
        ),
      ),
    );
  }
}
