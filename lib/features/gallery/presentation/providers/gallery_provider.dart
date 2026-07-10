import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nailvault/features/appointments/presentation/providers/photo_upload_provider.dart';
import 'package:nailvault/features/appointments/domain/models/appointment_photo_model.dart';
import 'package:nailvault/features/gallery/data/repositories/gallery_repository.dart';
import 'package:nailvault/features/gallery/domain/models/gallery_filter.dart';

final galleryRepositoryProvider = Provider<GalleryRepository>((ref) {
  return GalleryRepository(ref.watch(photoRepositoryProvider));
});

final galleryFilterProvider = StateProvider<GalleryFilter>((ref) {
  return const GalleryFilter();
});

final galleryPhotosProvider =
    FutureProvider.family<List<AppointmentPhotoModel>, String>((ref, appointmentId) async {
  final repository = ref.watch(galleryRepositoryProvider);
  final filter = ref.watch(galleryFilterProvider);
  return repository.fetchPhotos(appointmentId: appointmentId, filter: filter);
});
