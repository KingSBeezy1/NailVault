import 'dart:io';

class AppConfig {
  const AppConfig({required this.supabaseUrl, required this.supabaseAnonKey});

  final String supabaseUrl;
  final String supabaseAnonKey;

  factory AppConfig.fromEnvironment() {
    const compileTimeSupabaseUrl = String.fromEnvironment('SUPABASE_URL', defaultValue: '');
    const compileTimeSupabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY', defaultValue: '');
    final env = Platform.environment;

    final supabaseUrl = compileTimeSupabaseUrl.isNotEmpty
        ? compileTimeSupabaseUrl
        : (env['SUPABASE_URL'] ?? '');
    final supabaseAnonKey = compileTimeSupabaseAnonKey.isNotEmpty
        ? compileTimeSupabaseAnonKey
        : (env['SUPABASE_ANON_KEY'] ?? '');

    return AppConfig(
      supabaseUrl: supabaseUrl,
      supabaseAnonKey: supabaseAnonKey,
    );
  }

  bool get isConfigured => supabaseUrl.isNotEmpty && supabaseAnonKey.isNotEmpty;
}
