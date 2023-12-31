import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mars_photos/Data/Models/Model.dart';
import 'package:mars_photos/Logic/cubit/marsphotobloc_cubit.dart';
import 'package:mars_photos/core/Constans/Font.dart';
import 'package:mars_photos/core/Constans/color_schemes.g.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:mars_photos/core/Constans/AppStrings.dart';

class MainScreen extends StatelessWidget {
  final DateTime? earthDate;
  MainScreen({super.key, this.earthDate});

  final advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    context.read<MarsphotoblocCubit>().fetchDatePhotoData(earthDate);
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
                value: Hive.box(AppStrings.mySettings)
                    .get(AppStrings.myDark, defaultValue: false),
                onChanged: (v) {
                  Hive.box(AppStrings.mySettings).put(AppStrings.myDark, v);
                },
              ),
            ),
            ListTile(
              title: Text("${AppLocalizations.of(context)!.changelanguage}"),
              trailing: Switch(
                value: Hive.box(AppStrings.mySettings).get(AppStrings.myLanuage,
                        defaultValue: AppStrings.myEnglish) ==
                    AppStrings.myEnglish,
                onChanged: (v) {
                  Hive.box(AppStrings.mySettings).put(AppStrings.myLanuage,
                      v ? AppStrings.myEnglish : AppStrings.myArbic);
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
        ),
        body: BlocBuilder<MarsphotoblocCubit, MarsphotoblocState>(
          buildWhen: (previous, current) =>
              previous is MarsphotoblocRoverLoading &&
              current is MarsphotoblocRoverLoaded,
          builder: (context, state) {
            return Container(
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
              child: ConditionalBuilder(
                condition: state is MarsphotoblocLoaded,
                builder: (context) {
                  return BlocBuilder<MarsphotoblocCubit, MarsphotoblocState>(
                      buildWhen: (previous, current) =>
                          current is MarsphotoblocLoaded,
                      builder: (BuildContext context, state) {
                        final List<Marsphoto> marsPhotoC =
                            (state as MarsphotoblocLoaded).listFromCuibt;
                        return LoadedWidget(marsPhotoC: marsPhotoC);
                      });
                },
                fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class LoadedWidget extends StatelessWidget {
  const LoadedWidget({
    super.key,
    required this.marsPhotoC,
  });

  final List<Marsphoto> marsPhotoC;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: marsPhotoC.length,
      itemBuilder: (context, index) {
        return Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: ListView.separated(
            itemCount: marsPhotoC.length,
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
                    width: MediaQuery.sizeOf(context).width * .8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * .4,
                          child: Column(
                            children: [
                              Text(
                                "ID: \n${marsPhotoC[index].id}",
                                style: getBoldTextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              Text(
                                "EarthDate:\n ${marsPhotoC[index].earthDate.day}",
                                style: getBoldTextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.sizeOf(context).height * .2,
                          width: MediaQuery.sizeOf(context).width * .4,
                          child: Image.network(
                            fit: BoxFit.contain,
                            marsPhotoC[index].imageSrc,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, state) => SizedBox(
              height: MediaQuery.sizeOf(context).height / 10,
              width: MediaQuery.sizeOf(context).width,
            ),
          ),
        );
      },
    );
  }
}
