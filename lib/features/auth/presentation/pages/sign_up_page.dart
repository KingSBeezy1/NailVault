import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nailvault/features/auth/presentation/providers/auth_controller.dart';
import 'package:nailvault/features/auth/presentation/providers/auth_state.dart';
import 'package:nailvault/features/shared/widgets/primary_button.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
      appBar: AppBar(title: const Text('Create account')),
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
                        'Start your NailVault workspace',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Use your professional email to begin managing images, appointments and clients in one place.',
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
                      PrimaryButton(
                        label: authState.status == AuthStatus.loading ? 'Creating account...' : 'Create account',
                        onPressed: authState.status == AuthStatus.loading
                            ? () {}
                            : () async {
                                await ref.read(authControllerProvider.notifier).signUp(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text,
                                );
                                if (ref.read(authControllerProvider).status == AuthStatus.authenticated) {
                                  if (context.mounted) {
                                    context.go('/dashboard');
                                  }
                                }
                              },
                        icon: Icons.person_add_alt_1,
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () => context.go('/sign-in'),
                        child: const Text('Already have an account?'),
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
