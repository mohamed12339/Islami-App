import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/tabs/ahadath/ahadath_tap.dart';
import 'package:islami/ui/utiltes/app_assets.dart';
import 'package:islami/ui/utiltes/app_colors.dart';
import 'package:islami/ui/utiltes/app_styles.dart';

class HadethDetails extends StatefulWidget {
  static const routeName = "HadethDetails";

  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  late Hadeth hadeth;
  String suraContent = "";

  @override
  Widget build(BuildContext context) {
    hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;///شرحها زيها في file sura_details


    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(
          Icons.arrow_back,
          color: AppColors.gold,
        )),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:  EdgeInsets.all(8),
            child: Row(
              children: [
                Image.asset(AppAssets.leftPattern),
                Expanded(
                  child: Text(hadeth.title,
                    style: AppTextStyles.goldBold20,
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(AppAssets.rightPattern),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(hadeth.content ,
                      style: AppTextStyles.goldBold20,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl, ///دية هتظبط الكلام ازاي زي اكنك بتكتب عربي وانجليزي مع بعض دية هتظبطهم بس
                    ),
                  )
              )
          ),
          Image.asset(AppAssets.mosqueImage),

        ],
      ),
    );
  }

}
