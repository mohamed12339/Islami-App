import 'package:flutter/material.dart';
import 'package:islami/ui/screens/hadeth_details/hadeth_datails.dart';
import 'package:islami/ui/screens/home/home.dart';
import 'package:islami/ui/screens/splash/splash.dart';
import 'package:islami/ui/screens/sura_details/sura_details.dart';
import 'package:islami/ui/utiltes/app_colors.dart';
import 'package:islami/ui/utiltes/constants.dart';
import 'introScreens/intro_screen.dart';


void main() {
  AppConstants.fillSuras(); ///عملتها هنا عشان تشتغل قبل ما الابليكين يشتغل اصلا
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home.routeName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(canvasColor: AppColors.gold),///دية عشان البار الي تحت مش رضي يغير اللون فعملنا theme and canvas
      routes: {
        Splash.routeName:(context) => Splash(),
        Home.routeName:(context)=>Home(),
        IntroScreen.routeName: (context) => IntroScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
        HadethDetails.routeName: (context) => HadethDetails(),

      },
    );
  }
}
