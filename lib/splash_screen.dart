
import 'package:flutter/material.dart';
import 'package:mars_photos/core/Constans/Colors.dart';
import 'package:mars_photos/core/Constans/Routes.dart';

class SplashView extends StatefulWidget {
  SplashView._intarnal();
  static final SplashView _instance = SplashView._intarnal();
  factory SplashView() => _instance;
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void initState() {
    super.initState();
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      return Navigator.pushReplacementNamed(context, Routes.MainScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        // child: Image.asset("${ImageAssets.imagepath}splash_logo.png"),
      ),
    );
  }
}
