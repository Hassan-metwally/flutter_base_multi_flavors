import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../domain/enums/provider_status_enum.dart';

class ProviderStatusWidget extends StatelessWidget {
  final ProviderStatusEnum status;
  const ProviderStatusWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: status.bgColor),
      child: Text(
        status.title,
        style: TextStyles.regular12.copyWith(color: status.titlColor),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
