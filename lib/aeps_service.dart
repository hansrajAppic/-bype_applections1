// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_constructors

import 'dart:developer';


import 'package:mantra_biometric/mantra_biometric.dart';

import 'Globale_class/checknumberapi.dart';
import 'Globale_class/colors.dart';
import 'Json_model/getactiveaepsbank_model.dart';
import 'Widget_Class/costem_dailogbox.dart';

import 'cash_withdraw.dart';
import 'change_device.dart';
import 'package:flutter/material.dart';

import 'package:mantra_biometric/utils/mantra_plugin_exception.dart';


class ApesService_Screen extends StatefulWidget {
  final String selectedItem;
  final getData data;

  ApesService_Screen({required this.selectedItem, required this.data});
  @override
  State<ApesService_Screen> createState() => _ApesService_ScreenState();
}

class _ApesService_ScreenState extends State<ApesService_Screen> {
  // final _mantraBiometricPlugin = MantraBiometric();

  bool registration = true;
  APIManager apiManager = APIManager();




  //
  // @override
  // void initState() {
  //
  //   super.initState();
  //
  //
  //   // WidgetsBinding.instance.addPostFrameCallback((_) {
  //   //   // apiManager.registrationApi(context, setState, selectedBankName);
  //   //   apiManager.aepsbalanceApi(context, widget.selectedItem);});
  //
  //
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     // apiManager.registrationApi(context, setState, selectedBankName);
  //     apiManager.getactiveaepsbankapi(context, setState);
  //     _showAlertDialog();
  //   });
  //
  //
  //   //
  //   // if (registration ==true) {
  //   //   apiManager.athenticateApi(context,  selectedBankName, result);
  //   // }
  //   // else{
  //   //   apiManager.registrationApi(context,  selectedBankName, result);
  //   // }
  //
  // }
  //
  // displyAlert(String message) {
  //   showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             content: Text(message),
  //           ));
  // }
  //
  // String result = "";
  //
  // getDeviceInfo() async {
  //   try {
  //     String output = await _mantraBiometricPlugin.getDeviceInformation() ?? "";
  //     result = output;
  //     setState(() {});
  //   } on RDClientNotFound catch (e) {
  //     displyAlert("Install Clinet");
  //   } catch (e) {
  //     displyAlert("Something Went Wrong");
  //   }
  // }
  //
  // scanFingerPrint() async {
  //   try {
  //     String wadh = "";
  //     String pidOptions =
  //         "<PidOptions ver=\"1.0\"> <Opts fCount=\"1\" fType=\"2\" pCount=\"0\" format=\"0\" pidVer=\"2.0\" wadh=\"$wadh\" timeout=\"20000\"  posh=\"UNKNOWN\" env=\"P\" /> </PidOptions>";
  //     result = await _mantraBiometricPlugin.captureFingerPrint(
  //             pidOptions: pidOptions) ??
  //         "";
  //
  //     setState(() {});
  //   } on RDClientNotFound catch (e) {
  //     log("${e.code}");
  //     displyAlert("Install Client");
  //   } catch (e) {
  //     displyAlert("Something Went Wrong ${e.runtimeType} $e");
  //   }
  // }

  //


  final _mantraBiometricPlugin = MantraBiometric();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showAlertDialog();
    });
    super.initState();
  }

  displyAlert(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(message),
        ));
  }

  String result = "";

  getDeviceInfo() async {
    try {
      String output = await _mantraBiometricPlugin.getDeviceInformation() ?? "";
      result = output;
      setState(() {});
    } on RDClientNotFound catch (e) {
      displyAlert("Install Clinet");
    } catch (e) {
      displyAlert("Something Went Wrong");
    }
  }

  scanFingerPrint() async {
    try {
      String wadh = "";
      String pidOptions =
          "<PidOptions ver=\"1.0\"> <Opts fCount=\"1\" fType=\"2\" pCount=\"0\" format=\"0\" pidVer=\"2.0\" wadh=\"$wadh\" timeout=\"20000\"  posh=\"UNKNOWN\" env=\"P\" /> </PidOptions>";
      result = await _mantraBiometricPlugin.captureFingerPrint(
          pidOptions: pidOptions) ??
          "";

      setState(() {});
    } on RDClientNotFound catch (e) {
      log("${e.code}");
      displyAlert("Install Clinet");
    } catch (e) {
      displyAlert("Something Went Wrong ${e.runtimeType} $e");
    }
  }

  List<Map<String, dynamic>> Arraitam = [
    {
      "title": "Cash Withdraw",
      "icon": Icons.account_balance,
      "color": Colors.red
    },
    {
      "title": "Mini Statement",
      "icon": Icons.book_online_outlined,
      "color": Colors.blue
    },
    {
      "title": "Balance enquiry",
      "icon": Icons.account_balance_wallet,
      "color": Colors.pinkAccent
    },
    {
      "title": "Aadhar Pay",
      "icon": Icons.request_quote,
      "color": Colors.orange
    },
    {
      "title": "Change Device",
      "icon": Icons.device_hub_outlined,
      "color": Colors.purple
    },
  ];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 244, 230, 230),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.blackColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Text(widget.selectedItem),
        ],
        title:  TextButton(onPressed: (){

          apiManager.registrationApi(context, widget.selectedItem,result);
        }, child: Text("data")),

        // title: Image.asset(
        //   "assets/images/aps_logo_glyph.png",
        //   height: 25,
        // ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$result"),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffFFFFFF),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(69, 143, 145, 135),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/file (1).png"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: h * 0.0029),
                          child: Text(
                            "Transact with over ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0b5285),
                            ),
                          ),
                        ),
                        Text(
                          " 80+ banks",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff0b5285),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.0037,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(221, 247, 223, 223),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.02, vertical: h * 0.005),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Branchless Banking ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Image.asset(
                                  "assets/images/aps_logo_glyph.png",
                                  height: 12,
                                ),
                                SizedBox(
                                  width: w * 0.02,
                                ),
                                Image.asset(
                                  "assets/images/Icics.png",
                                  height: 22,
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "Selected Device: null",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(69, 143, 145, 135),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: Arraitam.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      if (index < 4) {
                                        return CashWithdraw();
                                      } else {
                                        return ChangeDevice();
                                      }
                                    },
                                  ),
                                );
                              },
                              child: GridTile(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      child: Icon(
                                        Arraitam[index]['icon'],
                                        size: 20,
                                        color: Arraitam[index]['color'],
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      Arraitam[index]['title'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text("$result"),
              TextButton(onPressed: (){
              apiManager.registrationApi(context, widget.selectedItem,result);
              }, child: Text("data")),
            ],
          ),
        ),
      ),
    );
  }

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: Icon(
            Icons.fingerprint_outlined,
            size: 70,
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 32,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 58, 56, 56), width: 1),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: MaterialButton(
                  onPressed: getDeviceInfo,
                  child: Text(
                    "Get Device Information",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 38,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(69, 143, 145, 135),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: MaterialButton(
                  onPressed: scanFingerPrint,
                  child: Text(
                    "Scan Finger Print",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Text(
              //   "Result: $result",
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ],
          ),
          // onClosePressed: () {
          //   Navigator.of(context).pop(); // Dismiss the dialog
          // },
        );
      },
    );
  }
}
