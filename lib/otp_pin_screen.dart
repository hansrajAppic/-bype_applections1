// ignore_for_file: unused_field, prefer_const_constructors, camel_case_types, unused_element, prefer_is_empty, avoid_print, body_might_complete_normally_nullable, unused_local_variable, non_constant_identifier_names, duplicate_ignore, unnecessary_brace_in_string_interps

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'Globale_class/colors.dart';
import 'Globale_class/shardPreferance.dart';
import 'Json_model/sendotp_model.dart';
import 'globale_class.dart';
import 'homnave_scree.dart';

class OTPPINScreen extends StatefulWidget {
  const OTPPINScreen({super.key});

  @override
  State<OTPPINScreen> createState() => _Authenticate_screenState();
}

class _Authenticate_screenState extends State<OTPPINScreen> {
  // ignore: non_constant_identifier_names
  var Pin = true;
  bool _isLoading = false;
  String? otp;
  List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());

  final _formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  final focusNode = FocusNode();
  late Timer _timer;
  String? formattedMobileNumber;
  int _secondsRemaining = 60;
  bool _resendButtonEnabled = false;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _resendButtonEnabled = true;
          _timer.cancel();
        }
      });
    });
  }

  void resendOTP() {
    _OtpPinApi();
    setState(() {
      _secondsRemaining = 60;
      _resendButtonEnabled = false;
      startTimer();
    });
  }

  // Implement logic to resend OTP

  @override
  void initState() {
    super.initState();
    _OtpPinApi();
    _fetchMobileNumber();
    resendOTP();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _doSomething() {}
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Verification",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h * 0.02,
              ),
              SizedBox(
                height: h * 0.013,
              ),
              Container(
                height: h * 0.4,
                width: w * double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/otp.png"),
                    fit: BoxFit
                        .cover, // This will cover the whole widget/container
                  ),
                ),
              ),
              Text(
                "OTP has been sent on your registered",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              RichText(
                text: TextSpan(
                  // Use the default text style of the context for the overall RichText
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    // First part of the text in brown
                    TextSpan(
                      text: 'Phone Number: ',
                      style: TextStyle(color: Colors.black54, fontSize: 13),
                    ),

                    TextSpan(
                      text:
                          formattedMobileNumber ?? "No mobile number available",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color.fromARGB(255, 6, 76, 133),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Directionality(
                  // Specify direction if desired
                  textDirection: TextDirection.ltr,
                  child: Pinput(
                    keyboardType: TextInputType.number,
                    controller: otpController,
                    focusNode: focusNode,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,
                    listenForMultipleSmsOnAndroid: true,
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    onCompleted: (String pin) async {
                      if (otp != null && otp.toString() == pin) {
                        _submitOTP();

                        // Show success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Verification is successful"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        // Show error message for invalid OTP
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Invalid OTP entered."),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    onChanged: (code) {
                      // debugPrint('onChanged: $value');
                    },
                    cursor: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 9),
                          width: 22,
                          height: 1,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                  child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                      text: "Didn't Receive Code?",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    if (_resendButtonEnabled)
                      WidgetSpan(
                          child: TextButton(
                        onPressed: () => resendOTP(),
                        child: Padding(
                          padding: EdgeInsets.only(top: h * 0.02),
                          child: Text(
                            'Resend Now',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color(0xff2596be)),
                          ),
                        ),
                      ))
                    else
                      TextSpan(
                        text: 'Resend OTP in $_secondsRemaining seconds',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                  ],
                ),
              )),
              SizedBox(
                height: h * 0.1,
              ),
              TextButton(
                onPressed: () async {
                  _OtpPinApi();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff76b5c5),
                  minimumSize: Size(
                    MediaQuery.of(context).size.width * double.infinity,
                    48,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(
                  "SUBMIT",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitOTP() async {
    setState(() {
      _isLoading = true;
    });

    try {
      String? Mobile = await SharedPreferenceUtils.getValue("mob");
      String? Password = await SharedPreferenceUtils.getValue("pass");

      if (Mobile != null && Password != null) {
        String combinedValue = getCombinedOtp();
        String? deviceID;

        try {
          deviceID = await MyGlobalFunctions.getId();
          print("API data: $deviceID");
        } catch (error) {
          print('Error getting device ID: $error');
        }

        String requestJson =
            '{"MethodName":"verifyuserinotherphone","UserID":"$Mobile","Password": "$Password","LoginPin":"$combinedValue", "AppType": " Apps"  }';
        String? verifyuserinotherphones = await MyGlobalFunctions.PostCall(
          requestJson,
          "$deviceID",
        );

        print("API Response: $verifyuserinotherphones");

        final data = json.decode(verifyuserinotherphones!);
        SharedPreferenceUtils.setValue(
            "loginResponse", verifyuserinotherphones);

        if (data["statuscode"] == "TXN") {
          navigatiDeshbordscreen();
        } else {
          // Handle other cases if needed
        }
      }
    } catch (error) {
      print('Error: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void navigatiDeshbordscreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeNaveScreens(
                  index: 0,
                )));
  }

  String getCombinedOtp() {
    return controllers.map((controller) => controller.text).join();
  }

  Future<void> _fetchMobileNumber() async {
    String? Mobile = await SharedPreferenceUtils.getValue("mob");

    setState(() {
      formattedMobileNumber = _formatMobileNumber(Mobile);
    });
  }

  String _formatMobileNumber(String? number) {
    if (number == null || number.length <= 2) {
      return number ?? "";
    }
    return number.replaceRange(0, number.length - 2, 'x' * (number.length - 2));
  }

//

  Future<sendotp_model?> _OtpPinApi() async {
    String? Mobile = await SharedPreferenceUtils.getValue("mob");
    try {
      if (Mobile != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final getServiceList = await MyGlobalFunctions.PostCall(
          '{"MethodName":"sendotp","MobileNo":"$Mobile"}',
          "$deviceID",
        );

        var data = json.decode(getServiceList!);

        if (data["statuscode"] == "TXN") {
          sendotp_model responseModel = sendotp_model.fromJson(data);
          setState(() {
            otp = responseModel.data?.oTP;
            print(">>>>>>>>>>>>>>>>>>>${otp}");
          });
        }
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
  // Future<sendotp_model?> _OtpPinApi() async {
  //   try {
  //     String? Mobile = await SharedPreferenceUtils.getValue("mob");

  //     if (Mobile != null) {
  //       final deviceID = await MyGlobalFunctions.getId();
  //       String combinedValue = getCombinedOtp();

  //       final getServiceList = await MyGlobalFunctions.PostCall(
  //         '{"MethodName":"sendotp","MobileNo":"$Mobile"}',
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
}
