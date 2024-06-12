// // ignore_for_file: body_might_complete_normally_nullable, unused_local_variable

// import 'dart:convert';

// import 'package:demo/Json_model/checknumber_model.dart';
// import 'package:demo/Json_model/sendotp_model.dart';
// import 'package:demo/globale_class.dart';
// import 'package:flutter/material.dart';

// Future<Checknumber_model?> checknumberApi(
//     String mobile, BuildContext context, StateSetter setState,  String otp) async {
//   if (mobile != null) {
//     String? deviceID = "";

//     try {
//       String? result = await MyGlobalFunctions.getId();
//       deviceID = result;
//     } catch (error) {
//       print('Error: $error');
//     }
//     String? checknumber = await MyGlobalFunctions.PostCall(
//       '{"MethodName":"checknumber","Mobile":"$mobile"}',
//       "$deviceID",
//     );

//     final data = json.decode(checknumber!);
//     if (data["statuscode"] == "ERR") {
//       OtpPinApi(context, setState, mobile);

//       return Checknumber_model(data);
//     } else {
//       if (data["status"].toString() == "UnAuthorized Person") {}
//     }
//   }
// }

// //  OtpPinApi >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Future<void> OtpPinApi(
//   BuildContext context,
//   StateSetter setState,
//   String mobile,
// ) async {
//   String? otp;

//   try {
//     if (mobile != null) {
//       final deviceID = await MyGlobalFunctions.getId();

//       final getServiceList = await MyGlobalFunctions.PostCall(
//         '{"MethodName":"sendotp","MobileNo":"$mobile"}',
//         "$deviceID",
//       );

//       var data = json.decode(getServiceList!);

//       if (data["statuscode"] == "TXN") {
//         sendotp_model responseModel = sendotp_model.fromJson(data);
//         setState(() {
//           otp = responseModel.data?.oTP;
//           print(">>>>>>>>>>>>>>>>>>>${otp}");
//         });
//       }
//     }
//   } catch (error) {
//     print('Error fetching data: $error');
//   }
// }

// getactiveaepsbankapi>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// import 'dart:convert';
// import 'package:demo/Globale_class/shardPreferance.dart';
// import 'package:demo/Json_model/getactiveaepsbank_model.dart';
// import 'package:demo/globale_class.dart';
// import 'package:flutter/material.dart';

// List<getData> getactiveaepsbankArry = [];

// typedef StateSetter = void Function(void Function() fn);

// Future<void> getactiveaepsbankapi(
//     BuildContext context, StateSetter setState) async {
//   try {
//     String? mobile = await SharedPreferenceUtils.getValue("mob");
//     String? password = await SharedPreferenceUtils.getValue("pass");
//     if (mobile != null && password != null) {
//       final deviceID = await MyGlobalFunctions.getId();

//       final getactiveaepsbank = await MyGlobalFunctions.PostCall(
//         '{"MethodName":"getactiveaepsbank","UserID":"$mobile","Password":"$password", "AppType": " Apps"  }',
//         deviceID,
//       );

//       final Map<String, dynamic> data = json.decode(getactiveaepsbank!);
//       if (data["statuscode"] == "TXN") {
//         setState(() {
//           getactiveaepsbankArry = List<getData>.from(
//               data["data"].map((json) => getData.fromJson(json)).toList());
//         });
//       } else if (data["status"].toString() == "UnAuthorized Person") {
//         MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
//       }
//     }
//   } catch (error) {
//     print('Error fetching data: $error');
//   }

// //
//   Future<void> getservicelistapi() async {
//     try {
//       String? Mobile = await SharedPreferenceUtils.getValue("mob");
//       String? Password = await SharedPreferenceUtils.getValue("pass");
//       if (Mobile != null) {
//         final deviceID = await MyGlobalFunctions.getId();

//         final getServiceList = await MyGlobalFunctions.PostCall(
//           '{"MethodName":"getservicelist","UserID":"$Mobile ","Password":"$Password", "AppType": " Apps"  }',
//           "$deviceID",
//         );

//         final Map<String, dynamic> data = json.decode(getServiceList!);
//         if (data["statuscode"] == "TXN") {
//           final List<dynamic> jsonList = data['data'];
//           final List<listData> serviceList =
//               jsonList.map((json) => listData.fromJson(json)).toList();
//           setState(() {
//             bannersArray = serviceList;
//           });
//         } else if (data["status"].toString() == "UnAuthorized Person") {
//           MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
//         }
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//     }
//   }

// }

// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:bype_applections1/Globale_class/shardPreferance.dart';
import 'package:flutter/material.dart';


import '../Json_model/baner_model.dart';
import '../Json_model/getactiveaepsbank_model.dart';
import '../Json_model/paytm_home_model.dart';
import '../globale_class.dart';

class APIManager {
  List<getData> getactiveaepsbankArry = [];

  List<listData> bannersArray = [];
  List<listData>  registrationArray = [];


  Future<void> getactiveaepsbankapi(
      BuildContext context, void Function(VoidCallback) setState) async {
    try {
      String? mobile = await SharedPreferenceUtils.getValue("mob");
      String? password = await SharedPreferenceUtils.getValue("pass");
      if (mobile != null && password != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final getactiveaepsbank = await MyGlobalFunctions.PostCall(
          '{"MethodName":"getactiveaepsbank","UserID":"$mobile","Password":"$password", "AppType": " Apps"  }',
          deviceID,
        );

        final Map<String, dynamic> data = json.decode(getactiveaepsbank!);
        if (data["statuscode"] == "TXN") {
          setState(() {
            getactiveaepsbankArry = List<getData>.from(
                data["data"].map((json) => getData.fromJson(json)).toList());
          });
        } else if (data["status"].toString() == "UnAuthorized Person") {
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        }
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  Future<BannerHome?> getBanner(
      BuildContext context, void Function(VoidCallback) setState) async {
    try {
      String? Mobile = await SharedPreferenceUtils.getValue("mob");
      String? Password = await SharedPreferenceUtils.getValue("pass");
      if (Mobile != null) {
        String? deviceID = "";

        try {
          String? result = await MyGlobalFunctions.getId();
          deviceID = result;
        } catch (error) {
          print('Error: $error');
        }

        String? getbanner = await MyGlobalFunctions.PostCall(
          '{"MethodName":"getbanner","UserID":"$Mobile ","Password":"$Password", "AppType": " Apps"  }',
          "$deviceID",
        );

        final data = json.decode(getbanner!);
        if (data["statuscode"] == "TXN") {
          return BannerHome.fromJson(data);
        } else {
          if (data["status"].toString() == "UnAuthorized Person") {
            MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
          }
        }
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
    return null;
  }

  Future<void> getservicelistapi(
      BuildContext context, void Function(VoidCallback) setState) async {
    try {
      String? Mobile = await SharedPreferenceUtils.getValue("mob");
      String? Password = await SharedPreferenceUtils.getValue("pass");
      if (Mobile != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final getServiceList = await MyGlobalFunctions.PostCall(
          '{"MethodName":"getservicelist","UserID":"$Mobile ","Password":"$Password", "AppType": " Apps"  }',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(getServiceList!);
        if (data["statuscode"] == "TXN") {
          final List<dynamic> jsonList = data['data'];
          final List<listData> serviceList =
              jsonList.map((json) => listData.fromJson(json)).toList();
          setState(() {
            bannersArray = serviceList;
          });
        } else if (data["status"].toString() == "UnAuthorized Person") {
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        }
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  Future<void> registrationApi(
      BuildContext context,   String selectedBankName, String result) async {
    try {
      String? mobile = await SharedPreferenceUtils.getValue("mob");

      if (mobile != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final reistration = await MyGlobalFunctions.aepsPostCall(
          '{"MethodName":"reistration","UserID":"$mobile","data":"$result", "bankname": "$selectedBankName"}',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(reistration!);
        if (data["statuscode"] == "TXN") {
          MyGlobalFunctions.errorMessage(context, data["status"].toString());

        } else if (data["status"].toString() == "UnAuthorized Person") {
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        }
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }


  Future<void> aepsbalanceApi(
      BuildContext context,   String selectedBankName ) async {
    try {
      String? mobile = await SharedPreferenceUtils.getValue("mob");

      if (mobile != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final aepsbalance = await MyGlobalFunctions.aepsPostCall(
          '{"MethodName":"aepsbalance","UserID":"$mobile", "bankname": "$selectedBankName"}',
          "$deviceID",
        );

        // final Map<String, dynamic> data = json.decode(aepsbalance!);
        final Map<String, dynamic> data = json.decode(aepsbalance!);
        if (data["statuscode"] == "TXN") {
          MyGlobalFunctions.errorMessage(context, data["status"].toString());

        } else if (data["status"].toString() == "UnAuthorized Person") {
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        }
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
  Future<void> athenticateApi(
      BuildContext context, String selectedBankName,String result) async {
    try {
      String? mobile = await SharedPreferenceUtils.getValue("mob");

      if (mobile != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final athenticate = await MyGlobalFunctions.aepsPostCall(
          '{"MethodName":"athenticate","UserID":"$mobile","data":"$result", "bankname": "$selectedBankName"}',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(athenticate!);
        if (data["statuscode"] == "TXN") {
          MyGlobalFunctions.errorMessage(context, data["status"].toString());

        } else if (data["status"].toString() == "UnAuthorized Person") {
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        }
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }



}
