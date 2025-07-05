import 'package:flutter/material.dart';
import '../ui/screens/home/home.dart';
import 'intro_item.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = "IntroScreen";

  const IntroScreen({super.key});

  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<IntroItem> introData = [
    IntroItem(
      title: "Welcome To Islami",
      subtitle: "",
      imagePath: "assets/images/welcome.png",
    ),
    IntroItem(
      title: "Welcome To Islami",
      subtitle: "We Are Very Excited To Have You In Our Community",
      imagePath: "assets/images/second.png",
    ),
    IntroItem(
      title: "Reading the Quran",
      subtitle: "Read, and your Lord is the Most Generous",
      imagePath: "assets/images/third.png",
    ),
    IntroItem(
      title: "Bearish",
      subtitle: "Praise the name of your Lord, the Most High",
      imagePath: "assets/images/fourth.png",
    ),
    IntroItem(
      title: "Holy Quran Radio",
      subtitle:
          "You can listen to the Holy Quran Radio through the application for free and easily",
      imagePath: "assets/images/MIC.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Color(0xff202020),
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset("assets/images/islami_intro_screen.png"),
            SizedBox(height: 20),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: introData.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(introData[index].imagePath, height: 300),
                      SizedBox(height: 20),
                      Text(
                        introData[index].title,
                        style: TextStyle(
                          color: Color(0xffE2BE7F),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 50),
                      Text(
                        introData[index].subtitle,
                        style: TextStyle(color: Color(0xffE2BE7F), fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _currentPage > 0
                        ? () {
                            _pageController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xffE2BE7F),
                      backgroundColor: Colors.transparent,
                    ),
                    child: Text("Back"),
                  ),
                  Row(
                    children: List.generate(
                      introData.length,
                      (index) => Container(
                        margin: EdgeInsets.all(4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: _currentPage == index
                              ? Color(0xffFFD482)
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _currentPage < introData.length - 1
                        ? () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } : (){
                      Navigator.pushReplacementNamed(context, Home.routeName);/// عملت دية عشان بعد اnext يخش علي الصفحة الي فيها الحاجات بقا بتاعة الhome بس كدا
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xffE2BE7F),
                      backgroundColor: Colors.transparent,
                    ),
                    child: Text("Next"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
