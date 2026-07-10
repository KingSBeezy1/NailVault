import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nailvault/features/auth/presentation/providers/current_user_provider.dart';
import 'package:nailvault/features/appointments/presentation/providers/appointments_provider.dart';

class AppointmentsPage extends ConsumerWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointmentsAsync = ref.watch(appointmentsProvider);
    final currentUserId = ref.watch(currentUserIdProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Appointments')),
      body: appointmentsAsync.when(
        data: (appointments) {
          if (appointments.isEmpty) {
            return const Center(child: Text('No appointments yet. Your schedule will appear here.'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: appointments.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final appointment = appointments[index];
              return GestureDetector(
                onTap: () {
                  context.push('/appointment/${appointment.id}/${appointment.clientId}/${currentUserId ?? ""}');
                },
                child: Card(
                  child: ListTile(
                    title: Text(DateFormat('EEE, MMM d • h:mm a').format(appointment.date)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text('Status: ${appointment.status}'),
                        Text('Duration: ${appointment.durationMinutes} min • Price: \$${appointment.price.toStringAsFixed(0)}'),
                        if (appointment.colorTags.isNotEmpty)
                          Text('Colors: ${appointment.colorTags.join(', ')}'),
                      ],
                    ),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Unable to load appointments: $error')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/add-appointment'),
        icon: const Icon(Icons.calendar_today),
        label: const Text('New Appointment'),
      ),
    );
  }
}
