import 'package:flutter/material.dart';

import 'environment_configs.dart';
import 'src/_client_app/client_app.dart';

void main() async {
  try {
    await initializeAppConfig(AppEnvironmentEnum.client);

    const configureAppEnv = EnvironmentsConfig(environment: AppEnvironmentEnum.client, appTitle: 'Azhimny Client', child: ClientApp());

    debugPrint('===================================================');
    debugPrint('====== Launching [ Client App ] Completed =======');
    debugPrint('===================================================');

    runApp(configureAppEnv);
  } catch (e, stackTrace) {
    debugPrint('===== !!! Launching [ Client App ] Failed !!! ===== \n ==> [Error]: $e \n ==>[StackTrace]: $stackTrace ======');
  }
}
