import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/screens/hadeth_details/hadeth_datails.dart';
import 'package:islami/ui/utiltes/app_assets.dart';
import 'package:islami/ui/utiltes/app_styles.dart';

class Hadeth{
  String title ;
  String content ;
  Hadeth(this.title , this.content);
}

class AhadathTap extends StatefulWidget {

  const AhadathTap({super.key});

  @override
  State<AhadathTap> createState() => _AhadathTapState();
}

class _AhadathTapState extends State<AhadathTap> {
  List<Hadeth> ahadeth = [];
  @override
  void initState() { ///تتعمل مرة واحدة بس
    super.initState();
    readAhadethFile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.ahadithBackground),
              fit: BoxFit.cover
          ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.islamiLogo),
          if(ahadeth.isNotEmpty)
            Expanded(
              child: CarouselSlider.builder(
                itemCount: ahadeth.length,
                options: CarouselOptions(
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  height: double.infinity,
                  viewportFraction: 0.7, ///دية خلت المسافة ما بين كل page تقرب بس
                  enlargeFactor: 0.2 , //وفية برضو حاجة اسمها enlargeFactor بتحدد المسافة بردو   دول كدا مع يظبطوا ال page بس /

                ),
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return buildHadethWidget(itemIndex);
              },
            ),
          ),
          SizedBox(height: 20,)

        ],
      ),
    );
  }

  Widget buildHadethWidget(int itemIndex) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, HadethDetails.routeName , arguments:ahadeth[itemIndex] );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 45),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.hadethBg
            ),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text(ahadeth[itemIndex].title,
              textAlign: TextAlign.center,
              style: AppTextStyles.blackBold20,),
            SizedBox(height: 20,),
            Expanded(
              child: SingleChildScrollView(
                child: Text(ahadeth[itemIndex].content,
                  style: AppTextStyles.blackBold16,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }


  void readAhadethFile()async{
   String ahadethFile = await rootBundle.loadString("assets/files/ahadeth.txt");
   List<String> ahadethList = ahadethFile.split("#\n");  ///انا هنا عملنا دية عشان نقولوا يعرفوا يفرق ما بين كل حديث ب # الي اصلا مكتوبة في الفايل ومعها \n انا كدا قسمت كدا خمسين سترينج
   for (int i = 0 ; i < ahadethList.length ; i++){ ///عملت عليهم لوب
     String hadeth = ahadethList[i]; ///هاخد كل سترينج
     List<String> hadethLines = hadeth.split("\n");///هاقسموا سطور
     String title = hadethLines.removeAt(0);///فا اول سطر بالنسبالي الي هوا title هيبقا كلمة الجديث الاول كدا
     ahadeth.add(Hadeth(title, hadethLines.join()));
   }
   setState(() {});
  }
}
