import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/home.dart';
import 'package:islami/ui/screens/splash/splash.dart';
import 'introScreens/intro_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:  Splash.routeName,
      routes: {
        Splash.routeName:(context) => Splash(),
        Home.routeName:(context)=>Home(),
        IntroScreen.routeName: (context) => IntroScreen(),
      },
    );
  }
}
