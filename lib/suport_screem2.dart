import 'dart:convert';

import 'package:bype_applections1/Globale_class/colors.dart';
import 'package:bype_applections1/Globale_class/companyinformationdata.dart';
import 'package:bype_applections1/Globale_class/shardPreferance.dart';
import 'package:bype_applections1/Json_model/company_logain_details_model.dart';
import 'package:bype_applections1/getsupport_models.dart';
import 'package:bype_applections1/globale_class.dart';
import 'package:bype_applections1/homnave_scree.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class SuportScreen2 extends StatefulWidget {
  const SuportScreen2({Key? key}) : super(key: key);

  @override
  State<SuportScreen2> createState() => _SuportScreen2State();
}

class _SuportScreen2State extends State<SuportScreen2> {
  List<Getsupport> getsuportArray = [];
  String apiResponseString = '';

  int currentIndex = 0; // Add this line to keep track of the current index

  @override
  void initState() {
    super.initState();
    _futureCompanyData = _assignCustomerData();
    fetchData();
  }

  late Future<CompanyData?> _futureCompanyData;
  Global globalInstance = Global();

  Future<CompanyData?> _assignCustomerData() async {
    return await globalInstance.getCompanyData();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.help_outline_outlined,
            color: AppColors.whiteColor,
            size: 22,
          ),
          SizedBox(
            width: w * 0.02,
          )
        ],
        backgroundColor: AppColors.PinkColors,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
          // onPressed: () => Navigator.of(context).pop(),o
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeNaveScreens(
                          index: 0,
                        )));
          },
        ),
        title: FutureBuilder<CompanyData?>(
          future: _futureCompanyData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final logoUrl = snapshot.data!.data![0].logo;
              return ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: Image.network(
                  "https://sonitechno.info/images/Company/$logoUrl",
                  height: 200,
                  width: 170,
                ),
              );
            }
          },
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the API response string as a Text widget
            SizedBox(height: 2.0),

            // Add CarouselSlider here
            CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                viewportFraction: 1.0,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: getsuportArray.map((support) {
                return Builder(
                  builder: (BuildContext context) {
                    return Card(
                      child: ListTile(
                        title: Html(
                          data: "Description: ${support.name ?? ""}",
                          style: {
                            "p": Style(
                              color: AppColors.blackColor,
                              fontSize: FontSize(13.0),
                            ),
                          },
                        ),
                        subtitle: Html(
                          data: "Description: ${support.description ?? ""}",
                          style: {
                            "p": Style(
                              color: AppColors.blackColor,
                              fontSize: FontSize(13.0),
                            ),
                          },
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            // Display the list of support items
            getsuportArray.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: getsuportArray.length,
                      itemBuilder: (context, index) {
                        var support = getsuportArray[index];
                        return Card(
                          child: ListTile(
                            title: Html(
                              data: "Description: ${support.name ?? ""}",
                              style: {
                                "p": Style(
                                  color: AppColors.blackColor,
                                  fontSize: FontSize(13.0),
                                ),
                              },
                            ),
                            subtitle: Html(
                              data: "Description: ${support.description ?? ""}",
                              style: {
                                "p": Style(
                                  color: AppColors.blackColor,
                                  fontSize: FontSize(13.0),
                                ),
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : CircularProgressIndicator(), // Show a loading indicator while data is being fetched
          ],
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    try {
      String? Mobile = await SharedPreferenceUtils.getValue("mob");
      String? Password = await SharedPreferenceUtils.getValue("pass");
      if (Mobile != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final getServiceList = await MyGlobalFunctions.PostCall(
          '{"MethodName":"getsupport","UserID":"$Mobile","Password":"$Password", "AppType": " Apps"  }',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(getServiceList!);
        if (data["statuscode"] == "TXN") {
          final List<dynamic> jsonList = data['data'];
          final List<Getsupport> serviceList =
              jsonList.map((json) => Getsupport.fromJson(json)).toList();
          setState(() {
            getsuportArray = serviceList;
            apiResponseString =
                getServiceList!; // Store the API response as a string
          });
        } else if (data["status"].toString() == "UnAuthorized Person") {
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        }
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
}
