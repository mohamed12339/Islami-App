import 'package:flutter/material.dart';
import 'package:islami/ui/utiltes/app_assets.dart';
import 'package:islami/ui/utiltes/app_styles.dart';

import '../../../../../model/sura_model.dart';

class SuraRow extends StatelessWidget {
  final SuraDM sura;

  const SuraRow({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
      buildIndexImage(),
      SizedBox(width:24 ,),
      Expanded(child: buildEnInfo()),
      buildNameAr()]);
  }

  Widget buildIndexImage() => Container(
    width: 52,
    height: 52,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(AppAssets.suraNumberBg)),
    ),
    child: Center(
      child: Text(sura.index.toString(), style: AppTextStyles.whiteBold14),
    ),
  );

  Widget buildEnInfo() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(sura.nameEn, style: AppTextStyles.whiteBold20),
      SizedBox(height: 3,),
      Text("${sura.verses} Verses", style: AppTextStyles.whiteBold14),
    ],
  );

  Widget buildNameAr() => Text(sura.nameAR , style: AppTextStyles.whiteBold20,);
}
