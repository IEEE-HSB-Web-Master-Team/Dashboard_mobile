import 'package:dash_board_ieee/core/utils/app_color.dart';
import 'package:dash_board_ieee/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FotterForm extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onPressed;
  const FotterForm(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style:
              AppStyles.styleBold15(context).copyWith(color: Color(0xff8CBED7)),
        ),
        Gap(6),
        TextButton(
          onPressed: onPressed,
          child: Text(
            subTitle,
            style: AppStyles.styleBold14(context).copyWith(
              color: AppColor.primaryColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
