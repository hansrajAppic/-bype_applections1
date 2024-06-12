// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'Globale_class/colors.dart';

import 'login_screen.dart'; // Import your login screen

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final controller = PageController();
  int currentIndex = 0;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences();
  }

  Future<void> initializeSharedPreferences() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    // You can set or retrieve SharedPreferences values here
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 223, 242).withOpacity(0.8),
      body: Container(
        child: PageView(
          onPageChanged: onPageChanged,
          controller: controller,
          children: [
            buildPage(
              title: "Welcome",
              description: "Sonitechno.",
              subtitle: "Online Bill Payments, Mobile Recharge, DTH, FASTag",
              image: AssetImage('assets/images/mantrara.png'),
            ),
            buildPage(
              title: "Welcome",
              description: "Sonitechno..",
              subtitle: "fino payment bank all services",
              image: AssetImage('assets/images/bankServuc.png'),
            ),
            buildPage(
              title: "Sonitechno.",
              subtitle: " BBPS Payment mode",
              description: "bill payments or recharges..",
              image: AssetImage('assets/images/magment icon.png'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: isLastPage
          ? Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff2596be),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Logain_screen()),
                  );
                  // Perform action when "Get Started" button is pressed
                },
                child: Text(
                  "Get Started >>",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            )
          : Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.zero,
                color: Colors.transparent,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        controller.jumpToPage(2);
                      },
                      child: Text('Skip >>'),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: WormEffect(
                      dotColor: const Color.fromARGB(255, 242, 203, 203),
                      activeDotColor: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: Text('Next >>'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildPage({
    required String title,
    required String description,
    required AssetImage image,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: image,
            height: 200,
          ),
          SizedBox(height: 30),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
      isLastPage = index == 2;
    });
  }
}

void main() {
  runApp(MaterialApp(
    routes: {
      'main': (context) =>
          Container(), // Replace 'Container()' with your main page widget
    },
    home: OnBoarding(),
  ));
}
