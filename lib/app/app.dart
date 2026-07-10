import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nailvault/core/router/app_router.dart';
import 'package:nailvault/core/theme/app_theme.dart';
import 'package:nailvault/features/auth/presentation/providers/auth_controller.dart';

class NailVaultApp extends ConsumerStatefulWidget {
  const NailVaultApp({super.key});

  @override
  ConsumerState<NailVaultApp> createState() => _NailVaultAppState();
}

class _NailVaultAppState extends ConsumerState<NailVaultApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authControllerProvider.notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'NailVault',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
