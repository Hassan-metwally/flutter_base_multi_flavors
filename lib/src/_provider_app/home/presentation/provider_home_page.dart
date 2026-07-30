import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../../../../core/config/router/app_routes.dart';
import '../../../../../core/core.dart';
import '../../../../../material/auth_states/logged_user_checker_widget.dart';
import '../../../../../material/media/app_image.dart';
import '../../../notifications/presentation/widgets/notification_button.dart';

part 'widgets/provider_home_app_bar.dart';
part 'widgets/provider_home_body.dart';
part 'widgets/provider_services_orders_section.dart';

class ProviderHomePage extends StatelessWidget {
  const ProviderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(top: false, child: Column(children: [_ProviderHomeAppBar(), _ProviderHomeBody()])),
    );
  }
}
