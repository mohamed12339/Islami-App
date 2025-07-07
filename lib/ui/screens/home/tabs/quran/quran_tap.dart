import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/tabs/quran/sura_row.dart';
import 'package:islami/ui/screens/sura_details/sura_details.dart';
import 'package:islami/ui/utiltes/app_assets.dart';
import 'package:islami/ui/utiltes/app_colors.dart';
import 'package:islami/ui/utiltes/app_styles.dart';
import 'package:islami/ui/utiltes/constants.dart';

class QuranTap extends StatelessWidget {
  const QuranTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.quranBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 30),
          Image.asset(AppAssets.islamiLogo),
          buildSearchTextField(),
          SizedBox(height: 10),
          Text("Suras List" , style: AppTextStyles.whiteBold16,),

          Expanded(child: buildSurasListview()),
        ],
      ),
    );
  }

  buildSearchTextField() {
    var defaultBorder = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.gold, width: 1),
      borderRadius: BorderRadius.circular(10),
    );
    return TextField(
      style: AppTextStyles.whiteBold16,
      cursorColor: AppColors.gold,

      /// دية هيا(|)بتغير لون دية بس
      decoration: InputDecoration(
        labelText: "SuraName",

        ///اعرف حاجة الlabelTextهيا الكلمة بتطلع فوق غير hintText الكلمة بتختفي
        labelStyle: AppTextStyles.whiteBold16,
        border: defaultBorder,
        focusedBorder: defaultBorder,
        enabledBorder: defaultBorder,
        prefixIcon: Image.asset(AppAssets.icQuran, color: AppColors.gold),
      ),
    );
  }

  buildSurasListview() {
    return ListView.separated(   /// دية هيا هيا listview.builder بس الفرق ان عندها حاجة اسمها هتعمل مسافة ما بين الحاجات وانا مثلا حطيت ديفيدر وعملت مسافة المسافة  separatorBuilder
      itemCount: AppConstants.suras.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            Navigator.pushNamed(context, SuraDetails.routeName ,arguments: AppConstants.suras[index] ); /// الargumentهنا عشان الانا كنت ببعتوا فيsuraRow هوا هوا اللي هابعتوا هنا
          },
          child: SuraRow(
            sura: AppConstants.suras[index],
          ),
        );
      },
      separatorBuilder: ( _ , _ ) => Divider( ///separatorBuilder (_,_) اكنها جواها (context, index) بس انا مش بستخدمهم بس كدا
        indent: 64,
        endIndent: 64, ///دول بيقللوا من الخط الانا عاملوا بس
      ),
    );
  }
}
