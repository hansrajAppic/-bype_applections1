// ignore: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

import 'demt_screen.dart';
import 'demt_transction2.dart';


void main() {
  runApp(const DemtTransaction());
}

class DemtTransaction extends StatelessWidget {
  const DemtTransaction({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(scaffoldBackgroundColor: Colors.white
          // primarySwatch: Colors.blue,
        ),
        home: const Home(),
      );
    });
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double h = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        toolbarHeight: 40,
        title: const Text(
          "Confirmation",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DemtScreen()));
          },
          child: const Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Screenshot(
            controller: screenshotController, child: shareComponent()),
      ),
    );
  }

  Widget shareComponent() {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
        height: 100.h,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.03),
          child: Column(children: [
            SizedBox(
              height: h * 0.046,
            ),
            Column(children: [
              const Center(
                child: Text(
                  "Transaction Successful!",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
              SizedBox(
                height: h * 0.023,
              ),
              Container(
                height: h * 0.04,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromARGB(255, 228, 224, 226),
                          Color.fromARGB(255, 202, 220, 241),
                        ]),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(69, 143, 145, 135),
                        blurRadius: 4,
                      ),
                    ]),
                child: const Center(
                  child: Text(
                    "Transaction ID :1365317729",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.023,
              ),
              Text(
                "${currentDate}",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54),
              ),
              SizedBox(
                height: h * 0.023,
              ),
              Container(
                child: Stack(children: [
                  Container(
                    height: h * 0.4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffFFFFFF),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(69, 143, 145, 135),
                            blurRadius: 4,
                          ),
                        ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: h * 0.1,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Payee Name",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "idsyesbank",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.018,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Payee Bank Name",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "YES BANK LTD",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.018,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "To Account No.",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "XXXXXXXXXXX0321",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.018,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "From Account No.",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "XXXXXXXX2987",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.018,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Amount",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Fifty Thousand Rupees",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.018,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Only",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Payment Type",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.018,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "IMPS",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Remarks",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      height: h * 0.11,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color.fromARGB(255, 183, 197, 224),
                              Color(0xffE4D8CC),
                              Color(0xffE4D8CC),
                            ]),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: h * 0.1,
                              width: w * 0.12,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Center(
                                child: Image.asset(
                                  "assets/images/phone recharge.png",
                                  height: 20,
                                ),
                              ),
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Total Amount Transfered",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                  "₹50,000",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Container(
                              height: h * 0.1,
                              width: w * 0.11,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: const Stack(children: [
                                Positioned(
                                  top: 8,
                                  child: Icon(Icons.near_me_disabled_rounded,
                                      color:
                                      Color.fromARGB(255, 148, 227, 150)),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ))
                ]),
              ),
              SizedBox(
                height: h * 0.028,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      WidgetToImage.createImageFromWidget(
                        shareComponent(),
                        wait: const Duration(microseconds: 5),
                        // imageSize: Size(50.w, 20.h),
                        // logicalSize: Size(50.w, 20.h),
                      ).then((Uint8List? imageBytes) async {
                        if (imageBytes != null) {
                          final tempDir = await getExternalStorageDirectory();
                          final file =
                          await File('${tempDir!.path}/shareImage.png')
                              .create();
                          await file.writeAsBytes(imageBytes);
                          await Share.shareXFiles([XFile(file.path)], text: "");
                        } else {
                          // Handle the case when image conversion fails
                        }
                      });
                    },
                    child: Container(
                        height: h * 0.06,
                        width: w * 0.42,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: const Color(0xffFFFFFF),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(69, 143, 145, 135),
                                blurRadius: 4,
                              ),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.share,
                              size: 14,
                            ),
                            const Text(
                              "Share Receipt",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 86, 68, 189)),
                            ),
                            SizedBox(
                              width: w * 0.04,
                            ),
                          ],
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      screenshotController
                          .capture(delay: const Duration(seconds: 7))
                          .then((capturedImage) async {
                        ShowCapturedWidget(context, capturedImage!);
                        _saved(capturedImage);
                      }).catchError((onError) {
                        // ignore: avoid_print
                        print(onError);
                      });

                      if (!downloading) {
                        startDownload();
                      }
                    },
                    child: downloading
                        ? const CircularProgressIndicator(
                      valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.blue),
                    )
                        : Container(
                      height: h * 0.06,
                      width: w * 0.42,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: const Color(0xffFFFFFF),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(69, 143, 145, 135),
                              blurRadius: 4,
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.download,
                            size: 14,
                          ),
                          SizedBox(
                            width: w * 0.02,
                          ),
                          const Text(
                            "Download Receipt",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 86, 68, 189)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.073,
              ),
              SizedBox(
                height: h * 0.06,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)), backgroundColor: const Color(0xff6485B0)
                      // Backg // Background color

                    ),
                    child: const Center(
                      child: Text(
                        'Make New Payment',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ]),
        ));
  }

  void downloadCouse() async {
    isDownloadStarted = true;
    isDownloadFinish = false;
    downloadProgress = 0;
    setState(() {
      while (downloadProgress < 100) {
        downloadProgress += 10;
        setState(() {
          if (downloadProgress == 100) {
            isDownloadStarted = true;
            isDownloadFinish = false;
            setState(() {});
          }
        });
      }
    });
  }

  // ignore: non_constant_identifier_names
  Future<dynamic> ShowCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        // appBar: AppBar(
        //   title: Text("Captured widget screenshot"),
        // ),
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          toolbarHeight: 40,
          title: const Text(
            "Confirmation",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DemtScreen()));
            },
            child: const Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          // ignore: unnecessary_null_comparison
            child: capturedImage != null
                ? Image.memory(capturedImage)
                : Container()),
      ),
    );
  }

  _saved(image) async {
    // ignore: unused_local_variable
    final result = await ImageGallerySaver.saveImage(image);
    // ignore: avoid_print
    print("File Saved to Gallery");
  }
}
