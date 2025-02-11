import 'package:dash_board_ieee/config/routes/routs.dart';
import 'package:dash_board_ieee/core/di/service_locator.dart';
import 'package:dash_board_ieee/core/utils/app_string.dart';
import 'package:dash_board_ieee/core/utils/app_style.dart';
import 'package:dash_board_ieee/core/utils/component/custom_toast.dart';
import 'package:dash_board_ieee/core/utils/validators.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/request/login_request_entity.dart';
import 'package:dash_board_ieee/features/Auth/presentation/viewModel/auth_actions.dart';
import 'package:dash_board_ieee/features/Auth/presentation/widgets/auth_button.dart';
import 'package:dash_board_ieee/features/Auth/presentation/widgets/container_form.dart';
import 'package:dash_board_ieee/features/Auth/presentation/widgets/form_fotter.dart';
import 'package:dash_board_ieee/features/Auth/presentation/widgets/header_widget.dart';
import 'package:dash_board_ieee/features/Auth/presentation/widgets/title_text_filed.dart';
import 'package:dash_board_ieee/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewModel/auth_view_model_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final AuthViewModelCubit viewModel;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    viewModel = getIt<AuthViewModelCubit>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BlocProvider<AuthViewModelCubit>(
        create: (context) => viewModel,
        child: BlocListener<AuthViewModelCubit, AuthViewModelState>(
          listener: (context, state) {
            switch (state) {
              case LoginLoadingState():
                CustomToast.showLoadingToast(message: 'Loading...');
                break;
              case LoginSuccessState():
                CustomToast.showSuccessToast(message: 'Success');
                break;
              case LoginErrorState():
                CustomToast.showErrorToast(
                    message: state.errorMessage.error.toString());
                break;
              default:
                null;
            }
          },
          child: Stack(
            children: [
              SvgPicture.asset(
                Assets.imagesAuthBackground,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Positioned.fill(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Gap(30),
                          HeaderWidget(title: AppString.welcome),
                          Gap(48),
                          ContainerForm(
                            child: Column(
                              children: [
                                Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      TitleTextFiled(
                                        validator: (value) {
                                          return Validators.validateEmail(
                                              value, context);
                                        },
                                        controller: emailController,
                                        title: AppString.email,
                                        hint: AppString.hintExample,
                                      ),
                                      Gap(8),
                                      TitleTextFiled(
                                        validator: (value) {
                                          return Validators.validatePassword(
                                              value, context);
                                        },
                                        controller: passwordController,
                                        title: AppString.password,
                                        hint: "*******",
                                      ),
                                    ],
                                  ),
                                ),
                                Gap(8),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    AppString.forgetPassword,
                                    style: AppStyles.styleBold14(context),
                                  ),
                                ),
                                Gap(24),
                                AuthButton(
                                    title: AppString.login,
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        viewModel.doAction(LoginAction(
                                            LoginRequestEntity(
                                                emailController.text,
                                                passwordController.text)));
                                      }
                                    }),
                                Gap(10),
                                FotterForm(
                                  onPressed: () =>
                                      context.go(AppRoute.signupView),
                                  title: AppString.dontHaveAccount,
                                  subTitle: AppString.signUp,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
