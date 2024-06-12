// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

import 'Create_upi_dettils_screen.dart';
import 'Globale_class/colors.dart';
import 'Globale_class/companyinformationdata.dart';
import 'Globale_class/shardPreferance.dart';
import 'Json_model/company_logain_details_model.dart';
import 'Signup.dart';
import 'addbanklistdetails.dart';
import 'change_pasword.dart';
import 'change_pinscreen.dart';
import 'login_screen.dart';
import 'payment_request.dart';
import 'personal_details_screen.dart';

class Setting_Screen extends StatefulWidget {
  const Setting_Screen({Key? key}) : super(key: key);

  @override
  State<Setting_Screen> createState() => _Setting_ScreenState();
}

class _Setting_ScreenState extends State<Setting_Screen> {
  final List<Map<String, dynamic>> gridViewArray = [
    {
      "title": "Create UPI",
      "icon": Icons.account_balance,
      "color": Colors.blue
    },
    {"title": "Add Bank", "icon": Icons.add_circle, "color": Colors.red},
    {
      "title": "Bank Balance",
      "icon": Icons.account_balance_wallet,
      "color": Colors.green
    },
    {
      "title": "Payment Request",
      "icon": Icons.request_quote,
      "color": Colors.orange
    },
    {"title": "Change Password", "icon": Icons.lock, "color": Colors.purple},
    {"title": "Change Pin", "icon": Icons.vpn_key, "color": Colors.teal},
    {
      "title": "Personal Details",
      "icon": Icons.person,
      "color": Colors.deepOrange
    },
    {"title": "Logout", "icon": Icons.exit_to_app, "color": Colors.purple},
    {
      "title": "Active Profile",
      "icon": Icons.account_circle,
      "color": Colors.indigo
    },
    {"title": "Add Member", "icon": Icons.person_add, "color": Colors.brown},
  ];

  bool _switchValue = false;
  Global globalInstance = Global();
  CompanyData? companyData;

  @override
  void initState() {
    _futureCompanyData = _assignCustomerData();
    super.initState();
  }

  late Future<CompanyData?> _futureCompanyData;

  Future<CompanyData?> _assignCustomerData() async {
    return await globalInstance.getCompanyData();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Settings',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('General Settings'),
              onTap: () {
                // Navigate to the general settings page.
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notification Settings'),
              onTap: () {
                // Navigate to the notification settings page.
              },
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Security Settings'),
              onTap: () {
                // Navigate to the security settings page.
              },
            ),
            ListTile(
              leading: Icon(Icons.password_rounded),
              title: Text('Change Password Settings'),
              onTap: () {
                // Navigate to the security settings page.
              },
            ),
            ListTile(
              leading: Icon(Icons.pin),
              title: Text('Change T Pin Settings'),
              onTap: () {
                // Navigate to the security settings page.
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Navigate to the security settings page.
              },
            ),
            ListTile(
              leading: Icon(Icons.app_blocking),
              title: Text('App Privacy'),
              onTap: () {
                // Navigate to the security settings page.
              },
            ),
            // Add more list tiles for additional settings options
          ],
        ),
      ),
      appBar: AppBar(
        // leading: Icon(Icons.menu, color: Colors.red),
        title: FutureBuilder<CompanyData?>(
          future: _futureCompanyData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final logoUrl = snapshot.data!.data![0].logo;
              return ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: Image.network(
                  "https://sonitechno.info/images/Company/$logoUrl",
                  height: 200,
                  width: 170,
                ),
              );
            }
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.001),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset("assets/images/andriod.png"),
            ),
            SizedBox(height: h * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Enable Two Step Security",
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _switchValue = !_switchValue;
                    });
                  },
                  child: Container(
                    width: 50.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.0),
                      color: _switchValue ? Colors.blue : Colors.grey,
                    ),
                    child: Row(
                      mainAxisAlignment: _switchValue
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 20.0,
                          height: 20.0,
                          margin: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: h * 0.01),
            Expanded(
              child: GridView.builder(
                itemCount: gridViewArray.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpiDetails()));
                      } else if (index == 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddBankDetailsScreens(
                                      dataList: const [],
                                    )));
                      } else if (index == 2) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddBankDetailsScreens(
                                      dataList: const [],
                                    )));
                      } else if (index == 3) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Paymentrequest_screen()));
                      } else if (index == 4) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PasswordChangeScreen()));
                      } else if (index == 5) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangePinScreen()));
                      } else if (index == 6) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Personal_Details_Screen()));
                      } else if (index == 7) {
                        _showConfirmationDialog(context);
                      } else if (index == 8) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ActivProfaile()));
                      } else if (index == 9) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DestubuterRegistration()));
                      }
                    },
                    child: GridTile(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.blueGrey[100],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              gridViewArray[index]['icon'],
                              size: 36,
                              color: gridViewArray[index]['color'],
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              gridViewArray[index]['title'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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
