import 'package:dash_board_ieee/core/utils/app_color.dart';
import 'package:flutter/material.dart';

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
