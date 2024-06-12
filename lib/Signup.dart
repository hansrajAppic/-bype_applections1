// // ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

// import 'dart:async';
// import 'dart:convert';

// import 'package:demo/Json_model/checknumber_model.dart';
// import 'package:demo/Json_model/getrollist_model.dart';
// import 'package:demo/Json_model/sendotp_model.dart';
// import 'package:demo/Widget_Class/costem_textformfild.dart';
// import 'package:demo/careat_account.dart';
// import 'package:demo/globale_class.dart';
// import 'package:easy_loading_button/easy_loading_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pinput/pinput.dart';

// class DestubuterRegistration
// extends StatefulWidget {
//   @override
//   _MyStepperState createState() => _MyStepperState();
// }

// class _MyStepperState extends State<DestubuterRegistration
//> {
//   bool isLoading = true;
//   bool showTextFormField = false; // Add this line

//   @override
//   void initState() {
//     getrolelistApi();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           Icon(
//             Icons.help_outline_outlined,
//             size: 22,
//           ),
//           SizedBox(
//             width: w * 0.02,
//           )
//         ],
//         backgroundColor: Colors.pink,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           'Registration',
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
//         ),
//       ),
//       body: FutureBuilder<List<rollidlist>>(
//         future: getrolelistApi(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             return buildListView(snapshot.data!);
//           }
//         },
//       ),
//     );
//   }

//   Widget buildListView(List<rollidlist> getrolelistarry) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//     return Stack(
//       children: [
//         Align(
//           alignment: Alignment.topCenter,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'I AM Interested \n          in',
//                 style: TextStyle(
//                   fontSize: 29.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(
//                 height: h * 0.1,
//               ),
//               SizedBox(
//                 height: 300,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   shrinkWrap: true,
//                   itemCount: getrolelistarry.length,
//                   itemBuilder: (context, index) {
//                     final item = getrolelistarry[index];
//                     return GestureDetector(
//                       // Wrap the item with GestureDetector
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => TextFormPage(
//                               selectedItem: item.name.toString(),
//                               getrolelistarry: getrolelistarry,
//                             ),
//                           ),
//                         );
//                       },
//                       child: SizedBox(
//                         width:
//                             150, // Adjust the width of each column according to your needs
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.account_circle,
//                               size: 40,
//                               color: Colors.blue,
//                             ),
//                             // Add space between icon and text
//                             Text(
//                               item.name.toString(),
//                               textAlign: TextAlign.center,
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//         Positioned(
//           bottom: 0,
//           left: 0,
//           right: 0,
//           child: Image.asset(
//             'assets/images/made.png',
//             fit: BoxFit.cover,
//             height: 150,
//           ),
//         ),
//       ],
//     );
//   }

//   Future<List<rollidlist>> getrolelistApi() async {
//     try {
//       final deviceID = await MyGlobalFunctions.getId();
//       final getServiceList = await MyGlobalFunctions.PostCall(
//         '{"MethodName":"getrolelist"}',
//         "$deviceID",
//       );
//       final Map<String, dynamic> data = json.decode(getServiceList!);
//       if (data["statuscode"] == "TXN") {
//         final List<dynamic> jsonList = data['data'];
//         final List<rollidlist> serviceList =
//             jsonList.map((json) => rollidlist.fromJson(json)).toList();
//         return serviceList;
//       } else if (data["status"].toString() == "UnAuthorized Person") {
//         MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
//         return [];
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//       throw error;
//     }
//     return [];
//   }
// }
//
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:async';
import 'dart:convert';


import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'Globale_class/colors.dart';
import 'Json_model/checknumber_model.dart';
import 'Json_model/getrollist_model.dart';
import 'Json_model/sendotp_model.dart';
import 'Widget_Class/costem_textformfild.dart';
import 'careat_account.dart';
import 'globale_class.dart';

class DestubuterRegistration
 extends StatefulWidget {
  @override
  _MyStepperState createState() => _MyStepperState();
}

class _MyStepperState extends State<DestubuterRegistration
> {
  late Future<List<rollidlist>> _roleListFuture;

  @override
  void initState() {
    super.initState();
    _roleListFuture = getRoleListApi();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
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
        backgroundColor: AppColors.PinkColors,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Registration',
          style: const TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
      ),
      // appBar: AppBar(
      //   actions: [
      //     Icon(
      //       Icons.help_outline_outlined,
      //       size: 22,
      //     ),
      //     SizedBox(
      //       width: MediaQuery.of(context).size.width * 0.02,
      //     )
      //   ],
      //   backgroundColor: Colors.pink,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      //   title: Text(
      //     'Registration',
      //     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
      //   ),
      // ),
      body: FutureBuilder<List<rollidlist>>(
        future: _roleListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return buildListView(snapshot.data!);
          }
        },
      ),
    );
  }

  Widget buildListView(List<rollidlist> roleList) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'I AM Interested \n          in',
                style: TextStyle(
                  fontSize: 29.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: roleList.length,
                  itemBuilder: (context, index) {
                    final item = roleList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TextFormPage(
                              selectedItem: item.name.toString(),
                              roleList: roleList,
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.account_circle,
                              size: 40,
                              color: Colors.blue,
                            ),
                            Text(
                              item.name.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/images/made.png',
            fit: BoxFit.cover,
            height: 150,
          ),
        ),
      ],
    );
  }
}

Future<List<rollidlist>> getRoleListApi() async {
  try {
    final deviceID = await MyGlobalFunctions.getId();
    final getServiceList = await MyGlobalFunctions.PostCall(
      '{"MethodName":"getrolelist"}',
      "$deviceID",
    );
    final Map<String, dynamic> data = json.decode(getServiceList!);
    if (data["statuscode"] == "TXN") {
      final List<dynamic> jsonList = data['data'];
      final List<rollidlist> roleList =
          jsonList.map((json) => rollidlist.fromJson(json)).toList();
      return roleList;
    }
  } catch (error) {
    print('Error fetching data: $error');
    throw error;
  }
  return [];
}

class TextFormPage extends StatefulWidget {
  final String selectedItem;
  final List<rollidlist> roleList;

  TextFormPage({required this.selectedItem, required this.roleList});

  @override
  _TextFormPageState createState() => _TextFormPageState();
}

class _TextFormPageState extends State<TextFormPage> {
  bool isLoading = false;
  String? otp;
  TextEditingController registmobileController = TextEditingController();
  TextEditingController otppinController = TextEditingController();

  // Now, mobile variable holds the value entered in the text field

  bool showOTP = false;
  final focusNode = FocusNode();
  int _secondsRemaining = 60;
  bool _resendButtonEnabled = false;

  String? _validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    } else if (value.length != 10) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }

  String? _validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter OTP';
    } else if (value.length != 6) {
      return 'OTP must be 6 digits';
    }
    return null;
  }

  final _formKey = GlobalKey<FormState>();
  late Timer _timer;
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
    setState(() {
      _secondsRemaining = 60;
      _resendButtonEnabled = false;
      startTimer();
    });
  }

  @override
  void initState() {
    otppinController.clear();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    otppinController.dispose();
    otppinController.clear();
    super.dispose();
  }

  Future<void> onButtonPressed(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(milliseconds: 3000));
    if (_formKey.currentState!.validate()) {
      checknumberApi(registmobileController.text);
      resendOTP();
      // await checknumberApi(
      //     registmobileController.text, context, setState, otp!);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
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
        backgroundColor: AppColors.PinkColors,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Registration',
          style: const TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
      ),

      // appBar: AppBar(
      //   actions: [
      //     Icon(
      //       Icons.help_outline_outlined,
      //       size: 22,
      //     ),
      //     SizedBox(
      //       width: w * 0.02,
      //     )
      //   ],
      //   backgroundColor: Colors.pink,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      //   title: Text(
      //     'Registration',
      //     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' ${widget.selectedItem}',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 20.0),
                CustomTextFormFild(
                  validator: _validateMobile,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  myController: registmobileController,
                  labelText: 'Mobile Number',
                  hintText: 'Enter your mobile number',
                  myIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    setState(() {
                      showOTP = value.length >= 10;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                Visibility(
                  visible: showOTP,
                  child: Column(
                    children: [
                      Text(
                        "Enter your valid OTP Number ",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2596be)),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Phone Number: ',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 13),
                            ),
                            TextSpan(
                              text: registmobileController.text ?? "",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color.fromARGB(255, 6, 76, 133),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Pinput(
                          keyboardType: TextInputType.number,
                          controller: otppinController,
                          focusNode: focusNode,
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                          listenForMultipleSmsOnAndroid: true,
                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          onCompleted: (String pin) async {
                            if (otp != null && otp.toString() == pin) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreateAccount(
                                    selectedItem: widget.selectedItem,
                                    getrolelistarry: widget.roleList,
                                    mobile: registmobileController.text,
                                  ),
                                ),
                              );

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
                            // Your code to handle the completion of OTP input
                          },
                          onChanged: (code) {
                            // Your code when the OTP changes
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
                      SizedBox(
                        height: h * 0.01,
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
                                  color: Colors.black,
                                ),
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
                                          color: Color(0xff2596be),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              else
                                TextSpan(
                                  text:
                                      'Resend OTP in $_secondsRemaining seconds',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: EasyButton(
                    idleStateWidget: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    loadingStateWidget: const CircularProgressIndicator(
                      strokeWidth: 3.0,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                    useWidthAnimation: true,
                    useEqualLoadingStateWidgetDimension: true,
                    width: double.infinity,
                    height: 40.0,
                    borderRadius: 4.0,
                    contentGap: 6.0,
                    buttonColor: Colors.green,
                    onPressed:
                        isLoading ? null : () => onButtonPressed(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void assignMobile() {
    String Mobile;

    // Get the text from the TextEditingController
    Mobile = registmobileController.text;
  }

  Future<Checknumber_model?> checknumberApi(String Mobile) async {
    print(" Mobile>>>>>>>>>>>>>$Mobile");

    if (Mobile != null) {
      String? deviceID = "";

      try {
        String? result = await MyGlobalFunctions.getId();
        deviceID = result;
      } catch (error) {
        print('Error: $error');
      }
      String? checknumber = await MyGlobalFunctions.PostCall(
        '{"MethodName":"checknumber","Mobile":"$Mobile"}',
        "$deviceID",
      );

      final data = json.decode(checknumber!);
      if (data["statuscode"] == "ERR") {
        _OtpPinApi(Mobile);

        return Checknumber_model(data);
      } else {
        if (data["status"].toString() == "UnAuthorized Person") {}
      }
    }
  }

  Future<sendotp_model?> _OtpPinApi(String Mobile) async {
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

  // Future<sendotp_model?> _OtpPinApi(String Mobile) async {
  //   try {
  //     if (Mobile != null) {
  //       final deviceID = await MyGlobalFunctions.getId();

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
