// ignore_for_file: camel_case_types, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, avoid_print, unnecessary_null_comparison, unnecessary_brace_in_string_interps, non_constant_identifier_names, body_might_complete_normally_nullable, deprecated_member_use

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'Globale_class/colors.dart';
import 'Globale_class/shardPreferance.dart';
import 'Json_model/moneytransferhsitory_model.dart';
import 'globale_class.dart';

class MoneyTransferHistory_screen extends StatefulWidget {
  const MoneyTransferHistory_screen({Key? key}) : super(key: key);

  @override
  State<MoneyTransferHistory_screen> createState() =>
      _Rechargehistory_screenState();
}

class _Rechargehistory_screenState extends State<MoneyTransferHistory_screen> {
  TextEditingController filtterController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  double _kSize = 60.0;
  List<Map<String, dynamic>> numbers = [
    // Add more data here
  ];

  List<moneytransfeData> filteredItems = [];

  List<moneytransfeData> moneytransfeDataArray = [];

  bool isLoading = false;
  bool hasMore = true;
  int currentPage = 1;
  late ScrollController _controller;

  void filterItems(String query) {
    setState(() {
      filteredItems = moneytransfeDataArray
          .where((item) =>
              (item.addDate?.toLowerCase() ?? '')
                  .contains(query.toLowerCase()) ||
              (item.nAME?.toLowerCase() ?? '').contains(query.toLowerCase()) ||
              (item.transID?.toLowerCase() ?? '')
                  .contains(query.toLowerCase()) ||
              (item.lOGINID?.toLowerCase() ?? '').contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    fromDateController.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
    toDateController.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
    moneytransferhsitoryApi();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.help_outline,
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(
              width: w * 0.02,
            )
          ],
          backgroundColor: AppColors.PinkColors,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'MoneyTransfer History',
            style: const TextStyle(
                color: AppColors.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w800),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: h * 0.01),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: fromDateController,
                        decoration: InputDecoration(
                          labelText: "From date",
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                            setState(() {
                              fromDateController.text = formattedDate;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('From date is not selected'),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        controller: toDateController,
                        decoration: InputDecoration(
                          labelText: "To date",
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                            setState(() {
                              toDateController.text = formattedDate;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('To date is not selected'),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ElevatedButton(
                          onPressed: () {
                            String fromDate = fromDateController.text;
                            String toDate = toDateController.text;

                            if (fromDate.isNotEmpty && toDate.isNotEmpty) {
                              moneytransferhsitoryApi().then((value) {});
                            } else {
                              // Display a Snackbar indicating both dates should be selected
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Please select both From date and To date'),
                                ),
                              );
                            }
                          },
                          child: Text("Search"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.red,
              ),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (!isLoading &&
                        scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent) {
                      moneytransferhsitoryApi();
                      return true;
                    }
                    return false;
                  },
                  child: ListView.separated(
                    controller: _controller,
                    itemCount: filteredItems.length + (hasMore ? 1 : 0),
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      thickness: 3,
                      color: Colors.redAccent,
                    ),
                    itemBuilder: (context, index) {
                      GlobalKey containerKey = GlobalKey();
                      if (index < filteredItems.length) {
                        final item = filteredItems[index];
                        var styleFrom = ElevatedButton.styleFrom(
                          minimumSize: Size(70, 0),
                          backgroundColor: Color.fromARGB(255, 252, 254, 255)
                              .withOpacity(0.9),
                          elevation: 0.09,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: 3, horizontal: 14),
                        );
                        return RepaintBoundary(
                          key: containerKey,
                          child: Container(
                            color: AppColors.whiteColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    child: Icon(
                                      Icons.receipt_long,
                                    ),
                                  ),
                                  title: Text(
                                    item != null
                                        ? item.nAME.toString()
                                        : 'Operator Name', // Check if item is null before accessing its properties
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  subtitle: Text(
                                    item != null
                                        ? item.number.toString()
                                        : 'transID', // Check if item is null before accessing its properties
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  trailing: Text(
                                    item != null
                                        ? "₹${item.amount}"
                                        : 'Amount', // Check if item is null before accessing its properties
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '  Surcharge Transaction Details:',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: w * 0.052),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            " ₹ : ${item.msrno}",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.red,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          SizedBox(
                                            width: w * 0.052,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Bank Name: ${item.bankName}",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                              Text(
                                                "IFSC : ${item.ifsc}",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                              Text(
                                                "Sender Name : ${item.senderName}",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                              Text(
                                                "Sender Number : ${item.senderNumber}",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                              Text(
                                                "Texn ID : ${item.transID}",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                              Text(
                                                "Bank Rrn : ${item.rrn}",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.02),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'AddDate : ',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: ui.Color.fromARGB(
                                                    255,
                                                    244,
                                                    54,
                                                    92), // Change this color as per your requirement
                                              ),
                                            ),
                                            TextSpan(
                                              text: '${item.addDate}',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.black
                                                  // You don't need to specify color here to maintain the original color of item.addDate
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: item.status
                                                      .toString()
                                                      .toUpperCase() ==
                                                  "SUCCESS"
                                              ? Colors.green
                                              : (item.status
                                                          .toString()
                                                          .toUpperCase() ==
                                                      "PENDING"
                                                  ? Colors.orange
                                                  : Colors.red),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 1),
                                          minimumSize: Size(70, 0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(22),
                                          ),
                                        ),
                                        onPressed: () {
                                          // Logic for handling COMPLAINT button
                                        },
                                        child: Text(
                                          '${item.status}',
                                          style: TextStyle(
                                              color: AppColors.whiteColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: w * 0.038,
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: () {
                                          _shareContent(
                                            context,
                                            containerKey,
                                            index,
                                            Colors.red,
                                            AppColors.whiteColor,
                                          );
                                          // Call the function to share content
                                        },
                                        icon: Icon(
                                          Icons.share,
                                          color: Colors.blue,
                                          size: 14,
                                        ),
                                        label: Text(
                                          'Share',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        style: styleFrom,
                                      ),
                                      SizedBox(
                                        width: w * 0.03,
                                      ),
                                      ElevatedButton.icon(
                                        onPressed: () {
                                          _shareContent(
                                            context,
                                            containerKey,
                                            index,
                                            Colors.red,
                                            AppColors.whiteColor,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.print_disabled,
                                          color: Colors.black,
                                          size: 14,
                                        ),
                                        label: Text(
                                          'PRINT',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(70, 0),
                                          backgroundColor: ui.Color.fromARGB(
                                                  255, 252, 252, 252)
                                              .withOpacity(0.9),
                                          elevation: 0.09,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(22),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 14),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else if (filteredItems.isEmpty && !isLoading) {
                        return Center(
                          child: Text(
                            'No result found',
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      } else if (isLoading != false) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: LoadingAnimationWidget.discreteCircle(
                                  color: ui.Color.fromARGB(255, 18, 42, 180),
                                  size: _kSize,
                                  secondRingColor: Colors.orange,
                                  thirdRingColor: Colors.purple)),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Formfild() {
    TextFormField(
      onChanged: (value) {
        filterItems(value);
      },
      controller: filtterController,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Colors.blue,
        ),
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.pinkAccent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.pinkAccent,
          ),
        ),
        border: OutlineInputBorder(),
        labelText: ' Search Number...',
      ),
    );
  }
  // ignore: unused_element

  Future<void> moneytransferhsitoryApi() async {
    if (isLoading || !hasMore) return;

    setState(() {
      isLoading = true;
    });

    try {
      String? Mobile = await SharedPreferenceUtils.getValue("mob");
      String? Password = await SharedPreferenceUtils.getValue("pass");

      if (Mobile != null) {
        final deviceID = await MyGlobalFunctions.getId();
        var num = 10;
        final moneytransferhsitory = await MyGlobalFunctions.PostCall(
          '{"MethodName":"moneytransferhsitory","UserID":"$Mobile","Password":"$Password", "ToDate":"${toDateController.text}","Size":"${num}","Page":"${currentPage}","FromDate":"${fromDateController.text}"}',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(moneytransferhsitory!);
        if (data["statuscode"] == "TXN") {
          final List<dynamic> jsonList = data['data'];
          final List<moneytransfeData> serviceList =
              jsonList.map((json) => moneytransfeData.fromJson(json)).toList();

          setState(() {
            moneytransfeDataArray.addAll(serviceList);
            filteredItems = List.from(moneytransfeDataArray);

            currentPage++;
            isLoading = false;
          });

          if (serviceList.isEmpty) {
            setState(() {
              hasMore = false;
            });
          }
        } else if (data["status"].toString() == "UnAuthorized Person") {
          MyGlobalFunctions.showAlertDialog(
            context,
            "UnAuthorized Person!",
          );
          setState(() {
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
            // filteredItems = [];
          });
        }
      }
    } catch (error) {
      print('Error fetching data: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  // Function to share content
  void _shareContent(BuildContext context, GlobalKey containerKey, int index,
      Color containerColor, Color textColor) async {
    try {
      // Delay accessing the context until after the widget has been built
      await Future.delayed(Duration(milliseconds: 50));

      // Find the render object of the container
      RenderRepaintBoundary? boundary = containerKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary?;

      if (boundary == null) {
        print('Error: Render boundary is null');
        return;
      }

      // Capture the image
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Save the image to a temporary file
      final tempDir = await getTemporaryDirectory();
      final file =
          await File('${tempDir.path}/share_container_$index.png').create();
      await file.writeAsBytes(pngBytes);

      // Share the image file
      await Share.shareFiles([file.path],
          text: 'Check out this awesome ', subject: 'Share   contant history ');
    } catch (e) {
      print('Error sharing: $e');
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: MoneyTransferHistory_screen(),
  ));
}
