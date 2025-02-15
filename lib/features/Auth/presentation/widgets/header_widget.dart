import 'package:dash_board_ieee/core/utils/app_style.dart';
import 'package:dash_board_ieee/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

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
