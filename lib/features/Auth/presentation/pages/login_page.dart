import 'dart:ui';

import 'package:dash_board_ieee/core/utils/app_color.dart';
import 'package:dash_board_ieee/core/utils/app_string.dart';
import 'package:dash_board_ieee/core/utils/app_style.dart';
import 'package:dash_board_ieee/core/utils/component/custom_camapaign_textfiled.dart';
import 'package:dash_board_ieee/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          SvgPicture.asset(
            Assets.imagesAuthBackground,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Gap(30),
                  HeaderWidget(title: AppString.welcome),
                  Gap(48),
                  ContainerForm(
                    child: Column(

                      children: [
                        TitleTextFiled(
                          title: AppString.email,
                          hint: "example@example.com",
                        ),
                        Gap(8),
                        TitleTextFiled(
                          title: AppString.password,
                          hint: "***************",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(Assets.imagesWrittenLogo),
        Gap(29),
        Text(title, style: AppStyles.styleBold34(context)),
      ],
    );
  }
}

class ContainerForm extends StatelessWidget {
  const ContainerForm({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.secondaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}

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
