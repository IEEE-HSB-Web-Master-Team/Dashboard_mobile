
import 'package:dash_board_ieee/core/utils/app_color.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

abstract class Helper {
  static String timeToString(TimeOfDay time) {
    try {
      final DateTime now = DateTime.now();
      final date = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );
      final formatType = DateFormat.jm();
      return formatType.format(date);
    } catch (e) {
      return '12:00';
    }
  }

  static String dateToString(DateTime date) {
    return DateFormat.yMMMd().format(date);
  }

 static  UnderlineInputBorder buildOutlineInputBorder() {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColor.secondaryColor,
        strokeAlign: BorderSide.strokeAlignOutside,
        ),
    );
  }
}
