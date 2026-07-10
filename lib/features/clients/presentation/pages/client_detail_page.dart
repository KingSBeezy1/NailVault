import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nailvault/features/appointments/presentation/providers/appointments_provider.dart';
import 'package:nailvault/features/clients/domain/models/client_model.dart';

class ClientDetailPage extends ConsumerWidget {
  const ClientDetailPage({super.key, required this.client});

  final ClientModel client;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointmentsAsync = ref.watch(appointmentsProvider);

    return Scaffold(
      appBar: AppBar(title: Text('${client.firstName} ${client.lastName}')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 48,
                    child: Text(
                      '${client.firstName[0]}${client.lastName[0]}',
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _InfoSection(
                    title: 'Contact Information',
                    children: [
                      if (client.phoneNumber != null) _InfoItem(label: 'Phone', value: client.phoneNumber!),
                      if (client.email != null) _InfoItem(label: 'Email', value: client.email!),
                      if (client.instagramUsername != null)
                        _InfoItem(label: 'Instagram', value: '@${client.instagramUsername!}'),
                      if (client.birthday != null)
                        _InfoItem(label: 'Birthday', value: DateFormat('MMM d, yyyy').format(client.birthday!)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  if (client.notes != null && client.notes!.isNotEmpty)
                    _InfoSection(
                      title: 'Notes',
                      children: [
                        Text(client.notes!),
                      ],
                    ),
                  const SizedBox(height: 24),
                  Text(
                    'Appointment History',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            appointmentsAsync.when(
              data: (appointments) {
                final clientAppointments =
                    appointments.where((a) => a.clientId == client.id).toList();

                if (clientAppointments.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(24),
                    child: Center(
                      child: Text(
                        'No appointments yet.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  itemCount: clientAppointments.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final appointment = clientAppointments[index];
                    return Card(
                      child: ListTile(
                        title: Text(DateFormat('EEE, MMM d • h:mm a').format(appointment.date)),
                        subtitle: Text('${appointment.status} • \$${appointment.price.toStringAsFixed(0)}'),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(child: Text('Error: $error')),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  const _InfoSection({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500)),
          Text(value, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
