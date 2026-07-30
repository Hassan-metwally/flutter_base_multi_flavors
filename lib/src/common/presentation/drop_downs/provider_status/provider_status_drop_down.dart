import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../../../../../material/inputs/validator_field/validator_field.dart';
import '../../../domain/enums/provider_status_enum.dart';
import '../drop_downs/drop_down.dart';
import '../provider_status/provider_status_drop_down_cubit.dart';

class ProviderStatusDropDown extends StatelessWidget {
  const ProviderStatusDropDown({super.key, required this.controller, this.onChanged, this.hasRequiredSymbol = false, this.label});
  final ValidatorFieldController<ProviderStatusEnum?> controller;
  final void Function(ProviderStatusEnum? value)? onChanged;
  final bool hasRequiredSymbol;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return AppSingleDropDown(
      controller: controller,
      itemDisplay: (displayValue) => displayValue?.title,
      onChanged: onChanged,
      title: label ?? appLocalizer.providerStatus,
      hint: appLocalizer.selectProviderStatus,
      cubit: ServicesDropDownCubit(),
    );
  }
}
