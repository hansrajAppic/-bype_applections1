// // ignore_for_file: use_key_in_widget_constructors

// import 'package:bype_techno_projects1/Globale_class/colors.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: ReportScreen(),
//   ));
// }

// class ReportScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> containerData = [
//     {'icon': Icons.star, 'color': Colors.white, 'text': ' , 1'},
//     {'icon': Icons.favorite, 'color': Colors.white, 'text': ' reports, 2'},
//     {'icon': Icons.attach_money, 'color': Colors.white, 'text': ' reports, 3'},
//     {'icon': Icons.camera, 'color': Colors.white, 'text': ' reports, 4'},
//     {'icon': Icons.email, 'color': Colors.white, 'text': ' reports, 5'},
//     {'icon': Icons.access_alarm, 'color': Colors.white, 'text': ' reports, 6'},
//     {'icon': Icons.emoji_events, 'color': Colors.white, 'text': ' reports, 7'},
//     {'icon': Icons.add_alarm, 'color': Colors.white, 'text': ' reports, 8'},
//     {
//       'icon': Icons.directions_bike,
//       'color': Colors.white,
//       'text': ' reports, 9'
//     },
//     {'icon': Icons.brightness_5, 'color': Colors.white, 'text': ' reports, 10'},
//     {'icon': Icons.phone, 'color': Colors.white, 'text': ' reports, 11'},
//     {'icon': Icons.laptop, 'color': Colors.white, 'text': ' reports, 12'},
//     {'icon': Icons.restaurant, 'color': Colors.white, 'text': ' reports, 13'},
//     {
//       'icon': Icons.shopping_cart,
//       'color': Colors.white,
//       'text': ' reports, 14'
//     },
//     {'icon': Icons.pets, 'color': Colors.white, 'text': ' reports, 15'},
//     {
//       'icon': Icons.local_florist,
//       'color': Colors.white,
//       'text': ' reports, 16'
//     },
//     {
//       'icon': Icons.directions_run,
//       'color': Colors.greenAccent,
//       'text': ' reports, 17'
//     },
//     {'icon': Icons.palette, 'color': Colors.white, 'text': ' reports, 18'},
//     {'icon': Icons.public, 'color': Colors.white, 'text': ' reports, 19'},
//     {'icon': Icons.movie, 'color': Colors.white, 'text': ' reports, 20'},
//     // Add more entries as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Image.asset(
//             "assets/images/rsz_1sonitecno.png",
//             height: 30,
//           ),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: containerData.length,
//         itemBuilder: (context, index) {
//           final item = containerData[index];
//           return buildContainer(item);
//         },
//       ),
//     );
//   }

// ignore_for_file: prefer_const_constructors

// import 'package:demo/Globale_class/colors.dart';
// import 'package:demo/Globale_class/companyinformationdata.dart';
// import 'package:demo/Json_model/company_logain_details_model.dart';
// import 'package:demo/aepswallethistory_screen.dart';
// import 'package:demo/homnave_scree.dart';
// import 'package:demo/moneytransser_history_screen.dart';
// import 'package:demo/recharge_history_screen.dart';
// import 'package:demo/wallet_history_screen.dart';
// ignore_for_file: use_key_in_widget_constructors, unused_local_variable

// import 'package:bype_techno_projects1/Globale_class/companyinformationdata.dart';
// import 'package:bype_techno_projects1/Json_model/company_logain_details_model.dart';
// import 'package:bype_techno_projects1/homnave_scree.dart';
// import 'package:demo/Globale_class/colors.dart';
import 'package:bype_applections1/balancereceviereport_screen.dart';
import 'package:bype_applections1/balancetransferreport_screen.dart';
import 'package:bype_applections1/homnave_scree.dart';
import 'package:flutter/material.dart';

import 'Globale_class/colors.dart';
import 'Globale_class/companyinformationdata.dart';
import 'Json_model/company_logain_details_model.dart';
import 'aepswallethistory_screen.dart';
import 'moneytransser_history_screen.dart';
import 'recharge_history_screen.dart';
import 'wallet_history_screen.dart';

class ReportScreen extends StatefulWidget {
  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final List<Map<String, dynamic>> containerData = [
    {
      'icon': Icons.directions_bike,
      'color': AppColors.whiteColor,
      'text': 'Recharge History'
    },
    {
      'icon': Icons.phone_iphone,
      'color': AppColors.whiteColor,
      'text': 'Money Transfer History'
    },
    {
      'icon': Icons.history,
      'color': AppColors.whiteColor,
      'text': 'AEPs Txn History'
    },
    {
      'icon': Icons.balance,
      'color': AppColors.whiteColor,
      'text': 'Main Wallet History'
    },
    {'icon': Icons.download, 'color': AppColors.whiteColor, 'text': 'DownLine'},

    {
      'icon': Icons.account_balance,
      'color': AppColors.whiteColor,
      'text': 'Settlement History'
    },
    {
      'icon': Icons.camera,
      'color': AppColors.whiteColor,
      'text': 'AEPS Wallet History'
    },
    {
      'icon': Icons.email,
      'color': AppColors.whiteColor,
      'text': 'MATM History'
    },
    {
      'icon': Icons.access_alarm,
      'color': AppColors.whiteColor,
      'text': 'e-Ticket History'
    },
    {
      'icon': Icons.emoji_events,
      'color': AppColors.whiteColor,
      'text': 'NSDL History'
    },
    {
      'icon': Icons.add_alarm,
      'color': AppColors.whiteColor,
      'text': 'UTI History'
    },
    {
      'icon': Icons.directions_bike,
      'color': AppColors.whiteColor,
      'text': 'Recharge History'
    },
    {
      'icon': Icons.brightness_5,
      'color': AppColors.whiteColor,
      'text': 'Money Transfer History'
    },
    {
      'icon': Icons.phone,
      'color': AppColors.whiteColor,
      'text': 'AEPS Txn History'
    },
    {
      'icon': Icons.star,
      'color': AppColors.whiteColor,
      'text': 'Main Wallet History'
    },
    {
      'icon': Icons.favorite,
      'color': AppColors.whiteColor,
      'text': 'Settlement History'
    },
    {
      'icon': Icons.attach_money,
      'color': AppColors.whiteColor,
      'text': 'Upi Send History'
    },
    {
      'icon': Icons.camera,
      'color': AppColors.whiteColor,
      'text': 'AEPS Wallet History'
    },
    {
      'icon': Icons.email,
      'color': AppColors.whiteColor,
      'text': 'MATM History'
    },
    {
      'icon': Icons.access_alarm,
      'color': AppColors.whiteColor,
      'text': ' Upi Send History'
    },
    {
      'icon': Icons.emoji_events,
      'color': AppColors.whiteColor,
      'text': 'NSDL History'
    },
    {
      'icon': Icons.add_alarm,
      'color': AppColors.whiteColor,
      'text': 'UTI History'
    },
    {
      'icon': Icons.directions_bike,
      'color': AppColors.whiteColor,
      'text': 'Recharge History'
    },
    {
      'icon': Icons.brightness_5,
      'color': AppColors.whiteColor,
      'text': 'Money Transfer History'
    },
    {
      'icon': Icons.phone,
      'color': AppColors.whiteColor,
      'text': 'AEPS Txn History'
    },
    // Add more entries as needed
  ];

  late Future<CompanyData?> _futureCompanyData;
  Global globalInstance = Global();
  CompanyData? companyData;

  @override
  void initState() {
    _futureCompanyData = _assignCustomerData();
    super.initState();
  }

  Future<CompanyData?> _assignCustomerData() async {
    return await globalInstance.getCompanyData();
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
          // onPressed: () => Navigator.of(context).pop(),o
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeNaveScreens(
                          index: 0,
                        )));
          },
        ),
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
      body: ListView.builder(
        itemCount: containerData.length,
        itemBuilder: (context, index) {
          // if (index == 0) {
          //   // Navigator.push(
          //   //   context,
          //   //   MaterialPageRoute(builder: (context) => ()),
          //   // );
          // }
          final item = containerData[index];
          return GestureDetector(
              onTap: () {
                if (index == 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Rechargehistory_screen()));
                } else if (index == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MoneyTransferHistory_screen()));
                } else if (index == 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Aepswallethistory_screen()));
                } else if (index == 3) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WalletHistory()));
                } else if (index == 4) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Balancetransferreport_screen()));
                } else if (index == 4) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Balancereceviereport_screen()));
                }
              },
              child: buildContainer(item));
        },
      ),
    );
  }

  Widget buildContainer(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: item['color'], // Use the color from the data
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(69, 143, 145, 135),
              blurRadius: 4,
            ),
          ],
        ),
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(item['icon'], color: Colors.black),
            SizedBox(width: 16.0),
            Text(
              item['text'],
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
