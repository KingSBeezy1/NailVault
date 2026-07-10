import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nailvault/features/auth/presentation/providers/auth_controller.dart';
import 'package:nailvault/features/auth/presentation/providers/auth_state.dart';
import 'package:nailvault/features/shared/widgets/primary_button.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final _emailController = TextEditingController(text: 'tech@example.com');
  final _passwordController = TextEditingController(text: 'password123');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Sign in to continue managing your portfolio and client workflow.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 24),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                      ),
                      const SizedBox(height: 24),
                      if (authState.status == AuthStatus.failure && authState.message != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            authState.message!,
                            style: TextStyle(color: Theme.of(context).colorScheme.error),
                          ),
                        ),
                      PrimaryButton(
                        label: authState.status == AuthStatus.loading ? 'Signing in...' : 'Sign in',
                        onPressed: authState.status == AuthStatus.loading
                            ? () {}
                            : () async {
                                await ref.read(authControllerProvider.notifier).signIn(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text,
                                );
                                if (ref.read(authControllerProvider).status == AuthStatus.authenticated) {
                                  if (context.mounted) {
                                    context.go('/dashboard');
                                  }
                                }
                              },
                        icon: Icons.login,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () => context.go('/sign-up'),
                            child: const Text('Create account'),
                          ),
                          TextButton(
                            onPressed: () => context.go('/forgot-password'),
                            child: const Text('Forgot password'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
