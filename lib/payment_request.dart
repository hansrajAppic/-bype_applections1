// ignore_for_file: camel_case_types, prefer_const_constructors, sort_child_properties_last, unused_field, unnecessary_null_comparison, non_constant_identifier_names, use_build_context_synchronously, unused_local_variable

import 'dart:convert';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Globale_class/colors.dart';
import 'Globale_class/shardPreferance.dart';
import 'Json_model/companybanklist_model.dart';
import 'Json_model/getpaymentmode_model.dart';
import 'globale_class.dart';
import 'homnave_scree.dart';


class Paymentrequest_screen extends StatefulWidget {
  const Paymentrequest_screen({Key? key}) : super(key: key);

  @override
  State<Paymentrequest_screen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Paymentrequest_screen> {
  CompanyData? _selectedItem;
  List<CompanyData> _dropdownItems = [];
  paymentmodeData? _selectedPaymentmod;
  List<paymentmodeData> dropdownmenu = [];
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();
  final TextEditingController _referanceController = TextEditingController();

  String? _selectedItems;

  bool isLoading = false;

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getpaymentmodeApi();
    // Call API to fetch dropdown items
    CompanybanklistApi();
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
            'Payment Request',
            style: const TextStyle(
                color: AppColors.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w800),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: DropdownButtonFormField<int>(
                      value: _selectedItem?.iD, // Use ID as the value
                      onChanged: (int? newValue) {
                        setState(() {
                          // Find the corresponding CompanyData object based on the selected ID
                          _selectedItem = _dropdownItems
                              .firstWhere((element) => element.iD == newValue);
                        });
                      },
                      items: _dropdownItems.map((CompanyData value) {
                        return DropdownMenuItem<int>(
                          value: value.iD!, // Set the ID as the value
                          child: Text(value.accountNumber ?? ''),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        hintText: 'Select Company Details',
                        hintStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                    width: double.infinity,
                    height: h * 0.06,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ' ₹ 6.24',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  TextFormField(
                    controller: _amountController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.pinkAccent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.pinkAccent,
                        ),
                      ),
                      hintText: '0.00',
                      labelText: 'Amount',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter amount';
                      }
                      // You can add more validation logic here if needed
                      return null;
                    },
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  TextFormField(
                    controller: _referanceController,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.pinkAccent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.pinkAccent,
                        ),
                      ),
                      labelText: 'Bank Reference Number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a bank reference number';
                      }
                      // Add more validation if needed
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        // _bankReferenceNumber = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (_selectedDate != null)
                          Padding(
                            padding: EdgeInsets.only(left: w * 0.02),
                            child: Text(
                              'SelecteDate:  ${_selectedDate != null ? "${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}" : "Not Selected"}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: _selectedDate != null
                                    ? Colors.green
                                    : Colors
                                        .black, // Change only the color of the "SelecteTime" text
                              ),
                            ),
                          ),
                        IconButton(
                          onPressed: () {
                            _selectDate(context);
                          },
                          icon: Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: DropdownButtonFormField<int>(
                      value: _selectedPaymentmod?.iD, // Use ID as the value
                      onChanged: (int? newValue) {
                        setState(() {
                          // Find the corresponding paymentmodeData object based on the selected ID
                          _selectedPaymentmod = dropdownmenu
                              .firstWhere((element) => element.iD == newValue);
                        });
                      },
                      items: dropdownmenu.map((paymentmodeData value) {
                        return DropdownMenuItem<int>(
                          value: value.iD!, // Set the ID as the value
                          child: Text(value.nAME ?? ''),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        hintText: 'Select Company Details',
                        hintStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  TextFormField(
                    controller: _remarksController,
                    // maxLines: 5,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.pinkAccent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.pinkAccent,
                        ),
                      ),
                      hintText: 'Type your remarks here...',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some remarks';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 0,
            ),
            child: TextButton(
              onPressed: isLoading
                  ? null
                  : () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        paymentrequest();
                      }
                    },
              style: TextButton.styleFrom(
                  minimumSize: Size(w * 0.5, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor: isLoading
                      ? AppColors.BUttonDisable
                      : AppColors.Buttancolour),
              child: isLoading
                  ? CircularProgressIndicator(
                      color: AppColors.whiteColor) // Show loading indicator
                  : Text(
                      "SUBMIT",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteColor,
                      ),
                    ),
            )));
    
  }

  Future<void> CompanybanklistApi() async {
    try {
      String? Mobile = await SharedPreferenceUtils.getValue("mob");
      String? Password = await SharedPreferenceUtils.getValue("pass");
      if (Mobile != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final Companybanklist = await MyGlobalFunctions.PostCall(
          '{"MethodName":"companybanklist","UserID":"$Mobile","Password":"$Password", "AppType": " Apps"  }',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(Companybanklist!);
        if (data["statuscode"] == "TXN") {
          final List<dynamic> jsonList = data['data'];
          final List<CompanyData> listMembers = jsonList
              .map((json) => CompanyData.fromJson(json))
              .cast<CompanyData>()
              .toList(); // Ensure type casting to CompanyData
          setState(() {
            _dropdownItems = listMembers;
          });
        } else if (data["status"].toString() == "UnAuthorized Person") {
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching data: $error');
      }
    }
  }

  Future<void> getpaymentmodeApi() async {
    try {
     String? Mobile = await SharedPreferenceUtils.getValue("mob");
    String? Password = await SharedPreferenceUtils.getValue("pass");
      if (Mobile != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final getpaymentmode = await MyGlobalFunctions.PostCall(
          '{"MethodName":"getpaymentmode","UserID":"$Mobile","Password":"$Password", "AppType": " Apps"  }',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(getpaymentmode!);
        if (data["statuscode"] == "TXN") {
          final List<dynamic> jsonList = data['data'];
          final List<paymentmodeData> listMembers = jsonList
              .map((json) => paymentmodeData.fromJson(json))
              .cast<paymentmodeData>()
              .toList(); // Ensure type casting to paymentmodeData
          setState(() {
            dropdownmenu = listMembers;
          });
        } else if (data["status"].toString() == "UnAuthorized Person") {
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching data: $error');
      }
    }
  }

  Future<void> paymentrequest() async {
    try {
      setState(() {
        isLoading = true;
      });

    String? Mobile = await SharedPreferenceUtils.getValue("mob");
      String? Password = await SharedPreferenceUtils.getValue("pass");

      if (Mobile != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final String selectedPaymentModeId =
            _selectedPaymentmod?.iD.toString() ??
                ''; // Get the selected payment mode ID

        final String selectedCompanyId =
            _selectedItem?.iD.toString() ?? ''; // Get the selected company ID

        final Companybanklist = await MyGlobalFunctions.PostCall(
          '{"MethodName":"paymentrequest","UserID":"$Mobile","Password":"$Password", "ReferanceNo":"${_referanceController.text}","Amount":"${_amountController.text}","PaymentDate":"${_selectedDate.toIso8601String()}", "Remark":"${_remarksController.text}", "PaymentMode":"$selectedPaymentModeId", "CompanyBankID":"$selectedCompanyId"}',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(Companybanklist!);
        if (data["statuscode"] == "TXN") {
          // MyGlobalFunctions.errorMessage(context, data["status"].toString());
        }
        _showDialog(context, data);

        // MyGlobalFunctions.errorMessage(context, data["status"].toString());
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching data: $error');
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _showDialog(BuildContext context, Map<String, dynamic> data) async {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          insetPadding: EdgeInsets.all(8),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              final String selectedPaymentModeId =
                  _selectedPaymentmod?.iD.toString() ?? '';
              return Container(
                width: double.infinity,
                height: h * 0.28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.02, vertical: h * 0.004),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          minimumSize: Size(w * double.infinity, 20),
                          backgroundColor: Colors.redAccent,
                        ),
                        child: Text(
                          "Payment Request Confirmation",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.002,
                      ),
                      Text(
                        'Amount: ${_amountController.text}',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Remarks: ${_remarksController.text}',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Bank Reference Number: ${_referanceController.text}',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "$_selectedDate ",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: h * 0.002,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    data["status"].toString(),
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeNaveScreens(
                                          index: 0,
                                        )),
                              ); // Dismiss the dialog
                            },
                            child: Text('OK'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
