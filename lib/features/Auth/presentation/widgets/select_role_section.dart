import 'package:dash_board_ieee/core/utils/app_color.dart';
import 'package:dash_board_ieee/core/utils/app_string.dart';
import 'package:dash_board_ieee/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class SelectRoleSection extends StatefulWidget {
  const SelectRoleSection({super.key});

  @override
  State<SelectRoleSection> createState() => _SelectRoleSectionState();
}

class _SelectRoleSectionState extends State<SelectRoleSection> {
 String selectedRole = AppString.admin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomRadio(
          title: AppString.admin,
          value: AppString.admin,
          groupValue: selectedRole,
          onChanged: (value) {
            setState(() {
              selectedRole = value!;
            });
          },
        ),
        CustomRadio(
          title: AppString.volunteer,
          value: AppString.volunteer,
          groupValue: selectedRole,
          onChanged: (value) {
            setState(() {
              selectedRole = value!;
            });
          },
        ),
      ],
    );
  }
}

class CustomRadio extends StatelessWidget {
  const CustomRadio({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });
  final String title;

  final String value;
  final String groupValue;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          activeColor: AppColor.primaryColor,
          fillColor: MaterialStateProperty.all(AppColor.primaryColor),
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(
          title,
          style: AppStyles.styleBold14(context)
              .copyWith(color: AppColor.primaryColor),
        ),
      ],
    );
  }
}
