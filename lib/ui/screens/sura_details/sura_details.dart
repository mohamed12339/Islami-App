import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/ui/utiltes/app_assets.dart';
import 'package:islami/ui/utiltes/app_colors.dart';
import 'package:islami/ui/utiltes/app_styles.dart';
import '../home/home.dart';

///شرح sura = ModalRoute.of(context)!.settings.arguments as SuraDM ;
//لما المستخدم يدوس على حاجة (زي اسم سورة مثلًا)، إحنا بننقله على صفحة تانية اسمها SuraDetails.
// 	•	وإحنا وإحنا بننقله، بنعدّي معانا بيانات (زي اسم السورة أو رقمها) علشان الصفحة الجديدة تعرف تشتغل بيها.
// 	•	في الصفحة الجديدة (SuraDetails)، بنستخدم

///ثانيًا: ما معنى ! بعد ModalRoute.of(context)! ؟
// في Dart، القيمة الراجعة من ModalRoute.of(context) ممكن تكون null، لكن:
// 	•	أنت عارف ومتأكد إن الشاشة دي اتنادت من خلال Navigator ومعاها arguments، فبتحط ! علشان تقول للمترجم:
// “أنا متأكد إنها مش null، خليني أتعامل معاها على هذا الأساس”

class SuraDetails extends StatefulWidget {
  static const routeName = "SuraDetails";

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDM sura;
   String suraContent = "";

  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as SuraDM;///شرحها فوق
    if(suraContent.isEmpty){
      readSuraContent();
    }

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(
            onPressed: () {
          Navigator.pushNamed(context, Home.routeName);
        }, icon: Icon(
          Icons.arrow_back,
          color: AppColors.gold,
        )),
        title: Text(sura.nameEn,
          style: AppTextStyles.goldBold20,
        ),
        centerTitle: true,
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
                  child: Text(sura.nameAR,
                    style: AppTextStyles.goldBold20,
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(AppAssets.rightPattern),
              ],
            ),
          ),
          suraContent.isEmpty ? Center(
              child: CircularProgressIndicator(color: AppColors.gold,)) :///CircularProgressIndicator دية هيا عبارة عن انها تعمللك علامة تحميل دية بتظهر في الشاشة
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      suraContent, style: AppTextStyles.goldBold20,
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

  Future readSuraContent() async {
    String fileName = "assets/files/quran/${sura.index}.txt";
   Future<String> contentFuture =  rootBundle.loadString(fileName);///شرح دية عشان تقرا فايل الtxt راجع علي session7 الفيديو بتاعها1:38:10 من بداية هوا شرحها راجعها كويس تاني للتاكيد
    suraContent =  await contentFuture ;
    List<String> suraLines = suraContent.trim().split("\n");/// .split دية عبارة عن انها بتعرفني عدد السطور الي محطوط في الكلام وبتتعمل في ليستة
    /// trim() دية عبارة عن لو فية سطور فاضة متكتبهاش خلاص
    for(int i = 0 ; i<suraLines.length ; i++){
      suraLines[i] += "[${i+1}]" ;
    }
    suraContent = suraLines.join() ; /// join  معناها بتجمع يعني اية يعني بتجمع الليستة بيتاعة سورة لين في سورة كونتنت تاني
    setState(() {});
  }
}
