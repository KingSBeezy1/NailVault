import 'package:flutter_test/flutter_test.dart';
import 'package:nailvault/core/config/app_config.dart';

void main() {
  group('AppConfig', () {
    test('reports configured when both values are set', () {
      const config = AppConfig(supabaseUrl: 'https://example.supabase.co', supabaseAnonKey: 'anon-key');

      expect(config.isConfigured, isTrue);
    });

    test('reports unconfigured when values are missing', () {
      const config = AppConfig(supabaseUrl: '', supabaseAnonKey: '');

      expect(config.isConfigured, isFalse);
    });
  });
}
