import 'package:flutter/material.dart';
import 'package:islami/ui/utiltes/app_assets.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int tassbihIndex = 0;
  double turns = 0;

  final List<String> tassbihList = ['سبحان الله', 'الحمد لله', 'الله أكبر'];

  void handleTap() {
    counter++;
    turns += 1 / 33;

    if (counter > 33) {
      counter = 1;
      tassbihIndex = (tassbihIndex + 1) % tassbihList.length;
    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    var dy = -450/2+12 ;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.sebhaBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: InkWell(
        onTap: handleTap,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 30,
                right: 69,
                left: 70,
                bottom: 16,
              ),
              child: Image.asset(AppAssets.islamiLogo),
            ),
            Text(
              textAlign: TextAlign.center,
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 80,),
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.translate(///بتزيح الايد او بتنقلها يعني ومش لاقي حل غيرها
                  offset: Offset(0, dy), ///dy is the vertical component
                  child: Image.asset(AppAssets.sebhaHand ,
                   width: 100,
                  ),
                ),
                AnimatedRotation(
                  turns: turns,
                  duration: Duration(milliseconds: 300),
                  // الدايرة بتلف
                  child: Padding(
                    padding:  EdgeInsets.all(16),
                    child: Image.asset(
                      AppAssets.sebhaTurns,
                      width: 500,
                    ),
                  ),
                ),

                Column(
                  children: [
                    Text(
                      tassbihList[tassbihIndex],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$counter",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
