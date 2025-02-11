import 'package:dash_board_ieee/core/utils/app_style.dart';
import 'package:dash_board_ieee/core/utils/component/custom_camapaign_textfiled.dart';
import 'package:dash_board_ieee/core/utils/validators.dart';
import 'package:flutter/material.dart';

class TitleTextFiled extends StatelessWidget {
  const TitleTextFiled({
    super.key,
    required this.title,
    required this.hint,
    this.controller,
    this.validator,
  });

  final String title;
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

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
          validator: validator,
          textEditingController: controller,
          hint: hint,
          maxLine: 1,
          labelText: "",
        ),
      ],
    );
  }
}
