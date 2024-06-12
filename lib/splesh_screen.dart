
import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'Globale_class/colors.dart';
import 'Globale_class/shardPreferance.dart';
import 'homnave_scree.dart';
import 'onbording_spleshscree.dart';

class Splesh_screen extends StatefulWidget {
  const Splesh_screen({Key? key}) : super(key: key);

  @override
  State<Splesh_screen> createState() => SpleshScrrenState();
}

class SpleshScrrenState extends State<Splesh_screen> {
  static const String KEYLOGIN = "Login";

  @override
  void initState() {
    super.initState();
    shareedpreprancedata();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.skyblue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            "assets/images/rsz_1sonitecno.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void shareedpreprancedata() async {
    var isLoggedIn = await SharedPreferenceUtils.getBool(KEYLOGIN);
    print({isLoggedIn});
    Timer(const Duration(seconds: 1), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeNaveScreens(
                index: 0,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OnBoarding(),
            ),
          );
        }
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OnBoarding(),
          ),
        );
      }
    });
  }
}

void Animations() {
  runApp(MaterialApp(
    home: AnimatedSplashScreen(
      duration: 3000,
      splash: 'assets/logo.png', // Your splash image path
      nextScreen:
          Splesh_screen(), // The screen to navigate to after the splash screen
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: Colors.blueAccent,
    ),
  ));
}
