import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.txt, this.containerBgClr, this.borderClr, this.txtClr});

  final String txt;
  final Color? containerBgClr, borderClr, txtClr;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
          color: containerBgClr ?? AppColor.primaryColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 2, color: borderClr ?? Colors.transparent)),
      child: Center(
        child: Text(txt,
            style: AppStyles.styleMostThick18(context)
                .copyWith(color: txtClr ?? AppColor.white)),
      ),
    );
  }
}
