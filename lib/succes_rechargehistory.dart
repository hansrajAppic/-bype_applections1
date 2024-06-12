// ignore_for_file: non_constant_identifier_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_final_fields, deprecated_member_use, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, file_names

import 'dart:io';
import 'dart:ui' as ui;

import 'package:bype_applections1/Globale_class/companyinformationdata.dart';
import 'package:bype_applections1/Json_model/company_logain_details_model.dart';
import 'package:bype_applections1/Json_model/historyrepot.dart';
import 'package:bype_applections1/Widget_Class/costem_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'Globale_class/colors.dart';

class Success_rechargehistory extends StatefulWidget {
  final List<Datahistory> filteredItems;

  Success_rechargehistory({required this.filteredItems});
  // final Recharge_succfuly Data;

  //  Success_rechargehistory({required this.Data});

  @override
  State<Success_rechargehistory> createState() =>
      _Success_rechargehistorytate();
}

class _Success_rechargehistorytate extends State<Success_rechargehistory> {
  ScreenshotController screenshotController = ScreenshotController();
  // int downloadProgress = 0;

  GlobalKey _globalKey = GlobalKey();

  Future<void> _sharePageContent() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final directory = (await getApplicationDocumentsDirectory()).path;
      File imgFile = File('$directory/payment_successful.png');
      await imgFile.writeAsBytes(pngBytes);

      Share.shareFiles([imgFile.path], text: 'Payment successful!');
    } catch (e) {
      print("Error sharing content: $e");
    }
  }

  String apiResponseString = '';

  int currentIndex = 0; // Add this line to keep track of the current index

  @override
  void initState() {
    super.initState();
    _futureCompanyData = _assignCustomerData();
  }

  final GlobalKey _containerKey = GlobalKey();
  late Future<CompanyData?> _futureCompanyData;
  Global globalInstance = Global();

  Future<CompanyData?> _assignCustomerData() async {
    return await globalInstance.getCompanyData();
  }

  File? _profileImage;

  Future _pickProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => _profileImage = imageTemporary);
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final items = widget.filteredItems;
    // Recharge_succfuly items = widget.Data;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      // appBar: AppBar(
      //   actions: [
      //     Icon(
      //       Icons.help_outline_outlined,
      //       color: AppColors.whiteColor,
      //       size: 22,
      //     ),
      //     SizedBox(
      //       width: w * 0.02,
      //     )
      //   ],
      //   backgroundColor: AppColors.PinkColors,
      //   automaticallyImplyLeading: true,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      //   title: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       // Text(
      //       //   "Transaction successfully",
      //       //   style: const TextStyle(
      //       //       color: AppColors.whiteColor,
      //       //       fontSize: 13,
      //       //       fontWeight: FontWeight.w400),
      //       // ),
      //       Text(
      //         'Transaction ${items[0].status}',
      //         style: TextStyle(
      //             color: AppColors.whiteColor,
      //             fontSize: 13,
      //             fontWeight: FontWeight.w400),
      //       ),
      //       Text(
      //         ' ${items[0].addDate}',
      //         style: TextStyle(
      //             color: AppColors.whiteColor,
      //             fontSize: 13,
      //             fontWeight: FontWeight.w400),
      //       )
      //     ],
      //   ),
      // ),
      // appBar: AppBar(
      //   actions: [
      //     Text(
      //       "Share",
      //       style: TextStyle(fontSize: 14, color: Colors.blue),
      //     ),
      //     SizedBox(
      //       width: w * 0.03,
      //     ),
      //   ],
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, color: AppColors.blackColor),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      //   title: Text(
      //     //
      //     "",
      //     style: const TextStyle(
      //         color: AppColors.blackColor,
      //         fontSize: 17,
      //         fontWeight: FontWeight.bold),
      //   ),
      //   leadingWidth: 28,
      // ),

      body: SingleChildScrollView(
        child: RepaintBoundary(
          key: _containerKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                leadingIcon: Icons.arrow_back,
                leadingIconColor: AppColors.whiteColor,
                onLeadingPressed: () => Navigator.of(context).pop(),
                backgroundColor: AppColors.Buttancolour,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Transaction ${items.isNotEmpty ? items[0].status : ''}',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      ' ${items.isNotEmpty ? items[0].addDate : ''}',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.help_outline_outlined,
                      color: AppColors.whiteColor,
                    ),
                    onPressed: () {
                      // Handle help action
                      // For example, you can show a dialog with help information
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Help'),
                          content: Text('This is the help content.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.DivaiderblackColor),
                    boxShadow: [
                      const BoxShadow(
                        color: Color.fromARGB(69, 143, 145, 135),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.028, vertical: h * 0.02),
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Amount",
                            style: const TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w800),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Center align horizontally
                            crossAxisAlignment: CrossAxisAlignment
                                .center, // Center align vertically
                            children: [
                              Text(
                                '₹ ${items.isNotEmpty ? items[0].amount : "amount"}',
                                style: TextStyle(
                                  fontSize: 23,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: w * 0.02,
                              ),
                              Icon(
                                Icons.check_circle,
                                color: const Color.fromARGB(255, 11, 81, 15),
                                size: 32,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '₹ ' +
                                    NumberToWordsEnglish.convert(
                                        items[0].amount?.toInt() ??
                                            0), // Convert amount to words
                                style: TextStyle(
                                  color: AppColors.Buttancolour,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),

                              // Text(
                              //   "Rupees Nineteen Only",
                              //   style: const TextStyle(
                              //       color: AppColors.blackColor,
                              //       fontSize: 13,
                              //       fontWeight: FontWeight.w400),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: h * 0.036,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: Colors.blue,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    "Split this Payment",
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: w * 0.03),
                              Container(
                                alignment: Alignment.center,
                                height: h * 0.036,
                                decoration: BoxDecoration(
                                  color: Color(0xffe1f7ec),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: AppColors.DivaiderblackColor,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: w * 0.02),
                                    Icon(
                                      Icons.mode_edit,
                                      size: 18,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      child: Text(
                                        "Add Tag",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: h * 0.02),
                          Divider(
                            color: AppColors.DivaiderblackColor,
                          ),
                          SizedBox(height: h * 0.0001),
                          SizedBox(height: h * 0.02),
                          Text(
                            "For",
                            style: const TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Recharge of ${items[0].oPERATORNAME}",
                                    style: const TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${items[0].mobileno}",
                                    style: const TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              // Example text widget before the conditional logo
                              if (items[0].logo != null)
                                Image.network(
                                  items[0].logo!,
                                  width: 45,
                                  height: 45,
                                ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: h * 0.036,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: AppColors.Skygray,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    "View Details",
                                    style: const TextStyle(
                                      color: AppColors.Buttancolour,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: w * 0.03),
                              Container(
                                alignment: Alignment.center,
                                height: h * 0.036,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: AppColors.Skygray,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      child: Text(
                                        "View History",
                                        style: const TextStyle(
                                          color: AppColors.Skygray,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: h * 0.02),
                          Divider(
                            color: AppColors.DivaiderblackColor,
                          ),
                          SizedBox(height: h * 0.02),
                          Text(
                            "From",
                            style: const TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${items[0].sERVICENAME}",
                                    style: const TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons
                                            .account_balance_wallet, // Replace with your wallet icon
                                        color: AppColors
                                            .skyblue, // Adjust color as needed
                                      ),
                                      SizedBox(
                                          width:
                                              8), // Adjust spacing between icon and label
                                      Text(
                                        'Wallet', // Label for the wallet
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors
                                              .blackColor, // Adjust color as needed
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Comm',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              '₹2.2',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ]),
                                      SizedBox(
                                        width: w * 0.02,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Transaction Details:',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            "Service Name : ${items[0].sERVICENAME}",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          Text(
                                            "User ID : ${items[0].lOGINID}",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          Text(
                                            "Operator ID : ${items[0].apimessage}",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          Text(
                                            "Txn ID : ${items[0].apitransid}",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          SizedBox(
                                            height: h * 0.001,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // Text(
                                  //   // "${items.Balance}",
                                  //   "",
                                  //   style: const TextStyle(
                                  //       color: AppColors.blackColor,
                                  //       fontSize: 12,
                                  //       fontWeight: FontWeight.w500),
                                  // ),
                                  // SizedBox(height: 15),
                                  // Text(
                                  //   // "${items.DateTime}",
                                  //   "",
                                  //   style: const TextStyle(
                                  //       color: AppColors.blackColor,
                                  //       fontSize: 12,
                                  //       fontWeight: FontWeight.w500),
                                  // ),
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   crossAxisAlignment:
                                  //       CrossAxisAlignment.start,
                                  //   children: [
                                  //     Text(
                                  //       // "${items.TransactionID}",
                                  //       "",
                                  //       style: const TextStyle(
                                  //           color: AppColors.blackColor,
                                  //           fontSize: 12,
                                  //           fontWeight: FontWeight.w500),
                                  //     ),
                                  //     SizedBox(width: 10),
                                  //     Text(
                                  //       "Copy",
                                  //       style: const TextStyle(
                                  //           color: Colors.blue,
                                  //           fontSize: 12,
                                  //           fontWeight: FontWeight.w400),
                                  //     ),
                                  //   ],
                                  // ),
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   crossAxisAlignment:
                                  //       CrossAxisAlignment.start,
                                  //   children: [
                                  //     Text(
                                  //       // "${items.OPID}",
                                  //       "",
                                  //       style: const TextStyle(
                                  //           color: AppColors.blackColor,
                                  //           fontSize: 12,
                                  //           fontWeight: FontWeight.w500),
                                  //     ),
                                  //     SizedBox(width: 10),
                                  //     Text(
                                  //       "Copy",
                                  //       style: const TextStyle(
                                  //           color: Colors.blue,
                                  //           fontSize: 12,
                                  //           fontWeight: FontWeight.w400),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                              SizedBox(
                                width: w * 0.18,
                                height: h * 0.1,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey.shade200,
                                  backgroundImage: _profileImage != null
                                      ? FileImage(_profileImage!)
                                      : null,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 3,
                                        right: 3,
                                        child: GestureDetector(
                                          onTap: _pickProfileImage,
                                          child: const Icon(
                                            Icons.camera_alt_sharp,
                                            color: Color.fromARGB(
                                                255, 182, 208, 237),
                                            size: 25,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Divider(
                            color: AppColors.DivaiderblackColor,
                          ),
                          SizedBox(height: h * 0.02),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.Buttancolour,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    padding: EdgeInsets.all(8),
                                    child: Icon(
                                      MdiIcons.share,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.Buttancolour,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    padding: EdgeInsets.all(8),
                                    child: Icon(
                                      MdiIcons.send,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _shareContent(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.Buttancolour,
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      padding: EdgeInsets.all(8),
                                      child: Icon(
                                        MdiIcons.history,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Send Again",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.Buttancolour,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "View History",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.Buttancolour,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Share Receipt",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.Buttancolour,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // ElevatedButton(
                          //   onPressed: _sharePageContent,
                          //   child: Text('Share Payment '),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: h * 0.06, // Adjusted height
        child: Container(
          alignment: Alignment.center,
          color: Color.fromARGB(255, 191, 215, 234),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Powered",
                    style: TextStyle(fontSize: 9),
                  ),
                  Text(
                    "         by",
                    style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(width: 8), // Add some space between columns
              FutureBuilder<CompanyData?>(
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
              SizedBox(width: 8), // Add some space between columns
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Payments", style: TextStyle(fontSize: 9)),
                  Text("Bank", style: TextStyle(fontSize: 9)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _shareContent(BuildContext context) async {
    try {
      await Future.delayed(Duration(milliseconds: 50));

      RenderRepaintBoundary? boundary = _containerKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary?;

      if (boundary == null) {
        print('Error: Render boundary is null');
        return;
      }

      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/share_image.png').create();
      await file.writeAsBytes(pngBytes);

      await Share.shareFiles([file.path],
          text: 'Check out this awesome image!', subject: 'Share Example');
    } catch (e) {
      print('Error sharing: $e');
    }
  }
}
