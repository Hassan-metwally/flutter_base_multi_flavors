import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../material/buttons/app_button.dart';
import '../../../../material/inputs/intel_phone/phone_field.dart';
import '../../../../material/inputs/name_field.dart';
import '../../../../material/inputs/validator_field/validator_field.dart';
import '../../../../material/media/svg_icon.dart';
import '../../../../material/toast/app_toast.dart';
import '../../../common/domain/entity/city_entity.dart';
import '../../../common/presentation/drop_downs/cities/cities_drop_down.dart';
import '../../domain/use_case/_client_register_use_case.dart';
import '../../domain/use_case/verify_otp_use_case.dart';
import '../otp/otp_page.dart';
import '../widgets/accept_terms_tile.dart';
import 'client_register_cubit.dart';

class UserRegisterPage extends StatefulWidget {
  const UserRegisterPage({super.key});

  @override
  State<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final termsController = ValidatorFieldController<bool>(initialValue: false);
  final cityController = ValidatorFieldController<CityEntity?>();

  void _onRegisterPressed() {
    final isValidForm = formKey.currentState?.validate() ?? false;
    if (isValidForm) {
      if (termsController.value == false) {
        AppToasts.error(context, message: appLocalizer.youMustAgreeTermsAndConditionsFirst);
        return;
      }
      context.read<UserRegisterCubit>().register(
        UserRegisterParams(phone: phoneController.text, name: nameController.text, city: cityController.value!),
      );
    }
  }

  void _onRegisterSuccess() {
    OtpPage.show(
      context,
      arguments: OtpScreenArguments(countryCode: "+966", phone: phoneController.text, verifyCase: OtpScreenCaseEnum.register),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserRegisterCubit, UserRegisterState>(
      listener: (context, state) {
        if (state.isSuccess) {
          _onRegisterSuccess();
        } else if (state.isFailure) {
          AppToasts.error(context, message: state.failure?.message ?? '');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(backgroundColor: AppColors.backgroundColor),
          body: IgnorePointer(
            ignoring: state.isLoading,
            child: Form(
              key: formKey,
              canPop: state.isLoading == false,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSvgIcon(path: ""),
                    const SizedBox(height: 16),
                    Text(appLocalizer.register, style: TextStyles.regular20.copyWith(color: AppColors.black)),
                    const SizedBox(height: 8),
                    Text.rich(
                      TextSpan(
                        text: appLocalizer.registerWelcomeMessage,
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
                    const SizedBox(height: 20),
                    NameField(controller: nameController),
                    const SizedBox(height: 10),
                    PhoneField(controller: phoneController),
                    CitiesDropDown(cityController: cityController),
                    const SizedBox(height: 20),
                    AcceptTermsAndConditionsWidget(controller: termsController),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppButton(text: appLocalizer.register, isLoading: state.isLoading, onPressed: _onRegisterPressed),
                const SizedBox(height: 24),
                Text.rich(
                  TextSpan(
                    text: appLocalizer.alreadyHaveAccount,
                    children: [
                      TextSpan(
                        text: "\t${appLocalizer.login}",
                        recognizer: TapGestureRecognizer()..onTap = Navigator.of(context).pop,
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
    nameController.dispose();
    super.dispose();
  }
}
