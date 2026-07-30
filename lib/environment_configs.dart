import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/di/di.dart';
import 'core/utils/pusher/pusher_handler.dart';
import 'src/notifications/helpers/firebase/firebase_helper.dart';

enum AppEnvironmentEnum {
  client('client'),
  provider('provider');

  final String falvorName;

  factory AppEnvironmentEnum.fromJson(String json) {
    return AppEnvironmentEnum.values.firstWhere((type) => type.falvorName.toLowerCase() == json.toLowerCase());
  }

  const AppEnvironmentEnum(this.falvorName);
}

class EnvironmentsConfig extends InheritedWidget {
  final AppEnvironmentEnum _environment;
  final String appTitle;

  static AppEnvironmentEnum get appEnvironment {
    return AppEnvironmentEnum.values.firstWhere((element) => element.falvorName == appFlavor);
  }

  const EnvironmentsConfig({required super.child, required AppEnvironmentEnum environment, required this.appTitle, super.key})
    : _environment = environment;

  static EnvironmentsConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EnvironmentsConfig>()!;
  }

  bool get isUserApp => _environment == AppEnvironmentEnum.client;
  bool get isProviderApp => _environment == AppEnvironmentEnum.provider;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

Future<void> initializeAppConfig(AppEnvironmentEnum env) async {
  // Ensure that the Flutter engine is properly initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Lock the app orientation to portrait mode only.
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Initialize application dependencies (e.g., services, providers, shared preferences, dio helper...etc).
  await initializeDependencies();

  // Initialize Firebase services.
  await FirebaseHelper.init(env);

  // Initialize the Pusher.
  await PusherHandler.instance.initialize();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);

  // Set the system UI mode to manual, displaying all system UI overlays.
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);

  // Apply a dark style to the system UI overlays for better visibility.
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  // To increase image cache size
  PaintingBinding.instance.imageCache.maximumSizeBytes = 512 << 20;

  SystemChannels.textInput.invokeMethod('TextInput.hide');
}
