import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nailvault/app/app.dart';
import 'package:nailvault/core/config/app_config.dart';
import 'package:nailvault/core/di/app_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appConfig = AppConfig.fromEnvironment();
  await initializeCoreServices(appConfig);

  runApp(const ProviderScope(child: NailVaultApp()));
}
