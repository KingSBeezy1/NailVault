import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nailvault/core/di/app_providers.dart';

final currentUserIdProvider = Provider<String?>((ref) {
  final supabaseService = ref.watch(supabaseServiceProvider);
  try {
    return supabaseService.client.auth.currentUser?.id;
  } catch (_) {
    return null;
  }
});
