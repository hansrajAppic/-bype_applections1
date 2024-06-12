// ignore_for_file: unused_local_variable, library_private_types_in_public_api, prefer_const_constructors, prefer_final_fields, unused_field, unnecessary_cast, non_constant_identifier_names, avoid_print, use_rethrow_when_possible, prefer_const_declarations, unnecessary_brace_in_string_interps, use_build_context_synchronously
import 'dart:convert';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'Globale_class/colors.dart';
import 'Json_model/getrollist_model.dart';
import 'Json_model/getstate_model2.dart';
import 'Widget_Class/costem_textformfild.dart';
import 'globale_class.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CreateAccount extends StatefulWidget {
  final dynamic selectedItem;
  final List<rollidlist> getrolelistarry;
  final String mobile; // Mobile number received from Contary widget

  const CreateAccount({
    Key? key,
    required this.selectedItem,
    required this.getrolelistarry,
    required this.mobile, // Declare mobile number here
  }) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _shopNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _aadharController = TextEditingController();
  TextEditingController _panController = TextEditingController();
  TextEditingController _pinController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  List<Statelist> slectbankoptions = [];
  Statelist? _selectedOption;
  TextEditingController dateController = TextEditingController();
  int? selectedStateId;
  bool isLoading = false;
  double _iconSize = 24.0;

  String? selectedGender;

  @override
  void initState() {
    dateController.text = "";
    super.initState();
    getstateApi(); // Fetch state data when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    final rolliD = widget.getrolelistarry[0].iD;
    final rolls = widget.getrolelistarry[0].name;
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Sign up Details',
          style: const TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
      ),
      body:
       SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              
              AutoCompleteTextField<Statelist>(
                key: GlobalKey(),
                clearOnSubmit: false,
                controller: _stateController,
                suggestions: slectbankoptions,
                decoration: InputDecoration(
                  labelText: 'Search for a state',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: PopupMenuButton<Statelist>(
                    itemBuilder: (context) => slectbankoptions
                        .map((option) => PopupMenuItem<Statelist>(
                              value: option,
                              child: Text(option.statename!),
                            ))
                        .toList(),
                    icon: Icon(Icons.arrow_drop_down,
                        size: _iconSize), // Add arrow icon here
                    onSelected: (Statelist value) {
                      setState(() {
                        _selectedOption = value;
                        _stateController.text = value.statename!;
                        _iconSize =
                            24.0; // Reset icon size when an option is selected
                        selectedStateId =
                            value.stateId; // Update selectedStateId
                      });
                    },
                    onCanceled: () {
                      setState(() {
                        _iconSize =
                            24.0; // Reset icon size when dropdown is canceled
                      });
                    },
                  ),
                ),
                itemFilter: (item, query) {
                  return item.statename!
                      .toLowerCase()
                      .contains(query.toLowerCase());
                },
                itemSorter: (a, b) {
                  return a.statename!.compareTo(b.statename!);
                },
                itemSubmitted: (item) {
                  setState(() {
                    _stateController.text = item.statename!;
                    _selectedOption = item;
                    selectedStateId = item.stateId; // Update selectedStateId
                  });
                },
                itemBuilder: (context, item) {
                  return ListTile(
                    title: Text(item.statename!),
                  );
                },
              ),




              // AutoCompleteTextField<Statelist>(
              //   key: GlobalKey(),
              //   clearOnSubmit: false,
              //   controller: _stateController,
              //   suggestions: slectbankoptions,
              //   decoration: InputDecoration(
              //     labelText: 'Search for a state',
              //     border: OutlineInputBorder(),
              //     prefixIcon: Icon(Icons.search),
              //     suffixIcon: PopupMenuButton<Statelist>(
              //       itemBuilder: (context) => slectbankoptions
              //           .map((option) => PopupMenuItem<Statelist>(
              //                 value: option,
              //                 child: Text(option.statename!),
              //               ))
              //           .toList(),
              //       icon: Icon(Icons.arrow_drop_down,
              //           size: _iconSize), // Add arrow icon here
              //       onSelected: (Statelist value) {
              //         setState(() {
              //           _selectedOption = value;
              //           _stateController.text = value.statename!;
    
              //           _iconSize =
              //               24.0; // Reset icon size when an option is selected
              //         });
              //       },
              //       onCanceled: () {
              //         setState(() {
              //           _iconSize =
              //               24.0; // Reset icon size when dropdown is canceled
              //         });
              //       },
              //     ),
              //   ),
              //   itemFilter: (item, query) {
              //     return item.statename!
              //         .toLowerCase()
              //         .contains(query.toLowerCase());
              //   },
              //   itemSorter: (a, b) {
              //     return a.statename!.compareTo(b.statename!);
              //   },
              //   itemSubmitted: (item) {
              //     setState(() {
              //       _stateController.text = item.statename!;
              //       stateIdIds = item.stateId!;
              //       _selectedOption = item;
              //     });
              //   },
              //   itemBuilder: (context, item) {
              //     return ListTile(
              //       title: Text(item.statename!),
              //     );
              //   },
              // ),


              SizedBox(height: 20.0),
              Form(
                key: _formKey,
                child: ListView.builder(
                  
                  scrollDirection: Axis.vertical,
                  controller: ScrollController(),
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormFild(
                          myController: index == 0
                              ? _cityController
                              : index == 1
                                  ? _nameController
                                  : index == 2
                                      ? _shopNameController
                                      : index == 3
                                          ? _emailController
                                          : index == 4
                                              ? _aadharController
                                              : index == 5
                                                  ? _panController
                                                  : index == 6
                                                      ? _pinController
                                                      : _addressController,
                          labelText: index == 0
                              ? 'City Name'
                              : index == 1
                                  ? 'Name'
                                  : index == 2
                                      ? 'Shop Name'
                                      : index == 3
                                          ? 'Email'
                                          : index == 4
                                              ? 'Aadhar Number'
                                              : index == 5
                                                  ? 'PAN Number'
                                                  : index == 6
                                                      ? 'Pin'
                                                      : 'Address',
                          hintText: index == 0
                              ? 'Enter your city name'
                              : index == 1
                                  ? 'Enter your name'
                                  : index == 2
                                      ? 'Enter your shop name'
                                      : index == 3
                                          ? 'Enter your email'
                                          : index == 4
                                              ? 'Enter your Aadhar number'
                                              : index == 5
                                                  ? 'Enter your PAN number'
                                                  : index == 6
                                                      ? 'Enter your Pin code'
                                                      : 'Enter your address',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return index == 0
                                  ? 'Please enter your city name'
                                  : index == 1
                                      ? 'Please enter your name'
                                      : index == 2
                                          ? 'Please enter your shop name'
                                          : index == 3
                                              ? 'Please enter your email'
                                              : index == 4
                                                  ? 'Please enter your Aadhar number'
                                                  : index == 5
                                                      ? 'Please enter your PAN number'
                                                      : index == 6
                                                          ? 'Please enter your Pin code'
                                                          : 'Please enter your address';
                            }



                            
                            return null;
                          },
                        ),




                        SizedBox(height: 20.0),
                      ],
                    );
                  },
                ),
               ),

              TextField(
                controller:
                    dateController, //editing controller of this TextField
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black45),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    border: OutlineInputBorder(),
                    // icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Enter Date" //label text of field
                    ),
                readOnly: true,
                onTap: () {
                  DatePicker();
                }, // when true user cannot edit text
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Radio(
                    value: 'Male',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value as String?;
                      });
                    },
                  ),
                  Text('Male'),
                  Radio(
                    value: 'Female',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value as String?;
                      });
                    },
                  ),
                  Text('Female'),
                  ElevatedButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          BorderSide(color: Colors.black)),
                    ),
                    child: Text('Selected'),
                    onPressed: () {
                      if (selectedGender != null) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Selected Gender'),
                              content: Text(selectedGender!),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),

              // ElevatedButton(
              //   onPressed: () {
              //     signupApi(widget.mobile, rolliD!);
              //   },
              //   child: Text("Submit"),
              // )
              SizedBox(
                height: h * 0.02,
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      signupApi(widget.mobile, rolliD!);
                    }
                  },
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void DatePicker() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(), //get today's date
        firstDate: DateTime(
            2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      print(
          pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(
          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
      print(
          formattedDate); //formatted date output using intl package =>  2022-07-04
      //You can format date as per your need

      setState(() {
        dateController.text =
            formattedDate; //set foratted date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }

  Future<void> getstateApi() async {
    try {
      final deviceID = await MyGlobalFunctions.getId();
      final getServiceList = await MyGlobalFunctions.PostCall(
        '{"MethodName":"getstate"}',
        "$deviceID",
      );
      final Map<String, dynamic> data = json.decode(getServiceList!);
      if (data["status"] == true) {
        final List<dynamic> jsonList = data['banklist'];
        setState(() {
          slectbankoptions =
              jsonList.map((json) => Statelist.fromJson(json)).toList();
        });
      } else if (data["status"].toString() == "UnAuthorized Person") {
        MyGlobalFunctions.showAlertDialog(context, "UnAuthorized Person!");
      }
    } catch (error) {
      print('Error fetching data: $error');
      throw error;
    }
  }

  Future<void> signupApi(
    String mobile,
    int rolliD,
  ) async {
    setState(() {
      isLoading = true;
    });

    final int packg = 0;
    final int tatelid = 1;

    try {
      final deviceID = await MyGlobalFunctions.getId();
      final getServiceList = await MyGlobalFunctions.PostCall(
        '{"MethodName":"signup", "StateID":"${selectedStateId}", "CityName":"${_cityController.text}","RoleID":"$rolliD","PackageID":"${packg}","TitleID":"${tatelid}","Name":"${_nameController.text}","ShopName":"${_shopNameController.text}","Email":"${_emailController.text}","Mobile":"${mobile}","Aadhar":"${_aadharController.text}","Pan":"${_panController.text}","Gender":"${"1"}","Pin":"${_pinController.text}","Address":"${_addressController.text}","DOB":"${dateController.text}"}',
        "$deviceID",
      );
      final Map<String, dynamic> data = json.decode(getServiceList!);
      if (data["statuscode"] == "TXN") {
        final List<dynamic> jsonList = data['banklist'];
        setState(() {
          slectbankoptions =
              jsonList.map((json) => Statelist.fromJson(json)).toList();
        });
      }
      MyGlobalFunctions.errorMessage(context, data["status"].toString());
    } catch (error) {
      print('Error fetching data: $error');
      throw error;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
