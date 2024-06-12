import 'dart:convert';

import 'package:bype_applections1/Globale_class/shardPreferance.dart';
import 'package:bype_applections1/Json_model/company_logain_details_model.dart';
import 'package:bype_applections1/Json_model/user_logain_details_model.dart';

class Global {
  Future<GetlogindetailsModel?> getCustomerData() async {
    String? response = await SharedPreferenceUtils.getValue("loginResponse");
    if (response != null) {
      // Decode the JSON string and create a  GetlogindetailsModel object
      Map<String, dynamic> jsonMap = jsonDecode(response);
      GetlogindetailsModel? user = GetlogindetailsModel.fromJson(jsonMap);
      return user;
    }
    return null;
  }

  Future<CompanyData?> getCompanyData() async {
    String? stringValue =
        await SharedPreferenceUtils.getValue('GetCompanyDetails');
    if (stringValue != null) {
      // Decode the JSON string and create a CompanyData object
      Map<String, dynamic> jsonMap = jsonDecode(stringValue);
      CompanyData company = CompanyData.fromJson(jsonMap);
      return company;
    }
    return null;
  }
}
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_local_variable, use_build_context_synchronously
