import 'package:flutter/material.dart';
class CustomValidator {

  static String? validateMobile(String? value) {
  if (value == null || value.isEmpty) {
  return 'Mobile number is required';
  }

  // Regular expression to match Indian mobile numbers
  final RegExp mobileRegex = RegExp(r'^[6-9]\d{9}$');

  if (!mobileRegex.hasMatch(value)) {
  return 'Invalid mobile number';
  }

  return null; // Return null if validation passes
  }
  }


