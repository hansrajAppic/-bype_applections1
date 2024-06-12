import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:bype_applections1/Globale_class/colors.dart';
import 'package:bype_applections1/Globale_class/shardPreferance.dart';
import 'package:bype_applections1/Json_model/historyrepot.dart';
import 'package:bype_applections1/globale_class.dart';
import 'package:bype_applections1/succes_rechargehistory.dart';
// import 'package:demo/Globale_class/colors.dart';
// import 'package:demo/Globale_class/shardPreferance.dart';
// import 'package:demo/Json_model/historyrepot.dart';
// import 'package:demo/globale_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class Rechargehistory_screen extends StatefulWidget {
  const Rechargehistory_screen({Key? key}) : super(key: key);

  @override
  State<Rechargehistory_screen> createState() => _Rechargehistory_screenState();
}

class _Rechargehistory_screenState extends State<Rechargehistory_screen> {
  TextEditingController filtterController = TextEditingController();
  double _kSize = 60.0;
  List<Map<String, dynamic>> numbers = [
    // Add more data here
  ];

  List<Datahistory> filteredItems = [];

  List<Datahistory> historyData = [];
  bool isLoading = false;
  bool hasMore = true;
  int currentPage = 1;
  late ScrollController _controller;

  void filterItems(String query) {
    setState(() {
      filteredItems = historyData
          .where((item) =>
              (item.mobileno?.toLowerCase() ?? '')
                  .contains(query.toLowerCase()) ||
              (item.transID?.toLowerCase() ?? '')
                  .contains(query.toLowerCase()) ||
              (item.lOGINID?.toLowerCase() ?? '')
                  .contains(query.toLowerCase()) ||
              (item.oPERATORNAME?.toLowerCase() ?? '')
                  .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
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
        backgroundColor: Colors.pinkAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Richarge history',
          style: const TextStyle(
            color: AppColors.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.0, vertical: h * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            ),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (!isLoading &&
                      scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent) {
                    fetchData();
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
                              ListTile(
                                leading: item.logo != null
                                    ? Image.network(
                                        item.logo!,
                                        width: 50,
                                        height: 50,
                                      )
                                    : Container(),
                                title: Text(
                                  item.oPERATORNAME.toString(),
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                subtitle: Text(
                                  item.mobileno.toString(),
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                trailing: Text(
                                  " ₹${item.amount}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 0.024),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          "Service Name : ${item.sERVICENAME}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Text(
                                          "User ID : ${item.lOGINID}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Text(
                                          "Operator ID : ${item.apimessage}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Text(
                                          "Txn ID : ${item.apitransid}",
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
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 0.02),
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
                                        'COMPLAINT',
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 14),
                                      ),
                                    ),
                                    SizedBox(width: w * 0.02),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
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
                                          onPressed: () {},
                                          child: Text(
                                            ' ${item.status}',
                                            style: TextStyle(
                                                color: AppColors.whiteColor,
                                                fontSize: 14),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Visibility(
                                          visible: item.status == "Success",
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              backgroundColor: item
                                                          .disputeStatus
                                                          .toString()
                                                          .toUpperCase() ==
                                                      "DISPUTE"
                                                  ? Colors.green //
                                                  : (item.disputeStatus
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
                                              _showConfirmationDialog(context,
                                                  item.transID.toString());
                                            },
                                            child: Text(
                                              ' ${item.disputeStatus}',
                                              style: TextStyle(
                                                  color: AppColors.whiteColor,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: w * 0.038,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(70, 0),
                                        backgroundColor:
                                            Color.fromARGB(255, 252, 254, 255)
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
                                      width: w * 0.02,
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.blue,
                                          minimumSize: Size(70, 0),
                                          // You can add more styling properties here as needed
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        Success_rechargehistory(
                                                            filteredItems:
                                                                filteredItems)),
                                          );
                                        },
                                        child: Text(
                                          "History",
                                          style: TextStyle(fontSize: 16),
                                        ))
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
                    } else {
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
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.redAccent,
        child: Icon(
          Icons.room,
        ),
      ),
    );
  }

  // ignore: unused_element

  void _showConfirmationDialog(BuildContext context, String item) {
    bool isLoading = false;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text("Confirm Action"),
              content: Text("Are you sure you want to perform this action?"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text("Cancel"),
                ),
                isLoading
                    ? CircularProgressIndicator() // Show loading indicator when isLoading is true
                    : TextButton(
                        onPressed: isLoading
                            ? null
                            : () async {
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  await Future.delayed(Duration(seconds: 1));
                                  disputeApi(item);

                                  Navigator.of(context).pop();
                                } catch (error) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  print("Error occurred: $error");
                                }
                              },
                        child: Text("Confirm"),
                      ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> disputeApi(String TransID) async {
    setState(() {
      isLoading = true;
    });

    try {
      String? Mobile = await SharedPreferenceUtils.getValue("mob");
      String? Password = await SharedPreferenceUtils.getValue("pass");
      if (Mobile != null) {
        final deviceID = await MyGlobalFunctions.getId();
        final dispute = await MyGlobalFunctions.PostCall(
          '{"MethodName":"dispute","UserID":"$Mobile","Password":"$Password", "TransID":"$TransID",}',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(dispute!);

        if (data["statuscode"] == "TXN") {
          MyGlobalFunctions.errorMessage(context, data["status"].toString());
        } else {
          MyGlobalFunctions.errorMessage(context, data["status"].toString());
        }
      }
    } catch (error) {
      // Handle the error here
      print('Error in AmountShowApi(): $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> fetchData() async {
    if (isLoading || !hasMore) return;

    setState(() {
      isLoading = true;
    });

    try {
      String? Mobile = await SharedPreferenceUtils.getValue("mob");
      String? Password = await SharedPreferenceUtils.getValue("pass");
      if (Mobile != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final historyreport = await MyGlobalFunctions.PostCall(
          '{"MethodName":"historyreport","UserID":"$Mobile","Password":"$Password","DateTo":"","SERVICEID": "1", "DateFrom": "","Status":"Success","PageNumber": "$currentPage","PageSize":"10"}',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(historyreport!);
        if (data["statuscode"] == "TXN") {
          final List<dynamic> jsonList = data['data'];
          final List<Datahistory> serviceList =
              jsonList.map((json) => Datahistory.fromJson(json)).toList();

          setState(() {
            historyData.addAll(serviceList);
            filteredItems = List.from(historyData);

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
          text: 'Check out this awesome Recharge history!',
          subject: 'Share   contant history ');
    } catch (e) {
      print('Error sharing: $e');
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: Rechargehistory_screen(),
  ));
}
