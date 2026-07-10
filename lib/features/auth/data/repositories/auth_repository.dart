import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nailvault/core/errors/app_exception.dart';
import 'package:nailvault/core/services/supabase_service.dart';

class AuthRepository {
  const AuthRepository(this._supabaseService);

  final SupabaseService _supabaseService;

  User? get currentUser {
    try {
      return _supabaseService.client.auth.currentUser;
    } on Exception catch (error) {
      throw AppException(message: error.toString());
    }
  }

  Future<User> signInWithPassword({required String email, required String password}) async {
    _ensureConfigured();

    final response = await _supabaseService.client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user == null) {
      throw const AppException(message: 'Unable to sign in right now.');
    }

    return response.user!;
  }

  Future<User> signUpWithPassword({required String email, required String password}) async {
    _ensureConfigured();

    final response = await _supabaseService.client.auth.signUp(
      email: email,
      password: password,
    );

    if (response.user == null) {
      throw const AppException(message: 'Unable to create your account right now.');
    }

    return response.user!;
  }

  Future<void> resetPassword({required String email}) async {
    _ensureConfigured();
    await _supabaseService.client.auth.resetPasswordForEmail(email);
  }

  Future<void> signOut() async {
    _ensureConfigured();
    await _supabaseService.client.auth.signOut();
  }

  void _ensureConfigured() {
    if (!_supabaseService.isInitialized) {
      throw const AppException(message: 'Supabase is not configured for this app yet.');
    }
  }
}
