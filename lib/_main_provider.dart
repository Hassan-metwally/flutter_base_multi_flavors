import 'package:flutter/material.dart';

import 'environment_configs.dart';
import 'src/_provider_app/provider_app.dart';

void main() async {
  try {
    await initializeAppConfig(AppEnvironmentEnum.provider);

    const configureAppEnv = EnvironmentsConfig(
      environment: AppEnvironmentEnum.provider,
      appTitle: 'Azhimny Provider',
      child: ProviderApp(),
    );

    debugPrint('===================================================');
    debugPrint('====== Launching [ Provider App ] Completed =======');
    debugPrint('===================================================');

    // await (DeleteCachedUserUseCase.getInstance()).call();

    runApp(configureAppEnv);
  } catch (e, stackTrace) {
    debugPrint('===== !!! Launching [ Provider App ] Failed !!! ====== \n ==> [Error]: $e \n ==>[StackTrace]: $stackTrace ======');
  }
}
