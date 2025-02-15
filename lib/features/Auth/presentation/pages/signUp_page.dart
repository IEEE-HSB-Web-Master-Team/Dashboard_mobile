import 'package:dash_board_ieee/config/routes/routs.dart';
import 'package:dash_board_ieee/core/utils/app_color.dart';
import 'package:dash_board_ieee/core/utils/app_string.dart';
import 'package:dash_board_ieee/core/utils/app_style.dart';
import 'package:dash_board_ieee/core/utils/component/custom_drop_menu.dart';
import 'package:dash_board_ieee/core/utils/component/custom_toast.dart';
import 'package:dash_board_ieee/core/utils/validators.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/request/signup_reqest_etity.dart';
import 'package:dash_board_ieee/features/Auth/presentation/viewModel/auth_actions.dart';
import 'package:dash_board_ieee/features/Auth/presentation/viewModel/auth_view_model_cubit.dart';
import 'package:dash_board_ieee/features/Auth/presentation/widgets/auth_button.dart';
import 'package:dash_board_ieee/features/Auth/presentation/widgets/container_form.dart';
import 'package:dash_board_ieee/features/Auth/presentation/widgets/form_fotter.dart';
import 'package:dash_board_ieee/features/Auth/presentation/widgets/header_widget.dart';
import 'package:dash_board_ieee/features/Auth/presentation/widgets/select_role_section.dart';
import 'package:dash_board_ieee/features/Auth/presentation/widgets/title_text_filed.dart';
import 'package:dash_board_ieee/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController userNameController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController phoneController;
  final formKey = GlobalKey<FormState>();

  late final AuthViewModelCubit viewModel;
  String selectedRole = "Chair";
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    userNameController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
    viewModel = context.read<AuthViewModelCubit>();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SignListenerWidget(),
                      const HeaderWidget(
                        title: AppString.createAmAccount,
                      ),
                      const Gap(24),
                      ContainerForm(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleTextFiled(
                              title: AppString.userName,
                              hint: AppString.userNameEx,
                              controller: userNameController,
                              validator: (value) {
                                return Validators.validateEmpty(
                                    value, "User Name");
                              },
                            ),
                            const Gap(8),
                            TitleTextFiled(
                              title: AppString.phone,
                              hint: AppString.hintPhone,
                              controller: phoneController,
                              validator: (value) {
                                return Validators.validatePhoneNumber(value);
                              },
                            ),
                            const Gap(8),
                            TitleTextFiled(
                              title: AppString.email,
                              hint: AppString.hintExample,
                              controller: emailController,
                              validator: (value) {
                                return Validators.validateEmail(value, context);
                              },
                            ),
                            const Gap(8),
                            TitleTextFiled(
                                title: AppString.password,
                                hint: "*********",
                                controller: passwordController,
                                validator: (value) {
                                  return Validators.validatePassword(
                                      value, context);
                                }),
                            const Gap(8),
                            TitleTextFiled(
                              title: AppString.confirmPassword,
                              hint: "********",
                              controller: confirmPasswordController,
                              validator: (value) {
                                return Validators.validateConfirmPassword(
                                    passwordController.text, value, context);
                              },
                            ),
                            const Gap(8),
                            Text("Select Role",
                                style: AppStyles.styleBold14(context)),
                            const Gap(8),
                            CustomDropMenu(
                              items: Map.fromIterable([
                                "Chair",
                                "Director",
                                "Volunteer",
                                "Participant"
                              ]),
                              selectedValue: selectedRole,
                              isAuth: false,
                              setValue: (value) {
                                setState(() {
                                  selectedRole = value;
                                });
                              },
                            ),
                            const SelectRoleSection(),
                            const Gap(16),
                            Center(
                              child: AuthButton(
                                title: AppString.signUp,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    viewModel.doAction(
                                      SignupAction(
                                        SignupReqestEtity(
                                          confirmPassword:
                                              confirmPasswordController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          userName: userNameController.text,
                                          role: selectedRole,
                                          phone: phoneController.text,
                                          gender: viewModel.selectedGender,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            const Gap(10),
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
              ),
            )
          ],
        )),
      ),
    );
  }
}
class SignListenerWidget extends StatelessWidget {
  const SignListenerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthViewModelCubit, AuthViewModelState>(
      listener: (context, state) {
       if (state is SignupLoadingState) {
          CustomToast.showLoadingToast(message: 'Loading...');
        }
        else if (state is SignupSuccessState) {
          CustomToast.showSuccessToast(message: 'Signup Success');
          context.go(AppRoute.loginView);
        } else if (state is SignupErrorState) {
            QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  text: state.errorMessage.message.toString(),
                  confirmBtnText: 'OK',
                  onConfirmBtnTap: () => context.pop(),
                  title: 'Signup Failed',
                  confirmBtnColor: AppColor.primaryColor,
                );
        }
      },
      child: SizedBox(),
    );
  }
}