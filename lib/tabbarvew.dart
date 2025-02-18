// ignore_for_file: non_constant_identifier_names, duplicate_ignore, prefer_const_literals_to_create_immutables, use_build_context_synchronously, empty_catches

import 'dart:convert';


import 'package:flutter/material.dart';
import 'Globale_class/shardPreferance.dart';
import 'Json_model/plannew.dart';
import 'globale_class.dart';



class TAbBarvew extends StatefulWidget {
  final Map<String, String> SearchData;

  const TAbBarvew(
      // ignore: non_constant_identifier_names
      {Key? key,
      required String searchTerm,
      required this.SearchData})
      : super(key: key);

  @override
  State<TAbBarvew> createState() => _TAbBarvewState();
}

class _TAbBarvewState extends State<TAbBarvew> {
  List<Plans> PlannewArray = [];

  @override
  void initState() {
    PlannewapiCall(widget.SearchData);
    super.initState();
    // Make sure you populate the searchData map before using it
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: h * 0.18,
            decoration: BoxDecoration(
              color: const Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                const BoxShadow(
                  color: Color.fromARGB(69, 143, 145, 135),
                  blurRadius: 4,
                ),
              ],
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: PlannewArray.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(PlannewArray[index].amount.toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> PlannewapiCall(Map<String, String> searchData) async {
   String? Mobile = await SharedPreferenceUtils.getValue("mob");
    String? Password = await SharedPreferenceUtils.getValue("pass");
    if (Mobile != null && Password != null) {
      String? deviceID = "";

      try {
        String? result = await MyGlobalFunctions.getId();
        deviceID = result;
      } catch (error) {}

      String? plannew = await MyGlobalFunctions.PostCall(
        '{"MethodName":"plannew","UserID":"$Mobile","Password":"$Password","OperatorID":"1","State":"19"}',
        "$deviceID",
      );

      final data = json.decode(plannew!);
      if (data["statuscode"] == "TXN") {
        List<dynamic> jsonList = json.decode(plannew)['data'];
        List<Plans> operatorsList =
            jsonList.map((json) => Plans.fromJson(json)).toList();

        setState(() {
          PlannewArray = operatorsList;
        });
      } else {
        if (data["status"].toString() == "UnAuthorized Person") {
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        }
      }
    }
  }
}
