// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, non_constant_identifier_names, prefer_const_constructors, use_build_context_synchronously, unnecessary_string_interpolations, avoid_print, no_leading_underscores_for_local_identifiers, unused_element, camel_case_types

import 'dart:convert';


import 'Globale_class/colors.dart';
import 'package:flutter/material.dart';


import 'Globale_class/shardPreferance.dart';
import 'globale_class.dart';

// Define the ChangePinScreen widget
class ChangePinScreen extends StatefulWidget {
  @override
  _ChangePin_ScreenState createState() => _ChangePin_ScreenState();
}

// Define the state for the ChangePinScreen widget
class _ChangePin_ScreenState extends State<ChangePinScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController oldchangedpinController = TextEditingController();
  TextEditingController newchangedpinController = TextEditingController();
  TextEditingController ConfrmchangedpinController = TextEditingController();
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
          'Change TPiN',
          style: const TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.red,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.white),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      //   title: const Text(
      //     'Change Password',
      //     style: TextStyle(
      //         fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
      //   ),
      // ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Old changedpin',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: oldchangedpinController,
                  obscureText: !_isVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter old changedpin.';
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
                    hintText: 'Enter old changedpin',
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
                  'New changedpin',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: newchangedpinController,
                  obscureText: !_isVisible1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter new password.';
                    }
                    // Add custom validation logic for new password
                    // Example: Check if the new password meets certain criteria
                    if (value.length < 4) {
                      return 'changedpin must be at least 4 characters.';
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
                    hintText: 'Enter new changedpin',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Confirm changedpin',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: ConfrmchangedpinController,
                  obscureText: !_isVisibl2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm new password.';
                    }
                    // Add custom validation logic for confirming new password
                    if (value != newchangedpinController.text) {
                      return 'changedpin do not match.';
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
                    hintText: 'Confirm new changedpin',
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
                          String oldPassword = oldchangedpinController.text;
                          String newPassword = newchangedpinController.text;
                          String confirmPassword =
                              ConfrmchangedpinController.text;
                          if (newPassword == confirmPassword) {
                            if (_formKey.currentState!.validate()) {
                              changedpinApi();
                              // Perform the password change operation

                              // Handle password change logic here
                              // You may want to validate the passwords and handle the change logic
                            }

                            // You may want to validate the passwords and handle the change logic
                          } else {
                            // Display an error message that passwords do not match
                            // You may want to show a snackbar or alert dialog
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'New changedpin and confirm changedpin do not match.'),
                              ),
                            );
                          }
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

  Future<void> changedpinApi() async {
    setState(() {
      // Set the flag to true when starting the password change
      _isLoading = true;
    });

    String? Mobile = await SharedPreferenceUtils.getValue("mob");
    String? Password = await SharedPreferenceUtils.getValue("pass");

    if (Mobile != null && Password != null) {
      try {
        String? deviceID = await MyGlobalFunctions.getId();
        String requestBody = '''
      {
        "MethodName": "changedpassword",
        "UserID": "$Mobile",
        "Password": "$Password",
        "OldPassword": "${oldchangedpinController.text}",
        "NewPassword": "${newchangedpinController.text}",
        "Confirm": "${ConfrmchangedpinController.text}",
        "AppType": "Apps"
      }
    ''';

        String? changedpin =
            await MyGlobalFunctions.PostCall(requestBody, deviceID);

        final data = json.decode(changedpin!);
        if (data["statuscode"] == "TXN") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${data["status"].toString()}',
                style: const TextStyle(fontSize: 10),
              ),
            ),
          );
        } else if (data["status"] != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
              data["status"].toString(),
              style: const TextStyle(fontSize: 10),
            )),
          );
        }
      } catch (error) {
        // Handle errors appropriately
        print("Error in changedpinApi: $error");
      } finally {
        setState(() {
          // Set the flag to false when password change is complete
          _isLoading = false;
        });
      }
    }
    _submitPasswordForm() async {
      if (_formKey.currentState!.validate()) {
        await changedpinApi();
        // You can show the CircularProgressIndicator here if needed
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: CircularProgressIndicator(),
        //   ),
        // );
      }
    }
  }
}
