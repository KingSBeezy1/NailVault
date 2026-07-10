import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nailvault/core/di/app_providers.dart';
import 'package:nailvault/core/errors/app_exception.dart';
import 'package:nailvault/features/auth/data/repositories/auth_repository.dart';
import 'package:nailvault/features/auth/presentation/providers/auth_state.dart';

final authControllerProvider = NotifierProvider<AuthController, AuthState>(AuthController.new);

class AuthController extends Notifier<AuthState> {
  late final AuthRepository _authRepository;

  @override
  AuthState build() {
    _authRepository = ref.read(authRepositoryProvider);
    return const AuthState(status: AuthStatus.initial);
  }

  Future<void> initialize() async {
    state = const AuthState(status: AuthStatus.loading);

    try {
      final user = _authRepository.currentUser;
      state = AuthState(
        status: user == null ? AuthStatus.unauthenticated : AuthStatus.authenticated,
      );
    } on AppException catch (error) {
      state = AuthState(status: AuthStatus.failure, message: error.message);
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    state = const AuthState(status: AuthStatus.loading);

    try {
      await _authRepository.signInWithPassword(email: email, password: password);
      state = const AuthState(status: AuthStatus.authenticated);
    } on AppException catch (error) {
      state = AuthState(status: AuthStatus.failure, message: error.message);
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    state = const AuthState(status: AuthStatus.loading);

    try {
      await _authRepository.signUpWithPassword(email: email, password: password);
      state = const AuthState(status: AuthStatus.authenticated);
    } on AppException catch (error) {
      state = AuthState(status: AuthStatus.failure, message: error.message);
    }
  }

  Future<void> resetPassword({required String email}) async {
    state = const AuthState(status: AuthStatus.loading);

    try {
      await _authRepository.resetPassword(email: email);
      state = const AuthState(status: AuthStatus.unauthenticated);
    } on AppException catch (error) {
      state = AuthState(status: AuthStatus.failure, message: error.message);
    }
  }

  Future<void> signOut() async {
    state = const AuthState(status: AuthStatus.loading);

    try {
      await _authRepository.signOut();
      state = const AuthState(status: AuthStatus.unauthenticated);
    } on AppException catch (error) {
      state = AuthState(status: AuthStatus.failure, message: error.message);
    }
  }
}
