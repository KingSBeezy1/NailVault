import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nailvault/features/appointments/presentation/providers/appointments_provider.dart';
import 'package:nailvault/features/appointments/presentation/providers/photo_upload_provider.dart';
import 'package:nailvault/features/appointments/domain/models/appointment_model.dart';
import 'package:nailvault/features/appointments/domain/models/appointment_photo_model.dart';

final appointmentDetailProvider = FutureProvider.family<AppointmentModel?, String>((ref, appointmentId) async {
  final repository = ref.watch(appointmentRepositoryProvider);
  final appointments = await repository.fetchAppointments();
  try {
    return appointments.firstWhere((a) => a.id == appointmentId);
  } catch (_) {
    return null;
  }
});

final appointmentPhotosProvider =
    FutureProvider.family<List<AppointmentPhotoModel>, String>((ref, appointmentId) async {
  final photoRepository = ref.watch(photoRepositoryProvider);
  return photoRepository.fetchAppointmentPhotos(appointmentId);
});
