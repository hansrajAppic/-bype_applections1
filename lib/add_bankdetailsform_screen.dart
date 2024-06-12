// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, non_constant_identifier_names, prefer_final_fields, unused_field, duplicate_ignore, use_build_context_synchronously

import 'dart:convert';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';


import 'package:flutter/material.dart';

import 'Globale_class/colors.dart';
import 'Globale_class/shardPreferance.dart';
import 'Json_model/getbanklist_models.dart';
import 'globale_class.dart';

class AddBankDetailsForm extends StatefulWidget {
  @override
  _AddBankDetailsFormState createState() => _AddBankDetailsFormState();
 }
class _AddBankDetailsFormState extends State<AddBankDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  String _selectedValue = 'Option 1'; // Initial selected value
  AutoCompleteTextField<String>? textField;

  TextEditingController _textEditingController = TextEditingController();
  TextEditingController accountNoController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController bankIdController = TextEditingController();

  TextEditingController branchController = TextEditingController();
  TextEditingController accountholderController = TextEditingController();

  // int bankid  ;
  late int bankId;
  double _kSize = 70.0;

  List<banklist> slectbankoptions = [];

  String? dataList;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getbankapi();
  }

  String? bankName;
  String? accountNumber;
  String? ifscCode;
  String? accountHolderName;
  String? branchName;
  bool showTable = false;
  // Define the showTable variable

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          actions: [
            // ignore: prefer_const_constructors
            Icon(
              Icons.help_outline_outlined,
              color:  AppColors.whiteColor,
              size: 22,
            ),
            SizedBox(
              width: w * 0.02,
            )
          ],
          backgroundColor: AppColors.Buttancolour,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color:  AppColors.whiteColor),
            onPressed: () {
              List<String> values = [
                _textEditingController.text,
                accountNoController.text,
                ifscCodeController.text,
                // bankIdController.text,
                branchController.text,
                accountholderController.text,
              ];
              Navigator.pop(
                context,
                values,
              );
            },
          ),
          title: Text(
            "Bank Details",
            style: TextStyle(
              color:  AppColors.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textField!,
                  SizedBox(
                    height: h * 0.02,
                  ),
                  TextFormField(
                    controller: accountNoController,
                    onChanged: (value) {
                      setState(() {
                        accountNumber = value;
                        if (value.length == 10) {
                          showTable = true;
                        } else {
                          showTable = false;
                        }
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.book_online_outlined),
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      labelText: 'Account Number',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Account Number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      accountNumber = value;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: ifscCodeController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.severe_cold),
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'IFSC Code',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter IFSC Code';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      ifscCode = value;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: accountholderController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_add),
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Account Holder Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Account Holder Name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      accountHolderName = value;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: branchController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_balance),
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Branch Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Branch Name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      branchName = value;
                    },
                  ),
                  SizedBox(height: 20.0),
                  Tabel(),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 45,
              left: w * 0.04,
              right: w * 0.04,
            ),
            child: TextButton(
              onPressed: isLoading
                  ? null
                  : () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Addbankdetails();
                      }
                    },
              style: TextButton.styleFrom(
                  minimumSize: Size(w * 0.5, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
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
                    ), )));
             }

  Widget Tabel() {
    return Visibility(
      visible: showTable,
      child: Table(
        border: TableBorder.all(),
        children: const [
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Branch',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(""
                        // fundMemberDetails.isNotEmpty
                        //     ? fundMemberDetails[0].name.toString()
                        //     : '',
                        )),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Bank',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(""
                      // fundMemberDetails.isNotEmpty
                      //     ? fundMemberDetails[0].loginID.toString()
                      // : '',
                      ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'ADDRESS',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(""
                      //   fundMemberDetails.isNotEmpty
                      //       ? fundMemberDetails[0].email.toString()
                      //       : '',
                      // ),
                      ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _showOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select an option'),
          content: SingleChildScrollView(
            child: Column(
              children: slectbankoptions.map((bank) {
                return ListTile(
                  title: Text(bank.name!),
                  onTap: () {
                    setState(() {
                      _textEditingController.text = bank.name!;
                      ifscCodeController.text = bank.ifsc!;
                      bankId = bank.id!;
                    });
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  Future<void> getbankapi() async {
    try {
    String? Mobile = await SharedPreferenceUtils.getValue("mob");
      String? Password = await SharedPreferenceUtils.getValue("pass");
      if ( Mobile != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final getbanklist = await MyGlobalFunctions.PostCall(
          '{"MethodName":"getbanklist","UserID":"$Mobile","Password":"$Password ",  }',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(getbanklist!);
        if (data["statuscode"] == "TXN") {
          final List<dynamic> jsonList = data['data'];
          final List<banklist> bankList =
              jsonList.map((json) => banklist.fromJson(json)).toList();
          setState(() {
            slectbankoptions = bankList;
            setupTextField(); // Setup text field after fetching banks
          });
        } else if (data["status"].toString() == "UnAuthorized Person") {
          MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
        }
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
  void setupTextField() {
    textField = AutoCompleteTextField<String>(
      key: GlobalKey<AutoCompleteTextFieldState<String>>(),
      controller: _textEditingController,
      clearOnSubmit: false,
      suggestions: slectbankoptions.map((bank) => bank.name!).toList(),
      decoration: InputDecoration(
        labelText: 'Search Bank Name',
        suffixIcon: IconButton(
          icon: Icon(Icons.arrow_drop_down),
          onPressed: () {
            _showOptions(context);
          },
        ),
        border: OutlineInputBorder(),
      ),
      itemBuilder: (context, suggestion) => ListTile(title: Text(suggestion)),
      itemFilter: (suggestion, query) =>
          suggestion.toLowerCase().startsWith(query.toLowerCase()),
      itemSorter: (a, b) => a.compareTo(b),
      itemSubmitted: (String value) {
        setState(() {
          _textEditingController.text = value;
          // Update IFSC code when bank name is selected
          var bank = slectbankoptions.firstWhere(
            (element) => element.name == value,
            orElse: () => banklist(ifsc: ''),
          );
          ifscCodeController.text = bank.ifsc!;
          bankId = bank.id!;
        });
      },
      textChanged: (text) {
        setState(() {
          _textEditingController.text = text;
        });
      },
    );
  }

  Future<void> Addbankdetails() async {
    try {
      setState(() {
        isLoading = true;
      });

     String? Mobile = await SharedPreferenceUtils.getValue("mob");
      String? Password = await SharedPreferenceUtils.getValue("pass");


      if ( Mobile != null) {
        final deviceID = await MyGlobalFunctions.getId();

        final getbanklist = await MyGlobalFunctions.PostCall(
          '{"MethodName":"addbankdetails","UserID":"$Mobile","Password":"$Password","AccountNo":"${accountNoController.text}","AccountNo":"${accountNoController.text}", "IfscCode":"${ifscCodeController.text}","BranchName":"${branchController.text}","BankID":"${bankId}",   "AccountHolderName":"${accountNoController.text}",  }',
          "$deviceID",
        );

        final Map<String, dynamic> data = json.decode(getbanklist!);
        if (data["statuscode"] == "TXN") {
          _showAlertDialog(context, data["status"].toString());
        } else {
          _showAlertDialog(context, data["status"].toString());
        }
      }
    } catch (error) {
      print('Error fetching data: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

// Function to show the alert dialog
  Future<void> _showAlertDialog(BuildContext context, String message) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Image.asset(
                "assets/images/mantrara.png",
                height: 90,
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(message),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    // Close the dialog without passing data
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    // Pass data to AddBankDetailsScreens and close the dialog
                    List<String> newData = [
                      _textEditingController.text,
                      accountNoController.text,
                      ifscCodeController.text,
                      bankIdController.text,
                      branchController.text,
                      accountholderController.text,
                    ];
                    Navigator.of(context)
                        .pop(newData); // Close the dialog and pass data
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      },
    ).then((value) {
      if (value != null) {
        Navigator.pop(context, value); // Return data to previous screen
      }
    });
  }
}
