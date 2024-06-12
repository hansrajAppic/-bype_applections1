// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, non_constant_identifier_names

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'Globale_class/colors.dart';
import 'Globale_class/shardPreferance.dart';
import 'Json_model/getbanklistdetails.dart';
import 'add_bankdetailsform_screen.dart';
import 'globale_class.dart';


class AddBankDetailsScreens extends StatefulWidget {
  final List<List<String>> dataList;

  AddBankDetailsScreens({Key? key, required this.dataList}) : super(key: key);

  @override
  _AddBankDetailsScreensState createState() => _AddBankDetailsScreensState();
}

const double _kSize = 70.0;

class _AddBankDetailsScreensState extends State<AddBankDetailsScreens> {
  late Future<List<banklistdata>> _bankListFuture;

  @override
  void initState() {
    super.initState();
    _bankListFuture = Getbankdetailsapi();
  }

  Future<void> _refreshData() async {
    setState(() {
      _bankListFuture = Getbankdetailsapi(); // Refresh bank data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff21182b),
      appBar: AppBar(
        actions: [
          Icon(
            Icons.help_outline_outlined,
            color: AppColors.whiteColor,
            size: 22,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        ],
        backgroundColor: AppColors.PinkColors,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.whiteColor),
          onPressed: () => Navigator.of(context)
              .pop(_bankListFuture), // Pass _bankListFuture as result
        ),
        title: Text(
          'Bank Details',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData, // Call _refreshData function when refreshing
        child: FutureBuilder<List<banklistdata>>(
          future: _bankListFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: LoadingAnimationWidget.discreteCircle(
                      color:  AppColors.whiteColor,
                      size: _kSize,
                      secondRingColor: Colors.orange,
                      thirdRingColor: Colors.purple));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<banklistdata> Listbankdata = snapshot.data!;
              return SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                      vertical: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          decoration: ShapeDecoration(
                            color: const Color(0xffFFFFFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: Listbankdata.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return ScaleTransition(
                                          alignment: Alignment.center,
                                          scale: Tween<double>(
                                            begin: 0.1,
                                            end: 1,
                                          ).animate(
                                            CurvedAnimation(
                                              parent: animation,
                                              curve: Curves.bounceIn,
                                            ),
                                          ),
                                          child: child,
                                        );
                                      },
                                      transitionDuration: Duration(seconds: 2),
                                      pageBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double>
                                              secondaryAnimation) {
                                        return UserAccountsDetails_screen(
                                          index: index,
                                          data: Listbankdata[index],
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    color: Colors.transparent,
                                  ),
                                  child: Column(
                                    children: [
                                      if (Listbankdata[index].name!.isNotEmpty)
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                          ),
                                          child: ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            leading: CircleAvatar(
                                              maxRadius: 16,
                                              backgroundColor: Color.fromARGB(
                                                255,
                                                187,
                                                212,
                                                233,
                                              ),
                                              child: Image.asset(
                                                "assets/images/Bdoda.png",
                                              ),
                                            ),
                                            title: Text(
                                              Listbankdata[index].name!,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            trailing: IconButton(
                                              icon: Icon(
                                                Icons.arrow_forward_ios,
                                                size: 18,
                                              ),
                                              onPressed: () {},
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                // Text('Phone: ${widget.dataList[index][1]}'),
                                                // Text('Password: ${widget.dataList[index][2]}'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      SizedBox(height: 0),
                                      Container(
                                        height: 1,
                                        width: double.infinity,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 1,
          left: MediaQuery.of(context).size.width * 0.0,
          right: MediaQuery.of(context).size.width * 0.00,
        ),
        child: 
        
        TextButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddBankDetailsForm(),
              ),
            );
            if (result != null) {
              setState(() {
                _bankListFuture = Getbankdetailsapi(); // Refresh bank data
              });
            }
          },
          style: TextButton.styleFrom(
            minimumSize: Size(
              MediaQuery.of(context).size.width * 0.5,
              50,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            backgroundColor: AppColors.PinkColors,
          ),
          child: Text(
            "Add New Bank Account",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color:  AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }

  // Get bank details API function
  Future<List<banklistdata>> Getbankdetailsapi() async {
    try {
    String? Mobile = await SharedPreferenceUtils.getValue("mob");
      String? Password = await SharedPreferenceUtils.getValue("pass");


      if ( Mobile != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final getServiceList = await MyGlobalFunctions.PostCall(
          '{"MethodName":"getbankdetails","UserID":"$Mobile","Password":"$Password",  }',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(getServiceList!);
        if (data["statuscode"] == "TXN") {
          final List<dynamic> jsonList = data['data'];
          final List<banklistdata> serviceList = jsonList
              .map((json) => banklistdata.fromJson(json))
              .toList(); // Convert JSON list to List<banklistdata>
          return serviceList; // Return fetched data
        } else if (data["status"].toString() == "UnAuthorized Person") {
          throw Exception("UnAuthorized Person!");
        }
      }
      return []; // Return empty list if no data fetched
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }
}

// Get bank details API function
Future<List<banklistdata>> Getbankdetailsapi() async {
  try {
   String? Mobile = await SharedPreferenceUtils.getValue("mob");
    String? Password = await SharedPreferenceUtils.getValue("pass");


    if ( Mobile != null) {
      final deviceID = await MyGlobalFunctions.getId();

      final getServiceList = await MyGlobalFunctions.PostCall(
        '{"MethodName":"getbankdetails","UserID":"$Mobile","Password":"$Password",  }',
        "$deviceID",
      );

      final Map<String, dynamic> data = json.decode(getServiceList!);
      if (data["statuscode"] == "TXN") {
        final List<dynamic> jsonList = data['data'];
        final List<banklistdata> serviceList = jsonList
            .map((json) => banklistdata.fromJson(json))
            .toList(); // Convert JSON list to List<banklistdata>
        return serviceList; // Return fetched data
      } else if (data["status"].toString() == "UnAuthorized Person") {
        throw Exception("UnAuthorized Person!");
      }
    }
    return []; // Return empty list if no data fetched
  } catch (error) {
    throw Exception('Error fetching data: $error');
  }
}

// ignore: camel_case_types
class UserAccountsDetails_screen extends StatelessWidget {
  // final int index;
  // final List<String> data;
  final int index;
  final banklistdata data; // Accept the required data here

  UserAccountsDetails_screen({required this.index, required this.data});

  // UserAccountsDetails_screen(
  //     {super.key, required this.index, required this.data});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff0e051b),
      appBar: AppBar(
        actions: [
          Icon(
            Icons.help_outline_outlined,
            color:  AppColors.whiteColor,
            size: 22,
          ),
          SizedBox(
            width: w * 0.02,
          )
        ],
        backgroundColor: Color(0xff3f1e65),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Account Details',
          style: const TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color(0xff21182b),
              boxShadow: const [
                BoxShadow(
                    // color: Color.fromARGB(69, 143, 145, 135),
                    // blurRadius: 4,
                    ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading:
                        CircleAvatar(maxRadius: 16, child: Icon(Icons.person)),
                    title: Text(
                      'Account Number:  ${data.accountNumber}',
                      style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(
                      'Branch Name:  ${data.branchName}',
                      style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Divider(
                    color: Colors.white30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Set as primary',
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.white12,
                  ),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff21182b),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(69, 143, 145, 135),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Type',
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'Bank Name',
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'Branch',
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'Account Holder',
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'IFSC',
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ]),
                              SizedBox(width: w * 0.1),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ': Saving Account',
                                      style: const TextStyle(
                                          color: Colors.white60,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      ':  ${data.name}',
                                      style: const TextStyle(
                                          color: Colors.white60,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      ':  ${data.branchName}',
                                      style: const TextStyle(
                                          color: Colors.white60,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      ':  ${data.accountHolderName}',
                                      style: const TextStyle(
                                          color: Colors.white60,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      ':  ${data.iFSCCode}',
                                      style: const TextStyle(
                                          color: Colors.white60,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ]),
                            ]),
                      ) // Add your child widget here
                      ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff21182b),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(69, 143, 145, 135),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'UPI PIN',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 244, 238, 238),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200),
                                ),
                                Spacer(),
                                SizedBox(
                                    width:
                                        10), // Adjust the width as needed for spacing
                                Text(
                                  'REST',
                                  style: TextStyle(
                                      color: Color(0xff2596be),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                    width:
                                        10), // Adjust the width as needed for spacing
                                Text(
                                  'Change',
                                  style: TextStyle(
                                      color: Color(0xff2596be),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Text(
                              '6 digit UPI PIN exists',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 236, 227, 227),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w200),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff21182b),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(69, 143, 145, 135),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Blance:₹.....',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 244, 238, 238),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                Spacer(),
                                SizedBox(
                                    width:
                                        10), // Adjust the width as needed for spacing
                                Text(
                                  'CHECKBLANCE',
                                  style: TextStyle(
                                      color: Color(0xff2596be),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff21182b),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(69, 143, 145, 135),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'International UPI is here..',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 244, 238, 238),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                                Spacer(),
                                SizedBox(
                                    width:
                                        10), // Adjust the width as needed for spacing
                                Text(
                                  'ACTIVATE',
                                  style: TextStyle(
                                      color: Color(0xff2596be),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Text(
                              'Scan and pay at select merchant stores abroad now',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 244, 238, 238),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w200),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff21182b),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(69, 143, 145, 135),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'UPI IDs',
                                style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w100),
                              ),
                              Text(
                                'Below UPI IDs can onty be used with this account',
                                style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w100),
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'sachinbalyan-1@axl',
                                    style: TextStyle(
                                        color:  AppColors.whiteColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(179, 224, 216, 216),
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.white12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'sachinbalyan-1@axl',
                                    style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(179, 224, 216, 216),
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.white12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'sachinbalyan-1@axl',
                                    style: TextStyle(
                                        color:  AppColors.whiteColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(179, 224, 216, 216),
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.white12,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '@axl',
                                      style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Icon(
                                      Icons.add,
                                      color: AppColors.whiteColor,
                                    ),
                                  ]),
                              Divider(
                                color: Colors.white12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    '@ible',
                                    style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Icon(
                                    Icons.add,
                                    color:  AppColors.whiteColor,
                                  )
                                ],
                              ),
                            ]),
                      )
                      // Add your child widget here
                      ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff21182b),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(69, 143, 145, 135),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.edit,
                                  size: 14,
                                  color: Colors.white54,
                                ),

                                SizedBox(
                                    width:
                                        10), // Adjust the width as needed for spacing
                                Text(
                                  'Add Nickname',
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff21182b),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(69, 143, 145, 135),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: h * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Icon(
                                  Icons.delete,
                                  size: 16,
                                  color: Color.fromRGBO(143, 20, 57, 1),
                                ),

                                SizedBox(
                                    width:
                                        10), // Adjust the width as needed for spacing
                                Text(
                                  'Unlink banka account ',
                                  style: TextStyle(
                                      color: Color.fromRGBO(143, 20, 57, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: h * 0.01,
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: h * 0.03,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.zero,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xff21182b),
          borderRadius: const BorderRadius.only(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Powered by",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: w * 0.02,
                ),
                Text(
                  "UPI",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor:  AppColors.whiteColor,
                    color: AppColors.whiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
            Center(
              child: SizedBox(
                width: w * 0.3,
                child: Divider(
                  thickness: 3,
                  color: Colors.red, // Change the color to your desired color
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
