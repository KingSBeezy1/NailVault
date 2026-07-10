import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nailvault/core/config/app_config.dart';
import 'package:nailvault/core/services/supabase_service.dart';
import 'package:nailvault/features/auth/data/repositories/auth_repository.dart';

final supabaseServiceProvider = Provider<SupabaseService>((ref) => SupabaseService.instance);

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final supabaseService = ref.watch(supabaseServiceProvider);
  return AuthRepository(supabaseService);
});

Future<void> initializeCoreServices(AppConfig appConfig) async {
  await SupabaseService.instance.initialize(
    url: appConfig.supabaseUrl,
    anonKey: appConfig.supabaseAnonKey,
  );
}
