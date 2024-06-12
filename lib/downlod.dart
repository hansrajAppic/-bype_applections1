// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:bype_techno_projects1/Json_model/sendotp_model.dart';
// import 'package:bype_techno_projects1/globale_class.dart';
// import 'package:bype_techno_projects1/Globale_class/shardPreferance.dart';

// class OTPScreen extends StatefulWidget {
//   @override
//   _OTPScreenState createState() => _OTPScreenState();
// }

// class _OTPScreenState extends State<OTPScreen> {
//   bool _isLoading = false;
//   List<TextEditingController> controllers =
//       List.generate(4, (_) => TextEditingController());

//   String getCombinedValue() {
//     return controllers.map((controller) => controller.text).join();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Verify OTP")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: List.generate(4, (index) => buildOTPField(index)),
//             ),
//             ElevatedButton(
//               onPressed: _submitOTP,
//               child: Text("Verify OTP"),
//             ),
//             if (_isLoading) CircularProgressIndicator(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildOTPField(int index) {
//     return SizedBox(
//       width: 50,
//       child: TextField(
//         controller: controllers[index],
//         keyboardType: TextInputType.number,
//         textAlign: TextAlign.center,
//         maxLength: 1,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           counterText: "",
//         ),
//         onChanged: (value) {
//           if (value.length == 1 && index < 3) {
//             FocusScope.of(context).nextFocus();
//           } else if (value.length == 0 && index > 0) {
//             FocusScope.of(context).previousFocus();
//           }
//         },
//       ),
//     );
//   }

//   Future<void> _submitOTP() async {
//     SendOtpModel? otpModel = await _OtpPinApi();
//     if (otpModel != null && otpModel.data?.oTP == getCombinedValue()) {
//       Navigator.pushReplacementNamed(
//           context, '/home'); // Navigate on successful verification
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("Invalid OTP")));
//     }
//   }

//   Future<SendOtpModel?> _OtpPinApi() async {
//     setState(() => _isLoading = true);

//     try {
//       String? userDataPref = await SharedPreferenceUtils.getValue('mobileKey');
//       String? deviceID = await MyGlobalFunctions.getId();

//       var requestJson = json.encode({
//         "MethodName": "sendotp",
//         "MobileNo": userDataPref,
//       });

//       String? response =
//           await MyGlobalFunctions.PostCall(requestJson, deviceID!);

//       if (response != null) {
//         var data = json.decode(response);
//         if (data["statuscode"] == "TXN") {
//           return SendOtpModel.fromJson(data);
//         } else {
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text(data["status"].toString())));
//         }
//       }
//     } catch (error) {
//       print('Error: $error');
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Failed to verify OTP')));
//     } finally {
//       setState(() => _isLoading = false);
//     }
//     return null;
//   }
// }
