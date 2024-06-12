// ignore_for_file: prefer_final_fields, non_constant_identifier_names, unused_field, prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use


import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'Globale_class/colors.dart';
import 'Widget_Class/costem_textformfild.dart';
import 'package:bype_applections1/Widget_Class/customvalidator.dart';

import 'serach_bankName.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CashWithdraw extends StatefulWidget {
  const CashWithdraw({Key? key}) : super(key: key);

  @override
  State<CashWithdraw> createState() => _CashWithdrawState();
}

class _CashWithdrawState extends State<CashWithdraw> {

  TextEditingController Adharcontroller = TextEditingController();
  TextEditingController mobcontroller = TextEditingController();
  List<String> arrayValues = ["10000", "5000", "1000", "500"];
  List<Map<String, dynamic>> Listicon = [
    {"icon": "assets/images/hfdc.png"},
    {"icon": "assets/images/icic.png"},
    {"icon": "assets/images/pungab.png"},
    {"icon": "assets/images/icic.png"},
    {"icon": "assets/images/icic.png"},
    {"icon": "assets/images/bank.png"},
  ];

  double _imageHeight = 100.0;
  int selectedIndex =
      -1; // Initialize selectedIndex to -1 to indicate no selection

  final List<String> banks = ['Bank 1', 'Bank 2', 'Bank 3', 'Bank 4'];
  final formKey = GlobalKey<FormState>();
  final List<String> SlectvalueArray = [
    'Pending',
    'Pending',
    'Pending',
    'Pending'
  ];

  @override
  void initState() {
    super.initState();

    Adharcontroller.text = '10,000';
  }

  int _selectedBankIndex = -1; // Initially no bank selected

  List<String> bankss = ['Bank 1', 'Bank 2', 'Bank 3'];

  final TextEditingController _aadhaarController = TextEditingController();
  String _validationMessage = '';

  @override
  void dispose() {
    _aadhaarController.dispose();
    super.dispose();
  }

  void _validateAadhaar(String aadhaar) {
    final cleanedAadhaar = aadhaar.replaceAll(' ', '');

    if (cleanedAadhaar.length != 12) {
      setState(() {
        _validationMessage = 'Aadhaar must be exactly 12 digits.';
      });
      return;
    }

    if (cleanedAadhaar.substring(0, 1) == '0' || cleanedAadhaar.substring(0, 1) == '1') {
      setState(() {
        _validationMessage = 'Aadhaar should not start with 0 or 1.';
      });
      return;
    }

    final validCharacters = RegExp(r'^[0-9]+$');
    if (!validCharacters.hasMatch(cleanedAadhaar)) {
      setState(() {
        _validationMessage = 'Aadhaar must contain only digits.';
      });
      return;
    }

    setState(() {
      _validationMessage = 'Aadhaar is valid.';
    });
  }



  // barcod example
  String _scanResult = 'Unknown';

  Future<void> _scanQRCode() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      Adharcontroller.text = barcodeScanRes;
      _scanResult = barcodeScanRes;
    });
  }
































  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Cash Withdraw",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Form(
        // autovalidateMode: AutovalidateMode.always,
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your AEPS balance is ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent,
                  ),
                ),
                SizedBox(height: h * 0.001),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "₹",
                      style: TextStyle(
                        fontSize: 39,
                        fontWeight: FontWeight.w400,
                        color: Colors.pinkAccent,
                      ),
                    ),
                    SizedBox(width: w * 0.02),
                    Text(
                      "0.0",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.fact_check,
                      color: Colors.pinkAccent,
                      size: 40,
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: w * 0.15,
                        child: Divider(
                          thickness: 4,
                        ),
                      ),
                      SizedBox(height: h * 0.033),
                      Image.asset(
                        "assets/images/rsz_1sonitecno.png",
                        height: 50,
                      ),
                      SizedBox(height: h * 0.033),
                      Container(
                        width: w * 0.52, // Set desired width here
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w800,
                            color: Colors.black54,
                          ),
                          controller: Adharcontroller,
                          decoration: InputDecoration(
                            isDense: true,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.pinkAccent,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.pinkAccent,
                              ),
                            ),
                            prefix: SizedBox(
                              width: w * 0.1200,
                              child: Text(
                                '₹',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.pinkAccent,
                                ),
                              ),
                            ),
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.03),
                      SizedBox(
                        height: h * 0.05,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: arrayValues.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  Adharcontroller.text = arrayValues[index];
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(4),
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black54),
                                ),
                                child: Text(
                                  arrayValues[index],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.pinkAccent,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: w*0.13),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextField(
                              controller: _aadhaarController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(12), // Limit length including spaces
                                // Inline AadhaarNumberInputFormatter logic
                                TextInputFormatter.withFunction((oldValue, newValue) {
                                  final text = newValue.text.replaceAll(' ', '');
                                  final buffer = StringBuffer();

                                  for (int i = 0; i < text.length; i++) {
                                    buffer.write(text[i]);
                                    if (i % 4 == 3 && i != text.length - 1) {
                                      buffer.write(' ');
                                    }
                                  }

                                  final newText = buffer.toString();
                                  return newValue.copyWith(
                                    text: newText,
                                    selection: TextSelection.collapsed(offset: newText.length),
                                  );
                                }),
                              ],
                              decoration: InputDecoration(
                                hintText: 'Enter Aadhaar Number',
                                labelText: 'Aadhaar Number',
                                errorText: _validationMessage.isNotEmpty ? _validationMessage : null,
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.qr_code),
                                  onPressed: _scanQRCode,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            TextField(
                              controller:  mobcontroller ,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              decoration: InputDecoration(
                                hintText: 'Enter Mobile Number',
                                labelText: 'Mobile Number',
                                errorText: _validationMessage.isNotEmpty ? _validationMessage : null,
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.phone_iphone),
                                  onPressed: _scanQRCode,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _validationMessage = CustomValidator.validateMobile(value) ?? '';
                                });
                              },
                            ),

                          ],
                        ),
                      ),





                      Text(
                        "Select Your Bank",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        height: h * 0.1,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Listicon.length,
                          itemBuilder: (context, index) {
                            // Calculate maxRadius based on available space
                            double maxRadius =
                                MediaQuery.of(context).size.shortestSide / 2;

                            return GestureDetector(
                              onTap: () {
                                if (index == 5) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SerchBankName()));
                                }
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: w * 0.03),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black12,
                                    maxRadius: 16,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          maxRadius), // Clip with circular border radius
                                      child: Image.asset(
                                        Listicon[index]["icon"],
                                        height: maxRadius * 0.14,

                                        width: maxRadius * 0.14,

                                        fit: BoxFit
                                            .cover, // Use BoxFit.cover to fill the CircleAvatar
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        "Active Bank",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      SizedBox(
                        height: h * 0.08,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: bankss.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedBankIndex =
                                        index; // Update selectedIndex when a ListTile is tapped
                                  });
                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(9),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 2,
                                          ),
                                          color: _selectedBankIndex == index
                                              ? Colors.green
                                              : null,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          size: 18,
                                          color: _selectedBankIndex == index
                                              ? AppColors.whiteColor
                                              : Colors.grey,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            bankss[index],
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            SlectvalueArray[index],
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      )
                                    ]));
                          },
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextButton(
                            onPressed: () {  _validateAadhaar(_aadhaarController.text);
                              if (formKey.currentState!.validate()) {
                                // Form is valid, proceed with authentication
                                _validateAadhaar(_aadhaarController.text);
                              }
                            },
                            style: TextButton.styleFrom(
                              minimumSize: Size(MediaQuery.of(context).size.width * 0.5, 50),
                              backgroundColor: Colors.pinkAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "Authenticate",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: h * 0.03,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}



