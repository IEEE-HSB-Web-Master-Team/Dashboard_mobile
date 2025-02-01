import 'package:dash_board_ieee/core/utils/app_style.dart';
import 'package:dash_board_ieee/core/utils/component/custom_camapaign_textfiled.dart';
import 'package:flutter/material.dart';

class TitleTextFiled extends StatelessWidget {
  const TitleTextFiled({
    super.key,
    required this.title,
    required this.hint, 
  });

  final String title;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.styleBold14(context),
        ),
        CustomTextFiled(
          hint: hint,
          maxLine: 1,
          labelText: "",
        ),
      ],
    );
  }
}
