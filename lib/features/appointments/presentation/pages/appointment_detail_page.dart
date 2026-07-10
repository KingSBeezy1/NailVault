import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nailvault/features/appointments/presentation/providers/appointment_detail_provider.dart';
import 'package:nailvault/features/shared/widgets/appointment_photo_grid.dart';

class AppointmentDetailPage extends ConsumerWidget {
  const AppointmentDetailPage({
    super.key,
    required this.appointmentId,
    required this.clientId,
    required this.userId,
  });

  final String appointmentId;
  final String clientId;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointmentAsync = ref.watch(appointmentDetailProvider(appointmentId));
    final photosAsync = ref.watch(appointmentPhotosProvider(appointmentId));

    return Scaffold(
      appBar: AppBar(title: const Text('Appointment')),
      body: appointmentAsync.when(
        data: (appointment) {
          if (appointment == null) {
            return const Center(child: Text('Appointment not found'));
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('EEEE, MMMM d, y').format(appointment.date),
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      _InfoRow(label: 'Duration', value: '${appointment.durationMinutes} min'),
                      _InfoRow(label: 'Price', value: '\$${appointment.price.toStringAsFixed(2)}'),
                      _InfoRow(label: 'Status', value: appointment.status),
                      if (appointment.nailShape != null) _InfoRow(label: 'Shape', value: appointment.nailShape!),
                      if (appointment.length != null) _InfoRow(label: 'Length', value: appointment.length!),
                      if (appointment.colorTags.isNotEmpty)
                        _InfoRow(label: 'Colors', value: appointment.colorTags.join(', ')),
                      if (appointment.notes != null && appointment.notes!.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            Text('Notes', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Text(appointment.notes!),
                          ],
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Photos', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                      FilledButton.icon(
                        onPressed: () {
                          context.push('/camera/$appointmentId/$clientId/$userId');
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Add'),
                      ),
                    ],
                  ),
                ),
                photosAsync.when(
                  data: (photos) {
                    if (photos.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(24),
                        child: Center(
                          child: Text(
                            'No photos yet. Capture some to showcase this appointment.',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }

                    return AppointmentPhotoGrid(photos: photos);
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) => Center(child: Text('Error loading photos: $error')),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error loading appointment: $error')),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500)),
          Text(value, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
