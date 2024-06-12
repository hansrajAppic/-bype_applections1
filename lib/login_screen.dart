// ignore_for_file: camel_case_types, library_private_types_in_public_api, non_constant_identifier_names, unused_field, avoid_print, unused_local_variable, use_build_context_synchronously, prefer_const_constructors, deprecated_member_use, no_leading_underscores_for_local_identifiers, body_might_complete_normally_nullable, unused_element, unnecessary_null_comparison, prefer_final_fields, annotate_overrides, unnecessary_brace_in_string_interps

import 'dart:async';
import 'dart:convert';

import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import 'Globale_class/colors.dart';
import 'Globale_class/shardPreferance.dart';
import 'Json_model/baner_model.dart';
import 'Json_model/checknumber_model.dart';
import 'Json_model/sendotp_model.dart';
import 'Services/loginservice.dart';
import 'Signup.dart';
import 'Widget_Class/costem_textformfild.dart';
import 'Widget_Class/customelevatedButton.dart';
import 'Widget_Class/forgetpasswod.dart';
import 'globale_class.dart';
import 'otp_pin_screen.dart';

class Logain_screen extends StatefulWidget {
  const Logain_screen({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<Logain_screen> {
  String getCombinedOtp() {
    return controllers.map((controller) => controller.text).join();
  }

  List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());

  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController oldpasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  final TextEditingController mobileotpController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  String? otp;
  String? mobile;

  List<Map<String, dynamic>> IconListArray = [
    {"image": "assets/images/whatsapp-png-logo-1.png"},
    {
      "image":
          "assets/images/pngtree-twitter-social-media-round-icon-png-image_6315985.png"
    },
    {"image": "assets/images/Facebook_Logo_2023 (1).png"},
    {"image": "assets/images/insta.png"},
  ];
  late Timer _timer;

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
    _OtpPinApi(mobileController.text);
    setState(() {
      _secondsRemaining = 60;
      _resendButtonEnabled = false;
      startTimer();
    });
  }

  String _formatMobileNumber(String? number) {
    if (number == null || number.length <= 2) {
      return number ?? "";
    }
    return number.replaceRange(0, number.length - 2, 'x' * (number.length - 2));
  }

  bool _passwordVisible = true;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final String _password = '';
  bool _isVisible = false;
  bool _isVisible1 = false;

  dynamic SignUpResponse = [];

  final TextEditingController _phoneNumberController = TextEditingController();
  List<BannerListData> banners = [];

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length > 15) {
      return 'Password must be at least 15 characters';
    }
    return null;
  }

  String? _validateMobail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    } else if (value.length > 10) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }

  // static const String KEYLOGIN = "Login";

  String? deviceID = '';
  String? results = '';

  final LoginService _authService = LoginService();
  Future<void> LoginApi(String mobile, String password) async {
    setState(() {
      _isLoading = true;
    });
    try {
      String responsData = await _authService.Login(mobile, password);

      final data = json.decode(responsData);
      Map<String, dynamic> userJson = json.decode(responsData);

      if (data["statuscode"] == "TXN") {
        navigatelogain_Scr(context);
      } else {
        if (data["status"].toString() == "UnAuthorized Person") {
          navigatelogain_Scr(context);
        } else {
          MyGlobalFunctions.errorMessage(context, data["status"].toString());
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

  void navigatelogain_Scr(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OTPPINScreen()),
    );
  }

  Future<void> GetCompanyData() async {
    String? deviceID = await MyGlobalFunctions.getId();

    String requestBody =
        '{"MethodName":"getcompanydetails", "AppType": " Apps"  }';

    try {
      String? responsData =
          await MyGlobalFunctions.PostCall(requestBody, deviceID);
      final data = json.decode(responsData!);
      Map<String, dynamic> companyJSON = json.decode(responsData);

      await SharedPreferenceUtils.setValue("GetCompanyDetails", responsData);

      if (data["statuscode"] == "TXN") {
      } else if (data["status"] != null) {}
    } catch (error) {
      print('Error: $error');
    } finally {}
  }

  @override
  initState() {
    super.initState();

    GetCompanyData();
    resendOTP();
  }

  void dispose() {
    pinController.dispose();
    newpasswordController.dispose();
    oldpasswordController.dispose();
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/login (1).png"),
                fit: BoxFit.cover),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Form(
              // autovalidateMode: AutovalidateMode.always,
              key: _formKey,
              child: Stack(
                children: [
                  Container(),
                  Container(
                    padding: const EdgeInsets.only(left: 35, top: 130),
                    child: const Text(
                      'Welcome\nBack',
                      style:
                          TextStyle(color: AppColors.whiteColor, fontSize: 33),
                    ),
                  ),
                  SingleChildScrollView(
                    controller: ScrollController(),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 27, right: 35),
                            child: Column(
                              children: [
                                Center(
                                  child: !_isLoading
                                      ? const Text("")
                                      : const CircularProgressIndicator(),
                                ),
                                TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  // controller: mobileController,
                                  controller: mobileController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      // suffixIcon: const Icon(
                                      //   Icons.phone_callback,
                                      //   color: Colors.blue,
                                      // ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isVisible1 = !_isVisible1;
                                          });
                                        },
                                        icon: _isVisible1
                                            ? const Icon(
                                                Icons.phone_callback,
                                                color: Colors.blue,
                                              )
                                            : const Icon(
                                                Icons.phone_callback,
                                                color: Color.fromARGB(
                                                    255, 107, 164, 126),
                                              ),
                                      ),
                                      isCollapsed: true,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          10, 15, 0, 15),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(22.0),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 164, 146, 152)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(22.0),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 140, 124, 130)),
                                      ),
                                      labelText: 'Phone Number',
                                      hintText: 'Enter a 10-digit phone number',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(22.0),
                                      )),
                                  validator: _validateMobail,
                                  obscureText: _isVisible1,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  validator: _validatePassword,
                                  // inputFormatters: [
                                  //   LengthLimitingTextInputFormatter(20),
                                  // ],
                                  obscureText: !_isVisible,
                                  decoration: InputDecoration(
                                      isCollapsed: true,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          10, 15, 0, 15),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isVisible = !_isVisible;
                                          });
                                        },
                                        icon: _isVisible
                                            ? const Icon(
                                                Icons.visibility,
                                                color: Colors.black,
                                              )
                                            : const Icon(
                                                Icons.visibility_off,
                                                color: Colors.grey,
                                              ),
                                      ),
                                      labelText: 'Password',
                                      hintText: 'Password',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(22))),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DestubuterRegistration()));
                                      },
                                      child: const Text(
                                        'Sign in',
                                        style: TextStyle(
                                            fontSize: 27,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.blue),
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: const Color(0xff4c505b),
                                      child: IconButton(
                                          color: AppColors.whiteColor,
                                          onPressed: () {
                                            _submitForm();

                                            if (_formKey.currentState!
                                                .validate()) {}
                                          },
                                          icon: const Icon(
                                            Icons.arrow_forward,
                                          )),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: h * 0.04,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: IconListArray.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: w * 0.02),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(22),
                                          child: Image.asset(
                                            IconListArray[index]['image'],
                                            height: 50,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, 'register');
                                      },
                                      // ignore: sort_child_properties_last
                                      child: const Text(
                                        'Sign Up',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xff4c505b),
                                            fontSize: 18),
                                      ),
                                      style: const ButtonStyle(),
                                    ),
                                    // TextButton(
                                    //     onPressed: () {
                                    //       LogainApi();
                                    //     },
                                    //     child: Text("data")),
                                    TextButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(25.0),
                                                topRight: Radius.circular(25.0),
                                              ),
                                            ),
                                            builder: (BuildContext context) {
                                              return showBottomSheet1();
                                            },
                                          ).whenComplete(() {
                                            // Clear controller value when the bottom sheet is closed
                                            mobileController.clear();
                                          });
                                        },
                                        child: const Text(
                                          'Forgot Password',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.green,
                                            decorationColor: Colors.green,
                                            fontSize: 18,
                                          ),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context)
                                      .viewInsets
                                      .bottom)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void _submitForm() async {
    String mobile = mobileController.text;
    String password = passwordController.text;
    if (_formKey.currentState!.validate()) {
      mobileController.text = mobile;
      passwordController.text = password;
      await LoginApi(mobile, password);
    }
  }

  Future<Checknumber_model?> checknumberApi(String mobile) async {
    print("mobile>>>>>>>>>>>>>$mobile");

    if (mobile != null) {
      String? deviceID = "";

      try {
        String? result = await MyGlobalFunctions.getId();
        deviceID = result;
      } catch (error) {
        print('Error: $error');
      }
      String? checknumber = await MyGlobalFunctions.PostCall(
        '{"MethodName":"checknumber","Mobile":"$mobile"}',
        "$deviceID",
      );

      final data = json.decode(checknumber!);
      if (data["statuscode"] == "ERR") {
        _OtpPinApi(mobile);
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          builder: (BuildContext context) {
            return showBottomSheet2(
                mobile); // Call showBottomSheet2 from the Bottom class
          },
        ).whenComplete(() {
          pinController.clear();
        });
        return Checknumber_model(data);
      } else {
        _showCreateAccountDialog(context);
        // if (data["status"].toString() == "UnAuthorized Person") {}
      }
    }
  }

  _showCreateAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Create Account"),
          content: Text("Would you like to create an account?"),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text("No"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DestubuterRegistration()),
                );
                // Navigator.of(context).pop();
                // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  Future<sendotp_model?> _OtpPinApi(String mobile) async {
    try {
      if (mobile != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final getServiceList = await MyGlobalFunctions.PostCall(
          '{"MethodName":"sendotp","MobileNo":"$mobile"}',
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

  Future<void> changedpasswordnewApi(String otp, String Mobile) async {
    if (Mobile != null) {
      String? deviceID = "";

      try {
        String? result = await MyGlobalFunctions.getId();
        deviceID = result;
      } catch (error) {
        print('Error: $error');
      }

      String? changedpasswordnew = await MyGlobalFunctions.PostCall(
        '{"MethodName": "changedpasswordnew","UserID":"$Mobile", "NewPassword": " ${newpasswordController.text}" ,"OTP":" $otp" }',
        "$deviceID",
      );
      print('changedpasswordnew>>>>>>>>>>>>>>${changedpasswordnew}');

      final data = json.decode(changedpasswordnew!);
      if (data["statuscode"] == "TXN") {
        Navigator.of(context).pop();
        MyGlobalFunctions.errorMessage(context, data["status"].toString());
      } else {
        MyGlobalFunctions.errorMessage(context, data["status"].toString());
      }
    }
  }

  Widget showBottomSheet1() {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    Future<void> onButtonPressed() async {
      await Future.delayed(const Duration(milliseconds: 3000), () => 42);
      Navigator.of(context).pop();
      checknumberApi(mobileController.text);
    }

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.03, vertical: h * 0.03),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Forgot password",
              style: TextStyle(
                  fontSize: 22,
                  color: focusedBorderColor,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            const Text(
              "Enter Your mobile for the verification\nprocess",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const Text(
              "we will send 4 digits code to your",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            const Text(
              "Mobile",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            CustomTextFormFild(
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
              ],
              // fieldName: 'Mobile',
              labelText: 'Mobile',
              keyboardType: TextInputType.number,

              myController: mobileController,
              // contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
            ),
            SizedBox(
              height: h * 0.05,
            ),

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
                onPressed: onButtonPressed,
              ),
            ),
            // CustomElevatedButton(
            //   text: 'Continue',
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //     checknumberApi(mobileController.text);
            //   },
            //   color: Colors.green,
            //   borderRadius: 22.0,
            //   elevation: 4.0,
            //   textStyle:
            //       const TextStyle(fontSize: 16.0, color: AppColors.whiteColor),
            // ),
          ],
        ),
      ),
    );
  }

  Widget showBottomSheet2(String mobile) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
    String _formatMobileNumber(String? number) {
      if (number == null || number.length <= 2) {
        return number ?? "";
      }
      return number.replaceRange(
          0, number.length - 2, 'x' * (number.length - 2));
    }

    String lastTwoDigits = _formatMobileNumber(mobile);
    @override
    initState() {
      super.initState();

      GetCompanyData();
      resendOTP();
    }

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.03, vertical: h * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              "Enter 4 Digits Code",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            const Text(
              "Enter the 4 Digits Code that you received on\nyour mobile",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Color.fromARGB(255, 6, 76, 133),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Phone Number  ',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        decoration: TextDecoration.none),
                  ),
                  TextSpan(
                    text: lastTwoDigits,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Center(
              child: Directionality(
                // Specify direction if desired
                textDirection: TextDirection.ltr,
                child: Pinput(
                  keyboardType: TextInputType.number,
                  controller: pinController,
                  focusNode: focusNode,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  listenForMultipleSmsOnAndroid: true,
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (String pin) async {
                    if (otp != null && otp.toString() == pin) {
                      Navigator.of(context).pop();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PasswordForm(
                            otp: otp!, // Data you want to send
                            mobile: mobile, // Data you want to send
                          ),
                        ),
                      );

                      // Close current bottom sheet
                      //\
                      // Open the next bottom sheet
                      // showModalBottomSheet(
                      //   isScrollControlled: true,
                      //   context: context,
                      //   shape: const RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.only(
                      //       topLeft: Radius.circular(25.0),
                      //       topRight: Radius.circular(25.0),
                      //     ),
                      //   ),
                      //   builder: (BuildContext context) {
                      //     return ShowBottomSheet3(mobile);
                      //   },
                      // );

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
            SizedBox(
              height: h * 0.02,
            ),
            Center(
                child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
              ),
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
                          decoration: TextDecoration.none),
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
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                color: Color(0xff2596be)),
                          ),
                        ),
                      ))
                    else
                      TextSpan(
                        text: 'Resend OTP in $_secondsRemaining seconds',
                        style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.none,
                        ),
                      ),
                  ],
                ),
              ),
            )),
            SizedBox(
              height: h * 0.05,
            ),
            CustomElevatedButton(
              child: Text("contune"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the first bottom sheet
                //
              },
              color: Colors.green,
              borderRadius: 22.0,
              elevation: 4.0,
              textStyle:
                  const TextStyle(fontSize: 16.0, color: AppColors.whiteColor),
            ),
            SizedBox(
              height: h * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
