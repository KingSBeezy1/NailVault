import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nailvault/features/clients/presentation/pages/client_detail_page.dart';
import 'package:nailvault/features/clients/presentation/providers/clients_provider.dart';

class ClientsPage extends ConsumerWidget {
  const ClientsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientsAsync = ref.watch(clientsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Clients')),
      body: clientsAsync.when(
        data: (clients) {
          if (clients.isEmpty) {
            return const Center(child: Text('No clients yet. Add your first one to start building your portfolio.'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: clients.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final client = clients[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ClientDetailPage(client: client),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(client.firstName.isNotEmpty ? client.firstName[0] : '?'),
                    ),
                    title: Text('${client.firstName} ${client.lastName}'),
                    subtitle: Text(client.email ?? client.phoneNumber ?? 'No contact details yet'),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Unable to load clients: $error')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/add-client'),
        icon: const Icon(Icons.person_add_alt_1),
        label: const Text('New Client'),
      ),
    );
  }
}
