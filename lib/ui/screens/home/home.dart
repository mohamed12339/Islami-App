import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/tabs/ahadath/ahadath_tap.dart';
import 'package:islami/ui/screens/home/tabs/azkar/azkar_tap.dart';
import 'package:islami/ui/screens/home/tabs/quran/quran_tap.dart';
import 'package:islami/ui/screens/home/tabs/radio/radio_tap.dart';
import 'package:islami/ui/screens/home/tabs/sebha/sebha_tap.dart';
import 'package:islami/ui/utiltes/app_assets.dart';
import 'package:islami/ui/utiltes/app_colors.dart';
import 'package:islami/ui/utiltes/app_styles.dart';

class Home extends StatefulWidget {
  static const routeName = "Home";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  /// هنا انا عملت فريابل عشان لما النستخدم يختار ايكون
  List<Widget> tabs = [
    QuranTap(),
    AhadathTap(),
    SebhaTap(),
    RadioTap(),
    AzkarTap(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
        bottomNavigationBar: buildBottomNavigationBar()
    );
  }

  buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: AppColors.white,
      //لما يدوس يظهر ابيض
      unselectedItemColor: AppColors.black,
      // لو مدسش يظهر اسود
      iconSize: 30,
      // يكبر الايكون
      selectedLabelStyle: AppTextStyles.whiteBold12,
      //بتاعة ال Label
      onTap: (index) {
        /// هنا بقا بقولوا لما الستخم يدوس علي الايكون تكبر عنهم كدا وسويتها بالانديكس
        selectedIndex = index;
        setState(() {});
      },
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: buildBottomNavigationBarIcon(
            AppAssets.icQuran,
            selectedIndex == 0,
          ),

          ///  دية معناها  (bool) selectedIndex==0  لو الايكون الاولي بتساوي صفر يظهر الكونتينر بس والباقي كدا بردوا
          label: "Quran",
        ),
        BottomNavigationBarItem(
          icon: buildBottomNavigationBarIcon(
            AppAssets.icAhadath,
            selectedIndex == 1,
          ),
          label: "Ahadath",
        ),
        BottomNavigationBarItem(
          icon: buildBottomNavigationBarIcon(
            AppAssets.icsabha,
            selectedIndex == 2,
          ),
          label: "sabha",
        ),
        BottomNavigationBarItem(
          icon: buildBottomNavigationBarIcon(
            AppAssets.icRadio,
            selectedIndex == 3,
          ),
          label: "Radio",
        ),
        BottomNavigationBarItem(
          icon: buildBottomNavigationBarIcon(
            AppAssets.icAzkar,
            selectedIndex == 4,
          ),
          label: "Azkar",
        ),
      ],
    );
  }

  buildBottomNavigationBarIcon(String icon, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.blackWithOpacity60 : Colors.transparent,

        ///يبقا هنا انا بقولوا لو المستخدم داس علي ايكونة يبقا اللون يظهر والباقي شفاف
        borderRadius: BorderRadius.circular(16),
      ),
      child: ImageIcon(AssetImage(icon)),
    );
  }
}
