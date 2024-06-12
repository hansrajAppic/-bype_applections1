// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_local_variable, use_build_context_synchronously

import 'dart:io';

import 'package:bype_applections1/Globale_class/companyinformationdata.dart';
import 'package:bype_applections1/Globale_class/shardPreferance.dart';
import 'package:bype_applections1/Json_model/user_logain_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../change_pasword.dart';
import '../change_pinscreen.dart';
import '../login_screen.dart';
import '../my_profaile_screen.dart';
import '../search_paytm.dart';
import '../setting_screen.dart';
import 'colors.dart';
// Needed for FileImage

class CustomDrawer extends StatefulWidget {
  final File? profileImage;

  CustomDrawer({this.profileImage});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  File? _profileImage;

  Future _pickProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => _profileImage = imageTemporary);
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image error: $e');
    }
  }

  Global globalInstance = Global();
  GetlogindetailsModel? companyData;

  @override
  void initState() {
    _assignCustomerData();
    super.initState();
  }

  void _assignCustomerData() async {
    companyData = await globalInstance.getCustomerData();
    setState(() {
      companyData = companyData;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.orange,
                    Colors.red,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(39),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen()));
                    },
                    child: SizedBox(
                      width: 130,
                      height: 130,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade200,
                        backgroundImage: _profileImage != null
                            ? FileImage(_profileImage!)
                            : null,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: _pickProfileImage,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade400,
                                    border: Border.all(
                                        color: AppColors.whiteColor, width: 3),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt_sharp,
                                    color: AppColors.whiteColor,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${(companyData != null ? companyData!.data![0].username : "")}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${(companyData != null ? companyData!.data![0].mobilenumber : "")}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          // Text(
                          //   'User ID: ${items.userid}', // Corrected: removed unnecessary quotation
                          //   style: TextStyle(
                          //     fontSize: 15,
                          //     fontWeight: FontWeight.w500,
                          //     color: Colors.white,
                          //   ),
                          // ),
                          Text(
                            "${(companyData != null ? companyData!.data![0].userid : "")}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("My Profile"),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyProfile_Screen()),
              );
            },
          ),
          const Divider(
            color: Color.fromARGB(255, 211, 189, 189),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Change your Login ID"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChangePinScreen()));
            },
          ),
          const Divider(
            color: Color.fromARGB(255, 211, 189, 189),
          ),
          ListTile(
            leading: const Icon(Icons.arrow_back_ios_new_sharp),
            title: const Text("Change your password"),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PasswordChangeScreen()));
            },
          ),
          const Divider(
            color: Color.fromARGB(255, 211, 189, 189),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Setting_Screen()));
            },
          ),
          const Divider(
            color: Color.fromARGB(255, 211, 189, 189),
          ),
          ListTile(
            leading: const Icon(Icons.star_border),
            title: const Text("Rat Us "),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(
            color: Color.fromARGB(255, 211, 189, 189),
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text("FAQs"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(
            color: Color.fromARGB(255, 211, 189, 189),
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text("Isafe"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(
            color: Color.fromARGB(255, 211, 189, 189),
          ),
          ListTile(
            leading: const Icon(Icons.phone_callback_rounded),
            title: const Text("Contact Us"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(
            color: Color.fromARGB(255, 211, 189, 189),
          ),
          ListTile(
            leading: const Icon(Icons.bookmark_outline_outlined),
            title: const Text("Feedback"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(
            color: Color.fromARGB(255, 211, 189, 189),
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text("Logout"),
            onTap: () {
              _showConfirmationDialog(context);
              // showDialog(
              //     context: context,
              //     builder: (context) {
              //       return AlertDialog(
              //           shape: const RoundedRectangleBorder(
              //               borderRadius:
              //                   BorderRadius.all(Radius.circular(8))),
              //           insetPadding: const EdgeInsets.symmetric(
              //             horizontal: 50.0,
              //             vertical: 10.0,
              //           ),
              //           title: const Text(
              //             "are you sure? you want to Close Applications",
              //             style: TextStyle(
              //                 fontSize: 14, fontWeight: FontWeight.w500),
              //           ),
              //           content: Row(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             children: [
              //               InkWell(
              //                 onTap: () {
              //                   Navigator.pop(context);
              //                   showDialog(
              //                       context: context,
              //                       builder: (context) {
              //                         Future.delayed(
              //                             const Duration(seconds: 1), () {
              //                           Navigator.of(context).pop(true);
              //                         });
              //                         return const AlertDialog(
              //                           shape: RoundedRectangleBorder(
              //                               borderRadius:
              //                                   BorderRadius.all(
              //                                       Radius.circular(20))),
              //                           insetPadding:
              //                               EdgeInsets.symmetric(
              //                             horizontal: 120.0,
              //                             vertical: 146.0,
              //                           ),
              //                           title: Text(
              //                             "No Thanks",
              //                             style: TextStyle(
              //                                 fontSize: 13,
              //                                 fontWeight:
              //                                     FontWeight.w500),
              //                           ),
              //                         );
              //                       });
              //                 },
              //                 child: const Text(
              //                   "No",
              //                   style: TextStyle(
              //                       fontSize: 15,
              //                       fontWeight: FontWeight.bold,
              //                       color: Colors.red),
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: w * 0.08,
              //               ),
              //               InkWell(
              //                 onTap: () async {
              //                   SharedPreferenceUtils.clear();

              //                   Navigator.pushAndRemoveUntil(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) =>
              //                             Logain_screen()),
              //                     (route) => false,
              //                   );
              //                   // Navigator.push(
              //                   //     context,
              //                   //     MaterialPageRoute(
              //                   //         builder: (context) =>
              //                   //             const Logain_screen()));

              //                   ScaffoldMessenger.of(context)
              //                       .showSnackBar(
              //                     const SnackBar(
              //                         backgroundColor: Color(0xffFFCDD2),
              //                         content: Text(
              //                           "Yes Logout",
              //                           style: TextStyle(
              //                               fontSize: 15,
              //                               color: Colors.black,
              //                               fontWeight: FontWeight.w500),
              //                         )),
              //                   );
              //                 },
              //                 child: const Text(
              //                   "yes",
              //                   style: TextStyle(
              //                       fontSize: 15,
              //                       fontWeight: FontWeight.bold,
              //                       color: Colors.red),
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: w * 0.03,
              //               ),
              //             ],
              //           ));
              //     });
            },
          ),
          const Divider(
            color: Color.fromARGB(255, 211, 189, 189),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(
    BuildContext context,
  ) {
    bool isLoading = false;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              insetPadding: const EdgeInsets.symmetric(
                horizontal: 50.0,
                vertical: 10.0,
              ),
              title: const Text(
                "Logout",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              content: Text("Are you sure? you want to Close Applications"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text(
                    "No",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
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

                                  SharedPreferenceUtils.clear();

                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Logain_screen()),
                                    (route) => false,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          backgroundColor: Color(0xffFFCDD2),
                                          content: Text(
                                            "Yes Logout",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          )));
                                  // Navigator.of(context).pop();
                                } catch (error) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  print("Error occurred: $error");
                                }
                              },
                        child: Text(
                          "Yes",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
              ],
            );
          },
        );
      },
    );
  }
}
