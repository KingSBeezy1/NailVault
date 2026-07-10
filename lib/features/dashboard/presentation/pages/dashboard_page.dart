import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nailvault/features/auth/presentation/providers/auth_controller.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('NailVault Dashboard'),
        actions: [
          IconButton(
            onPressed: () => context.go('/settings'),
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () async {
              await ref.read(authControllerProvider.notifier).signOut();
              if (context.mounted) {
                context.go('/sign-in');
              }
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your studio command center',
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Track appointments, manage client history and keep every design backed up securely.',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.25,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _MetricCard(label: 'Today', value: '5 appointments'),
                  _MetricCard(label: 'Clients', value: '124 total'),
                  _MetricCard(label: 'Photos pending', value: '18 uploads'),
                  _MetricCard(label: 'Revenue', value: '480 this month'),
                ],
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  FilledButton.icon(
                    onPressed: () => context.go('/clients'),
                    icon: const Icon(Icons.person_add_alt_1),
                    label: const Text('Clients'),
                  ),
                  FilledButton.icon(
                    onPressed: () => context.go('/appointments'),
                    icon: const Icon(Icons.calendar_today),
                    label: const Text('Appointments'),
                  ),
                  FilledButton.icon(
                    onPressed: () => context.go('/search'),
                    icon: const Icon(Icons.search),
                    label: const Text('Search'),
                  ),
                  FilledButton.icon(
                    onPressed: () => context.go('/gallery'),
                    icon: const Icon(Icons.photo_library),
                    label: const Text('Gallery'),
                  ),
                  FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.photo_camera),
                    label: const Text('Take Photos'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 12),
            Text(value, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
