import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/ui/utiltes/app_assets.dart';

import '../../../introScreens/intro_screen.dart';


class Splash extends StatelessWidget {
  static const routeName = "Splash";

  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, IntroScreen.routeName);
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.splashImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
