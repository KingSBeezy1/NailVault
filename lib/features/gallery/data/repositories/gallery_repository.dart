import 'package:nailvault/features/appointments/data/repositories/photo_repository.dart';
import 'package:nailvault/features/appointments/domain/models/appointment_photo_model.dart';
import 'package:nailvault/features/gallery/domain/models/gallery_filter.dart';

class GalleryRepository {
  const GalleryRepository(this._photoRepository);

  final PhotoRepository _photoRepository;

  Future<List<AppointmentPhotoModel>> fetchPhotos({
    required String appointmentId,
    GalleryFilter? filter,
  }) async {
    var photos = await _photoRepository.fetchAppointmentPhotos(appointmentId);

    if (filter != null) {
      photos = _applyFilters(photos, filter);
    }

    return photos;
  }

  Future<List<AppointmentPhotoModel>> fetchAllPhotos({
    GalleryFilter? filter,
  }) async {
    // This would require fetching from all appointments
    // For now, return empty. In a real app, you'd query the database directly.
    return [];
  }

  List<AppointmentPhotoModel> _applyFilters(
    List<AppointmentPhotoModel> photos,
    GalleryFilter filter,
  ) {
    return photos.where((photo) {
      // Filter by favorites
      if (filter.favoritesOnly && !photo.favorite) {
        return false;
      }

      // Filter by posted status
      if (filter.postedOnly && !photo.instagramPosted && !photo.facebookPosted && !photo.tikTokPosted) {
        return false;
      }

      // Filter by date range
      if (filter.dateFrom != null && photo.takenAt.isBefore(filter.dateFrom!)) {
        return false;
      }
      if (filter.dateTo != null && photo.takenAt.isAfter(filter.dateTo!)) {
        return false;
      }

      return true;
    }).toList();
  }
}
