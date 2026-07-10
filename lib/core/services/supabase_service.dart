import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  SupabaseService._();

  static final SupabaseService instance = SupabaseService._();

  bool _initialized = false;

  bool get isInitialized => _initialized;

  SupabaseClient get client {
    if (!_initialized) {
      throw StateError('Supabase has not been initialized.');
    }

    return Supabase.instance.client;
  }

  Future<void> initialize({required String url, required String anonKey}) async {
    if (_initialized) {
      return;
    }

    if (url.isEmpty || anonKey.isEmpty) {
      _initialized = true;
      return;
    }

    await Supabase.initialize(url: url, anonKey: anonKey);
    _initialized = true;
  }
}
