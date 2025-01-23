import 'package:dash_board_ieee/core/utils/app_color.dart';
import 'package:dash_board_ieee/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart'; // Import PageViewModel

class OnboardingPageWidget extends StatelessWidget {
  final String title;
  final String body;
  final String imagePath;

  const OnboardingPageWidget({
    required this.title,
    required this.body,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.styleMostThick24(context)
              .copyWith(color: AppColor.black),
        ),
        SizedBox(height: 16),
        Text(
          body,
          textAlign: TextAlign.center,
          style: AppStyles.styleMedium13(context)
              .copyWith(color: AppColor.secondaryTextColor),
        ),
        SizedBox(height: 32),
        SvgPicture.asset(imagePath, width: 328, height: 216),
      ],
    );
  }

  // A helper method to convert this widget into a PageViewModel.
  PageViewModel toPageViewModel(BuildContext context) {
    return PageViewModel(
      titleWidget: Text(
        title,
        textAlign: TextAlign.center,
        style:
            AppStyles.styleMostThick24(context).copyWith(color: AppColor.black),
      ),
      bodyWidget: Text(
        body,
        textAlign: TextAlign.center,
        style: AppStyles.styleMedium13(context)
            .copyWith(color: AppColor.secondaryTextColor),
      ),
      image: SvgPicture.asset(imagePath, width: 328, height: 216),
    );
  }
}
