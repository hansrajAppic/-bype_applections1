// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'Globale_class/colors.dart';
import 'pay_recharge_screen.dart';


class PaidSuccessfullyss extends StatefulWidget {
  final Recharge_succfuly Data;

  PaidSuccessfullyss({required this.Data});

  @override
  State<PaidSuccessfullyss> createState() => _PaidSuccessfullyState();
}

class _PaidSuccessfullyState extends State<PaidSuccessfullyss> {
  ScreenshotController screenshotController = ScreenshotController();
  // int downloadProgress = 0;
  bool isDownloadStarted = false;
  bool isDownloadFinish = false;
  String currentDate =
      DateFormat('EEEEE-dd-MM-yyyy-hh:mm:ss a').format(DateTime.now());
  String todayDate = DateFormat('yMd').format(DateTime.now());

  bool downloading = false;
  double downloadProgress = 0.0;
  void startDownload() {
    // Simulate a download process
    setState(() {
      downloading = true;
    });

    // Add your actual download logic here

    // Simulate download completion after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        downloading = false;
      });
      // Add any post-download logic here
    });
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
    Recharge_succfuly items = widget.Data;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text(
            "Share",
            style: TextStyle(fontSize: 14, color: Colors.blue),
          ),
          SizedBox(
            width: w * 0.03,
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.blackColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "${items.Message}",
          style: const TextStyle(
              color: AppColors.blackColor,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
        leadingWidth: 28,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h * 0.024),
            Expanded(
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
                          "${items.Amount}",
                          style: const TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .start, // Center align horizontally
                          crossAxisAlignment: CrossAxisAlignment
                              .center, // Center align vertically
                          children: [
                            Text(
                              "₹19",
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
                              "Rupees Nineteen Only",
                              style: const TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${items.OPERATORNAME}",
                                  style: const TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${items.Number}",
                                  style: const TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              maxRadius: 23,
                              backgroundColor:
                                  Color.fromARGB(255, 241, 232, 232),
                              child: Image.asset(
                                "assets/images/1680513572airtel-png.png",
                                height: 30,
                              ),
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
                                  color: Colors.blue,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "View Details",
                                  style: const TextStyle(
                                    color: Colors.blue,
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
                                  color: Colors.blue,
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
                                        color: Colors.blue,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Member",
                                  style: const TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Wallet",
                                  style: const TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "${items.Balance}",
                                  style: const TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  "${items.DateTime}",
                                  style: const TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${items.TransactionID}",
                                      style: const TextStyle(
                                          color: AppColors.blackColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Copy",
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${items.OPID}",
                                      style: const TextStyle(
                                          color: AppColors.blackColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Copy",
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                Container(
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
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.Buttancolour,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    MdiIcons.setSplit,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    "Split Expense",
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
                        )
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
      bottomNavigationBar: SizedBox(
        height: h * 0.06, // Adjusted height
        child: Container(
          alignment: Alignment.center,
          color: Color.fromARGB(255, 191, 215, 234),
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .center, // Align children horizontally at the center
            crossAxisAlignment: CrossAxisAlignment
                .center, // Align children vertically at the center
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Paytm",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                ],
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
}
