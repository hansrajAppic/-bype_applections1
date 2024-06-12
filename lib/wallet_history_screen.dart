// ignore_for_file: camel_case_types, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, avoid_print, unnecessary_null_comparison, unnecessary_brace_in_string_interps, non_constant_identifier_names, deprecated_member_use, body_might_complete_normally_nullable

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
import 'Json_model/ewallethistor_model.dart';
import 'globale_class.dart';

class WalletHistory extends StatefulWidget {
  const WalletHistory({Key? key}) : super(key: key);

  @override
  State<WalletHistory> createState() => _Rechargehistory_screenState();
}

class _Rechargehistory_screenState extends State<WalletHistory> {
  TextEditingController filtterController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  double _kSize = 60.0;
  List<Map<String, dynamic>> numbers = [
    // Add more data here
  ];

  List<ewallethDatalist> filteredItems = [];

  List<ewallethDatalist> ewallethistoryArry = [];

  bool isLoading = false;
  bool hasMore = true;
  int currentPage = 1;
  late ScrollController _controller;

  void filterItems(String query) {
    setState(() {
      filteredItems = ewallethistoryArry
          .where((item) =>
              (item.addDate?.toLowerCase() ?? '')
                  .contains(query.toLowerCase()) ||
              (item.nAME?.toLowerCase() ?? '').contains(query.toLowerCase()) ||
              (item.transactionID?.toLowerCase() ?? '')
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
    // ewallethistoryApi();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor:AppColors.whiteColor,
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
            'Wallet History',
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
                              ewallethistoryApi().then((value) {});
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
                      ewallethistoryApi();
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
                        return RepaintBoundary(
                          key: containerKey,
                          child: Container(
                            color: AppColors.whiteColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "OPENING BALANCE",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Text(
                                          "₹ ${item.openBalance}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w800,
                                              color: AppColors.redColor),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "DEBIT AMOUNT",
                                          style: TextStyle(
                                            color: AppColors.redColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Text(
                                          "₹ ${item.amount}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w800,
                                              color: AppColors.redColor),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "CURRENT BLANCE",
                                          style: TextStyle(
                                            color: AppColors.greenColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Text(
                                          " ₹${item.bALANCE}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w800,
                                              color: AppColors.greenColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
                                        ? item.lOGINID.toString()
                                        : 'Mobile No', // Check if item is null before accessing its properties
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
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.02),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                        "Type : ${item.factor}",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        "Txn ID : ${item.transactionID}",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        "NARRATION : ${item.nARRATION}",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        "Date  : ${item.addDate}",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        "TDescription : ${item.description}",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(
                                        height: h * 0.001,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.02),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.green,
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
                                          'CREDIT',
                                          style: TextStyle(
                                              color:AppColors.whiteColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      SizedBox(width: w * 0.02),
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
                                          _shareContent(context, containerKey,
                                              index, Colors.red, AppColors.whiteColor,
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
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(70, 0), backgroundColor: Color.fromARGB(255, 252, 254, 255)
                                                  .withOpacity(0.9),
                                          elevation: 0.09,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(22),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 14),
                                        ),
                                      ),
                                      SizedBox(
                                        width: w * 0.03,
                                      ),
                                      ElevatedButton.icon(
                                        onPressed: () {
                                          _shareContent(context, containerKey,
                                              index, Colors.red, AppColors.whiteColor,
                                          );
                                          // Call the function to share content
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
                                          minimumSize: Size(70, 0), backgroundColor: ui.Color.fromARGB(
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

  Future<void> ewallethistoryApi() async {
    if (isLoading || !hasMore) return;

    setState(() {
      isLoading = true;
    });

    try {
   String? Mobile = await SharedPreferenceUtils.getValue("mob");
      String? Password = await SharedPreferenceUtils.getValue("pass");

      if ( Mobile  != null) {
        final deviceID = await MyGlobalFunctions.getId();
        var num = 10;
        final historyreport = await MyGlobalFunctions.PostCall(
          '{"MethodName":"ewallethistory","UserID":"$Mobile ","Password":"$Password", "ToDate":"${toDateController.text}","Size":"${num}","Page":"${currentPage}","FromDate":"${fromDateController.text}"}',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(historyreport!);
        if (data["statuscode"] == "TXN") {
          final List<dynamic> jsonList = data['data'];
          final List<ewallethDatalist> serviceList =
              jsonList.map((json) => ewallethDatalist.fromJson(json)).toList();

          setState(() {
            ewallethistoryArry.addAll(serviceList);
            filteredItems = List.from(ewallethistoryArry);

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
            filteredItems = [];
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
    home: WalletHistory(),
  ));
}
