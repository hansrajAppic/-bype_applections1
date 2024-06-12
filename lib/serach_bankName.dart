import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'globale_class.dart';

class SerchBankName extends StatefulWidget {
  const SerchBankName({Key? key}) : super(key: key);

  @override
  State<SerchBankName> createState() => _SerchBankNameState();
}

class _SerchBankNameState extends State<SerchBankName> {
  List<String> _dataset = [];
  List<String> _filteredDataset = [];

  @override
  void initState() {
    super.initState();
    // Initialize filtered dataset with the full dataset
    _filteredDataset.addAll(_dataset);
    // Call API to fetch bank list
    sendRequest();
  }

  void _filterDataset(String query) {
    setState(() {
      _filteredDataset = _dataset
          .where(
              (element) => element.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Color(0xff36355f),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(69, 143, 145, 135),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: h * 0.027),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                      )),
                                  child: Icon(
                                    Icons.close_rounded,
                                    color: Colors.white,
                                  ),
                                ))),
                        Text(
                          "Select Your Bank",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Make sure your Aadhaar is linked with the bank account",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 130, 116, 116),
                          ),
                        ),
                        SizedBox(height: h * 0.02),
                        TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          onChanged: (value) {
                            _filterDataset(value);
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            hintText: "Search bank name",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.044,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _filteredDataset.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(31, 148, 119, 119))),
                    child: ListTile(
                      leading: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      title: Text(_filteredDataset[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> sendRequest() async {
    try {
      final deviceID = await MyGlobalFunctions.getId();
      var headers = {
        'deviceid': '$deviceID',
        'Cookie':
            'ASP.NET_SessionId=gg5uofsoxsrba1uv0egdcwrg; ASP.NET_SessionId=b4qkrzbfle40tws0hkysbufq'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://sonitechno.info/api/aeps.aspx'));
      request.fields.addAll(
          {'Request': '{"MethodName":"getbanklist"}', 'deviceID': '$deviceID'});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var decodedData = jsonDecode(responseData);
        if (decodedData["status"] == true) {
          setState(() {
            // Clear existing data
            _dataset.clear();
            // Extract bank names from the API response
            var bankList = decodedData["banklist"]["data"];
            for (var bank in bankList) {
              _dataset.add(bank["bankName"]);
            }
            // Update filtered dataset
            _filteredDataset.addAll(_dataset);
          });
        } else {
          print("API returned unsuccessful status");
        }
      } else {
        print("Request failed with status: ${response.reasonPhrase}");
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
