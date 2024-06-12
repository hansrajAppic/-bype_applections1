// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, non_constant_identifier_names, unnecessary_string_interpolations, use_build_context_synchronously, avoid_print, no_leading_underscores_for_local_identifiers, unused_element

import 'dart:convert';

// import 'package:demo/Globale_class/colors.dart';
// import 'package:demo/Globale_class/shardPreferance.dart';
import 'Globale_class/colors.dart';
import 'Globale_class/shardPreferance.dart';
import 'package:flutter/material.dart';


import 'globale_class.dart';

// Define the PasswordChangeScreen widget
class PasswordChangeScreen extends StatefulWidget {
  @override
  _PasswordChangeScreenState createState() => _PasswordChangeScreenState();
}

// Define the state for the PasswordChangeScreen widget
class _PasswordChangeScreenState extends State<PasswordChangeScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _isVisible = false;
  bool _isVisible1 = false;
  bool _isVisibl2 = false;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    // Scaffold widget defines the basic structure of the visual interface
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.whiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Change Password',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.whiteColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Old Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: oldPasswordController,
                  obscureText: !_isVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter old password.';
                    }
                    // Add custom validation logic for old password
                    // Example: Check if the old password matches a stored value
                    // if (value != 'storedOldPassword') {
                    //   return 'Incorrect old password.';
                    // }
                    return null;
                  },
                  decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                    hintText: 'Enter old password',
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
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'New Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: newPasswordController,
                  obscureText: !_isVisible1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter new password.';
                    }
                    // Add custom validation logic for new password
                    // Example: Check if the new password meets certain criteria
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisible1 = !_isVisible1;
                        });
                      },
                      icon: _isVisible1
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                    ),
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                    hintText: 'Enter new password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Confirm Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: !_isVisibl2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm new password.';
                    }
                    // Add custom validation logic for confirming new password
                    if (value != newPasswordController.text) {
                      return 'Passwords do not match.';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisibl2 = !_isVisibl2;
                        });
                      },
                      icon: _isVisibl2
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                    ),
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                    hintText: 'Confirm new password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 32),
                Center(
                  child: !_isLoading
                      ? const Text("")
                      : const CircularProgressIndicator(),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: w * 0.4,
                      height: h * 0.050,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            backgroundColor: Colors.red),
                        onPressed: () {},
                        child: const Text(
                          'CANCEL',
                          style: TextStyle(color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: w * 0.4,
                      height: h * 0.050,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            backgroundColor: Colors.red),
                        onPressed: () {
                          // ignore: unused_local_variable
                          String oldPassword = oldPasswordController.text;
                          String newPassword = newPasswordController.text;
                          String confirmPassword =
                              confirmPasswordController.text;
                          if (newPassword == confirmPassword) {
                            if (_formKey.currentState!.validate()) {
                              passwordApi();
                            }
                          }
                          // else {
                          //   // Display an error message that passwords do not match
                          //   // You may want to show a snackbar or alert dialog
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(
                          //       content: Text(
                          //           'New password and confirm password do not match.'),
                          //     ),
                          //   );
                          // }
                        },
                        child: const Text(
                          'SUBMIT',
                          style: TextStyle(color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> passwordApi() async {
    setState(() {
      // Set the flag to true when starting the password change
      _isLoading = true;
    });

    String? Mobile = await SharedPreferenceUtils.getValue("mob");
    String? Password = await SharedPreferenceUtils.getValue("pass");

    if (Mobile != null && Password != null) {
      try {
      
          final deviceID = await MyGlobalFunctions.getId();

          final changedpassword = await MyGlobalFunctions.PostCall(
            '{"MethodName":"changedpassword","UserID": "$Mobile","Password":"$Password","NewPassword": "${newPasswordController.text}","OldPassword": "${oldPasswordController.text}"}',
            "$deviceID",
          );

          final data = json.decode(changedpassword!);
          if (data["statuscode"] == "TXN") {
            Navigator.of(context).pop();
            MyGlobalFunctions.errorMessage(context, data["status"].toString());
          } else {
            MyGlobalFunctions.errorMessage(context, data["status"].toString());
          }
        
      } catch (e) {
        print('Error: $e');
        // Handle error
        MyGlobalFunctions.errorMessage(context, 'An error occurred');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
