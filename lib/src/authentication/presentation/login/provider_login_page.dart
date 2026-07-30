import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/router/app_routes.dart';
import '../../../../core/core.dart';
import '../../../../material/buttons/app_button.dart';
import '../../../../material/inputs/intel_phone/phone_field.dart';
import '../../../../material/media/svg_icon.dart';
import '../../../../material/toast/app_toast.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/use_case/login_use_case.dart';
import '../../domain/use_case/verify_otp_use_case.dart';
import '../otp/otp_page.dart';
import 'login_cubit.dart';

class ProviderLoginPage extends StatefulWidget {
  const ProviderLoginPage({super.key});

  @override
  State<ProviderLoginPage> createState() => _ProviderLoginPageState();
}

class _ProviderLoginPageState extends State<ProviderLoginPage> {
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void _onLoginPressed() {
    final bool isValidForm = formKey.currentState?.validate() ?? false;
    final phoneNumber = phoneController.text.trim();
    if (phoneNumber.isEmpty) return;
    if (isValidForm) {
      final params = LoginParams(phone: phoneController.text.trim());
      context.read<LoginCubit>().login(params);
    }
  }

  void _onRegisterPressed() {
    Navigator.of(context).pushNamed(AppRoutes.providerRegisterPage);
  }

  void _onLoginSuccess({required UserEntity user}) {
    OtpPage.show(
      context,
      arguments: OtpScreenArguments(phone: phoneController.text, caseEnum: OtpScreenCaseEnum.login),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.isSuccess) {
          final userData = state.data!;
          _onLoginSuccess(user: userData);
        } else if (state.isFailure) {
          AppToasts.error(context, message: state.errorMessage ?? '');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(backgroundColor: AppColors.backgroundColor),
          body: IgnorePointer(
            ignoring: state.isLoading,
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppSvgIcon(path: ""),
                      const SizedBox(height: 16),
                      Text(appLocalizer.login, style: TextStyles.regular20.copyWith(color: AppColors.primary900)),
                      const SizedBox(height: 13),
                      Text.rich(
                        TextSpan(
                          text: appLocalizer.loginWelcomeMessage,
                          children: [
                            TextSpan(
                              text: "\t${appLocalizer.appName}",
                              style: TextStyles.regular16.copyWith(color: AppColors.primary),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyles.light16.copyWith(color: AppColors.black700),
                      ),
                      const SizedBox(height: 32),
                      PhoneField(controller: phoneController),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppButton(text: appLocalizer.login, onPressed: _onLoginPressed, isLoading: state.isLoading),
                const SizedBox(height: 24),
                Text.rich(
                  TextSpan(
                    text: appLocalizer.dontHaveAccount,
                    children: [
                      TextSpan(
                        text: "\t${appLocalizer.createAccount}",
                        recognizer: TapGestureRecognizer()..onTap = _onRegisterPressed,
                        style: TextStyles.regular14.copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                  style: TextStyles.regular14,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
