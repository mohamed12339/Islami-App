import 'package:flutter/material.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/ui/screens/home/tabs/quran/sura_row.dart';
import 'package:islami/ui/screens/sura_details/sura_details.dart';
import 'package:islami/ui/utiltes/app_assets.dart';
import 'package:islami/ui/utiltes/app_colors.dart';
import 'package:islami/ui/utiltes/app_styles.dart';
import 'package:islami/ui/utiltes/constants.dart';
import 'package:islami/ui/utiltes/most_recent_suras_prefs.dart';

class QuranTap extends StatefulWidget {
  const QuranTap({super.key});

  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  List<SuraDM> filterSuraList = AppConstants.suras;
  @override
  void initState() {
    super.initState();
    ///await , async هيا عبارة بعد ما تخلص اعمل سيت استيت زيها زي ال .then
    MostRecentSurasPrefs.loadSurasList().then((_){
      setState(() {});
    });
  }

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
          SizedBox(height: 20),
          Text("Most Recently", style: AppTextStyles.whiteBold16,),
          SizedBox(height: 10),
          Expanded(flex: 3 ,  child: buildMostRecentList()),
          SizedBox(height: 10),
          Text("Suras List", style: AppTextStyles.whiteBold16,),
          Expanded(flex: 7 ,child: buildSurasListview()),
        ],
      ),
    );
  }
  Widget buildMostRecentList() {
    return ListView.builder(
        itemCount: MostRecentSurasPrefs.surasList.length,
        scrollDirection: Axis.horizontal, ///انا هنا بقولوا تسكرول بالعرض يعني
        itemBuilder: (context , index){
          var sura =  MostRecentSurasPrefs.surasList[index];
          return Container(
            width: MediaQuery.of(context).size.width * 0.7 , ///دية انا بتكبر العرض يتاع الكونتير وبتكتب كدا بس
            margin: EdgeInsets.symmetric(horizontal: 7),
            padding: EdgeInsets.symmetric(horizontal: 7),
            decoration: BoxDecoration(
              color: AppColors.gold ,
              borderRadius: BorderRadius.circular(18)
            ),
            child: Row(
              children: [
                SizedBox(width: 8,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ //  هناsura دية  بتاعة سطر 50
                    Text(sura.nameEn ,style: AppTextStyles.blackBold24,),
                    Text(sura.nameAR,style: AppTextStyles.blackBold24,),
                    Text("${sura.verses} verses",style: AppTextStyles.blackBold16,),

                  ],
                ),
                Expanded(child: Image.asset(AppAssets.recentSuraImage))
              ],
            ),
          );
        });
  }

  buildSearchTextField() {
    var defaultBorder = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.gold, width: 1),
      borderRadius: BorderRadius.circular(10),
    );
    return TextField(
      style: AppTextStyles.whiteBold16,
      cursorColor: AppColors.gold,/// دية هيا(|)بتغير لون دية بس
      decoration: InputDecoration(
        labelText: "SuraName",///اعرف حاجة الlabelTextهيا الكلمة بتطلع فوق غير hintText الكلمة بتختفي
        labelStyle: AppTextStyles.whiteBold16,
        border: defaultBorder,
        focusedBorder: defaultBorder,
        enabledBorder: defaultBorder,
        prefixIcon: Image.asset(AppAssets.icQuran, color: AppColors.gold),
      ),
      onChanged: (query) {/// onChanged :دية حاجة موجودة في التيكست فيلد معناها انا ببعتولوا فانكشن وهوا بيندة عليها يعني هابعتلوا كل الليستة بتاعة الاحاديث عشان يندة عليها وبالتالي انا عملت كدا سيرش ولازم تكتب في ()في القوسين دول حاجة
        search(query);
      },

    );
  }

  buildSurasListview() {
    return ListView.separated(/// دية هيا هيا listview.builder بس الفرق ان عندها حاجة اسمها هتعمل مسافة ما بين الحاجات وانا مثلا حطيت ديفيدر وعملت مسافة المسافة  separatorBuilder
      itemCount: filterSuraList.length,///هنا بعقولوا بقا اعرضلي السورز من الليست الجديدة عشان اعمل سيرش هيا كدا كدا كوبي من اليستة بتاعتي عموما
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            MostRecentSurasPrefs.addSuraToPrefs(filterSuraList[index]);
           await Navigator.pushNamed(context, SuraDetails.routeName, arguments: filterSuraList[index]);///هنا بقا بقولوا اعرضلي السور من اليستة الجديدة الي عبارة عن ليستة السور يعني عشان اعمل سيرش
           setState(() {});
            /// الargumentهنا عشان الانا كنت ببعتوا فيsuraRow هوا هوا اللي هابعتوا هنا :AppConstants.suras[index]
            /// itemCount: AppConstants.length, دية الحاجة من اليستة القدية بس كان استخدامها اني اعرض السور او الاحاديث الي هما ظاهرين تحت بعض كدا بس
          },
          child: SuraRow(///دا فايل جواة تصميم السور الي هيا الاحاديث وانا معرف فيها حاجة اسمها sura عشان يعمل كل لستة السور تتحت بعض في listview.separated
            sura: filterSuraList[index],  ///هنا بقا بردو ولازم اكتبها هنا  بقولوا اعرضلي السور من اليستة الجديدة الي عبارة عن ليستة السور يعني عشان اعمل سيرش بردو في السور او الاحاديث الي موجودة
          ),
        );
      },
      separatorBuilder: (_, _) => Divider(///separatorBuilder (_,_) اكنها جواها (context, index) بس انا مش بستخدمهم بس كدا
            indent: 64,
            endIndent: 64,///دول بيقللوا من الخط الانا عاملوا بس
          ),
    );
  }

  void search(String query) {
    // filterSuraList.firstWhere(test) ///دول كدا حاجات مهمة وبتسخدم كتير لازم انا  اعمل سيرش عليهم وافهمهم كويس اوي والاخيرة انا شارحها
    // filterSuraList.sort()
    // filterSuraList.forEach(action)
    // filterSuraList.map(toElement)
    filterSuraList = AppConstants.suras.where((sura) {///شرحها في الكشكول
      return sura.nameAR.contains(query) || sura.nameEn.toLowerCase().contains(query.toLowerCase());///lower case معناها هنا بقولوا سيرش والحروف صغيرة يعني
    }).toList();
    setState(() {});
  }
}