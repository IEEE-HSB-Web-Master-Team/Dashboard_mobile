import 'package:dash_board_ieee/core/utils/app_color.dart';
import 'package:dash_board_ieee/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class NavigationControls extends StatelessWidget {
  final int currentPage;
  final VoidCallback onBackPressed;
  final VoidCallback onSkipPressed;
  final VoidCallback onNextPressed;

  const NavigationControls({
    required this.currentPage,
    required this.onBackPressed,
    required this.onSkipPressed,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      left: 40,
      right: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentPage != 0)
            IconButton(
              onPressed: onBackPressed,
              icon: Icon(Icons.arrow_back,
                  size: 25, color: AppColor.primaryColor),
            ),
          Row(
            children: [
              if (currentPage != 3)
                TextButton(
                  onPressed: onSkipPressed,
                  child: Text("Skip",
                      style: AppStyles.styleMostThick18(context)
                          .copyWith(color: AppColor.primaryColor)),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
