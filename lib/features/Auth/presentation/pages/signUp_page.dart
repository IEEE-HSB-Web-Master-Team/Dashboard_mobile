import 'package:dash_board_ieee/config/routes/routs.dart';
import 'package:dash_board_ieee/core/utils/app_color.dart';
import 'package:dash_board_ieee/core/utils/app_string.dart';
import 'package:dash_board_ieee/core/utils/app_style.dart';
import 'package:dash_board_ieee/features/Auth/presentation/widgets/auth_button.dart';
import 'package:dash_board_ieee/features/Auth/presentation/widgets/container_form.dart';
import 'package:dash_board_ieee/features/Auth/presentation/widgets/form_fotter.dart';
import 'package:dash_board_ieee/features/Auth/presentation/widgets/header_widget.dart';
import 'package:dash_board_ieee/features/Auth/presentation/widgets/select_role_section.dart';
import 'package:dash_board_ieee/features/Auth/presentation/widgets/title_text_filed.dart';
import 'package:dash_board_ieee/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
                  HeaderWidget(
                    title: AppString.createAmAccount,
                  ),
                  Gap(24),
                  ContainerForm(
                    child: Column(
                      children: [
                        TitleTextFiled(
                          title: AppString.email,
                          hint: AppString.hintExample,
                        ),
                        Gap(8),
                        TitleTextFiled(
                          title: AppString.password,
                          hint: "*********",
                        ),
                        Gap(8),
                        TitleTextFiled(
                          title: AppString.confirmPassword,
                          hint: "********",
                        ),
                        Gap(16),
                        SelectRoleSection(),
                        Gap(16),
                        AuthButton(
                          title: AppString.signUp,
                          onPressed: () {},
                        ),
                        Gap(10),
                        FotterForm(
                          onPressed: () => context.go(AppRoute.loginView),
                          title: AppString.alreadyHaveAccount,
                          subTitle: AppString.login,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

