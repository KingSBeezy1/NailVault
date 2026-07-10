import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nailvault/core/di/app_providers.dart';
import 'package:nailvault/features/appointments/data/repositories/appointment_repository.dart';
import 'package:nailvault/features/appointments/domain/models/appointment_model.dart';

final appointmentRepositoryProvider = Provider<AppointmentRepository>((ref) {
  return AppointmentRepository(ref.watch(supabaseServiceProvider));
});

final appointmentsProvider = FutureProvider<List<AppointmentModel>>((ref) async {
  final repository = ref.watch(appointmentRepositoryProvider);
  return repository.fetchAppointments();
});
