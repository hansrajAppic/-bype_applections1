// ignore_for_file: use_key_in_widget_constructors, camel_case_types, library_private_types_in_public_api

// import 'package:demo/Globale_class/colors.dart';
// import 'package:demo/Globale_class/companyinformationdata.dart';
// import 'package:demo/Json_model/company_logain_details_model.dart';
// import 'package:demo/homnave_scree.dart';
import 'package:flutter/material.dart';

import 'Globale_class/colors.dart';
import 'Globale_class/companyinformationdata.dart';
import 'Json_model/company_logain_details_model.dart';
import 'homnave_scree.dart';

void main() {
  runApp(Support_Screen());
}

class Support_Screen extends StatefulWidget {
  @override
  _Support_ScreenState createState() => _Support_ScreenState();
}

class _Support_ScreenState extends State<Support_Screen> {
  final List<MapEntry<IconData, String>> icons = [
    const MapEntry(Icons.account_balance, 'Account Balance'),
    const MapEntry(Icons.attach_money, 'Attach Money'),
    const MapEntry(Icons.credit_card, 'Credit Card'),
    const MapEntry(Icons.account_balance_wallet, 'Account Balance '),
    const MapEntry(Icons.monetization_on, 'Monetization On'),
    const MapEntry(Icons.payment, 'Payment'),
    const MapEntry(Icons.monetization_on, 'Monetization On'),
    const MapEntry(Icons.payment, 'Payment'),
  ];

  final List<MapEntry<IconData, String>> listIcons = [
    const MapEntry(Icons.phone_android, 'Mobile Recharge'),
    const MapEntry(Icons.motion_photos_pause, 'Mobile Postpaid'),
    const MapEntry(Icons.wifi_tethering_error_rounded, 'Electricity Bill'),
    const MapEntry(Icons.account_balance_wallet, 'Credit Card Bill'),
    const MapEntry(Icons.arrow_forward, 'View More'),
  ];
  Global globalInstance = Global();
  CompanyData? companyData;

  @override
  void initState() {
    super.initState();
    _assignCustomerData();
  }

  void _assignCustomerData() async {
    companyData = await globalInstance.getCompanyData();
    setState(() {
      companyData = companyData;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Icon(
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
          // onPressed: () => Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => DashBord_Screen())),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeNaveScreens(
                          index: 0,
                        )));
          },
        ),
        title: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: Image.network(
            "https://sonitechno.info/images/Company/${(companyData != null ? companyData!.data![0].logo : "")}",
            height: 200,
            width: 170,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.025),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'WeLcome to Help & Support',
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Hi, What can we help you with?',
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: h * 0.013,
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.blue, width: 4.0),
                    right: BorderSide(color: Colors.red, width: 4.0),
                    top: BorderSide(color: Colors.green, width: 4.0),
                    bottom:
                        BorderSide(color: AppColors.Buttancolour, width: 4.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.02, vertical: h * 0.002),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Your Sonitechno',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Will Work Like always!',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'We’re committed & doing our best to\n minimize any inconvenience.',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.045,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              child: const Text(
                                "Know more",
                                style: TextStyle(
                                    fontSize: 13, color: AppColors.whiteColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.006,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 210, 217, 245),
                      const Color.fromARGB(255, 190, 222, 245).withOpacity(0.1),
                      const Color(0xffd4e1e7),
                      const Color.fromARGB(255, 203, 230, 252),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'BANKING SERVICES & PAYMENTS\n Powered by PaytmXents',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.Buttancolour,
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                        ),
                        itemCount: icons.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(icons[index].key, size: 25),
                                const SizedBox(height: 4),
                                Text(
                                  icons[index].value,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.008,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black54),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'RECHARGE & BILL PAYMENTS',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const Text(
                        'Powered by BBPS',
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SingleChildScrollView(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            mainAxisSpacing: 2.0,
                            crossAxisSpacing: 2.0,
                            childAspectRatio: 4 / 5,
                          ),
                          itemCount: listIcons.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * 0.02),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(listIcons[index].key, size: 20),
                                  const SizedBox(height: 4),
                                  Text(
                                    listIcons[index].value,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.008,
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Amount',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Proceed to Pay'),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListView.builder(
                itemCount: 5, // Assuming 5 recent transactions
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.monetization_on),
                    title: Text('Transaction #$index'),
                    subtitle: const Text('Amount: \$100'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Action to view transaction details
                    },
                  );
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
