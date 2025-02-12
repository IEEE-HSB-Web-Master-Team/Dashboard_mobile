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
}
