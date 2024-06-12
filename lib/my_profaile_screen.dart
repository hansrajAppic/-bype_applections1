import 'package:flutter/material.dart';

import 'Globale_class/colors.dart';
import 'Globale_class/companyinformationdata.dart';
import 'Json_model/company_logain_details_model.dart';
import 'Json_model/user_logain_details_model.dart';
import 'homnave_scree.dart';

class MyProfile_Screen extends StatefulWidget {
  const MyProfile_Screen({Key? key});

  @override
  State<MyProfile_Screen> createState() => _MyProfile_ScreenState();
}

class _MyProfile_ScreenState extends State<MyProfile_Screen> {
  List<userData> logainArray = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    _CompanyDatas();
    _assignCustomerData();
    super.initState();
    // Call the API when the widget is created
  }

  Global globalInstance = Global();
  CompanyData? companyData;

  void _CompanyDatas() async {
    companyData = await globalInstance.getCompanyData();
    setState(() {
      companyData = companyData;
    });
  }

  GetlogindetailsModel? CustomerData;

  void _assignCustomerData() async {
    CustomerData = await globalInstance.getCustomerData();
    setState(() {
      CustomerData = CustomerData;
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
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeNaveScreens(
                          index: 0,
                        )));
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h * 0.05),
            Center(
              child: Image.asset(
                "assets/images/rsz_1sonitecno.png",
                height: 40,
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: InkWell(
                onTap: () {},
                child: Text(
                  "RETAILER",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            buildInfoItem("Mobaile No",
                "${(CustomerData != null ? CustomerData!.data![0].mobilenumber : "")}"),
            buildInfoItem("Email id",
                "${(CustomerData != null ? CustomerData!.data![0].email : "")}"),
            buildInfoItem("User Name",
                "${(CustomerData != null ? CustomerData!.data![0].username : "")}"),
            buildInfoItem("Pan No",
                "${(CustomerData != null ? CustomerData!.data![0].pan : "")}"),
            buildInfoItem("Aadhar no",
                "${(CustomerData != null ? CustomerData!.data![0].aadhar : "")}"),
            buildInfoItem("Joining Date ",
                "${(CustomerData != null ? CustomerData!.data![0].adddate : "")}"),
            SizedBox(height: h * 0.2),
          ],
        ),
      ),
    );
  }

  Widget buildInfoItem(String label, String value) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.044),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: h * 0.01),
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: h * 0.01),
          Container(
            height: h * 0.070,
            width: double.infinity,
            decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 137, 126, 126)),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(value),
            ),
          ),
        ],
      ),
    );
  }
}
