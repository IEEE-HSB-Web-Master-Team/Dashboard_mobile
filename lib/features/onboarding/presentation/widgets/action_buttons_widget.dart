import 'package:dash_board_ieee/core/utils/app_color.dart';
import 'package:dash_board_ieee/features/onboarding/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ActionButtonsWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onSignInPressed;
  final VoidCallback onSignUpPressed;
  final VoidCallback onNextPressed;

  const ActionButtonsWidget({
    required this.currentPage,
    required this.totalPages,
    required this.onSignInPressed,
    required this.onSignUpPressed,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return currentPage == totalPages - 1
        ? Row(
            children: [
              Expanded(
                child: GestureDetector(
                    onTap: onSignUpPressed,
                    child: CustomButton(txt: 'Sign Up')),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: GestureDetector(
                    onTap: onSignInPressed,
                    child: CustomButton(
                      txt: 'Sign In',
                      borderClr: AppColor.primaryColor,
                      txtClr: AppColor.primaryColor,
                      containerBgClr: AppColor.white,
                    )),
              ),
            ],
          )
        : GestureDetector(
            onTap: onNextPressed, child: CustomButton(txt: 'Next'));
  }
}
