import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/ui/utiltes/app_assets.dart';

import '../../../introScreens/intro_screen.dart';


class Splash extends StatefulWidget {
  static const routeName = "Splash";

  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() { ///عملت دية لية عشان اقولوا تشتغل مرة واحدة بس مش مرتين
    super.initState();
    Timer(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, IntroScreen.routeName);
    });
  }


  @override
  Widget build(BuildContext context) {
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
