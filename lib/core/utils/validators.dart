import 'package:flutter/material.dart';

class Validators {
  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'enter email';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'invalid email';
    }
    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'enter password';
    }
    if (value.length < 8) {
      return 'password must be at least 6 characters';
    }
    return null;
  }
  // validte confirm password
   static String? validateConfirmPassword(String? password, String? confirmPassword, BuildContext context) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'enter confirm password';
    }
    if (password != confirmPassword) {
      return 'passwords do not match';
    }
    return null;
  }
  // validate  Empty
  static String? validateEmpty(String? value, String? title) {
    if (value == null || value.trim().isEmpty) {
      return 'You must enter your $title';
    }
    return null;
  }
  // validate phone number
   static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'You must enter your phone';
    }

    var regex = RegExp(
      r"^(?:\+20|0)?1[0125]\d{8}$",
    );

    if (!regex.hasMatch(value)) {
      return """Must be 11 digits starts with (+20) or 0
Prefix is 10, 11, 12 or 15 only""";
    }

    return null;
  }

}
