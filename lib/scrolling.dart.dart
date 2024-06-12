// ignore_for_file: unused_import, prefer_const_constructors, library_private_types_in_public_api, non_constant_identifier_names, use_build_context_synchronously, duplicate_ignore, avoid_print

import 'dart:convert'; // Import dart:convert for JSON parsing



import 'package:flutter/material.dart';
import 'Globale_class/shardPreferance.dart';

import 'Json_model/historyrepot.dart'; // Import your history report model
import 'globale_class.dart'; // Import your global functions
import 'splesh_screen.dart'; // Import your SplashScreen if necessary

void main() {
  runApp(Kkkk());
}

class Kkkk extends StatelessWidget {
  const Kkkk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinite Scrolling Pagination',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InfiniteScrollingPage(),
    );
  }
}

class InfiniteScrollingPage extends StatefulWidget {
  const InfiniteScrollingPage({Key? key}) : super(key: key);

  @override
  _InfiniteScrollingPageState createState() => _InfiniteScrollingPageState();
}

class _InfiniteScrollingPageState extends State<InfiniteScrollingPage> {
  List<Datahistory> historyData = [];
  bool isLoading = false;
  bool hasMore = true;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    if (isLoading || !hasMore) return;

    setState(() {
      isLoading = true;
    });

    try {
    String? Mobile = await SharedPreferenceUtils.getValue("mobile");
      // ignore: non_constant_identifier_names
      String? Password = await SharedPreferenceUtils.getValue("password");
      if (Mobile != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final historyreport = await MyGlobalFunctions.PostCall(
          '{"MethodName":"historyreport","UserID":"$Mobile","Password":"$Password","DateTo":"","SERVICEID": "1", "DateFrom": "","Status":"Success","PageNo": "$currentPage"}',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(historyreport!);
        if (data["statuscode"] == "TXN") {
          final List<dynamic> jsonList = data['data'];
          final List<Datahistory> serviceList =
              jsonList.map((json) => Datahistory.fromJson(json)).toList();

          setState(() {
            historyData.addAll(serviceList);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite Scrolling Pagination'),
      ),
      body: Column(
        children: [
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
              child: ListView.builder(
                itemCount: historyData.length + (hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < historyData.length) {
                    final item = historyData[index]; // Get the current item
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(color: Colors.brown),
                        child: ListTile(
                          title: Text('Amount: ${item.amount}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Mobile No: ${item.mobileno}'),
                              Text('AddDate: ${item.addDate}'),
                              Text('DisputeStatus: ${item.disputeStatus}'),
                              Text('SERVICENAME: ${item.sERVICENAME}'),
                              Text('LOGINID: ${item.lOGINID}'),
                              Text('Operator Name: ${item.oPERATORNAME}'),
                              if (item.status !=
                                  null) // Check if status is not null
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        
                                     
                                      },
                                      child: Text('Success'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                      
                                      },
                                      child: Text('Dispute'),
                                    ),
                                  ],
                                ),
                              if (item.status ==
                                  null) // Check if status is "False"
                                ElevatedButton(
                                  onPressed: () {
                                    // Logic for handling Failed button
                                  },
                                  child: Text('Failed'),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
