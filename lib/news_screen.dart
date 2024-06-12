// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, non_constant_identifier_names

import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'Globale_class/colors.dart';
import 'Globale_class/shardPreferance.dart';
import 'Json_model/getnews_model.dart';
import 'globale_class.dart';

class NewsScreenss extends StatefulWidget {
  const NewsScreenss({Key? key}) : super(key: key);

  @override
  State<NewsScreenss> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreenss> {
  List<getnewss> newsbanersArray = [];

  @override
  void initState() {
    super.initState();
    // Call your apiCall() method when the widget is initialized
    apiCall();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Shadowwhitedark,
        title: Center(
          child: Image.asset(
            "assets/images/rsz_1sonitecno.png",
            height: 35,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.menu, color: AppColors.redColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.darkwhiteColor,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(69, 143, 145, 135),
                blurRadius: 4,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h * 0.02),
                for (var news in newsbanersArray)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText('Title: ${news.name ?? ""}',
                              textStyle: const TextStyle(
                                color: AppColors.orangeColor,
                                fontSize: 14,
                              )),
                        ],
                      ),
                      // Text(
                      //   "Title: ${news.name ?? ""}",
                      //   style: TextStyle(
                      //       color: AppColors.orangeColor,
                      //       fontSize: 14,
                      //       fontWeight: FontWeight
                      //           .w600), // Use a standard Flutter color
                      // ),
                      Divider(color: AppColors.redColor),
                      Html(
                        data: "Description: ${news.description ?? ""}",
                        style: {
                          "p": Style(
                            color: AppColors.blackColor,
                            fontSize: FontSize(13.0),
                          ),
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Date: ${news.addDate ?? "N/A"}",
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> apiCall() async {
    String? Mobile = await SharedPreferenceUtils.getValue("mob");
    String? Password = await SharedPreferenceUtils.getValue("pass");

    if (Mobile != null) {
      String? deviceID = "";

      try {
        String? result = await MyGlobalFunctions.getId();
        deviceID = result;
      } catch (error) {
        print('Error: $error');
      }

      String? getnews = await MyGlobalFunctions.PostCall(
        '{"MethodName":"getnews","UserID":"$Mobile","Password":"$Password", "AppType": " Apps"  }',
        "$deviceID",
      );

      final data = json.decode(getnews!);
      if (data["statuscode"] == "TXN") {
        List<dynamic> jsonList = json.decode(getnews)['data'];
        List<getnewss> newsList =
            jsonList.map((json) => getnewss.fromJson(json)).toList();
        setState(() {
          newsbanersArray = newsList;
        });
      } else {
        if (data["status"].toString() == "UnAuthorized Person") {
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        }
      }
    }
  }
}
