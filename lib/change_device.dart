// ignore_for_file: prefer_const_constructors


import 'Globale_class/colors.dart';
import 'package:flutter/material.dart';


class ChangeDevice extends StatefulWidget {
  const ChangeDevice({Key? key}) : super(key: key);

  @override
  State<ChangeDevice> createState() => _ChangeDeviceState();
}

class _ChangeDeviceState extends State<ChangeDevice> {
  String? _dropDownValue;
  bool _isLoading = false;

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
          "Change Device",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
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
                  Text(
                    "Select Your Bank",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: h * 0.033),
                ],
              ),
            ),
            Center(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<String>(
                  hint: _dropDownValue == null
                      ? Padding(
                          padding: EdgeInsets.only(left: w * 0.02),
                          child: Text('Dropdown'),
                        )
                      : Padding(
                          padding: EdgeInsets.only(left: w * 0.02),
                          child: Text(
                            _dropDownValue!,
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                  isExpanded: true,
                  iconSize: 30.0,
                  style: TextStyle(color: Colors.blue),
                  items: [
                    'Startek',
                    'Secugen',
                    'mantralris',
                    'aratek',
                    'SoniTechno',
                    'NextBiomatrix'
                        'Evolute',
                    'Precision',
                    'a complete IT solution',
                    'Morpho',
                    'Mantra',
                    'NextBiomatrix'
                  ].map(
                    (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(() {
                      _dropDownValue = val;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: h * 0.2,
            ),
            Center(
              child: TextButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        setState(() {
                          _isLoading = true;
                        });
                        Future.delayed(Duration(seconds: 2), () {
                          setState(() {
                            _isLoading = false;
                          });
                        });
                      },
                style: TextButton.styleFrom(
                  minimumSize: Size(w * 0.5, 50),
                  backgroundColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: _isLoading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white10),
                      )
                    : Text(
                        "Change Device",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        color: AppColors.whiteColor),
                        ),
                      ),
              ),
            
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: ChangeDevice()));
}
